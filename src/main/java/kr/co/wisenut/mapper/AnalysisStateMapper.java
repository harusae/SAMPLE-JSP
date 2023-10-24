package kr.co.wisenut.mapper;

import kr.co.wisenut.entity.AnalysisStateInfo1;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface AnalysisStateMapper {
    public List<AnalysisStateInfo1> getAnalysisState1List(HashMap<String, Object> param);
}
