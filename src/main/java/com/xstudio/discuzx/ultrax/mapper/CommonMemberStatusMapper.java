package com.xstudio.discuzx.ultrax.mapper;

import com.xstudio.discuzx.ultrax.model.CommonMemberStatus;
import com.xstudio.spring.mybatis.pagehelper.IMybatisPageHelperDao;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommonMemberStatusMapper extends IMybatisPageHelperDao<CommonMemberStatus, Integer> {
}