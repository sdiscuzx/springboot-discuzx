package com.xstudio.discuzx.config.security;

import com.xstudio.discuzx.ultrax.model.CommonAdmincpGroup;
import com.xstudio.discuzx.ultrax.model.CommonAdmingroup;
import com.xstudio.discuzx.ultrax.model.CommonUsergroup;
import com.xstudio.spring.security.vo.UserAuthority;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author xiaobiao
 * @version 2019/10/6
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class MemberAuthority extends UserAuthority {
    /**
     * 用户组
     */
    private CommonUsergroup userGroup;

    private CommonAdmingroup adminGroup;
}
