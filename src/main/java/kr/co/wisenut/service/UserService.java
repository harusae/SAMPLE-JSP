package kr.co.wisenut.service;

import kr.co.wisenut.config.sub.AES256;
import kr.co.wisenut.entity.UserInfo;
import kr.co.wisenut.mapper.UserMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class UserService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private UserMapper userMapper;

    public List<UserInfo> getUserList(HashMap<String, Object> param){
        List<UserInfo> list = userMapper.getUserList(param);
        AES256 aes256 = new AES256();
        for(UserInfo userInfo : list){
            try {
                userInfo.setUserName(aes256.decode(userInfo.getUserName()));
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        return list;
    }

}
