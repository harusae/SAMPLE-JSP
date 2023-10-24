package kr.co.wisenut.mapper;

import kr.co.wisenut.entity.InterestKeywordInfo1;
import kr.co.wisenut.entity.InterestKeywordInfo2;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface InterestKeywordMapper {
    public List<InterestKeywordInfo1> getInterestKeyword1List(HashMap<String, Object> param);
    public List<InterestKeywordInfo2> getInterestKeyword2List(HashMap<String, Object> param);
    public List<InterestKeywordInfo1> getInterestKeyword3List(HashMap<String, Object> param);
    public List<InterestKeywordInfo2> getInterestKeyword4List(HashMap<String, Object> param);
}
