package com.xstudio.discuzx.config.security.www;

import com.xstudio.core.Msg;
import com.xstudio.http.RequestUtil;
import org.springframework.security.authentication.*;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Beeant
 * @version 2020/6/13
 */
public class AjaxAuthenticationFailureHandler implements AuthenticationFailureHandler {
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        Msg<Object> responseBody = new Msg<>();
        if (exception instanceof UsernameNotFoundException) {
            responseBody.setResult(1, "用户名或密码错误!");
        } else if (exception instanceof BadCredentialsException) {
            responseBody.setResult(2, "用户名或密码错误!");
        } else if (exception instanceof LockedException) {
            responseBody.setResult(3, "用户已被锁定!");
        } else if (exception instanceof DisabledException) {
            responseBody.setResult(4, "用户不可用!");
        } else if (exception instanceof AccountExpiredException) {
            responseBody.setResult(5, "账户已过期!");
        } else if (exception instanceof CredentialsExpiredException) {
            responseBody.setResult(6, "用户密码已过期!");
//        } else if(exception instanceof TokenInvalidException) {
//            ResultEnum.USER_LOGIN_FAILED .setMessage( "登陆信息已过期,请重新登陆";
        } else {
            responseBody.setResult(7, "认证失败，请联系网站管理员!");
        }

        RequestUtil.writeJson(response, responseBody);
    }
}
