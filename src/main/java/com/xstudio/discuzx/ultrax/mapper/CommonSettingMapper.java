package com.xstudio.discuzx.ultrax.mapper;

import com.xstudio.discuzx.ultrax.model.CommonSetting;
import com.xstudio.spring.mybatis.pagehelper.IMybatisPageHelperDao;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommonSettingMapper extends IMybatisPageHelperDao<CommonSetting, String> {
}