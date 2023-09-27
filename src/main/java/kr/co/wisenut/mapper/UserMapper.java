package kr.co.wisenut.mapper;

import kr.co.wisenut.entity.UserInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
public interface UserMapper {
    public UserInfo getLoginInfo(Map<String, Object> param);

    public int addLoginFailCount(Map<String, Object> param);

    public int resetLoginFailCount(Map<String, Object> param);

    public List<UserInfo> getUserList(Map<String, Object> param);
}
