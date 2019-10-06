package com.xstudio.discuzx.ultrax.mapper;

import com.xstudio.discuzx.ultrax.model.UcenterMembers;
import com.xstudio.spring.mybatis.pagehelper.IMybatisPageHelperDao;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UcenterMembersMapper extends IMybatisPageHelperDao<UcenterMembers, Long> {
}