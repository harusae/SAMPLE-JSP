package kr.co.wisenut.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class UserInfo {
    private String userId;
    private String userPw;
    private String userName;
    private String userEmail;
    private String userAuth;
    private String enabled;

}
