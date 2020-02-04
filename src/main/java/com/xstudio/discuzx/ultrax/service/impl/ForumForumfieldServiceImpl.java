package com.xstudio.discuzx.ultrax.service.impl;

import com.xstudio.discuzx.config.AbstractSecurityMybatisPageHelperServiceImpl;
import com.xstudio.discuzx.ultrax.mapper.ForumForumfieldMapper;
import com.xstudio.discuzx.ultrax.model.ForumForumfield;
import com.xstudio.discuzx.ultrax.service.IForumForumfieldService;
import com.xstudio.spring.mybatis.pagehelper.IMybatisPageHelperDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * service implements for table pre_forum_forumfield
 * 
 * @author mybatis generator
 * @version 1.0.0
 */
@Service
public class ForumForumfieldServiceImpl extends AbstractSecurityMybatisPageHelperServiceImpl<ForumForumfield, Integer> implements IForumForumfieldService {
    @Autowired
    private ForumForumfieldMapper forumForumfieldMapper;

    @Override
    public IMybatisPageHelperDao getRepositoryDao() {
        return this.forumForumfieldMapper;
    }

    @Override
    public void setDefaults(ForumForumfield record) {
        // todo
        
    }
}