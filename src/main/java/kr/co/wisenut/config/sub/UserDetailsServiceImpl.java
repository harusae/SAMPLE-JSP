package kr.co.wisenut.config.sub;

import kr.co.wisenut.entity.MenuInfo;
import kr.co.wisenut.entity.UserInfo;
import kr.co.wisenut.mapper.MenuMapper;
import kr.co.wisenut.mapper.UserMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private MenuMapper menuMapper;


    @Override
    public UserDetails loadUserByUsername (String userId) throws UsernameNotFoundException{
        HashMap<String, Object> param = new HashMap<>();
        param.put("userId", userId);
        UserInfo userInfo = userMapper.getLoginInfo(param);

        if(userInfo == null){
            //설정을 바꾸지 않는 이상 BadCredentialsException 처리됨
            throw new UsernameNotFoundException("잘못된 사용자 정보입니다.");
        }
        else if(!("Y".equals(userInfo.getUseYn()) && "Y".equals(userInfo.getActiveYn()))){
            throw new LockedException("사용중지된 사용자입니다. 관리자에게 문의하세요.");
        }
        else if(5 <= userInfo.getLoginFailCnt()){
            throw new LockedException("로그인 실패로 인하여 사용중지된 사용자입니다.\\n관리자에게 문의하세요.");
        }

        List<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority(String.valueOf(userInfo.getUserAuth())));

        UserDetailsImpl userDetails = new UserDetailsImpl();
        userDetails.setUsername(userId);
        userDetails.setPassword(userInfo.getUserPw());
        userDetails.setAuthorities(authorities);
        userDetails.setEnabled(true);
        userDetails.setAccountNonExpired(true);
        userDetails.setAccountNonLocked(true);
        userDetails.setCredentialsNonExpired(true);

        Map<String, Object> menuParam = new HashMap<>();
        List<MenuInfo> menuListAll = menuMapper.getMenuList(menuParam); //모든 메뉴목록
        userDetails.setMenuListAll(menuListAll);

        menuParam.put("userAuth", userInfo.getUserAuth());
        List<MenuInfo> menuList = menuMapper.getMenuList(menuParam);    //권한 별 메뉴 목록
        userDetails.setMenuList(menuList);

        userDetails.setResetYn(userInfo.getInitYn());  //패스워드 초기화 여부
        userDetails.setPwChgDay(userInfo.getPwChgDay());    //패스워드 변경 후 누적 일


        return userDetails;
    }

}
