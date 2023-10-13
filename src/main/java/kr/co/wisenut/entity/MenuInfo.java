package kr.co.wisenut.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class MenuInfo {
    private String menuId;
    private String menuName;
    private String menuUrl;
    private String upperMenuId;
    private int menuOrder;
    private String creDt;
    private String creUser;
    private String modDt;
    private String modUser;
}
