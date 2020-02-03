package com.xstudio.discuzx.ultrax.service.impl;

import com.xstudio.discuzx.config.AbstractSecurityMybatisPageHelperServiceImpl;
import com.xstudio.discuzx.ultrax.mapper.CommonAdmincpGroupMapper;
import com.xstudio.discuzx.ultrax.model.CommonAdmincpGroup;
import com.xstudio.discuzx.ultrax.service.ICommonAdmincpGroupService;
import com.xstudio.spring.mybatis.pagehelper.IMybatisPageHelperDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * service implements for table pre_common_admincp_group
 * 
 * @author mybatis generator
 * @version Wed Oct 02 21:52:05 CST 2019
 */
@Service
public class CommonAdmincpGroupServiceImplAbstractSecurity extends AbstractSecurityMybatisPageHelperServiceImpl<CommonAdmincpGroup, Short> implements ICommonAdmincpGroupService {
    @Autowired
    private CommonAdmincpGroupMapper commonAdmincpGroupMapper;

    @Override
    public IMybatisPageHelperDao getRepositoryDao() {
        return this.commonAdmincpGroupMapper;
    }

    @Override
    public void setDefaults(CommonAdmincpGroup record) {
        // todo
        
    }
}