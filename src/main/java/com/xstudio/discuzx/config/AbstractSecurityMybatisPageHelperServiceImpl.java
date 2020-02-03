package com.xstudio.discuzx.config;


import com.xstudio.core.BaseModelObject;
import com.xstudio.spring.mybatis.pagehelper.AbstractMybatisPageHelperServiceImpl;

/**
 * @author xiaobiao
 * @version 2019/10/2
 */
public abstract class AbstractSecurityMybatisPageHelperServiceImpl<T extends BaseModelObject<K>, K> extends AbstractMybatisPageHelperServiceImpl<T, K> {
    @Override
    public String getActorId(T record) {
//        AppUserDetails currentUser = SecurityContextUtil.getCurrentUser();
//        if (null == currentUser) {
//            return null;
//        }
//        return currentUser.getUserId();
        return null;
    }
}
