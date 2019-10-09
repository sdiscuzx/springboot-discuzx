package com.xstudio.discuzx.ultrax.service.impl;

import com.xstudio.discuzx.config.AbstractSecurityMybatisPageHelperServiceImpl;
import com.xstudio.discuzx.ultrax.mapper.CommonSettingMapper;
import com.xstudio.discuzx.ultrax.model.CommonSetting;
import com.xstudio.discuzx.ultrax.service.ICommonSettingService;
import com.xstudio.spring.mybatis.pagehelper.IMybatisPageHelperDao;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * service implements for table pre_common_setting
 * 
 * @author mybatis generator
 * @version Mon Oct 07 21:10:14 CST 2019
 */
@Service
public class CommonSettingServiceImpl extends AbstractSecurityMybatisPageHelperServiceImpl<CommonSetting, String> implements ICommonSettingService {
    @Autowired
    private CommonSettingMapper commonSettingMapper;

    @Override
    public IMybatisPageHelperDao<CommonSetting, String> getRepositoryDao() {
        return this.commonSettingMapper;
    }

    @Override
    public void setDefaults(CommonSetting record) {
        // todo
        if(record.getSkey() == null || "".equals(record.getSkey())) {
            record.setSkey(UUID.randomUUID().toString());
        }
    }
}