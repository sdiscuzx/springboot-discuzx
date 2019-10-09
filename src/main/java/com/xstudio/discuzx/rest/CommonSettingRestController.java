package com.xstudio.discuzx.rest;

import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.xstudio.discuzx.ultrax.model.CommonSetting;
import com.xstudio.discuzx.ultrax.service.ICommonSettingService;
import com.xstudio.spring.web.rest.AbstractBaseRestController;
import com.xstudio.tool.service.IAbstractService;
import com.xstudio.tool.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * @author xiaobiao
 * @version 2019/10/7
 */
@RestController
@RequestMapping("api/common/setting")
public class CommonSettingRestController extends AbstractBaseRestController<CommonSetting, String> {

    @Autowired
    private ICommonSettingService commonSettingService;

    @Override
    public IAbstractService getService() {
        return commonSettingService;
    }

    @GetMapping("map")
    public Msg<Map<String, String>> map() {
        Msg<Map<String, String>> msg = new Msg<>();
        Msg<PageList<CommonSetting>> pageListMsg = commonSettingService.selectAllByExample(new CommonSetting());

        if (Boolean.TRUE.equals(pageListMsg.getSuccess())) {
            PageList<CommonSetting> data = pageListMsg.getData();
            Map<String, String> map = new HashMap<>(data.size());
            for (CommonSetting datum : data) {
                map.put(datum.getSkey(), datum.getSvalue());
            }
        }

        return msg;
    }
}
