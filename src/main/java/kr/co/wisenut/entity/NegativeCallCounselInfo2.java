package kr.co.wisenut.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class NegativeCallCounselInfo2 {
    private String year;
    private String month;
    private String day;
    private String agentId;
    private String agentNm;
    private String sumCount;

}
