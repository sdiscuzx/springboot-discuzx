package com.xstudio.discuzx.service.impl;

import com.xstudio.common.service.BaseServiceImpl;
import com.xstudio.common.service.IBaseDao;
import com.xstudio.discuzx.mapper.CommonMemberMapper;
import com.xstudio.discuzx.model.CommonMember;
import com.xstudio.discuzx.service.IPreCommonMemberService;
import com.xstudio.utils.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * service implements for table pre_common_member
 * 
 * @author mybatis generator
 * @version Sat Apr 13 17:11:41 CST 2019
 */
@Service
public class PreCommonMemberServiceImpl extends BaseServiceImpl<CommonMember> implements IPreCommonMemberService {
    @Autowired
    private CommonMemberMapper commonMemberMapper;

    @Override
    public IBaseDao<CommonMember> getRepositoryDao() {
        return this.commonMemberMapper;
    }

    @Override
    public void setDefaults(CommonMember record) {
        if(record.getUid() == null ) {
            record.setUid(IdWorker.getId());
        }
    }
}