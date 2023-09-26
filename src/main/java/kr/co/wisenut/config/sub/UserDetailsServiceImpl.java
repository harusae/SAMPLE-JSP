package kr.co.wisenut.config.sub;

import kr.co.wisenut.entity.MenuInfo;
import kr.co.wisenut.entity.UserInfo;
import kr.co.wisenut.mapper.MenuMapper;
import kr.co.wisenut.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
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
@RequiredArgsConstructor
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
            throw new UsernameNotFoundException("잘못된 사용자 정보입니다.");
        }
        else if(!"Y".equals(userInfo.getEnabled())){
            throw new LockedException("사용중지된 사용자입니다.");
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


        return userDetails;
    }

}
