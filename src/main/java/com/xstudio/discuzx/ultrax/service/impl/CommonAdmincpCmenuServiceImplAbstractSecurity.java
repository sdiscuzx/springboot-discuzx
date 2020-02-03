package com.xstudio.discuzx.ultrax.service.impl;

import com.xstudio.discuzx.config.AbstractSecurityMybatisPageHelperServiceImpl;
import com.xstudio.discuzx.ultrax.mapper.CommonAdmincpCmenuMapper;
import com.xstudio.discuzx.ultrax.model.CommonAdmincpCmenu;
import com.xstudio.discuzx.ultrax.service.ICommonAdmincpCmenuService;
import com.xstudio.spring.mybatis.pagehelper.IMybatisPageHelperDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * service implements for table pre_common_admincp_cmenu
 * 
 * @author mybatis generator
 * @version Wed Oct 02 21:17:22 CST 2019
 */
@Service
public class CommonAdmincpCmenuServiceImplAbstractSecurity extends AbstractSecurityMybatisPageHelperServiceImpl<CommonAdmincpCmenu, Short> implements ICommonAdmincpCmenuService {
    @Autowired
    private CommonAdmincpCmenuMapper commonAdmincpCmenuMapper;

    @Override
    public IMybatisPageHelperDao getRepositoryDao() {
        return this.commonAdmincpCmenuMapper;
    }

    @Override
    public void setDefaults(CommonAdmincpCmenu record) {
        // todo
        
    }
}