package kr.co.wisenut.service;

import kr.co.wisenut.entity.Lv1Info;
import kr.co.wisenut.entity.RealtimeKeywordChartInfo;
import kr.co.wisenut.entity.RealtimeKeywordInfo;
import kr.co.wisenut.mapper.RealtimeKeywordMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class RealtimeKeywordService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private RealtimeKeywordMapper realtimeKeywordMapper;

    public List<Lv1Info> getLv1ClsList(HashMap<String, Object> param){
        return realtimeKeywordMapper.getLv1ClsList(param);
    }

    public List<List<List<Object>>> getRealtimeKeywordList(HashMap<String, Object> param){

        List<Lv1Info> lv1List = realtimeKeywordMapper.getLv1ClsList(param);
        logger.info("lv1List size : {}", lv1List.size());
        logger.info("lv1List  : {}", lv1List);


        List<RealtimeKeywordInfo> tmpList = new ArrayList<>();
        for(int i=0; i<10; i++){
            if(lv1List != null && i < lv1List.size()){
                Lv1Info lv1Info = lv1List.get(i);
                //logger.info("lv1Info.getLv1Cd(): {}", lv1Info.getLv1Cd() );
                param.put("lv1Cd", lv1Info.getLv1Cd());
                List<RealtimeKeywordInfo> rtkList = realtimeKeywordMapper.getRealtimeKeywordList(param);
                //logger.info("rtkList : {}", rtkList.size());

                for(int j=0; j<10; j++){
                    if(rtkList != null && j < rtkList.size()){
                        //logger.info("rtkInfo : {}", rtkList.get(j) );
                        tmpList.add(rtkList.get(j));
                    }
                    else{
                        //빈값 입력
                        //tmpList.add(new RealtimeKeywordInfo(lv1Info.getLv1Cd(), lv1Info.getLv1Nm(), "","","","-",0));
                        tmpList.add(new RealtimeKeywordInfo(lv1Info.getLv1Cd(), lv1Info.getLv1Nm(), "-",0));
                    }

                }
            }
            else{
                for(int j=0; j<10; j++){
                    //빈값 입력
                    //tmpList.add(new RealtimeKeywordInfo("", "", "","","","-",0));
                    tmpList.add(new RealtimeKeywordInfo("", "", "-",0));

                }
            }
        }

        logger.info("tmpList.size() : {}", tmpList.size());
        logger.info("tmpList : {}", tmpList);

        //List<List<HashMap<String, Object>>> resultList = new ArrayList<>();
        List<List<List<Object>>> resultList = new ArrayList<>();

        for(int k=0; k< 10; k++){

            //List<HashMap<String, Object>> itemList = new ArrayList<>();
            List<List<Object>> itemList = new ArrayList<>();

            for(int l=0; l<10; l++){

                //HashMap<String, Object> tmpItem = new HashMap<>();
                List<Object> tmpItem = new ArrayList<>();
                int num = k + l*10;
                RealtimeKeywordInfo rtkInfo = tmpList.get(num);
                logger.info("num : {} , rtkInfo : {}", num, rtkInfo);
                //tmpItem.add(rtkInfo.getLv3Nm());
                tmpItem.add(rtkInfo.getKeyword());
                tmpItem.add(rtkInfo.getSumCount());
                itemList.add(tmpItem);

            }
            resultList.add(itemList);
            logger.info("resultItem : {}", itemList);
        }

        return resultList;
    }

    public List<RealtimeKeywordChartInfo> getLv1ChartList(HashMap<String, Object> param){
        return realtimeKeywordMapper.getLv1ChartList(param);
    }
}
