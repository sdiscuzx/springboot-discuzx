package com.xstudio.discuzx.config;

import com.xstudio.core.BaseModelObject;
import com.xstudio.spring.mybatis.pagehelper.AbstractMybatisPageHelperServiceImpl;

/**
 * 抽象服务
 *
 * @author xiaobiao
 * @version 2020/5/29
 */
public abstract class AbstractSecurityMybatisPageHelperServiceImpl<T extends BaseModelObject<K>, K> extends AbstractMybatisPageHelperServiceImpl<T, K> {

    @Override
    public String getActorId(T record) {
        return "";
    }
}
