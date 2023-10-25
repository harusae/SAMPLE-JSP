package kr.co.wisenut.mapper;

import kr.co.wisenut.entity.NegativeCallCounselInfo1;
import kr.co.wisenut.entity.NegativeCallCounselInfo2;
import kr.co.wisenut.entity.NegativeCallCounselInfo3;
import kr.co.wisenut.entity.NegativeCallInfo2;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface NegativeCallCounselMapper {
    List<NegativeCallCounselInfo1> getNegativeCallCounselList1(HashMap<String, Object> param);
    List<NegativeCallCounselInfo2> getNegativeCallCounselList2(List<String> paramList);
    List<NegativeCallCounselInfo3> getNegativeCallCounselList3(HashMap<String, Object> param);
}
