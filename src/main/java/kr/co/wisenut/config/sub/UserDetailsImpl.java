package kr.co.wisenut.config.sub;

import kr.co.wisenut.entity.MenuInfo;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;

@Data
public class UserDetailsImpl implements UserDetails{

    private String username;
    private String password;
    private boolean isEnabled;
    private boolean isAccountNonExpired;
    private boolean isAccountNonLocked;
    private boolean isCredentialsNonExpired;
    private Collection<? extends GrantedAuthority> authorities;;

    //모든 메뉴 목록
    List<MenuInfo> menuListAll;
    //사용자 별 메뉴 권한목록
    List<MenuInfo> menuList;
    //패스워드 초기화 여부
    private String resetYn;

}
