package kr.co.wisenut.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class NegativeKeywordInfo3 {
    private String sessId;
    private String callId;
    private String callStartDate;
    private String callStartTime;
    private String callTime;
    private String agentNm;
    private String sentClsPt;
}
