package com.xstudio.discuzx.ultrax.service.impl;

import com.xstudio.core.ErrorConstant;
import com.xstudio.core.Msg;
import com.xstudio.discuzx.config.AbstractSecurityMybatisPageHelperServiceImpl;
import com.xstudio.discuzx.rest.vo.ForumModeratorVo;
import com.xstudio.discuzx.rest.vo.ForumVo;
import com.xstudio.discuzx.ultrax.mapper.ForumForumMapper;
import com.xstudio.discuzx.ultrax.model.ForumForum;
import com.xstudio.discuzx.ultrax.model.ForumForumfield;
import com.xstudio.discuzx.ultrax.service.IForumForumService;
import com.xstudio.discuzx.ultrax.service.IForumForumfieldService;
import com.xstudio.spring.mybatis.pagehelper.IMybatisPageHelperDao;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * service implements for table pre_forum_forum
 *
 * @author mybatis generator
 * @version 1.0.0
 */
@Service
public class ForumForumServiceImpl extends AbstractSecurityMybatisPageHelperServiceImpl<ForumForum, Integer> implements IForumForumService {
    @Autowired
    private ForumForumMapper forumForumMapper;

    @Autowired
    private IForumForumfieldService forumForumfieldService;

    @Override
    public IMybatisPageHelperDao getRepositoryDao() {
        return this.forumForumMapper;
    }

    @Override
    public void setDefaults(ForumForum record) {
        // todo

    }

    @Override
    public Msg<List<ForumVo>> forums() {
        Msg<List<ForumVo>> msg = new Msg<>();

        List<ForumVo> list = forumForumMapper.forums();
        if (CollectionUtils.isEmpty(list)) {
            msg.setResult(ErrorConstant.NO_MATCH, ErrorConstant.NO_MATCH_MSG);
            return msg;
        }

        // 遍历 构造 树形结构
        List<ForumVo> roots = new ArrayList<>();
        // 所有列表的构建子节点项
        for (ForumVo top : list) {
            // 获取第一层节点
            for (ForumVo childMenu : list) {
                if (top.getFid().equals(childMenu.getFup())) {
                    if (top.getChild() == null) {
                        top.setChild(new ArrayList<>());
                    }
                    top.getChild().add(childMenu);
                }
            }
        }
        // 获取grade菜单是1的节点
        for (ForumVo topMenu : list) {
            if (topMenu.getFup() == 0) {
                roots.add(topMenu);
            }
        }

        msg.setData(roots);
        return msg;
    }

    @Override
    public Msg<List<ForumModeratorVo>> modertors(Integer fid) {
        Msg<List<ForumModeratorVo>> msg = new Msg<>();
        List<ForumModeratorVo> list = forumForumMapper.moderators(fid);
        if (CollectionUtils.isEmpty(list)) {
            msg.setResult(ErrorConstant.NO_MATCH, ErrorConstant.NO_MATCH_MSG);
            return msg;
        }

        msg.setData(list);
        return msg;
    }

    @Override
    public Msg<ForumForum> updateByPrimaryKeySelective(ForumForum record) {
        Msg<ForumForum> msg = super.updateByPrimaryKeySelective(record);
        if (msg.isSuccess() && record instanceof ForumVo && null != ((ForumVo) record).getField()) {
            forumForumfieldService.updateByPrimaryKeySelective(((ForumVo) record).getField());
        }
        return msg;
    }

    @Override
    public Msg<ForumForum> insertSelective(ForumForum record) {
        Msg<ForumForum> msg = super.insertSelective(record);
        if (msg.isSuccess()) {
            ForumForumfield field = new ForumForumfield();
            if (record instanceof ForumVo) {
                field = ((ForumVo) record).getField();
            }
            field.setFid(record.getFid());

            forumForumfieldService.insertSelective(field);
        }

        return msg;
    }
}