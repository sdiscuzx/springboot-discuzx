package com.xstudio.config;

import com.xstudio.config.security.MobileAuthenticationFilter;
import com.xstudio.config.security.MobileAuthenticationProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
public class WebSecurity extends WebSecurityConfigurerAdapter {

    @Autowired
    private MobileAuthenticationProvider mobileAuthenticationProvider;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        // 登出配置
        http
                .antMatcher("/uc/api/login")
                .authorizeRequests().anyRequest().permitAll()
                .and()
                .antMatcher("/uc/api/**")
                .authorizeRequests().anyRequest().authenticated()
                .and()
                .logout().logoutUrl("/uc/api/logout")
                .invalidateHttpSession(true)
                .deleteCookies("SESSION")

        ;

        http.addFilterAt(new MobileAuthenticationFilter(authenticationManagerBean()), UsernamePasswordAuthenticationFilter.class);
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(mobileAuthenticationProvider);
    }
}
