package com.xstudio.discuzx.rest.vo;

import com.xstudio.discuzx.ultrax.model.CommonNav;
import com.xstudio.discuzx.ultrax.model.ForumForum;
import com.xstudio.discuzx.ultrax.model.ForumForumfield;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * @author xiaobiao
 * @version 2020/2/4
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class ForumVo extends ForumForum {
    /**
     * 版块扩展信息
     */
    private ForumForumfield field;

    /**
     * 自定义导航栏
     */
    private CommonNav nav;

    /**
     * 子节点
     */
    private List<ForumVo> child;
}
