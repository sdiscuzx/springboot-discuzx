package com.xstudio.discuzx.config;

import com.xstudio.discuzx.config.security.www.*;
import com.xstudio.discuzx.ultrax.service.IUcenterMembersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

/**
 * 系统接口安全配置
 *
 * @author xiaobiao
 * @version 2020/6/2
 */
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
    @Autowired
    private IUcenterMembersService userDetailsService;

    /**
     * 静态资源设置
     */
    @Override
    public void configure(WebSecurity webSecurity) {
        //不拦截静态资源,所有用户均可访问的资源
        webSecurity.ignoring().antMatchers(
                "/",
                "/**.css",
                "/**.js",
                "/**.png",
                "/**.img",
                "/**.source.js",
                "/**.source.css"
        );
    }

    /**
     * http请求设置
     */
    @Override
    public void configure(HttpSecurity http) throws Exception {
        // 注释就是使用 csrf 功能
        http.csrf().disable();
        // 解决 in a frame because it set 'X-Frame-Options' to 'DENY' 问题
        http.headers().frameOptions().disable();

        http.httpBasic().authenticationEntryPoint(new AjaxAuthenticationEntryPoint());
        http.logout().logoutSuccessHandler(new AjaxLogoutSuccessHandler());
        // 无权访问 JSON 格式的数据
        http.exceptionHandling().accessDeniedHandler(new AjaxAccessDeniedHandler());

        http.authorizeRequests()
                // 不拦截登录相关方法
                .antMatchers("/login/**")
                .permitAll()
                .anyRequest().authenticated()
                .and()
                .formLogin()
                .successHandler(new AjaxAuthenticationSuccessHandler())
                .failureHandler(new AjaxAuthenticationFailureHandler())
                .loginPage("/")
                // 登录请求页
                .loginPage("/login")
                // 登录POST请求路径
                .loginProcessingUrl("/login")
                // 登录用户名参数
                .usernameParameter("usr")
                // 登录密码参数
                .passwordParameter("pwd")
//                // 默认登录成功页面
//                .defaultSuccessUrl("/")
                .and()
                .exceptionHandling()
                .and()
                .logout()
                // 退出登录成功URL
                .logoutSuccessUrl("/login?logout");
    }

    /**
     * 自定义获取用户信息服务
     */
    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setUserDetailsService(userDetailsService);
        provider.setPasswordEncoder(new DiscuzxPasswordEncoder());
        auth.authenticationProvider(provider);
    }


}
