package kr.co.wisenut.config;

import kr.co.wisenut.config.sub.UserDetailsImpl;
import kr.co.wisenut.entity.MenuInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Component
public class AuthrorizationChecker {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    //로그인한 사용자 메뉴 별 권한체크
    public boolean check(HttpServletRequest request, Authentication auth){

        logger.info("check : {}", request.getRequestURI());
        //favicon는 예외
        if(request.getRequestURI().equals("/favicon.png")){
            logger.info("favicon check : {}", request.getRequestURI().equals("/favicon.png"));
            return true;
        }

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
        else if(request.getRequestURI().startsWith("/font")){
            return true;
        }


        UserDetailsImpl userDetails = (UserDetailsImpl) auth.getPrincipal();
        List<MenuInfo> menuListAll = userDetails.getMenuListAll();  //DB에서 관리하는 모든 메뉴 목록
        List<MenuInfo> userMenuList = userDetails.getMenuList();    //로그인한 사용자에게 인가된 메뉴 목록

        for(int i=0; i<menuListAll.size(); i++){
            MenuInfo target = menuListAll.get(i);
            //사용가능한 메뉴(ex: /menu1) + 하위URL api(ex: /menu1/api1) = true
            if(target.getMenuUrl() != null && request.getRequestURI().startsWith(target.getMenuUrl())){
                return userMenuList.contains(target);
            }
        }

        //그 외에는 모두 false (403)
        return false;
    }


}
