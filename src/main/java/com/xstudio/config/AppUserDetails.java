package com.xstudio.config;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.util.Assert;

import java.io.Serializable;
import java.util.*;

/**
 * 登录用户信息
 *
 * @author xiaobiao on 2017/3/30.
 */
public class AppUserDetails implements UserDetails, Serializable {


    private static final long serialVersionUID = 6806823795249416381L;
    private String userId;

    private String username;

    private String password;

    private Object userDetails;

    private Boolean locked;

    private Boolean enabled;

    private Boolean expired;

    private Set<GrantedAuthority> authorities;

    public AppUserDetails() {
    }

    public AppUserDetails(String userId, String username, String password) {
        this.userId = userId;
        this.username = username;
        this.password = password;
    }

    public AppUserDetails(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public AppUserDetails(String userId, String username, String password, Object userDetails) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.userDetails = userDetails;
    }

    public AppUserDetails(Object userDetails) {
        this.userDetails = userDetails;
    }

    private static SortedSet<GrantedAuthority> sortAuthorities(
            Collection<? extends GrantedAuthority> authorities) {
        Assert.notNull(authorities, "Cannot pass a null GrantedAuthority collection");
        // Ensure array iteration order is predictable (as per
        // UserDetails.getAuthorities() contract and SEC-717)
        SortedSet<GrantedAuthority> sortedAuthorities = new TreeSet<>(
                new AuthorityComparator());

        for (GrantedAuthority grantedAuthority : authorities) {
            Assert.notNull(grantedAuthority,
                    "GrantedAuthority list cannot contain any null elements");
            sortedAuthorities.add(grantedAuthority);
        }

        return sortedAuthorities;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Override
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return expired == null || !expired;
    }

    @Override
    public boolean isAccountNonLocked() {
        return locked == null || !locked;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return enabled == null ? true : enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return this.authorities;
    }

    public void setAuthorities(List<GrantedAuthority> dbAuths) {
        this.authorities = Collections.unmodifiableSet(sortAuthorities(dbAuths));
    }

    @Override
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Object getUserDetails() {
        return userDetails;
    }

    /**
     * Setter for property 'userDetails'.
     *
     * @param userDetails Value to set for property 'userDetails'.
     */
    public void setUserDetails(Object userDetails) {
        this.userDetails = userDetails;
    }

    private static class AuthorityComparator implements Comparator<GrantedAuthority>,
            Serializable {
        private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;

        @Override
        public int compare(GrantedAuthority g1, GrantedAuthority g2) {
            // Neither should ever be null as each entry is checked before adding it to
            // the set.
            // If the authority is null, it is a custom authority and should precede
            // others.
            if (g2.getAuthority() == null) {
                return -1;
            }

            if (g1.getAuthority() == null) {
                return 1;
            }

            return g1.getAuthority().compareTo(g2.getAuthority());
        }
    }
}

