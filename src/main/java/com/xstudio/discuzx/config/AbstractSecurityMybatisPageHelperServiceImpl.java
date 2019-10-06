package com.xstudio.discuzx.config;

import com.xstudio.spring.mybatis.pagehelper.AbstractMybatisPageHelperServiceImpl;
import com.xstudio.spring.security.AppUserDetails;
import com.xstudio.spring.security.SecurityContextUtil;
import com.xstudio.tool.utils.BaseModelObject;

/**
 * @author xiaobiao
 * @version 2019/10/2
 */
public abstract class AbstractSecurityMybatisPageHelperServiceImpl<T extends BaseModelObject, K> extends AbstractMybatisPageHelperServiceImpl<T, K> {
    @Override
    public String getActorId(T record) {
        AppUserDetails currentUser = SecurityContextUtil.getCurrentUser();
        if (null == currentUser) {
            return null;
        }
        return currentUser.getUserId();
    }
}
