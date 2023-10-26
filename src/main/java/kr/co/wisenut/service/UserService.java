package kr.co.wisenut.service;

import kr.co.wisenut.config.sub.AES256;
import kr.co.wisenut.config.sub.SHA512;
import kr.co.wisenut.entity.SsoUsrInfo;
import kr.co.wisenut.entity.UserActionInfo;
import kr.co.wisenut.entity.UserInfo;
import kr.co.wisenut.mapper.UserMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Value("${value.pw.initialize:reset12!}")
    private String pwInit;

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
        //param = userId, userPw 2가지만 저장된 형태로 비교함
        List<UserActionInfo> list = userMapper.getRecentlyPwList(param);
        for(UserActionInfo userActionInfo: list){
            //logger.info("checkRecentlyPw : {}", userActionInfo.getParams());
            //logger.info("       input PW : {}", param.toString());
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
        if(userInfo == null || !"Y".equals(userInfo.getInitYn())){
            return -1;
        }

        //password 암호화
        SHA512 encoder = new SHA512();
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

    public int updateUser(HashMap<String, Object> param) {
        AES256 aes256 = new AES256();
        param.put("userName", aes256.encode(param.get("userName").toString()));

        return userMapper.updateUser(param);
    }

    public int initUserPw(HashMap<String, Object> param) {

        //초기화 password 암호화
        SHA512 encoder = new SHA512();
        try {
            param.put("userPw", encoder.encode(pwInit));
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }

        logger.info("initUserPw param : {}", param);

        //비밀번호 변경 실행
        int res = userMapper.initUserPw(param);

        return res;
    }

    public SsoUsrInfo getSsoUsrInfo(Map<String, Object> param){
        return userMapper.getSsoUsrInfo(param);
    }

    public int registUser(Map<String, Object> param){

        //초기화 password 암호화
        SHA512 encoder = new SHA512();
        try {
            param.put("userPw", encoder.encode(pwInit));
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
        logger.info("registUser param : {}", param);

        return userMapper.registUser(param);
    }

    public UserInfo getMyPageInfo(Map<String, Object> param){
        return userMapper.getMyPageInfo(param);
    }

    @Transactional
    public int changeInfo(HashMap<String, Object> param) {

        //파라미터 명 변경
        param.put("alarmYn", param.get("myPageAlarmYn"));
        int res = userMapper.updateUser(param);
        //변경 실패 시
        if(res < 1){
            return -3;
        }

        if(param.containsKey("myPagePwChange") && param.get("myPagePwChange").toString().equals("Y")){
            //password 암호화
            SHA512 encoder = new SHA512();
            try {
                //기존 패스워드 일치여부 확인
                UserInfo userInfo = userMapper.getLoginInfo(param);
                if(!encoder.matches(param.get("myPagePassword").toString(), userInfo.getUserPw())){
                    return -1;
                }
                //변경 패스워드 암호화
                param.put("userPw", encoder.encode(param.get("myPagePassword1").toString()));
            } catch (NoSuchAlgorithmException e) {
                throw new RuntimeException(e);
            }
            //비암호화 패스워드 + 비밀번호 변경이력 저장에 불필요한 데이터 삭제
            param.remove("myPagePassword");
            param.remove("myPagePassword1");
            param.remove("myPagePassword2");
            param.remove("myPagePwChange");
            param.remove("myPageAlarmYn");
            param.remove("alarmYn");

            //최근 3회 비밀번호와 동일한지 체크
            if(checkRecentlyPw(param)){
                return -2;
            }

            //내 비밀번호 변경 실행
            res = userMapper.updateMyPassword(param);
        }



        return res;
    }
}
