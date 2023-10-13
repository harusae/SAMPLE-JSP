package kr.co.wisenut.mapper;

import kr.co.wisenut.entity.KeywordInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface KeywordMapper {
    public List<KeywordInfo> getKeywordList(Map<String, Object> param);
    public int insertKeyword(Map<String, Object> param);
    public int updateKeyword(Map<String, Object> param);
    public int deleteKeyword(List<String> paramList);
}
