package kr.co.wisenut.mapper;

import kr.co.wisenut.entity.SsoUsrInfo;
import kr.co.wisenut.entity.UserActionInfo;
import kr.co.wisenut.entity.UserInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface UserMapper {
    public UserInfo getLoginInfo(Map<String, Object> param);

    public int addLoginFailCount(Map<String, Object> param);

    public int resetLoginFailCount(Map<String, Object> param);

    public int insertActionHistory(Map<String, Object> param);

    public List<UserActionInfo> getRecentlyPwList(Map<String, Object> param);

    public int updateUserPw(Map<String, Object> param);

    public int updateResetYn(Map<String, Object> param);

    public List<UserInfo> getUserList(Map<String, Object> param);

    public int updateUser(Map<String, Object> param);

    public int initUserPw(Map<String, Object> param);

    public SsoUsrInfo getSsoUsrInfo(Map<String, Object> param);

    public int registUser(Map<String, Object> param);

    public UserInfo getMyPageInfo(Map<String, Object> param);

    public int updateMyPassword(Map<String, Object> param);
}
