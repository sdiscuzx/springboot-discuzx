package com.xstudio.discuzx.service;

import com.xstudio.common.service.IBaseService;
import com.xstudio.discuzx.model.CommonMember;
import com.xstudio.utils.Msg;

/**
 * service for table pre_common_member
 *
 * @author mybatis generator
 * @version Sat Apr 13 17:11:41 CST 2019
 */
public interface IPreCommonMemberService extends IBaseService<CommonMember> {
    /**
     * 获取用户
     *
     * @param username
     * @return
     */
    Msg<CommonMember> getUserByname(String username);
}