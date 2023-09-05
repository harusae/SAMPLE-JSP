package kr.co.wisenut.service;

import kr.co.wisenut.entity.UserInfo;
import kr.co.wisenut.mapper.TestMapper;
import kr.co.wisenut.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class TestService{

    @Autowired
    private TestMapper testMapper;
    @Autowired
    private UserMapper userMapper;

    public int getTest01Count(){
        int count = testMapper.getTest01Count();

        return count;
    }

    public HashMap<String, Object> getLoginInfo(){
        HashMap<String, Object> param = new HashMap<>();
        param.put("userId", "test1");
        HashMap<String, Object> res = userMapper.getLoginInfo2(param);

        return res;
    }
}
