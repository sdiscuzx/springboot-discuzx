package com.xstudio.discuzx.ultrax.mapper;

import com.xstudio.discuzx.ultrax.model.ForumModerator;
import com.xstudio.discuzx.ultrax.model.ForumModeratorKey;
import com.xstudio.spring.mybatis.pagehelper.IMybatisPageHelperDao;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ForumModeratorMapper extends IMybatisPageHelperDao<ForumModerator, ForumModeratorKey> {
}