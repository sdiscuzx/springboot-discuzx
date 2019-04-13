package com.xstudio.discuzx.service.impl;

import com.xstudio.common.service.BaseServiceImpl;
import com.xstudio.common.service.IBaseDao;
import com.xstudio.discuzx.mapper.CommonUsergroupMapper;
import com.xstudio.discuzx.model.CommonUsergroup;
import com.xstudio.discuzx.service.IPreCommonUsergroupService;
import com.xstudio.utils.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * service implements for table pre_common_usergroup
 * 
 * @author mybatis generator
 * @version Sat Apr 13 17:11:41 CST 2019
 */
@Service
public class PreCommonUsergroupServiceImpl extends BaseServiceImpl<CommonUsergroup> implements IPreCommonUsergroupService {
    @Autowired
    private CommonUsergroupMapper commonUsergroupMapper;

    @Override
    public IBaseDao<CommonUsergroup> getRepositoryDao() {
        return this.commonUsergroupMapper;
    }

    @Override
    public void setDefaults(CommonUsergroup record) {
        if(record.getGroupid() == null ) {
            record.setGroupid(IdWorker.getId());
        }
    }
}