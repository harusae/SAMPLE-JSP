package kr.co.wisenut.mapper;

import kr.co.wisenut.entity.UserInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.Map;

@Mapper
public interface UserMapper {
    public UserInfo getLoginInfo(Map<String, Object> param);
    public HashMap<String, Object> getLoginInfo2(Map<String, Object> param);

}
