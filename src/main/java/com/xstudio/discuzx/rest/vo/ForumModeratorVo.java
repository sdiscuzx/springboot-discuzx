package com.xstudio.discuzx.rest.vo;

import com.xstudio.discuzx.ultrax.model.CommonMember;
import com.xstudio.discuzx.ultrax.model.ForumModerator;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author xiaobiao
 * @version 2020/2/4
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class ForumModeratorVo extends ForumModerator {
    /**
     * 成员信息
     */
    private CommonMember member;
}
