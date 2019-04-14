package com.xstudio.config.security;

import com.alibaba.fastjson.JSON;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.util.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 用户手机登录过滤器
 *
 * @author beeant
 * @version 2019-04-14
 */
public class MobileAuthenticationFilter extends AbstractAuthenticationProcessingFilter {
    public MobileAuthenticationFilter(AuthenticationManager authenticationManager) {
        super(new AntPathRequestMatcher("/uc/api/login", ""));
        this.setAuthenticationManager(authenticationManager);
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException, IOException, ServletException {
        String mobile = null;
        String password = null;
        if (request.getMethod().equals(HttpMethod.POST.name())) {
            String body = null;
            try {
//                body = HttpRequest.get(request);
                body = "// todo";
            } catch (Exception e) {
                logger.error("", e);
            }
            Map<String, String> parse = new HashMap<>(2);
            if (!StringUtils.isEmpty(body)) {
                parse = (Map<String, String>) JSON.parse(body);
                mobile = parse.get("mobile");
                password = parse.get("captcha");
            }
        }

        String decryptPassword = "";
        if (password != null) {
            decryptPassword = password;
        }

        UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(mobile, decryptPassword);
        return this.getAuthenticationManager().authenticate(authRequest);
    }
}
