package kr.co.wisenut.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class MenuInfo {
    String menuId;
    String menuName;
    String menuUrl;
    String upperMenuId;
    int menuOrder;
    String creDt;
    String creUser;
    String modDt;
    String modUser;
}
