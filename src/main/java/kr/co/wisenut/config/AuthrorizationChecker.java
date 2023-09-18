package kr.co.wisenut.config;

import kr.co.wisenut.config.sub.UserDetailsImpl;
import kr.co.wisenut.entity.MenuInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.List;

@Component
public class AuthrorizationChecker {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    public boolean check(HttpServletRequest request, Authentication auth){
        //logger.info("AuthrorizationChecker auth : {}", auth);
        //logger.info("AuthrorizationChecker request : {}", request.getRequestURI());

        //로그인정보가 없는 경우
        if(!(auth.getPrincipal() instanceof UserDetailsImpl)){
            return false;
        }
        //root는 예외
        else if(request.getRequestURI().equals("/")){
            return true;
        }
        //sessionChk는 예외
        else if(request.getRequestURI().equals("/sessionChk")){
            return true;
        }
        //font는 예외
        else if(request.getRequestURI().startsWith("/fonts")){
            return true;
        }


        UserDetailsImpl userDetails = (UserDetailsImpl) auth.getPrincipal();
        List<MenuInfo> menuListAll = userDetails.getMenuListAll();
        List<MenuInfo> userMenuList = userDetails.getMenuList();

        for(int i=0; i<menuListAll.size(); i++){
            MenuInfo target = menuListAll.get(i);
            //if(target.getMenuUrl() != null && request.getRequestURI().equals(target.getMenuUrl())){ //사용가능한 메뉴만 true
            if(target.getMenuUrl() != null && request.getRequestURI().startsWith(target.getMenuUrl())){ //사용가능한 메뉴 + 하위URL api true
                //logger.info("check equals target {} : {}: {}", target.getMenuUrl(), request.getRequestURI(), request.getRequestURI().equals(target.getMenuUrl()));
                //logger.info("check startsWith target {} : {}: {}", target.getMenuUrl(), request.getRequestURI(), request.getRequestURI().startsWith(target.getMenuUrl()));

                return userMenuList.contains(target);
            }
        }

        return false;
    }


}
