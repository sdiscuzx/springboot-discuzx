package com.xstudio.discuzx.rest;

import com.xstudio.core.Msg;
import com.xstudio.discuzx.ultrax.model.CommonUsergroup;
import com.xstudio.discuzx.ultrax.service.ICommonUsergroupService;
import com.xstudio.spring.mybatis.antdesign.PageResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author xiaobiao
 * @version 2020/2/5
 */
@RequestMapping("api/group")
@RestController
public class UserGroupRestController {
    @Autowired
    private ICommonUsergroupService usergroupService;

    @GetMapping("user")
    public Msg<PageResponse<CommonUsergroup>> usergroups(Byte radminid) {
        CommonUsergroup example = new CommonUsergroup();
        example.setRadminid(radminid);
        return usergroupService.selectAllByExample(example);
    }
}
