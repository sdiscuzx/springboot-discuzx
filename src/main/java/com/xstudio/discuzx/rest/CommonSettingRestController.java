package com.xstudio.discuzx.rest;

import com.xstudio.core.Msg;
import com.xstudio.core.service.IAbstractService;
import com.xstudio.discuzx.rest.vo.CommonSettingVo;
import com.xstudio.discuzx.ultrax.model.CommonSetting;
import com.xstudio.discuzx.ultrax.service.ICommonSettingService;
import com.xstudio.spring.mybatis.antdesign.PageResponse;
import com.xstudio.spring.web.rest.AbstractBaseRestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * @author xiaobiao
 * @version 2019/10/7
 */
@RestController
@RequestMapping("api/common/setting")
public class CommonSettingRestController extends AbstractBaseRestController<CommonSettingVo, String> {
    /**
     * 站点信息配置
     */
    private List<String> basic = Arrays.asList("bbname",
            "sitename",
            "siteurl",
            "adminemail",
            "site_qq",
            "icp",
            "boardlicensed",
            "statcode",
            "bbclosed",
            "closedreason",
            "closedallowactivation");

    private List<String> access = Arrays.asList("inviteconfig");

    @Autowired
    private ICommonSettingService commonSettingService;

    @Override
    public IAbstractService getService() {
        return commonSettingService;
    }

    @Override
    public Msg<CommonSettingVo> update(CommonSettingVo record, HttpServletRequest request, HttpServletResponse response) {
        PageResponse<CommonSetting> list = new PageResponse<>();
        Enumeration<String> parameterNames = request.getParameterNames();
        CommonSetting commonSetting;
        while (parameterNames.hasMoreElements()) {
            String key = parameterNames.nextElement();
            commonSetting = new CommonSetting();
            commonSetting.setSkey(key);
            commonSetting.setSvalue(request.getParameter(key));
            list.add(commonSetting);
        }
        Msg<PageResponse<CommonSetting>> pageListMsg = commonSettingService.batchUpdateByPrimaryKeySelective(list);

        return new Msg<>(pageListMsg.getCode(), pageListMsg.getMsg());
    }

    @GetMapping("basic")
    public Msg<Map<String, String>> basic() {
        return map(basic);
    }


    @GetMapping("access")
    public Msg<Map<String, String>> access() {
        return map(access);
    }

    private Msg<Map<String, String>> map(List<String> skeys) {
        Msg<Map<String, String>> msg = new Msg<>();
        Msg<List<CommonSetting>> pageListMsg = commonSettingService.selectBySkeys(skeys);

        if (Boolean.TRUE.equals(pageListMsg.isSuccess())) {
            List<CommonSetting> data = pageListMsg.getData();
            Map<String, String> map = new HashMap<>(data.size());
            for (CommonSetting datum : data) {
                if (skeys.contains(datum.getSkey())) {
                    map.put(datum.getSkey(), datum.getSvalue());
                }
            }

            msg.setData(map);
        }

        return msg;
    }

}
