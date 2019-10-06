package com.xstudio.discuzx.config.security;

import com.xstudio.discuzx.ultrax.model.CommonMember;
import com.xstudio.discuzx.ultrax.model.UcenterMembers;
import lombok.Data;

/**
 * @author xiaobiao
 * @version 2019/10/6
 */
@Data
public class MemberDetail {
    private CommonMember member;

    private UcenterMembers ucMember;
}
