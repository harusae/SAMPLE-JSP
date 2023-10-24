package kr.co.wisenut.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class DashboardInfo4 {
    private String keyword;
    private int sumCountBeforeWeek;
    private int sumCountYesterday;
    private int sumCountToday;
}
