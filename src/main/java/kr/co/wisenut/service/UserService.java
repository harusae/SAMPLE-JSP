package kr.co.wisenut.service;

import kr.co.wisenut.config.sub.AES256;
import kr.co.wisenut.config.sub.SHA256;
import kr.co.wisenut.entity.UserActionInfo;
import kr.co.wisenut.entity.UserInfo;
import kr.co.wisenut.mapper.UserMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;

@Service
public class UserService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private UserMapper userMapper;

    public int loginFail(HashMap<String, Object> param){
        logger.info("loginFail param : {}", param);
        int res = 0;
        UserInfo userInfo = userMapper.getLoginInfo(param);
        if(userInfo != null){
            res = userMapper.addLoginFailCount(param);
        }

        return res;
    }

    public int loginSuccess(HashMap<String, Object> param){
        logger.info("loginSuccess param : {}", param);
        int res = userMapper.resetLoginFailCount(param);

        return res;
    }

    public int insertActionHistory(HashMap<String, Object> param){
        logger.info("insertActionHistory param : {}", param);
        int res = userMapper.insertActionHistory(param);

        return res;
    }

    public boolean checkRecentlyPw(HashMap<String, Object> param){
        List<UserActionInfo> list = userMapper.getRecentlyPwList(param);
        for(UserActionInfo userActionInfo: list){
            //logger.info("checkRecentlyPw : {}", userActionInfo.getParams());
            //logger.info("input PW : {}", param.toString());
            if(userActionInfo.getParams().equals(param.toString())){
                return true;
            }
        }

        return false;
    }

    public int updateUserPw(HashMap<String, Object> param) {
        logger.info("updateUserPw param : {}", param);

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
        param.remove("password");   //미암호화 패스워드 삭제
        param.remove("password2");  //미암호화 패스워드 삭제

        //최근 3회 비밀번호와 동일한지 체크
        if(checkRecentlyPw(param)){
            return -2;
        }

        //비밀번호 변경 실행
        int res = userMapper.updateUserPw(param);

        return res;
    }

    public int updateResetYn(HashMap<String, Object> param) {
        return userMapper.updateResetYn(param);
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
