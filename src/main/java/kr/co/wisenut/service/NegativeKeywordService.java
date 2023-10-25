package kr.co.wisenut.service;

import kr.co.wisenut.entity.NegativeKeywordInfo1;
import kr.co.wisenut.entity.NegativeKeywordInfo2;
import kr.co.wisenut.entity.NegativeKeywordInfo3;
import kr.co.wisenut.entity.NegativeKeywordInfo4;
import kr.co.wisenut.mapper.NegativeKeywordMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class NegativeKeywordService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private NegativeKeywordMapper negativeKeywordMapper;

    public List<NegativeKeywordInfo1> getNegativeKeyword1List(HashMap<String, Object> param){
        return negativeKeywordMapper.getNegativeKeyword1List(param);
    }
    public List<NegativeKeywordInfo2> getNegativeKeyword2List(HashMap<String, Object> param){
        return negativeKeywordMapper.getNegativeKeyword2List(param);
    }
    public List<NegativeKeywordInfo3> getNegativeKeyword3List(HashMap<String, Object> param){
        return negativeKeywordMapper.getNegativeKeyword3List(param);
    }
    public List<NegativeKeywordInfo4> getNegativeKeyword4List(HashMap<String, Object> param){
        return negativeKeywordMapper.getNegativeKeyword4List(param);
    }
}
