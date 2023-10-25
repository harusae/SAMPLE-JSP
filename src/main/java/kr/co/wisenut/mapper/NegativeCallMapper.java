package kr.co.wisenut.mapper;

import kr.co.wisenut.entity.NegativeCallInfo1;
import kr.co.wisenut.entity.NegativeCallInfo2;
import kr.co.wisenut.entity.NegativeCallInfo3;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface NegativeCallMapper {
    public List<NegativeCallInfo1> getlv3List(HashMap<String, Object> param);
    public List<NegativeCallInfo2> getlv3ChartList(List<String> paramList);
    public List<NegativeCallInfo3> getGridList(HashMap<String, Object> param);
}
