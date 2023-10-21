package kr.co.wisenut.service;

import kr.co.wisenut.entity.DashboardInfo1;
import kr.co.wisenut.entity.DashboardInfo2;
import kr.co.wisenut.entity.DashboardInfo3;
import kr.co.wisenut.mapper.DashboardMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class DashboardService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private DashboardMapper dashboardMapper;

    public List<DashboardInfo1> getDashboard1List(HashMap<String, Object> param){
        return dashboardMapper.getDashboard1List(param);
    }

    public List<DashboardInfo2> getDashboard2List(HashMap<String, Object> param){
        return dashboardMapper.getDashboard2List(param);
    }

    public List<DashboardInfo3> getDashboard3List(HashMap<String, Object> param){
        return dashboardMapper.getDashboard3List(param);
    }
}
