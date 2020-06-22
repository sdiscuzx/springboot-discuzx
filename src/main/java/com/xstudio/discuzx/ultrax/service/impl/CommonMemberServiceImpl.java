package com.xstudio.discuzx.ultrax.service.impl;

import com.xstudio.discuzx.config.AbstractSecurityMybatisPageHelperServiceImpl;
import com.xstudio.discuzx.ultrax.mapper.CommonMemberMapper;
import com.xstudio.discuzx.ultrax.model.CommonMember;
import com.xstudio.discuzx.ultrax.service.ICommonMemberService;
import com.xstudio.spring.mybatis.pagehelper.IMybatisPageHelperDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.xstudio.core.Msg;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import java.util.Collections;

/**
 * service implements for table pre_common_member
 * 
 * @author mybatis generator
 * @version 1.0.0
 */
@Service
public class CommonMemberServiceImpl extends AbstractSecurityMybatisPageHelperServiceImpl<CommonMember, Integer> implements ICommonMemberService {

    @Autowired
    private CommonMemberMapper commonMemberMapper;

    @Override
    public IMybatisPageHelperDao<CommonMember, Integer> getRepositoryDao() {
        return this.commonMemberMapper;
    }

    @Override
    public void setDefaults(CommonMember record) {
    }
}
