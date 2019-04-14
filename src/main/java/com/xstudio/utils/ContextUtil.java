package com.xstudio.utils;


import com.xstudio.config.AppUserDetails;
import org.springframework.context.ApplicationContext;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.List;

/**
 * @author xiaobiao
 * @version 1.0.0 on 2017/4/11.
 */
public class ContextUtil {
    private static ApplicationContext context;

    public static ApplicationContext getContext() {
        return context;
    }

    public static void setContext(ApplicationContext context) {
        ContextUtil.context = context;
    }

    /**
     * 获取当前会话用户信息
     *
     * @return @see AppUserDetails
     */
    public static AppUserDetails getCurrentUser() {
        try {
            Class.forName("org.springframework.security.core.context.SecurityContextHolder");
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            if (null == auth) {
                return null;
            }
            if (auth.getPrincipal() instanceof AppUserDetails) {
                return (AppUserDetails) auth.getPrincipal();
            } else {
                AppUserDetails appUserDetails = new AppUserDetails();
                appUserDetails.setUserId((String) auth.getPrincipal());
                appUserDetails.setAuthorities((List<GrantedAuthority>) auth.getAuthorities());
                return appUserDetails;
            }
        } catch (ClassNotFoundException e) {
            return null;
        }
    }


    public static boolean isSuperadmin() {
        return hasRole(getCurrentUser(), "superadmin");
    }

    public static boolean hasRole(String roleName) {
        return hasRole(getCurrentUser(), roleName);
    }

    public static boolean isSuperadmin(AppUserDetails user) {
        return hasRole(user, "superadmin");
    }

    public static boolean hasRole(AppUserDetails user, String roleName) {
        if (null == user || null == user.getAuthorities()) {
            return false;
        }
        String role = "ROLE_" + roleName;

        for (GrantedAuthority grantedAuthority : user.getAuthorities()) {
            if (role.equals(grantedAuthority.getAuthority())) {
                return true;
            }
        }
        return false;
    }

    public static Object getBean(String name) {
        return getContext().getBean(name);
    }

    public static <T> T getBean(Class<T> requiredType) {
        return getContext().getBean(requiredType);
    }

    public static String getProperty(String property) {
        return ContextUtil.getContext().getEnvironment().getProperty(property);
    }

    public static String getProperty(String var1, String var2) {
        return ContextUtil.getContext().getEnvironment().getProperty(var1, var2);
    }

    public static <T> T getProperty(String var1, Class<T> var2) {
        return ContextUtil.getContext().getEnvironment().getProperty(var1, var2);
    }

    public static <T> T getProperty(String var1, Class<T> var2, T var3) {
        return ContextUtil.getContext().getEnvironment().getProperty(var1, var2, var3);
    }
}
