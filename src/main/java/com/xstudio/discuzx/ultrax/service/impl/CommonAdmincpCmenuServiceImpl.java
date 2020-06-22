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
 * @version 1.0.0
 */
@Service
public class CommonAdmincpCmenuServiceImpl extends AbstractSecurityMybatisPageHelperServiceImpl<CommonAdmincpCmenu, Short> implements ICommonAdmincpCmenuService {

    @Autowired
    private CommonAdmincpCmenuMapper commonAdmincpCmenuMapper;

    @Override
    public IMybatisPageHelperDao<CommonAdmincpCmenu, Short> getRepositoryDao() {
        return this.commonAdmincpCmenuMapper;
    }

    @Override
    public void setDefaults(CommonAdmincpCmenu record) {
    }
}
