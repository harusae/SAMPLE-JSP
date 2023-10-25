package kr.co.wisenut.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class NegativeKeywordInfo1 {
    private String keyword;
    private int sumCountToday;
    private int sumCountYesterday;
    private int sumCountBeforeWeekAvr;
    private int sumCountBeforeWeekDay;
}
