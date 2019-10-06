package com.xstudio.discuzx.ultrax.service.impl;

import com.xstudio.discuzx.config.AbstractSecurityMybatisPageHelperServiceImpl;
import com.xstudio.discuzx.config.security.MemberAuthority;
import com.xstudio.discuzx.config.security.MemberDetail;
import com.xstudio.discuzx.ultrax.mapper.CommonMemberMapper;
import com.xstudio.discuzx.ultrax.model.CommonAdmingroup;
import com.xstudio.discuzx.ultrax.model.CommonMember;
import com.xstudio.discuzx.ultrax.model.CommonUsergroup;
import com.xstudio.discuzx.ultrax.model.UcenterMembers;
import com.xstudio.discuzx.ultrax.service.ICommonAdmingroupService;
import com.xstudio.discuzx.ultrax.service.ICommonMemberService;
import com.xstudio.discuzx.ultrax.service.ICommonUsergroupService;
import com.xstudio.discuzx.ultrax.service.IUcenterMembersService;
import com.xstudio.spring.mybatis.pagehelper.IMybatisPageHelperDao;
import com.xstudio.spring.security.AppUserDetails;
import com.xstudio.spring.security.vo.UserAuthority;
import com.xstudio.tool.utils.IdWorker;
import com.xstudio.tool.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 * service implements for table pre_common_member
 *
 * @author mybatis generator
 * @version Thu Oct 03 21:41:31 CST 2019
 */
@Service
public class CommonMemberServiceImplAbstract extends AbstractSecurityMybatisPageHelperServiceImpl<CommonMember, Long> implements ICommonMemberService {
    @Autowired
    private CommonMemberMapper commonMemberMapper;

    @Autowired
    private IUcenterMembersService ucenterMembersService;

    @Autowired
    private ICommonUsergroupService userGroupService;
    @Autowired
    private ICommonAdmingroupService adminGroupService;

    @Override
    public IMybatisPageHelperDao<CommonMember, Long> getRepositoryDao() {
        return this.commonMemberMapper;
    }

    @Override
    public void setDefaults(CommonMember record) {
        if (record.getUid() == null) {
            record.setUid(IdWorker.getId());
        }
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        CommonMember example = new CommonMember();
        example.setUsername(username);
        Msg<CommonMember> getMemberMsg = selectOneByExample(example);

        if (Boolean.FALSE.equals(getMemberMsg.getSuccess())) {
            return null;
        }
        MemberDetail memberDetail = new MemberDetail();
        CommonMember member = getMemberMsg.getData();

        memberDetail.setMember(member);
        // 从 ucenter_member 表中获取 md5 salt
        Msg<UcenterMembers> ucenterMembersMsg = ucenterMembersService.selectByPrimaryKey(member.getUid());
        memberDetail.setUcMember(ucenterMembersMsg.getData());

        UserAuthority userAuthorityInfo = getGrantedAuthorities(member);

        return new AppUserDetails(member.getUsername(), ucenterMembersMsg.getData().getPassword(), String.valueOf(member.getUid()), memberDetail, userAuthorityInfo.getAuthorities());

    }

    /**
     * 用户权限
     *
     * @param member 用户
     * @return MemberAuthority
     */
    private MemberAuthority getGrantedAuthorities(CommonMember member) {
        MemberAuthority userAuthorityInfo = new MemberAuthority();
        Msg<CommonUsergroup> usergroupMsg = userGroupService.selectByPrimaryKey(member.getGroupid());
        if (Boolean.TRUE.equals(usergroupMsg.getSuccess())) {
            CommonUsergroup userGroup = usergroupMsg.getData();
            userAuthorityInfo.setUserGroup(userGroup);
            // 如果是管理员，表 common_admingroup 中会存在对应的数据 主键和 common_usergroup主键一致
            Msg<CommonAdmingroup> adminGroupMsg = adminGroupService.selectByPrimaryKey(userGroup.getGroupid());
            if (Boolean.TRUE.equals(adminGroupMsg.getSuccess())) {
                userAuthorityInfo.setAdminGroup(adminGroupMsg.getData());
            }
        }

        return userAuthorityInfo;
    }
}