package com.xstudio.discuzx.config;


import com.xstudio.core.BaseModelObject;
import com.xstudio.core.Msg;
import com.xstudio.spring.mybatis.antdesign.PageResponse;
import com.xstudio.spring.mybatis.pagehelper.AbstractMybatisPageHelperServiceImpl;

import java.util.ArrayList;
import java.util.List;

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

    @Override
    public Msg<PageResponse<T>> selectAllByExample(T record) {
        List<String> orders = new ArrayList<>();
        return selectAllByExample(record, orders);
    }
}
