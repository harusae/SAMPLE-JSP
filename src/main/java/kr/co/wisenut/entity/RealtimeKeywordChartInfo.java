package kr.co.wisenut.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class RealtimeKeywordChartInfo {
    private String lv1Cd;
    private String lv1Nm;
    private int sumCount;
}
