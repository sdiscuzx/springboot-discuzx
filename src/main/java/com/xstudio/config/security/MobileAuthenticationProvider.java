package com.xstudio.config.security;

import com.xstudio.discuzx.model.CommonMember;
import com.xstudio.discuzx.service.IPreCommonMemberService;
import com.xstudio.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class MobileAuthenticationProvider implements AuthenticationProvider {
    @Autowired
    private IPreCommonMemberService userService;

    @Autowired
    private Environment env;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        // 用户名
        String username = authentication.getName();
        // 验证码
        String password = (String) authentication.getCredentials();
        Msg<CommonMember> userByname = userService.getUserByname(username);
        List<SimpleGrantedAuthority> auths = new ArrayList<>();
        //游客=》提示用户去注册
        if (!userByname.getSuccess()) {
            //授权
            auths.add(new SimpleGrantedAuthority("ROLE_GUEST"));
            throw new UsernameNotFoundException(username);
        } else {
            // 存在此用户，调用登录接口
            if (true) {
                //验证码和手机号码正确,返回用户权限
                auths.add(new SimpleGrantedAuthority("ROLE_XXX"));
            } else {
                //验证消息放到权限里面， 页面提示
            }
        }
        return new UsernamePasswordAuthenticationToken(username, password, auths);
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }
}
