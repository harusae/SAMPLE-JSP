package kr.co.wisenut.service;

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
        return userMapper.getUserList(param);
    }

}
