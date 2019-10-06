package com.xstudio.discuzx.config.security;

import com.xstudio.spring.security.ExtraParameterAuthenticationFilter;
import com.xstudio.spring.security.UnauthorizedAuthenticationEntryPoint;
import com.xstudio.spring.security.handler.AuthenticationFailureHandler;
import com.xstudio.spring.security.handler.LogoutSuccessHandler;
import com.xstudio.spring.security.handler.RestAuthenticationAccessDeniedHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

/**
 * @author xiaobiao
 * @version 2019/10/3
 */
@Configuration
public class WebSecurityConfiguration {
    private static final String LOGIN_API = "/api/member/login";
    private static final String LOGOUT_API = "/api/logout";
    private static final String[] AUTH_WHITELIST = {
            // static resources
            "/",
    };

    private static Logger logger = LoggerFactory.getLogger(WebSecurityConfiguration.class);

    /**
     * 已登录，未授权异常处理
     *
     * @return
     */
    @Bean
    public AccessDeniedHandler getAccessDeniedHandler() {
        return new RestAuthenticationAccessDeniedHandler();
    }

    /**
     * 管理后台权限配置
     */
    @Configuration
    public class ApiWebSecurityConfigurationAdapter extends WebSecurityConfigurerAdapter {

        @Override
        protected void configure(HttpSecurity http) throws Exception {
            http.csrf().disable();

            http.authorizeRequests().antMatchers("/**").permitAll()
                    .antMatchers("/admin/**").authenticated()
                    .and()
                    .formLogin()
                    .loginProcessingUrl(LOGIN_API)
                    .and()// 登出配置
                    .logout().logoutUrl(LOGOUT_API)
                    .invalidateHttpSession(true)
                    .logoutSuccessHandler(new LogoutSuccessHandler())
                    .deleteCookies("SESSION")
            ;
            // 未登录异常处理
            http.exceptionHandling().authenticationEntryPoint(new UnauthorizedAuthenticationEntryPoint());
            // 自定义登录求参数获取
            ExtraParameterAuthenticationFilter authenticationFilter = new ExtraParameterAuthenticationFilter(authenticationManagerBean(), LOGIN_API);
            // 自定义失败处理器
            authenticationFilter.setAuthenticationFailureHandler(new AuthenticationFailureHandler());
            // 自定义成功处理器
            authenticationFilter.setAuthenticationSuccessHandler(new AuthenticationSuccessHandler());
            http.addFilterAt(authenticationFilter, UsernamePasswordAuthenticationFilter.class);
            setAllowedOrigins(http);

        }

        /**
         * 设置跨域白名单，支持系统被iframe嵌套集成
         *
         * @param http {@link HttpSecurity}
         * @throws Exception
         */
        private void setAllowedOrigins(HttpSecurity http) throws Exception {
            http.cors();
            http.headers().frameOptions().disable();
        }

        @Bean
        public DaoAuthenticationProvider daoAuthenticationProvider() {
            return new DaoAuthenticationProvider();
        }
    }
}
