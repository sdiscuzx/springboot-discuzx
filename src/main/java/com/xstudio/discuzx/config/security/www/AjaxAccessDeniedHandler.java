package com.xstudio.discuzx.config.security.www;

import com.xstudio.core.Msg;
import com.xstudio.http.RequestUtil;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Beeant
 * @version 2020/6/13
 */
public class AjaxAccessDeniedHandler implements AccessDeniedHandler {
    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException, ServletException {
        Msg<Object> result = new Msg<>();

        RequestUtil.writeJson(response, result);
    }
}
