package kr.co.wisenut.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class NegativeKeywordInfo2 {
    private String year;
    private String month;
    private String day;
    private String keyword;
    private int sumCount;
}
