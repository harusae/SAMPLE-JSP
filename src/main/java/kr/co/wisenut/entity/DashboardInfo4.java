package kr.co.wisenut.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class DashboardInfo4 {
    private String year;
    private String month;
    private String day;
    private String keyword;
    private int sumCountToday;
    private int sumCountTodayBefore1;
    private int sumCountTodayBefore2;
    private int sumCountTodayBefore3;
    private int sumCountTodayBefore4;
    private int sumCountTodayBefore5;
    private int sumCountTodayBefore6;
    private int sumCountTodayBefore7;
    private int sumCountTodayBefore8;
}
