package kr.co.wisenut.mapper;

import kr.co.wisenut.entity.DashboardInfo1;
import kr.co.wisenut.entity.DashboardInfo2;
import kr.co.wisenut.entity.DashboardInfo3;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface DashboardMapper {
    public List<DashboardInfo1> getDashboard1List(HashMap<String, Object> param);
    public List<DashboardInfo2> getDashboard2List(HashMap<String, Object> param);
    public List<DashboardInfo3> getDashboard3List(HashMap<String, Object> param);
}
