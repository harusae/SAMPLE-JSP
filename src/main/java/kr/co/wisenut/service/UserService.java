package kr.co.wisenut.service;

import kr.co.wisenut.config.sub.AES256;
import kr.co.wisenut.config.sub.SHA256;
import kr.co.wisenut.entity.UserInfo;
import kr.co.wisenut.mapper.UserMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private UserMapper userMapper;

    public int loginFail(HashMap<String, Object> param){
        logger.info("param : {}", param);
        int res = 0;
        UserInfo userInfo = userMapper.getLoginInfo(param);
        if(userInfo != null){
            res = userMapper.addLoginFailCount(param);
        }

        return res;
    }

    public int loginSuccess(HashMap<String, Object> param){
        logger.info("param : {}", param);
        int res = userMapper.resetLoginFailCount(param);

        return res;
    }

    public int insertActionHistory(HashMap<String, Object> param){
        logger.info("param : {}", param);
        int res = userMapper.insertActionHistory(param);

        return res;
    }

    public int updateUserPw(HashMap<String, Object> param) {
        logger.info("param : {}", param);

        //초기화 대상 확인
        UserInfo userInfo = userMapper.getLoginInfo(param);
        if(userInfo == null || !"Y".equals(userInfo.getResetYn())){
            return -1;
        }

        //password 암호화
        SHA256 encoder = new SHA256();
        try {
            param.put("userPw", encoder.encode(param.get("password").toString()));
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }

        //비밀번호 변경 실행
        int res = userMapper.updateUserPw(param);

        return res;
    }

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
