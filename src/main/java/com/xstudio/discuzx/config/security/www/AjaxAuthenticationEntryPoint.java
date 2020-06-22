package com.xstudio.discuzx.config.security.www;

import com.xstudio.core.Msg;
import com.xstudio.http.RequestUtil;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Beeant
 * @version 2020/6/13
 */
public class AjaxAuthenticationEntryPoint implements AuthenticationEntryPoint {
    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException, ServletException {
        Msg<Object> result = new Msg<>();

        RequestUtil.writeJson(response, result);
    }
}
