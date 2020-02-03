package com.xstudio.discuzx.ultrax.service.impl;

import com.xstudio.discuzx.config.AbstractSecurityMybatisPageHelperServiceImpl;
import com.xstudio.discuzx.ultrax.mapper.CommonMemberStatusMapper;
import com.xstudio.discuzx.ultrax.model.CommonMemberStatus;
import com.xstudio.discuzx.ultrax.service.ICommonMemberStatusService;
import com.xstudio.spring.mybatis.pagehelper.IMybatisPageHelperDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * service implements for table pre_common_member_status
 * 
 * @author mybatis generator
 * @version Sat Oct 05 09:20:06 CST 2019
 */
@Service
public class CommonMemberStatusServiceImpl extends AbstractSecurityMybatisPageHelperServiceImpl<CommonMemberStatus, Integer> implements ICommonMemberStatusService {
    @Autowired
    private CommonMemberStatusMapper commonMemberStatusMapper;

    @Override
    public IMybatisPageHelperDao getRepositoryDao() {
        return this.commonMemberStatusMapper;
    }

    @Override
    public void setDefaults(CommonMemberStatus record) {
        // todo
        
    }
}