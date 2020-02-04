package com.xstudio.discuzx.ultrax.mapper;

import com.xstudio.discuzx.rest.vo.ForumModeratorVo;
import com.xstudio.discuzx.rest.vo.ForumVo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.util.Assert;

import java.util.List;

/**
 * @author xiaobiao
 * @version 2020/2/4
 */
@SpringBootTest
@RunWith(SpringRunner.class)
public class ForumForumMapperTest {
    @Autowired
    ForumForumMapper forumForumMapper;

    @Test
    public void forums() {
        List<ForumVo> forums = forumForumMapper.forums();
        Assert.notEmpty(forums, "版块为空");
    }

    @Test
    public void moderators() {
        List<ForumModeratorVo> moderators = forumForumMapper.moderators(1);
        Assert.notEmpty(moderators, "版主为空");
    }
}