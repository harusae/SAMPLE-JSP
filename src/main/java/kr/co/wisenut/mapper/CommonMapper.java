package kr.co.wisenut.mapper;

import kr.co.wisenut.entity.CodeInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface CommonMapper {
    List<CodeInfo> getCodeList(Map<String, Object> param);
}
