package com.xstudio.discuzx.ultrax.service;

import com.xstudio.core.Msg;
import com.xstudio.discuzx.rest.vo.ForumModeratorVo;
import com.xstudio.discuzx.rest.vo.ForumVo;
import com.xstudio.discuzx.ultrax.model.ForumForum;
import com.xstudio.spring.mybatis.pagehelper.IMybatisPageHelperService;

import java.util.List;

/**
 * service for table pre_forum_forum
 *
 * @author mybatis generator
 * @version 1.0.0
 */
public interface IForumForumService extends IMybatisPageHelperService<ForumForum, Integer> {
    /**
     * 板块列表
     *
     * @return {@link ForumVo}
     */
    Msg<List<ForumVo>> forums();

    /**
     * 版主列表
     *
     * @param fid 版块ID
     * @return {@link ForumModeratorVo}
     */
    Msg<List<ForumModeratorVo>> modertors(Integer fid);
}