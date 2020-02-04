package com.xstudio.discuzx.ultrax.service.impl;

import com.xstudio.core.ErrorConstant;
import com.xstudio.core.Msg;
import com.xstudio.discuzx.config.AbstractSecurityMybatisPageHelperServiceImpl;
import com.xstudio.discuzx.ultrax.mapper.CommonSettingMapper;
import com.xstudio.discuzx.ultrax.model.CommonSetting;
import com.xstudio.discuzx.ultrax.service.ICommonSettingService;
import com.xstudio.spring.mybatis.pagehelper.IMybatisPageHelperDao;

import java.util.Collections;
import java.util.List;
import java.util.UUID;

import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * service implements for table pre_common_setting
 * 
 * @author mybatis generator
 * @version Fri Oct 11 14:44:30 CST 2019
 */
@Service
public class CommonSettingServiceImpl extends AbstractSecurityMybatisPageHelperServiceImpl<CommonSetting, String> implements ICommonSettingService {
    @Autowired
    private CommonSettingMapper commonSettingMapper;

    @Override
    public IMybatisPageHelperDao getRepositoryDao() {
        return this.commonSettingMapper;
    }

    @Override
    public void setDefaults(CommonSetting record) {

    }

    @Override
    public Msg<List<CommonSetting>> selectBySkeys(List<String> skeys) {
        Msg<List<CommonSetting>> msg = new Msg<>();
        List<CommonSetting> list = commonSettingMapper.selectBySkeys(skeys);
        if (CollectionUtils.isEmpty(list)){
            msg.setResult(ErrorConstant.NO_MATCH, ErrorConstant.NO_MATCH_MSG);
            return msg;
        }
        msg.setData(list);
        return msg;
    }
}