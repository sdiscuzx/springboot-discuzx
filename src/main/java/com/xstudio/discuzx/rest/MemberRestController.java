package com.xstudio.discuzx.rest;

import com.xstudio.discuzx.ultrax.model.CommonMember;
import com.xstudio.discuzx.ultrax.service.ICommonMemberService;
import com.xstudio.spring.web.rest.AbstractBaseRestController;
import com.xstudio.tool.service.IAbstractService;
import com.xstudio.tool.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.xml.ws.Action;

/**
 * @author xiaobiao
 * @version 2019/10/4
 */
@RestController
@RequestMapping("member")
public class MemberRestController extends AbstractBaseRestController<CommonMember, Long> {
    @Autowired
    private ICommonMemberService commonMemberService;

    @Override
    public IAbstractService getService() {
        return commonMemberService;
    }


}
