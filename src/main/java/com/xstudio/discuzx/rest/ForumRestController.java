package com.xstudio.discuzx.rest;

import com.xstudio.core.Msg;
import com.xstudio.discuzx.rest.vo.ForumModeratorVo;
import com.xstudio.discuzx.rest.vo.ForumVo;
import com.xstudio.discuzx.ultrax.model.ForumForum;
import com.xstudio.discuzx.ultrax.service.IForumForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author xiaobiao
 * @version 2020/2/4
 */
@RestController
@RequestMapping("/api/action/")
public class ForumRestController {

    @Autowired
    private IForumForumService forumForumService;

    @GetMapping("forums")
    public Msg<List<ForumVo>> forums() {
        return forumForumService.forums();
    }

    @PostMapping("forums")
    public Msg<ForumForum> forums(ForumVo forum) {
        return forumForumService.updateByPrimaryKeySelective(forum);
    }

    @PostMapping("forums/edit")
    public Msg<ForumForum> forumsEdit(ForumVo forumVo) {
        return forumForumService.updateByPrimaryKeySelective(forumVo);
    }

    @GetMapping("forums/moderators")
    public Msg<List<ForumModeratorVo>> moderators(Integer fid) {
        return forumForumService.modertors(fid);
    }
}
