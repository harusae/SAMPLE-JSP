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
    private Collection<? extends GrantedAuthority> authorities;

    //사용자 별 메뉴 권한목록
    List<MenuInfo> menuList;

}
