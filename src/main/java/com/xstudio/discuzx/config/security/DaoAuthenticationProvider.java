package com.xstudio.discuzx.config.security;

import com.alibaba.fastjson.JSON;
import com.xstudio.discuzx.ultrax.service.ICommonMemberService;
import com.xstudio.spring.security.AppUserDetails;
import com.xstudio.spring.security.SecurityContextUtil;
import com.xstudio.spring.security.params.LoginParams;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.AbstractUserDetailsAuthenticationProvider;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.util.DigestUtils;

/**
 * @author xiaobiao
 * @version 2019/10/3
 */
public class DaoAuthenticationProvider extends AbstractUserDetailsAuthenticationProvider {

    public static final String DEFAULT_ROLE_PREFIX = "ROLE_";

    public static final String DEFAULT_PERMISSION_PREFIX = "PERM_";

    private static Logger logger = LoggerFactory.getLogger(DaoAuthenticationProvider.class);

    private ICommonMemberService memberService;

    public DaoAuthenticationProvider() {
        super();
        this.setHideUserNotFoundExceptions(false);
    }


    /**
     * Getter for property 'springUserService'.
     *
     * @return Value for property 'springUserService'.
     */
    public ICommonMemberService getSpringUserService() {
        if (null == memberService) {
            memberService = SecurityContextUtil.getBean(ICommonMemberService.class);
        }
        return memberService;
    }

    @Override
    protected void additionalAuthenticationChecks(UserDetails userDetails, UsernamePasswordAuthenticationToken authentication) throws AuthenticationException {
        if (logger.isTraceEnabled()) {
            logger.trace("user {}", JSON.toJSONString(userDetails));
        }
        // 密码验证
        AppUserDetails details = (AppUserDetails) userDetails;
        MemberDetail user = (MemberDetail) details.getDetails();
        LoginParams loginParams = (LoginParams) authentication.getDetails();
        // todo 验证校验

        // 密码解密
        String rawPassword = authentication.getCredentials().toString();
        if (StringUtils.isEmpty(rawPassword)) {
            throw new BadCredentialsException("");
        }
        // 密码校验
        String encodedPassword = details.getPassword();
        String md5WithSalt = DigestUtils.md5DigestAsHex(rawPassword.getBytes()) + user.getUcMember().getSalt();
        String passwordWithSalt = DigestUtils.md5DigestAsHex(md5WithSalt.getBytes());
        boolean matches = encodedPassword.equals(passwordWithSalt);
        if (!matches) {
            throw new BadCredentialsException("");
        }
        // 更新最后登录时间

    }

    @Override
    protected UserDetails retrieveUser(String username, UsernamePasswordAuthenticationToken authentication) throws AuthenticationException {
        if (logger.isTraceEnabled()) {
            logger.trace("user {}", JSON.toJSONString(username));
        }

        // each project has its own user details implement
        return getSpringUserService().loadUserByUsername(username);
    }
}
