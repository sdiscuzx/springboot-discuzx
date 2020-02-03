package com.xstudio.discuzx.ultrax.service.impl;

import com.xstudio.discuzx.config.AbstractSecurityMybatisPageHelperServiceImpl;
import com.xstudio.discuzx.ultrax.mapper.CommonDistrictMapper;
import com.xstudio.discuzx.ultrax.model.CommonDistrict;
import com.xstudio.discuzx.ultrax.service.ICommonDistrictService;
import com.xstudio.spring.mybatis.pagehelper.IMybatisPageHelperDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * service implements for table pre_common_district
 * 
 * @author mybatis generator
 * @version Tue Oct 29 18:30:36 CST 2019
 */
@Service
public class CommonDistrictServiceImpl extends AbstractSecurityMybatisPageHelperServiceImpl<CommonDistrict, Integer> implements ICommonDistrictService {
    @Autowired
    private CommonDistrictMapper commonDistrictMapper;

    @Override
    public IMybatisPageHelperDao getRepositoryDao() {
        return this.commonDistrictMapper;
    }

    @Override
    public void setDefaults(CommonDistrict record) {
        // todo
        
    }
}