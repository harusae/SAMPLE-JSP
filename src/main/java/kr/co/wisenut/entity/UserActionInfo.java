package kr.co.wisenut.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class UserActionInfo {
    private int actionId;
    private String actionDt;
    private String actionType;
    private int resourceId;
    private String resourceType;
    private String actionMsg;
    private String actionUser;
    private String params;
    private String userIp;
}
