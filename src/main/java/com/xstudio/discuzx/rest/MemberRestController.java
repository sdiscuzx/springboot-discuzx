package com.xstudio.discuzx.rest;

import com.xstudio.core.Msg;
import com.xstudio.core.service.IAbstractService;
import com.xstudio.discuzx.ultrax.model.CommonMember;
import com.xstudio.discuzx.ultrax.service.ICommonMemberService;
import com.xstudio.spring.web.rest.AbstractBaseRestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author xiaobiao
 * @version 2019/10/4
 */
@RestController
@RequestMapping("api/member")
public class MemberRestController extends AbstractBaseRestController<CommonMember, Long> {
    @Autowired
    private ICommonMemberService commonMemberService;

    @Override
    public IAbstractService getService() {
        return commonMemberService;
    }

    @GetMapping("currentUser")
    public Msg<String> currentUser() {
        Msg<String> msg = new Msg<>();
//        AppUserDetails currentUser = SecurityContextUtil.getCurrentUser();
//        if (null != currentUser) {
//            msg.setData(currentUser.getUsername());
//        }
        return msg;
    }

}
