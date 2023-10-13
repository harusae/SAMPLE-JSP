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
    private String useYn;
    private String activeYn;
    private int loginFailCnt;
    private String initYn;
    private String alarmYn;
    private int pwChgDay;   //패스워드 변경 후 누적일 수 > 조회용으로 sql로 생성한 데이터

}
