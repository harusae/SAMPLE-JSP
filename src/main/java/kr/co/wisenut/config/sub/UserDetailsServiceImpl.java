package kr.co.wisenut.config.sub;

import kr.co.wisenut.entity.MenuInfo;
import kr.co.wisenut.entity.UserInfo;
import kr.co.wisenut.mapper.MenuMapper;
import kr.co.wisenut.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
        //UserInfo userInfo = userMapper.getLoginInfo(param);
        HashMap<String, Object> userInfo = userMapper.getLoginInfo2(param);

        if(userInfo == null){
            throw new UsernameNotFoundException("잘못된 사용자 정보입니다.");
        }

        List<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority((String) userInfo.get("USER_AUTH")));

        UserDetailsImpl userDetails = new UserDetailsImpl();
        userDetails.setUsername(userId);
        userDetails.setPassword((String) userInfo.get("USER_PW"));
        userDetails.setAuthorities(authorities);
        userDetails.setEnabled(true);
        userDetails.setAccountNonExpired(true);
        userDetails.setAccountNonLocked(true);
        userDetails.setCredentialsNonExpired(true);

        Map<String, Object> menuParam = new HashMap<>();
        menuParam.put("userAuth", userInfo.get("USER_AUTH"));
        List<MenuInfo> menuList = menuMapper.getMenuList(menuParam);
        logger.info("menuList : {}", menuList.size());
        userDetails.setMenuList(menuList);


        return userDetails;
    }

}
