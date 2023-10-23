package kr.co.wisenut.mapper;

import kr.co.wisenut.entity.Lv1Info;
import kr.co.wisenut.entity.RealtimeKeywordChartInfo;
import kr.co.wisenut.entity.RealtimeKeywordInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface RealtimeKeywordMapper {
    List<RealtimeKeywordInfo> getRealtimeKeywordList(HashMap<String, Object> param);
    List<Lv1Info> getLv1ClsList(HashMap<String, Object> param);
    List<RealtimeKeywordChartInfo> getLv1ChartList(HashMap<String, Object> param);

}
