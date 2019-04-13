package com.xstudio.discuzx.service.impl;

import com.xstudio.common.service.BaseServiceImpl;
import com.xstudio.common.service.IBaseDao;
import com.xstudio.discuzx.mapper.CommonMemberStatusMapper;
import com.xstudio.discuzx.model.CommonMemberStatus;
import com.xstudio.discuzx.service.IPreCommonMemberStatusService;
import com.xstudio.utils.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * service implements for table pre_common_member_status
 * 
 * @author mybatis generator
 * @version Sat Apr 13 17:11:41 CST 2019
 */
@Service
public class PreCommonMemberStatusServiceImpl extends BaseServiceImpl<CommonMemberStatus> implements IPreCommonMemberStatusService {
    @Autowired
    private CommonMemberStatusMapper commonMemberStatusMapper;

    @Override
    public IBaseDao<CommonMemberStatus> getRepositoryDao() {
        return this.commonMemberStatusMapper;
    }

    @Override
    public void setDefaults(CommonMemberStatus record) {
        if(record.getUid() == null ) {
            record.setUid(IdWorker.getId());
        }
    }
}