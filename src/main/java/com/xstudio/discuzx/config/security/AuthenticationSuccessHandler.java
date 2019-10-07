package com.xstudio.discuzx.config.security;

import com.xstudio.spring.security.params.LoginParams;
import org.springframework.security.core.Authentication;

/**
 * @author xiaobiao
 * @version 2019/10/6
 */
public class AuthenticationSuccessHandler extends com.xstudio.spring.security.handler.AuthenticationSuccessHandler {
    @Override
    public Object setData(Authentication authentication) {
        AuthenticationSuccessResponse response = new AuthenticationSuccessResponse();
        LoginParams loginParams = (LoginParams) authentication.getDetails();
        response.setUsername(authentication.getName());
        response.setType((String) loginParams.get("type"));
        return response;
    }
}
