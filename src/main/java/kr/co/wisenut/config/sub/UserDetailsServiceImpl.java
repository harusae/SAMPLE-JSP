package kr.co.wisenut.config.sub;

import kr.co.wisenut.entity.UserInfo;
import kr.co.wisenut.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;

@Service
@RequiredArgsConstructor
public class UserDetailsServiceImpl implements UserDetailsService {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserMapper userMapper;

    @Override
    public UserDetails loadUserByUsername (String userId) throws UsernameNotFoundException{
        System.out.println("loadUserByUsername userId : "+ userId);
        HashMap<String, Object> param = new HashMap<>();
        param.put("userId", userId);
        //UserInfo userInfo = userMapper.getLoginInfo(param);
        HashMap<String, Object> userInfo = userMapper.getLoginInfo2(param);

        logger.info("loadUserByUsername userInfo : {}", userInfo);
        if(userInfo == null){
            return null;
        }

        return User.builder()
                .username(userId)
                .password((String) userInfo.get("USER_PW"))
                .authorities(new SimpleGrantedAuthority("ROLL_"+(String) userInfo.get("USER_AUTH")))
                .build();
    }

}
