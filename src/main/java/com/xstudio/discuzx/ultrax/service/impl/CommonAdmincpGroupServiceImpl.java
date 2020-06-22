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
 * @version 1.0.0
 */
@Service
public class CommonAdmincpGroupServiceImpl extends AbstractSecurityMybatisPageHelperServiceImpl<CommonAdmincpGroup, Short> implements ICommonAdmincpGroupService {
    @Autowired
    private CommonAdmincpGroupMapper commonAdmincpGroupMapper;

    @Override
    public IMybatisPageHelperDao<CommonAdmincpGroup, Short> getRepositoryDao() {
        return this.commonAdmincpGroupMapper;
    }

    @Override
    public void setDefaults(CommonAdmincpGroup record) {
        // todo
        
    }
}