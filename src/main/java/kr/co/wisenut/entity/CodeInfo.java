package kr.co.wisenut.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CodeInfo {
    private String groupCd;
    private String gourpNm;
    private String code;
    private String name;
    private String useYn;
    private int sortOrder;
}
