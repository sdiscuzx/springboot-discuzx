package com.xstudio.discuzx.config.security;

import org.springframework.security.core.Authentication;

/**
 * @author xiaobiao
 * @version 2019/10/6
 */
public class AuthenticationSuccessHandler extends com.xstudio.spring.security.handler.AuthenticationSuccessHandler {
    @Override
    public Object setData(Authentication authentication) {
        AuthenticationSuccessResponse response = new AuthenticationSuccessResponse();
        response.setUsername(authentication.getName());
        return response;
    }
}
