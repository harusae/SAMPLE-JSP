package kr.co.wisenut.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class SsoUsrInfo {
    private String ssoId;
    private String usrNm;
    private String blntBrno;
    private String hlfcDscd;
}
