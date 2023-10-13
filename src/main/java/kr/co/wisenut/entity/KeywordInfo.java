package kr.co.wisenut.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class KeywordInfo {
    private int dicId;
    private String dicName;
    private String dicType;
    private String dicDesc;
    private String keyword;
    private String useYn;
    private int sortOrder;

}
