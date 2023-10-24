package kr.co.wisenut.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class AnalysisStateInfo1 {
    private String day;
    private String sentClsCd;
    private String sentClsCdNm;
    private int sumCount;
}
