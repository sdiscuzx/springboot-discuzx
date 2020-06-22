package com.xstudio.discuzx.config.security.www;

import com.xstudio.core.Msg;
import com.xstudio.http.RequestUtil;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Beeant
 * @version 2020/6/13
 */
public class AjaxLogoutSuccessHandler implements LogoutSuccessHandler {
    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        Msg<Object> result = new Msg<>();

        RequestUtil.writeJson(response, result);
    }
}
