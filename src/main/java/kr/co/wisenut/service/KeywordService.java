package kr.co.wisenut.service;

import kr.co.wisenut.entity.KeywordInfo;
import kr.co.wisenut.mapper.KeywordMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class KeywordService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private KeywordMapper keywordMapper;

    public List<KeywordInfo> getKeywordList(Map<String, Object> param){
        return keywordMapper.getKeywordList(param);
    }
    @Transactional
    public int deleteKeyword(List<String> paramList){
        int res = 0;
        res = keywordMapper.deleteKeyword(paramList);
        return res;
    }

}
