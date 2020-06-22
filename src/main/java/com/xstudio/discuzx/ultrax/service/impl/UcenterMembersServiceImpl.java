package com.xstudio.discuzx.ultrax.service.impl;

import com.xstudio.discuzx.config.AbstractSecurityMybatisPageHelperServiceImpl;
import com.xstudio.discuzx.ultrax.mapper.UcenterMembersMapper;
import com.xstudio.discuzx.ultrax.model.UcenterMembers;
import com.xstudio.discuzx.ultrax.service.IUcenterMembersService;
import com.xstudio.spring.mybatis.pagehelper.IMybatisPageHelperDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.xstudio.core.Msg;
import com.xstudio.discuzx.config.security.UserDetailsExt;
import com.xstudio.discuzx.ultrax.model.CommonMember;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import java.util.Collections;

/**
 * service implements for table pre_ucenter_members
 * 
 * @author mybatis generator
 * @version 1.0.0
 */
@Service
public class UcenterMembersServiceImpl extends AbstractSecurityMybatisPageHelperServiceImpl<UcenterMembers, Integer> implements IUcenterMembersService {

    @Autowired
    private UcenterMembersMapper ucenterMembersMapper;

    @Override
    public IMybatisPageHelperDao<UcenterMembers, Integer> getRepositoryDao() {
        return this.ucenterMembersMapper;
    }

    @Override
    public void setDefaults(UcenterMembers record) {
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UcenterMembers userExample = new  UcenterMembers();
        userExample.setUsername(username);
        // 通过账号获取系统用户
        Msg<UcenterMembers> dbRstMsg = selectOneByExample(userExample);
        if (Boolean.FALSE.equals(dbRstMsg.isSuccess())) {
            return null;
        }
        UcenterMembers member = dbRstMsg.getData();
        UserDetailsExt userDetailsExt = new  UserDetailsExt(member.getUsername(), member.getPassword(), Collections.emptyList());
        userDetailsExt.setDetail(member);
        return userDetailsExt;
    }
}
