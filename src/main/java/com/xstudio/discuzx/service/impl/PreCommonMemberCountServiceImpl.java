package com.xstudio.discuzx.service.impl;

import com.xstudio.common.service.BaseServiceImpl;
import com.xstudio.common.service.IBaseDao;
import com.xstudio.discuzx.mapper.CommonMemberCountMapper;
import com.xstudio.discuzx.model.CommonMemberCount;
import com.xstudio.discuzx.service.IPreCommonMemberCountService;
import com.xstudio.utils.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * service implements for table pre_common_member_count
 * 
 * @author mybatis generator
 * @version Sat Apr 13 17:11:41 CST 2019
 */
@Service
public class PreCommonMemberCountServiceImpl extends BaseServiceImpl<CommonMemberCount> implements IPreCommonMemberCountService {
    @Autowired
    private CommonMemberCountMapper commonMemberCountMapper;

    @Override
    public IBaseDao<CommonMemberCount> getRepositoryDao() {
        return this.commonMemberCountMapper;
    }

    @Override
    public void setDefaults(CommonMemberCount record) {
        if(record.getUid() == null ) {
            record.setUid(IdWorker.getId());
        }
    }
}