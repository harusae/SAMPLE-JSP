package kr.co.wisenut.service;

import kr.co.wisenut.entity.NegativeCallCounselInfo1;
import kr.co.wisenut.entity.NegativeCallCounselInfo2;
import kr.co.wisenut.entity.NegativeCallCounselInfo3;
import kr.co.wisenut.mapper.NegativeCallCounselMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class NegativeCallCounselService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private NegativeCallCounselMapper negativeCallCounselMapper;
    public List<NegativeCallCounselInfo1> getNegativeCallCounselList1(HashMap<String, Object> param){
        return negativeCallCounselMapper.getNegativeCallCounselList1(param);
    }
    public List<NegativeCallCounselInfo2> getNegativeCallCounselList2(List<String> paramList){
        return negativeCallCounselMapper.getNegativeCallCounselList2(paramList);
    }
    public List<NegativeCallCounselInfo3> getNegativeCallCounselList3(HashMap<String, Object> param){
        return negativeCallCounselMapper.getNegativeCallCounselList3(param);
    }
}
