package kr.co.wisenut.service;

import kr.co.wisenut.entity.AnalysisStateInfo1;
import kr.co.wisenut.mapper.AnalysisStateMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class AnalysisStateService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private AnalysisStateMapper analysisStateMapper;

    public List<AnalysisStateInfo1> getAnalysisState1List(HashMap<String, Object> param){
        return analysisStateMapper.getAnalysisState1List(param);
    }
}
