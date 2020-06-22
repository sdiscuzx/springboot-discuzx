package com.xstudio.discuzx.rest;

import com.xstudio.core.service.IAbstractService;
import com.xstudio.discuzx.ultrax.model.CommonMember;
import com.xstudio.discuzx.ultrax.service.ICommonMemberService;
import com.xstudio.spring.mybatis.pagehelper.IMybatisPageHelperService;
import com.xstudio.spring.web.rest.AbstractBaseRestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Action;

/**
 * 用户相关接口
 *
 * @author xiaobiao
 * @version 2020/5/1
 */
@RestController
@RequestMapping("/api/member")
public class MemberRestController extends AbstractBaseRestController<CommonMember, Integer> {
    private ICommonMemberService commonMemberService;

    @Autowired
    public MemberRestController(ICommonMemberService commonMemberService) {
        this.commonMemberService = commonMemberService;
    }

    @Override
    public IMybatisPageHelperService<CommonMember, Integer> getService() {
        return commonMemberService;
    }
}
