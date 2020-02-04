package com.xstudio.discuzx.ultrax.service.impl;

import com.xstudio.discuzx.config.AbstractSecurityMybatisPageHelperServiceImpl;
import com.xstudio.discuzx.ultrax.mapper.ForumModeratorMapper;
import com.xstudio.discuzx.ultrax.model.ForumModerator;
import com.xstudio.discuzx.ultrax.model.ForumModeratorKey;
import com.xstudio.discuzx.ultrax.service.IForumModeratorService;
import com.xstudio.spring.mybatis.pagehelper.IMybatisPageHelperDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * service implements for table pre_forum_moderator
 * 
 * @author mybatis generator
 * @version 1.0.0
 */
@Service
public class ForumModeratorServiceImpl extends AbstractSecurityMybatisPageHelperServiceImpl<ForumModerator, ForumModeratorKey> implements IForumModeratorService {
    @Autowired
    private ForumModeratorMapper forumModeratorMapper;

    @Override
    public IMybatisPageHelperDao getRepositoryDao() {
        return this.forumModeratorMapper;
    }

    @Override
    public void setDefaults(ForumModerator record) {
        // todo
        
        
    }
}