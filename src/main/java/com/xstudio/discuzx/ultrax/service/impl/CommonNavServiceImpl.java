package com.xstudio.discuzx.ultrax.service.impl;

import com.xstudio.discuzx.config.AbstractSecurityMybatisPageHelperServiceImpl;
import com.xstudio.discuzx.ultrax.mapper.CommonNavMapper;
import com.xstudio.discuzx.ultrax.model.CommonNav;
import com.xstudio.discuzx.ultrax.service.ICommonNavService;
import com.xstudio.spring.mybatis.pagehelper.IMybatisPageHelperDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * service implements for table pre_common_nav
 * 
 * @author mybatis generator
 * @version 1.0.0
 */
@Service
public class CommonNavServiceImpl extends AbstractSecurityMybatisPageHelperServiceImpl<CommonNav, Short> implements ICommonNavService {
    @Autowired
    private CommonNavMapper commonNavMapper;

    @Override
    public IMybatisPageHelperDao getRepositoryDao() {
        return this.commonNavMapper;
    }

    @Override
    public void setDefaults(CommonNav record) {
        // todo
        
    }
}