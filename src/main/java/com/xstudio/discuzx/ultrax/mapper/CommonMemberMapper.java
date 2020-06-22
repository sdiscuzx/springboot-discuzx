package com.xstudio.discuzx.ultrax.mapper;

import com.xstudio.discuzx.ultrax.model.CommonMember;
import com.xstudio.spring.mybatis.pagehelper.IMybatisPageHelperDao;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommonMemberMapper extends IMybatisPageHelperDao<CommonMember, Integer> {
}
