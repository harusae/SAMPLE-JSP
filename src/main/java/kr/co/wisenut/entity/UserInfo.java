package kr.co.wisenut.entity;

import lombok.Data;

@Data
public class UserInfo {
    private String userId;
    private String userPw;
    private String userName;
    private String userEmail;
    private String userAuth;

}
