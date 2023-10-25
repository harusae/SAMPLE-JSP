package kr.co.wisenut.service;

import kr.co.wisenut.entity.NegativeCallInfo1;
import kr.co.wisenut.entity.NegativeCallInfo2;
import kr.co.wisenut.entity.NegativeCallInfo3;
import kr.co.wisenut.mapper.NegativeCallMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class NegativeCallService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private NegativeCallMapper negativeCallMapper;

    public List<NegativeCallInfo1> getlv3List(HashMap<String, Object> param){
        return negativeCallMapper.getlv3List(param);
    }

    public List<NegativeCallInfo2> getlv3ChartList(List<String> paramList){
        return negativeCallMapper.getlv3ChartList(paramList);
    }
    public List<NegativeCallInfo3> getGridList(HashMap<String, Object> param){
        return negativeCallMapper.getGridList(param);
    }
}
