package com.xstudio.discuzx.config.security;

import com.xstudio.discuzx.ultrax.model.UcenterMembers;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;

/**
 * @author Beeant
 * @version 2020/6/13
 */
public class UserDetailsExt extends User {
    /**
     * 用户详情
     */
    private UcenterMembers detail;

    public UserDetailsExt(String username, String password, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
    }

    public UserDetailsExt(String username, String password, boolean enabled, boolean accountNonExpired, boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
    }

    public UcenterMembers getDetail() {
        return detail;
    }

    public void setDetail(UcenterMembers detail) {
        this.detail = detail;
    }
}
