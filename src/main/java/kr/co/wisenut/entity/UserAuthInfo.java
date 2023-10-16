package kr.co.wisenut.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class UserAuthInfo {
    String userAuth;
    String userAuthName;
}
