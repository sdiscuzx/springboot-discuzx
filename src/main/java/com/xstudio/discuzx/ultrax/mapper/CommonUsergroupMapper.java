package com.xstudio.discuzx.ultrax.mapper;

import com.xstudio.discuzx.ultrax.model.CommonUsergroup;
import com.xstudio.spring.mybatis.pagehelper.IMybatisPageHelperDao;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommonUsergroupMapper extends IMybatisPageHelperDao<CommonUsergroup, Short> {
}