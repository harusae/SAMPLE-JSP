package kr.co.wisenut.service;

import kr.co.wisenut.entity.InterestKeywordInfo1;
import kr.co.wisenut.entity.InterestKeywordInfo2;
import kr.co.wisenut.mapper.InterestKeywordMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class InterestKeywordService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private InterestKeywordMapper interestKeywordMapper;

    public List<InterestKeywordInfo1> getInterestKeyword1List(HashMap<String, Object> param){
        return interestKeywordMapper.getInterestKeyword1List(param);
    }
    public List<InterestKeywordInfo2> getInterestKeyword2List(HashMap<String, Object> param){
        return interestKeywordMapper.getInterestKeyword2List(param);
    }
    public List<InterestKeywordInfo1> getInterestKeyword3List(HashMap<String, Object> param){
        return interestKeywordMapper.getInterestKeyword3List(param);
    }
    public List<InterestKeywordInfo2> getInterestKeyword4List(HashMap<String, Object> param){
        return interestKeywordMapper.getInterestKeyword4List(param);
    }
}
