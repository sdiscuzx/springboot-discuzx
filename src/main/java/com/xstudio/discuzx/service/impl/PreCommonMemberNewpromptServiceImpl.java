package com.xstudio.discuzx.service.impl;

import com.xstudio.common.service.BaseServiceImpl;
import com.xstudio.common.service.IBaseDao;
import com.xstudio.discuzx.mapper.CommonMemberNewpromptMapper;
import com.xstudio.discuzx.model.CommonMemberNewprompt;
import com.xstudio.discuzx.service.IPreCommonMemberNewpromptService;
import com.xstudio.utils.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * service implements for table pre_common_member_newprompt
 * 
 * @author mybatis generator
 * @version Sat Apr 13 17:11:41 CST 2019
 */
@Service
public class PreCommonMemberNewpromptServiceImpl extends BaseServiceImpl<CommonMemberNewprompt> implements IPreCommonMemberNewpromptService {
    @Autowired
    private CommonMemberNewpromptMapper commonMemberNewpromptMapper;

    @Override
    public IBaseDao<CommonMemberNewprompt> getRepositoryDao() {
        return this.commonMemberNewpromptMapper;
    }

    @Override
    public void setDefaults(CommonMemberNewprompt record) {
        if(record.getUid() == null ) {
            record.setUid(IdWorker.getId());
        }
    }
}