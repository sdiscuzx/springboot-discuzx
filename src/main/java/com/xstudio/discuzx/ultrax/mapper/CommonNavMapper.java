package com.xstudio.discuzx.ultrax.mapper;

import com.xstudio.discuzx.ultrax.model.CommonNav;
import com.xstudio.spring.mybatis.pagehelper.IMybatisPageHelperDao;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommonNavMapper extends IMybatisPageHelperDao<CommonNav, Short> {
}