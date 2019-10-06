package com.xstudio.discuzx.ultrax.service.impl;

import com.xstudio.discuzx.config.AbstractSecurityMybatisPageHelperServiceImpl;
import com.xstudio.discuzx.ultrax.mapper.CommonUsergroupFieldMapper;
import com.xstudio.discuzx.ultrax.model.CommonUsergroupField;
import com.xstudio.discuzx.ultrax.service.ICommonUsergroupFieldService;
import com.xstudio.spring.mybatis.pagehelper.IMybatisPageHelperDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * service implements for table pre_common_usergroup_field
 * 
 * @author mybatis generator
 * @version Fri Oct 04 08:27:23 CST 2019
 */
@Service
public class CommonUsergroupFieldServiceImpl extends AbstractSecurityMybatisPageHelperServiceImpl<CommonUsergroupField, Short> implements ICommonUsergroupFieldService {
    @Autowired
    private CommonUsergroupFieldMapper commonUsergroupFieldMapper;

    @Override
    public IMybatisPageHelperDao<CommonUsergroupField, Short> getRepositoryDao() {
        return this.commonUsergroupFieldMapper;
    }

    @Override
    public void setDefaults(CommonUsergroupField record) {
        // todo
        
    }
}