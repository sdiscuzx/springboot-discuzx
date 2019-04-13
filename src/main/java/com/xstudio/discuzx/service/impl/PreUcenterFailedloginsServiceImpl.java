package com.xstudio.discuzx.service.impl;

import com.xstudio.common.service.BaseServiceImpl;
import com.xstudio.common.service.IBaseDao;
import com.xstudio.discuzx.mapper.UcenterFailedloginsMapper;
import com.xstudio.discuzx.model.UcenterFailedlogins;
import com.xstudio.discuzx.service.IPreUcenterFailedloginsService;
import com.xstudio.utils.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * service implements for table pre_ucenter_failedlogins
 * 
 * @author mybatis generator
 * @version Sat Apr 13 17:11:41 CST 2019
 */
@Service
public class PreUcenterFailedloginsServiceImpl extends BaseServiceImpl<UcenterFailedlogins> implements IPreUcenterFailedloginsService {
    @Autowired
    private UcenterFailedloginsMapper ucenterFailedloginsMapper;

    @Override
    public IBaseDao<UcenterFailedlogins> getRepositoryDao() {
        return this.ucenterFailedloginsMapper;
    }

    @Override
    public void setDefaults(UcenterFailedlogins record) {
        if(record.getId() == null ) {
            record.setId(IdWorker.getId());
        }
    }
}