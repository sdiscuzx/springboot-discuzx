package com.xstudio.discuzx.ultrax.mapper;

import com.xstudio.discuzx.rest.vo.ForumModeratorVo;
import com.xstudio.discuzx.rest.vo.ForumVo;
import com.xstudio.discuzx.ultrax.model.CommonNav;
import com.xstudio.discuzx.ultrax.model.ForumForum;
import com.xstudio.spring.mybatis.pagehelper.IMybatisPageHelperDao;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ForumForumMapper extends IMybatisPageHelperDao<ForumForum, Integer> {
    /**
     * 版块列表
     *
     * @return {@link ForumVo}
     */
    List<ForumVo> forums();

    CommonNav forumNav(Integer fid);
    /**
     * 版主列表
     *
     * @param fid 版块ID
     * @return {@link ForumModeratorVo}
     */
    List<ForumModeratorVo> moderators(Integer fid);
}