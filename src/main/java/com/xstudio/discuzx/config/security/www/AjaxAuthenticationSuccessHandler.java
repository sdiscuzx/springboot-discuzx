package com.xstudio.discuzx.config.security.www;

import com.xstudio.core.Msg;
import com.xstudio.discuzx.config.security.UserDetailsExt;
import com.xstudio.discuzx.ultrax.model.UcenterMembers;
import com.xstudio.http.RequestUtil;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Beeant
 * @version 2020/6/13
 */
public class AjaxAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, FilterChain chain, Authentication authentication) throws IOException, ServletException {
        Msg<UcenterMembers> result = new Msg<>();
        UserDetailsExt principal = (UserDetailsExt) authentication.getPrincipal();
        UcenterMembers detail = principal.getDetail();
        result.setData(detail);
        RequestUtil.writeJson(response, result);
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        Msg<UcenterMembers> result = new Msg<>();
        UserDetailsExt principal = (UserDetailsExt) authentication.getPrincipal();
        UcenterMembers detail = principal.getDetail();
        result.setData(detail);
        RequestUtil.writeJson(response, result);
    }
}
