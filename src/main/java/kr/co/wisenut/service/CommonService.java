package kr.co.wisenut.service;

import kr.co.wisenut.entity.CodeInfo;
import kr.co.wisenut.mapper.CommonMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class CommonService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private CommonMapper commonMapper;

    public List<CodeInfo> getCodeList(HashMap<String, Object> param) {
        return commonMapper.getCodeList(param);
    }
}
