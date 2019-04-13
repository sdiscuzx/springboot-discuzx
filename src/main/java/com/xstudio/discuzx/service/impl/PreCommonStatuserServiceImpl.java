package com.xstudio.discuzx.service.impl;

import com.xstudio.common.service.BaseServiceImpl;
import com.xstudio.common.service.IBaseDao;
import com.xstudio.discuzx.mapper.CommonStatuserMapper;
import com.xstudio.discuzx.model.CommonStatuser;
import com.xstudio.discuzx.service.IPreCommonStatuserService;
import com.xstudio.utils.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * service implements for table pre_common_statuser
 * 
 * @author mybatis generator
 * @version Sat Apr 13 17:11:41 CST 2019
 */
@Service
public class PreCommonStatuserServiceImpl extends BaseServiceImpl<CommonStatuser> implements IPreCommonStatuserService {
    @Autowired
    private CommonStatuserMapper commonStatuserMapper;

    @Override
    public IBaseDao<CommonStatuser> getRepositoryDao() {
        return this.commonStatuserMapper;
    }

    @Override
    public void setDefaults(CommonStatuser record) {
        if(record.getId() == null ) {
            record.setId(IdWorker.getId());
        }
    }
}