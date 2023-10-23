package kr.co.wisenut.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class RealtimeKeywordInfo {
    private String lv1Cd;
    private String lv1Nm;
    private String lv2Cd;
    private String lv2Nm;
    private String lv3Cd;
    private String lv3Nm;
    private int sumCount;
}
