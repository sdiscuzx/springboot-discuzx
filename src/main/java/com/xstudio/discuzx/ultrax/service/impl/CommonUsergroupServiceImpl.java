package com.xstudio.discuzx.ultrax.service.impl;

import com.xstudio.core.service.IAbstractDao;
import com.xstudio.discuzx.config.AbstractSecurityMybatisPageHelperServiceImpl;
import com.xstudio.discuzx.ultrax.mapper.CommonUsergroupMapper;
import com.xstudio.discuzx.ultrax.model.CommonUsergroup;
import com.xstudio.discuzx.ultrax.service.ICommonUsergroupService;
import com.xstudio.spring.mybatis.pagehelper.IMybatisPageHelperDao;
import com.xstudio.spring.mybatis.pagehelper.PageBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * service implements for table pre_common_usergroup
 * 
 * @author mybatis generator
 * @version Sun Oct 06 19:48:15 CST 2019
 */
@Service
public class CommonUsergroupServiceImpl extends AbstractSecurityMybatisPageHelperServiceImpl<CommonUsergroup, Short> implements ICommonUsergroupService {
    @Autowired
    private CommonUsergroupMapper commonUsergroupMapper;

    @Override
    public IAbstractDao getRepositoryDao() {
        return commonUsergroupMapper;
    }

    @Override
    public void setDefaults(CommonUsergroup record) {
        // todo
        
    }
}