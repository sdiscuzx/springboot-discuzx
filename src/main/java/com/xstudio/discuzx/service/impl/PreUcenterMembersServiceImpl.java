package com.xstudio.discuzx.service.impl;

import com.xstudio.common.service.BaseServiceImpl;
import com.xstudio.common.service.IBaseDao;
import com.xstudio.discuzx.mapper.UcenterMembersMapper;
import com.xstudio.discuzx.model.UcenterMembers;
import com.xstudio.discuzx.service.IPreUcenterMembersService;
import com.xstudio.utils.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * service implements for table pre_ucenter_members
 * 
 * @author mybatis generator
 * @version Sat Apr 13 17:11:41 CST 2019
 */
@Service
public class PreUcenterMembersServiceImpl extends BaseServiceImpl<UcenterMembers> implements IPreUcenterMembersService {
    @Autowired
    private UcenterMembersMapper ucenterMembersMapper;

    @Override
    public IBaseDao<UcenterMembers> getRepositoryDao() {
        return this.ucenterMembersMapper;
    }

    @Override
    public void setDefaults(UcenterMembers record) {
        if(record.getUid() == null ) {
            record.setUid(IdWorker.getId());
        }
    }
}