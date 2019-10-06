package com.xstudio.discuzx.ultrax.service.impl;

import com.xstudio.discuzx.config.AbstractSecurityMybatisPageHelperServiceImpl;
import com.xstudio.discuzx.ultrax.mapper.UcenterMembersMapper;
import com.xstudio.discuzx.ultrax.model.UcenterMembers;
import com.xstudio.discuzx.ultrax.service.IUcenterMembersService;
import com.xstudio.spring.mybatis.pagehelper.IMybatisPageHelperDao;
import com.xstudio.tool.utils.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * service implements for table pre_ucenter_members
 * 
 * @author mybatis generator
 * @version Sun Oct 06 20:52:52 CST 2019
 */
@Service
public class UcenterMembersServiceImpl extends AbstractSecurityMybatisPageHelperServiceImpl<UcenterMembers, Long> implements IUcenterMembersService {
    @Autowired
    private UcenterMembersMapper ucenterMembersMapper;

    @Override
    public IMybatisPageHelperDao<UcenterMembers, Long> getRepositoryDao() {
        return this.ucenterMembersMapper;
    }

    @Override
    public void setDefaults(UcenterMembers record) {
        // todo
        if(record.getUid() == null ) {
            record.setUid(IdWorker.getId());
        }
    }
}