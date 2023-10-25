package kr.co.wisenut.mapper;

import kr.co.wisenut.entity.NegativeKeywordInfo1;
import kr.co.wisenut.entity.NegativeKeywordInfo2;
import kr.co.wisenut.entity.NegativeKeywordInfo3;
import kr.co.wisenut.entity.NegativeKeywordInfo4;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface NegativeKeywordMapper {
    public List<NegativeKeywordInfo1> getNegativeKeyword1List(HashMap<String, Object> param);
    public List<NegativeKeywordInfo2> getNegativeKeyword2List(HashMap<String, Object> param);
    public List<NegativeKeywordInfo3> getNegativeKeyword3List(HashMap<String, Object> param);
    public List<NegativeKeywordInfo4> getNegativeKeyword4List(HashMap<String, Object> param);
}
