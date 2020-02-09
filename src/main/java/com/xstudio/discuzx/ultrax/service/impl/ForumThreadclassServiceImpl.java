package com.xstudio.discuzx.ultrax.service.impl;

import com.xstudio.discuzx.config.AbstractSecurityMybatisPageHelperServiceImpl;
import com.xstudio.discuzx.ultrax.mapper.ForumThreadclassMapper;
import com.xstudio.discuzx.ultrax.model.ForumThreadclass;
import com.xstudio.discuzx.ultrax.service.IForumThreadclassService;
import com.xstudio.spring.mybatis.pagehelper.IMybatisPageHelperDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * service implements for table pre_forum_threadclass
 * 
 * @author mybatis generator
 * @version 1.0.0
 */
@Service
public class ForumThreadclassServiceImpl extends AbstractSecurityMybatisPageHelperServiceImpl<ForumThreadclass, Integer> implements IForumThreadclassService {
    @Autowired
    private ForumThreadclassMapper forumThreadclassMapper;

    @Override
    public IMybatisPageHelperDao getRepositoryDao() {
        return this.forumThreadclassMapper;
    }

    @Override
    public void setDefaults(ForumThreadclass record) {
        // todo
        
    }
}