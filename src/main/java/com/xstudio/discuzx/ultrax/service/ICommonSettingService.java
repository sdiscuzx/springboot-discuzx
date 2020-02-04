package com.xstudio.discuzx.ultrax.service;

import com.xstudio.core.Msg;
import com.xstudio.discuzx.ultrax.model.CommonSetting;
import com.xstudio.spring.mybatis.pagehelper.IMybatisPageHelperService;

import java.util.List;

/**
 * service for table pre_common_setting
 *
 * @author mybatis generator
 * @version Fri Oct 11 14:44:30 CST 2019
 */
public interface ICommonSettingService extends IMybatisPageHelperService<CommonSetting, String> {
    /**
     * 按 skeys查询
     *
     * @param skeys skey字段
     * @return {@link CommonSetting}
     */
    Msg<List<CommonSetting>> selectBySkeys(List<String> skeys);
}