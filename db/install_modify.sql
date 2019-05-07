--
-- DiscuzX INSTALL MAKE SQL DUMP V1.0
-- DO NOT modify this file
--
-- Create: 2013-08-27 16:12:45
--
DROP TABLE IF EXISTS pre_common_admincp_cmenu;
CREATE TABLE pre_common_admincp_cmenu (
  id bigint(20) unsigned NOT NULL COMMENT '编号',
  title varchar(255) NOT NULL COMMENT '菜单名称',
  url varchar(255) NOT NULL COMMENT '菜单地址',
  sort tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型,备用',
  displayorder tinyint(3) NOT NULL COMMENT '显示顺序',
  clicks smallint(6) unsigned NOT NULL DEFAULT 1 COMMENT '点击数,备用',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT '' COMMENT '添加用户ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY uid (uid),
  KEY displayorder (displayorder)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '后台管理面板，自定义常用菜单表';

DROP TABLE IF EXISTS pre_common_admincp_group;
CREATE TABLE pre_common_admincp_group (
  cpgroupid bigint(20) unsigned NOT NULL  COMMENT '职务ID',
  cpgroupname varchar(255) NOT NULL COMMENT '职务名称',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (cpgroupid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '后台团队职务名称表';

DROP TABLE IF EXISTS pre_common_admincp_member;
CREATE TABLE pre_common_admincp_member (
  uid bigint(20) unsigned NOT NULL COMMENT '成员uID',
  cpgroupid bigint(20) unsigned NOT NULL COMMENT '成员组ID',
  customperm text NOT NULL COMMENT '自定义管理权限',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '后台管理员成员表';

DROP TABLE IF EXISTS pre_common_admincp_perm;
CREATE TABLE pre_common_admincp_perm (
  cpgroupid bigint(20) unsigned NOT NULL COMMENT '后台组ID',
  perm varchar(255) NOT NULL COMMENT '后台组权限',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  UNIQUE KEY cpgroupperm (cpgroupid,perm)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '后台权限表';

DROP TABLE IF EXISTS pre_common_admincp_session;
CREATE TABLE pre_common_admincp_session (
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  adminid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '管理组ID',
  panel tinyint(1) NOT NULL DEFAULT '0' COMMENT '面板位置',
  ip varchar(15) NOT NULL DEFAULT '' COMMENT 'IP',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后动作时间',
  errorcount tinyint(1) NOT NULL DEFAULT '0' COMMENT '登录错误次数',
  `storage` mediumtext NOT NULL COMMENT '临时内容存储',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid,panel)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '后台在线管理员表';

DROP TABLE IF EXISTS pre_common_admingroup;
CREATE TABLE pre_common_admingroup (
  admingid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '所属管理员分组ID',
  alloweditpost tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许编辑帖子',
  alloweditpoll tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许编辑投票',
  allowstickthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许置顶主题',
  allowmodpost tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许审核帖子',
  allowdelpost tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许删除帖子',
  allowmassprune tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许批量删帖',
  allowrefund tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许强制退款',
  allowcensorword tinyint(1) NOT NULL DEFAULT '0' COMMENT '兼容性字段',
  allowviewip tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许查看IP',
  allowbanip tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许禁止IP',
  allowedituser tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许编辑用户',
  allowmoduser tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许审核用户',
  allowbanuser tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许禁止用户发言',
  allowbanvisituser tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许禁止用户访问',
  allowpostannounce tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许发布站点公告',
  allowviewlog tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许查看管理日志',
  allowbanpost tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许屏蔽帖子',
  supe_allowpushthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '兼容性字段',
  allowhighlightthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许高亮主题',
  allowlivethread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许直播帖',
  allowdigestthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许精华主题',
  allowrecommendthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许推荐主题',
  allowbumpthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许提升主题',
  allowclosethread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许关闭主题',
  allowmovethread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许移动主题',
  allowedittypethread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许编辑主题分类',
  allowstampthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许添加主题图章',
  allowstamplist tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许添加主题图标',
  allowcopythread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许复制主题',
  allowmergethread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许合并主题',
  allowsplitthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许分割主题',
  allowrepairthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许修复主题',
  allowwarnpost tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许警告帖子',
  allowviewreport tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许查看用户报告',
  alloweditforum tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许编辑版块',
  allowremovereward tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许移除悬赏',
  allowedittrade tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许编辑商品',
  alloweditactivity tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理活动报名者',
  allowstickreply tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许置顶回帖',
  allowmanagearticle tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理所有文章',
  allowaddtopic tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许创建专题',
  allowmanagetopic tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理专题',
  allowdiy tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许DIY',
  allowclearrecycle tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许删除回收站的帖子',
  allowmanagetag tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理标签',
  alloweditusertag tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许添加用户标签',
  managefeed tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理动态(feed)',
  managedoing tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理记录',
  manageshare tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理分享',
  manageblog tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理日志',
  managealbum tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理相册',
  managecomment tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理评论',
  managemagiclog tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理道具记录',
  managereport tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理举报',
  managehotuser tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理推荐成员',
  managedefaultuser tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理推荐好友',
  managevideophoto tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理视频认证',
  managemagic tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理道具',
  manageclick tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理表态动作',
  allowmanagecollection tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理淘专辑',
  allowmakehtml tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许生成门户静态页面',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (admingid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '管理组表';

DROP TABLE IF EXISTS pre_common_adminnote;
CREATE TABLE pre_common_adminnote (
  id bigint(20) unsigned NOT NULL COMMENT '后台留言ID',
  admin varchar(15) NOT NULL DEFAULT '' COMMENT '管理员姓名',
  access tinyint(3) NOT NULL DEFAULT '0' COMMENT '哪组可以看到信息',
  adminid tinyint(3) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  expiration int(10) unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  message text NOT NULL COMMENT '消息内容',
  `create_at` datetime DEFAULT NULL COMMENT '发表时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '管理团队留言表（后台）';

DROP TABLE IF EXISTS pre_common_advertisement;
CREATE TABLE pre_common_advertisement (
  advid bigint(20) unsigned NOT NULL COMMENT '广告ID',
  available tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `type` varchar(50) NOT NULL DEFAULT '0' COMMENT '类型',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '显示顺序',
  title varchar(255) NOT NULL DEFAULT '' COMMENT '广告标题',
  targets text NOT NULL COMMENT '投放范围',
  parameters text NOT NULL COMMENT '参数 序列化存放的数组数据',
  `code` text NOT NULL COMMENT '代码',
  starttime datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  endtime datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (advid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '广告数据表';

DROP TABLE IF EXISTS pre_common_advertisement_custom;
CREATE TABLE pre_common_advertisement_custom (
  id bigint(20) unsigned NOT NULL COMMENT '自定义广告类型ID',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '自定义广告数据表';

DROP TABLE IF EXISTS pre_common_banned;
CREATE TABLE pre_common_banned (
  id bigint(20) unsigned NOT NULL COMMENT '禁止ID',
  ip1 smallint(3) NOT NULL DEFAULT '0' COMMENT 'IP分段1',
  ip2 smallint(3) NOT NULL DEFAULT '0' COMMENT 'IP分段2',
  ip3 smallint(3) NOT NULL DEFAULT '0' COMMENT 'IP分段3',
  ip4 smallint(3) NOT NULL DEFAULT '0' COMMENT 'IP分段4',
  admin varchar(15) NOT NULL DEFAULT '' COMMENT '管理员姓名',
  dateline datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '禁止时间',
  expiration datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '过期时间',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '禁止访问表';

DROP TABLE IF EXISTS pre_common_block;
CREATE TABLE pre_common_block (
  bid bigint(20) unsigned NOT NULL COMMENT '模块ID',
  blockclass varchar(255) NOT NULL DEFAULT '0' COMMENT '模块分类 article/pic/member/board/poll',
  blocktype tinyint(1) NOT NULL DEFAULT '0' COMMENT '调用类型 0为模板调用 1为js调用',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '模块标名称',
  title text NOT NULL COMMENT '模块标题名',
  classname varchar(255) NOT NULL DEFAULT '' COMMENT '指定样式class',
  summary text NOT NULL COMMENT '模块自定义内容',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建者用户ID',
  username varchar(255) NOT NULL DEFAULT '' COMMENT '创建者用户名',
  styleid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '模块风格ID',
  blockstyle text NOT NULL COMMENT '自定义风格',
  picwidth smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '显示图片长度',
  picheight smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '显示图片宽度',
  target varchar(255) NOT NULL DEFAULT '' COMMENT '模块链接打开方式: _blank, _self, _top',
  dateformat varchar(255) NOT NULL DEFAULT '' COMMENT '时间格式： H:i； u； Y-m-d等',
  dateuformat tinyint(1) NOT NULL DEFAULT '0' COMMENT '	是否使用个性化时间格式',
  script varchar(255) NOT NULL DEFAULT '' COMMENT '模块获取数据脚本名',
  param text NOT NULL COMMENT '模块参数配置序列化存储',
  shownum smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '获取数据数目',
  cachetime int(10) NOT NULL DEFAULT '0' COMMENT '模块缓存更新时间间隔',
  cachetimerange char(5) NOT NULL DEFAULT '' COMMENT '模块缓存更新时间区间',
  punctualupdate tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否严格按照缓存时间更新（忽略优化）',
  hidedisplay tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否屏蔽输出',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模块缓存创建时间戳',
  notinherited tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否继承所在页面权限',
  isblank tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为空白模块，只显示准送数据',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (bid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '模块表';

DROP TABLE IF EXISTS pre_common_block_favorite;
CREATE TABLE pre_common_block_favorite (
  favid bigint(20) unsigned NOT NULL COMMENT '收藏ID',
  bid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '模块ID',
  `create_at` datetime DEFAULT NULL COMMENT '收藏时间',
  `create_by` bigint(20) DEFAULT '' COMMENT '会员ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (favid),
  KEY create_by (create_by,create_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '模块收藏表';

DROP TABLE IF EXISTS pre_common_block_item;
CREATE TABLE pre_common_block_item (
  itemid bigint(20) unsigned NOT NULL COMMENT '信息ID',
  bid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '模块ID',
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID',
  idtype varchar(255) NOT NULL DEFAULT '' COMMENT '来源ID TYPE，手工添加数据为rand',
  itemtype tinyint(1) NOT NULL DEFAULT '0' COMMENT '信息类型 0为自动 1为手工输入 2已编辑',
  title varchar(255) NOT NULL DEFAULT '' COMMENT '信息标题名',
  url varchar(255) NOT NULL DEFAULT '' COMMENT '信息链接地址',
  pic varchar(255) NOT NULL DEFAULT '' COMMENT '信息图片',
  picflag tinyint(1) NOT NULL DEFAULT '0' COMMENT '图片类型 0为url 1为本地 2 为ftp远程',
  makethumb tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已生成缩略图 1:生成成功; 2:生成失败',
  thumbpath varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图地址',
  summary text NOT NULL COMMENT '信息摘要',
  showstyle text NOT NULL COMMENT '显示样式',
  related text NOT NULL COMMENT '相关链接',
  `fields` text NOT NULL COMMENT '信息附属num/author/authorid/dateline',
  displayorder smallint(6) NOT NULL DEFAULT '0' COMMENT '显示顺序',
  startdate datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  enddate datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (itemid),
  KEY bid (bid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '模块数据表';

DROP TABLE IF EXISTS pre_common_block_item_data;
CREATE TABLE pre_common_block_item_data (
  dataid bigint(20) unsigned NOT NULL COMMENT '推荐信息ID',
  bid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '模块ID',
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID',
  idtype varchar(255) NOT NULL DEFAULT '' COMMENT '来源ID TYPE',
  itemtype tinyint(1) NOT NULL DEFAULT '0' COMMENT '信息类型 0为自动 1为手工输入 3推荐数据',
  title varchar(255) NOT NULL DEFAULT '' COMMENT '信息标题名',
  url varchar(255) NOT NULL DEFAULT '' COMMENT '信息链接地址',
  pic varchar(255) NOT NULL DEFAULT '' COMMENT '信息图片',
  picflag tinyint(1) NOT NULL DEFAULT '0' COMMENT '图片类型 0为url 1为本地 2 为ftp远程',
  makethumb tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已生成缩略图',
  summary text NOT NULL COMMENT '信息摘要',
  showstyle text NOT NULL COMMENT '显示样式',
  related text NOT NULL COMMENT '相关链接',
  `fields` text NOT NULL COMMENT '信息附属num/author/authorid/dateline',
  displayorder smallint(6) NOT NULL DEFAULT '0' COMMENT '显示顺序',
  startdate datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  enddate datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '推荐者 UID',
  username varchar(255) NOT NULL DEFAULT '' COMMENT '推荐者用户名',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '推荐日期',
  isverified tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已通过审核',
  verifiedtime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '通过审核日期',
  stickgrade tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '置顶等级： 0～10',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (dataid),
  KEY bid (bid,stickgrade,displayorder,verifiedtime)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '模块推荐信息表';

DROP TABLE IF EXISTS pre_common_block_permission;
CREATE TABLE pre_common_block_permission (
  bid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '模块ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  allowmanage tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许管理',
  allowrecommend tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许推荐',
  needverify tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐需要审核',
  inheritedtplname varchar(255) NOT NULL DEFAULT '' COMMENT '继承自的模板名称',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (bid,uid),
  KEY uid (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '模块权限表';

DROP TABLE IF EXISTS pre_common_block_pic;
CREATE TABLE pre_common_block_pic (
  picid bigint(20) unsigned NOT NULL COMMENT '图片ID',
  bid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '模块ID',
  itemid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '信息ID',
  pic varchar(255) NOT NULL DEFAULT '' COMMENT '信息图片',
  picflag tinyint(1) NOT NULL DEFAULT '0' COMMENT '图片类型 0为本地 1为ftp远程',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '信息类型 0为模块缩略图 1为上传的图',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (picid),
  KEY bid (bid,itemid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '模块使用图片表';

DROP TABLE IF EXISTS pre_common_block_style;
CREATE TABLE pre_common_block_style (
  styleid bigint(20) unsigned NOT NULL COMMENT '模块样式ID',
  blockclass varchar(255) NOT NULL DEFAULT '' COMMENT '模块分类',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '样式名称',
  template text NOT NULL COMMENT '样式模板',
  `hash` varchar(255) NOT NULL DEFAULT '' COMMENT '样式hash（blockclass + template）',
  getpic tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要获取pic数据',
  getsummary tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要获取summary数据',
  makethumb tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要block设置缩略图',
  settarget tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要设置链接打开方式',
  `fields` text NOT NULL COMMENT '模板中用到的模块分类字段',
  moreurl tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有更多链接',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (styleid),
  KEY `hash` (`hash`),
  KEY blockclass (blockclass)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '模块模板表';

DROP TABLE IF EXISTS pre_common_block_xml;
CREATE TABLE pre_common_block_xml (
  id bigint(20) unsigned NOT NULL COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT 'XML扩展 名称',
  version varchar(255) NOT NULL COMMENT 'XML扩展 版本',
  url varchar(255) NOT NULL COMMENT 'XML扩展 URL',
  clientid varchar(255) NOT NULL COMMENT '客户端ID',
  `key` varchar(255) NOT NULL COMMENT '通信密钥',
  signtype varchar(255) NOT NULL COMMENT '签名的加密方式：目前只支持MD5方式，空为不使用签名，直接使用通信密钥',
  `data` text NOT NULL COMMENT 'XML扩展 数据',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '模块 XML 扩展类数据表';

DROP TABLE IF EXISTS pre_common_cache;
CREATE TABLE pre_common_cache (
  cachekey varchar(255) NOT NULL DEFAULT '' COMMENT '缓存 key',
  cachevalue mediumblob NOT NULL COMMENT '缓存值',
  `create_at` datetime DEFAULT NULL COMMENT '缓存时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (cachekey)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '通用缓存表';

DROP TABLE IF EXISTS pre_common_card;
CREATE TABLE pre_common_card (
  id char(255) NOT NULL DEFAULT '' COMMENT '生成的卡片号码',
  typeid bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '卡片分类',
  maketype tinyint(1) NOT NULL DEFAULT '0' COMMENT '卡片生成的方法',
  makeruid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '卡片生成者uID',
  price mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '卡片面值',
  extcreditskey tinyint(1) NOT NULL DEFAULT '0' COMMENT '充值积分种类',
  extcreditsval int(10) NOT NULL DEFAULT '0' COMMENT '积分数额',
  `status` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '卡片状态(位与):1:可用,2:已用',
  cleardateline datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '卡片清理时间',
  useddateline datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '使用时间',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '使用者',
  `create_at` datetime DEFAULT NULL COMMENT '卡片生成时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY dateline (dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '充值卡密表';

DROP TABLE IF EXISTS pre_common_card_log;
CREATE TABLE pre_common_card_log (
  id bigint(20) NOT NULL COMMENT '生成的卡片号码',
  uid bigint(20) NOT NULL DEFAULT '0' COMMENT '卡片生成者ID',
  username varchar(20) NOT NULL DEFAULT '' COMMENT '卡片生成者',
  cardrule varchar(255) NOT NULL DEFAULT '' COMMENT '卡片生成规则',
  info text NOT NULL COMMENT '卡片生成log',
  description mediumtext NOT NULL COMMENT '卡片描述',
  operation tinyint(1) NOT NULL DEFAULT '0' COMMENT '操作动作(位与):1:生成,2:任务生成,4:删除,9:卡片过期',
  `create_at` datetime DEFAULT NULL COMMENT '本次log生成时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY dateline (dateline),
  KEY operation_dateline (operation,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '充值卡密表';

DROP TABLE IF EXISTS pre_common_card_type;
CREATE TABLE pre_common_card_type (
  id bigint(20) NOT NULL COMMENT '卡片分类ID',
  typename char(20) NOT NULL DEFAULT '' COMMENT '分类名称',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '卡片分类表';

DROP TABLE IF EXISTS pre_common_connect_guest;
CREATE TABLE pre_common_connect_guest (
  conopenid char(32) NOT NULL DEFAULT '' COMMENT '',
  conuin char(40) NOT NULL DEFAULT '' COMMENT '',
  conuinsecret char(16) NOT NULL DEFAULT '' COMMENT '',
  conqqnick char(100) NOT NULL DEFAULT '' COMMENT '',
  conuintoken char(32) NOT NULL DEFAULT '' COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (conopenid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'QQ登录用户表QQ登录插件';

DROP TABLE IF EXISTS pre_common_credit_log;
CREATE TABLE pre_common_credit_log (
  logid bigint(20) unsigned NOT NULL COMMENT '',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户uID',
  operation char(3) NOT NULL DEFAULT '' COMMENT '操作类型',
  relatedid int(10) unsigned NOT NULL COMMENT '操作相关ID',
  extcredits1 int(10) NOT NULL COMMENT '积分1变化值',
  extcredits2 int(10) NOT NULL COMMENT '积分2变化值',
  extcredits3 int(10) NOT NULL COMMENT '积分3变化值',
  extcredits4 int(10) NOT NULL COMMENT '积分4变化值',
  extcredits5 int(10) NOT NULL COMMENT '积分5变化值',
  extcredits6 int(10) NOT NULL COMMENT '积分6变化值',
  extcredits7 int(10) NOT NULL COMMENT '积分7变化值',
  extcredits8 int(10) NOT NULL COMMENT '积分8变化值',
  `create_at` datetime DEFAULT NULL COMMENT '记录时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (logid),
  KEY uid (uid),
  KEY operation (operation),
  KEY relatedid (relatedid),
  KEY dateline (dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '积分日志表';

DROP TABLE IF EXISTS pre_common_credit_log_field;
CREATE TABLE pre_common_credit_log_field (
  logid bigint(20) unsigned NOT NULL COMMENT '',
  title varchar(100) NOT NULL COMMENT '',
  `text` text NOT NULL COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  KEY logid (logid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '积分日志记录表X3新增';

DROP TABLE IF EXISTS pre_common_credit_rule;
CREATE TABLE pre_common_credit_rule (
  rid bigint(20) unsigned NOT NULL COMMENT '规则ID',
  rulename varchar(20) NOT NULL DEFAULT '' COMMENT '规则名称',
  `action` varchar(20) NOT NULL DEFAULT '' COMMENT '规则action唯一KEY',
  cycletype tinyint(1) NOT NULL DEFAULT '0' COMMENT '奖励周期0:一次;1:每天;2:整点;3:间隔分钟;4:不限',
  cycletime int(10) NOT NULL DEFAULT '0' COMMENT '间隔时间',
  rewardnum tinyint(2) NOT NULL DEFAULT '1' COMMENT '奖励次数',
  norepeat tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否去重1：去重;0：不去重',
  extcredits1 int(10) NOT NULL DEFAULT '0' COMMENT '扩展1',
  extcredits2 int(10) NOT NULL DEFAULT '0' COMMENT '扩展2',
  extcredits3 int(10) NOT NULL DEFAULT '0' COMMENT '扩展3',
  extcredits4 int(10) NOT NULL DEFAULT '0' COMMENT '扩展4',
  extcredits5 int(10) NOT NULL DEFAULT '0' COMMENT '扩展5',
  extcredits6 int(10) NOT NULL DEFAULT '0' COMMENT '扩展6',
  extcredits7 int(10) NOT NULL DEFAULT '0' COMMENT '扩展7',
  extcredits8 int(10) NOT NULL DEFAULT '0' COMMENT '扩展8',
  fids text NOT NULL COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (rid),
  UNIQUE KEY `action` (`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '积分规则表';

DROP TABLE IF EXISTS pre_common_credit_rule_log;
CREATE TABLE pre_common_credit_rule_log (
  clid bigint(20) unsigned NOT NULL COMMENT '策略日志ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '策略日志所有者uID',
  rid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '策略ID',
  fid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '版块ID',
  total mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '策略被执行总次数',
  cyclenum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '周期被执行次数',
  extcredits1 int(10) NOT NULL DEFAULT '0' COMMENT '扩展1',
  extcredits2 int(10) NOT NULL DEFAULT '0' COMMENT '扩展2',
  extcredits3 int(10) NOT NULL DEFAULT '0' COMMENT '扩展3',
  extcredits4 int(10) NOT NULL DEFAULT '0' COMMENT '扩展4',
  extcredits5 int(10) NOT NULL DEFAULT '0' COMMENT '扩展5',
  extcredits6 int(10) NOT NULL DEFAULT '0' COMMENT '扩展6',
  extcredits7 int(10) NOT NULL DEFAULT '0' COMMENT '扩展7',
  extcredits8 int(10) NOT NULL DEFAULT '0' COMMENT '扩展8',
  starttime datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '周期开始时间',
  dateline datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '策略最后执行时间',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (clid),
  KEY uid (uid,rid,fid),
  KEY dateline (dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '积分规则日志表';

DROP TABLE IF EXISTS pre_common_credit_rule_log_field;
CREATE TABLE pre_common_credit_rule_log_field (
  clid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '策略日志ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '策略日志所有者uID',
  info text NOT NULL COMMENT '记录信息防重',
  `user` text NOT NULL COMMENT '记录用户防重',
  app text NOT NULL COMMENT '记录应用防重',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid,clid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '积分规则日志扩展表';

DROP TABLE IF EXISTS pre_common_cron;
CREATE TABLE pre_common_cron (
  cronid bigint(20) unsigned NOT NULL COMMENT '计划任务ID',
  available tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `type` enum('user','system','plugin') NOT NULL DEFAULT 'user' COMMENT '类型',
  `name` char(50) NOT NULL DEFAULT '' COMMENT '名称',
  filename char(50) NOT NULL DEFAULT '' COMMENT '对应文件',
  lastrun datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上次执行时间',
  nextrun datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '下次执行时间',
  weekday tinyint(1) NOT NULL DEFAULT '0' COMMENT '周计划',
  `day` tinyint(2) NOT NULL DEFAULT '0' COMMENT '日计划',
  `hour` tinyint(2) NOT NULL DEFAULT '0' COMMENT '小时计划',
  `minute` char(36) NOT NULL DEFAULT '' COMMENT '分计划',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (cronid),
  KEY nextrun (available,nextrun)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '计划任务表';

DROP TABLE IF EXISTS pre_common_devicetoken;
CREATE TABLE pre_common_devicetoken (
  uid bigint(20) unsigned NOT NULL COMMENT '',
  token char(50) NOT NULL COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid),
  KEY token (token)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '掌上论坛插件-密钥校验存放表';

DROP TABLE IF EXISTS pre_common_district;
CREATE TABLE pre_common_district (
  id bigint(20) unsigned NOT NULL COMMENT '地区ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '地区名称',
  `level` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '地区等级：1，省级；2，市级；3，县级；4，乡镇',
  usetype tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '使用对象：0:都不启用; 1:出生地; 2:居住地; 3:都启用',
  upid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '上级地区ID',
  displayorder smallint(6) NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY upid (upid,displayorder)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '地区信息表';

DROP TABLE IF EXISTS pre_common_diy_data;
CREATE TABLE pre_common_diy_data (
  targettplname varchar(100) NOT NULL DEFAULT '' COMMENT '目标模板文件名',
  tpldirectory varchar(80) NOT NULL DEFAULT '' COMMENT '原模板所在目录',
  primaltplname varchar(255) NOT NULL DEFAULT '' COMMENT '原模板文件名',
  diycontent mediumtext NOT NULL COMMENT 'DIY的内容',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '目标模板页面名称',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '用户名',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (targettplname,tpldirectory)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'DIY模板页面数据的存档表';

DROP TABLE IF EXISTS pre_common_domain;
CREATE TABLE pre_common_domain (
  domain char(30) NOT NULL DEFAULT '' COMMENT '域名前缀',
  domainroot char(60) NOT NULL DEFAULT '' COMMENT '二级域名后缀',
  id bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '对应对象ID',
  idtype char(15) NOT NULL DEFAULT '' COMMENT '对应对象类型subarea:分区、forum:版块、home:个人空间、group:群组、topic:专题、channel:频道',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id,idtype),
  KEY domain (domain,domainroot),
  KEY idtype (idtype)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '域名相关数据表后台-全局-域名设置';

DROP TABLE IF EXISTS pre_common_failedip;
CREATE TABLE pre_common_failedip (
  ip char(7) NOT NULL DEFAULT '' COMMENT '用户登陆IP地址',
  lastupdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登陆',
  count tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '登陆失败次数',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (ip,lastupdate),
  KEY lastupdate (lastupdate)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '登录失败IP记录表';

DROP TABLE IF EXISTS pre_common_failedlogin;
CREATE TABLE pre_common_failedlogin (
  ip char(15) NOT NULL DEFAULT '' COMMENT '失败IP',
  username char(32) NOT NULL DEFAULT '' COMMENT '失败时的用户名',
  count tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '尝试次数',
  lastupdate datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后一次尝试时间',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (ip,username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '失败登录表';

DROP TABLE IF EXISTS pre_common_friendlink;
CREATE TABLE pre_common_friendlink (
  id bigint(20) unsigned NOT NULL COMMENT 'ID',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '显示顺序，正序',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  url varchar(255) NOT NULL DEFAULT '' COMMENT 'url',
  description mediumtext NOT NULL COMMENT '解释说明',
  logo varchar(255) NOT NULL DEFAULT '' COMMENT 'logo',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '类型',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '友情链接表';

DROP TABLE IF EXISTS pre_common_grouppm;
CREATE TABLE pre_common_grouppm (
  id bigint(20) unsigned NOT NULL COMMENT '消息ID',
  authorid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '作者ID',
  author varchar(15) NOT NULL DEFAULT '' COMMENT '作者姓名',
  message text NOT NULL COMMENT '消息',
  numbers mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '数量',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '群发短消息表';

DROP TABLE IF EXISTS pre_common_invite;
CREATE TABLE pre_common_invite (
  id bigint(20) unsigned NOT NULL COMMENT 'ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '邀请人',
  `code` char(20) NOT NULL DEFAULT '' COMMENT '邀请码',
  fuid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '受邀人UID',
  fusername char(20) NOT NULL DEFAULT '' COMMENT '受邀人姓名',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '邮件邀请 1是0否',
  email char(40) NOT NULL DEFAULT '' COMMENT '邀请Email',
  inviteip char(15) NOT NULL DEFAULT '' COMMENT '邀请IP',
  appid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '应用ID',
  dateline datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '邀请码生成时间',
  endtime datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '邀请码结束时间',
  regdateline datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '注册时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '邀请码状态',
  orderid char(32) NOT NULL DEFAULT '' COMMENT '购买邀请码的订单号ID',
  `create_at` datetime DEFAULT NULL COMMENT '邀请码生成时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY uid (uid,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '推广邀请表用户积分推广时使用';

DROP TABLE IF EXISTS pre_common_magic;
CREATE TABLE pre_common_magic (
  magicid bigint(20) unsigned NOT NULL COMMENT '',
  available tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `name` varchar(50) NOT NULL COMMENT '',
  identifier varchar(40) NOT NULL COMMENT '',
  description varchar(255) NOT NULL COMMENT '',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '会员ID',
  credit tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  price mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  num smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  salevolume smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  supplytype tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  supplynum smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  useperoid tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  usenum smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  weight tinyint(3) unsigned NOT NULL DEFAULT '1',
  magicperm text NOT NULL COMMENT '',
  useevent tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (magicid),
  UNIQUE KEY identifier (identifier),
  KEY displayorder (available,displayorder)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '道具数据表';

DROP TABLE IF EXISTS pre_common_magiclog;
CREATE TABLE pre_common_magiclog (
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  magicid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '道具ID',
  `action` tinyint(1) NOT NULL DEFAULT '0' COMMENT '操作动作 1 购买 2 使用 3 赠送',
  amount smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '操作数量',
  credit tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '操作积分',
  price mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '操作价格',
  targetid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '目标ID',
  idtype char(6) DEFAULT NULL COMMENT '道具类型',
  targetuid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '道具目标UID',
  `create_at` datetime DEFAULT NULL COMMENT '操作时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  KEY uid (uid,dateline),
  KEY `action` (`action`),
  KEY targetuid (targetuid,dateline),
  KEY magicid (magicid,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '道具日志表';

DROP TABLE IF EXISTS pre_common_mailcron;
CREATE TABLE pre_common_mailcron (
  cid bigint(20) unsigned NOT NULL COMMENT '计划编号',
  touid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '接收用户的UID',
  email varchar(100) NOT NULL DEFAULT '' COMMENT '邮件',
  sendtime datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发布时间',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (cid),
  KEY sendtime (sendtime)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '邮件计划任务表';

DROP TABLE IF EXISTS pre_common_mailqueue;
CREATE TABLE pre_common_mailqueue (
  qid bigint(20) unsigned NOT NULL COMMENT '邮件发送ID',
  cid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '邮件计划ID',
  `subject` text NOT NULL COMMENT '主题',
  message text NOT NULL COMMENT '邮件内容',
  dateline datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '推送时间',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (qid),
  KEY mcid (cid,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '邮件队列表';

DROP TABLE IF EXISTS pre_common_member;
CREATE TABLE pre_common_member (
  uid bigint(20) unsigned NOT NULL COMMENT '会员ID',
  email char(40) NOT NULL DEFAULT '' COMMENT '邮箱',
  username char(15) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '判断用户是否已经删除 需要discuz程序加判断，并增加整体清理的功能。原home字段为flag',
  emailstatus tinyint(1) NOT NULL DEFAULT '0' COMMENT 'email是否经过验证 1=验证通过 0=未验证 home字段为emailcheck',
  avatarstatus tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有头像 1=已上传 0=未上传 home字段为avatar',
  videophotostatus tinyint(1) NOT NULL DEFAULT '0' COMMENT '视频认证状态 1=是 0=否',
  adminid tinyint(1) NOT NULL DEFAULT '0' COMMENT ' 管理组ID 1=管理员 2=超级版主 3=版主',
  groupid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员组groupid',
  groupexpiry int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展用户组有效期',
  extgroupids char(20) NOT NULL DEFAULT '' COMMENT '扩展用户组ID数组',
  regdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  credits int(10) NOT NULL DEFAULT '0' COMMENT '总积分',
  notifysound tinyint(1) NOT NULL DEFAULT '0' COMMENT '短信声音',
  timeoffset char(4) NOT NULL DEFAULT '' COMMENT '时区校正',
  newpm smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '新短消息数量',
  newprompt smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '新提醒数目',
  accessmasks tinyint(1) NOT NULL DEFAULT '0' COMMENT '访问权限',
  allowadmincp tinyint(1) NOT NULL DEFAULT '0' COMMENT '管理权限',
  onlyacceptfriendpm tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否只接收好友短消息',
  conisbind tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户是否绑定QC',
  freeze tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否被冻结',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid),
  UNIQUE KEY username (username),
  KEY email (email),
  KEY groupid (groupid),
  KEY conisbind (conisbind),
  KEY regdate (regdate)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户主表';

DROP TABLE IF EXISTS pre_common_member_action_log;
CREATE TABLE pre_common_member_action_log (
  id bigint(20) unsigned NOT NULL COMMENT '记录ID',
  `action` tinyint(5) NOT NULL DEFAULT '0' COMMENT '动作',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `create_by` bigint(20) DEFAULT '' COMMENT '用户ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY dateline (dateline,`action`,uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户操作日志表';

DROP TABLE IF EXISTS pre_common_member_connect;
CREATE TABLE pre_common_member_connect (
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  conuin char(40) NOT NULL DEFAULT '' COMMENT '',
  conuinsecret char(16) NOT NULL DEFAULT '' COMMENT '',
  conopenid char(32) NOT NULL DEFAULT '' COMMENT '',
  conisfeed tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  conispublishfeed tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  conispublisht tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  conisregister tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  conisqzoneavatar tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  conisqqshow tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  conuintoken char(32) NOT NULL DEFAULT '' COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid),
  KEY conuin (conuin),
  KEY conopenid (conopenid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'QQ互联记录表';

DROP TABLE IF EXISTS pre_common_member_count;
CREATE TABLE pre_common_member_count (
  uid bigint(20) unsigned NOT NULL COMMENT '会员ID',
  extcredits1 int(10) NOT NULL DEFAULT '0' COMMENT '声望',
  extcredits2 int(10) NOT NULL DEFAULT '0' COMMENT '金钱',
  extcredits3 int(10) NOT NULL DEFAULT '0' COMMENT '扩展',
  extcredits4 int(10) NOT NULL DEFAULT '0' COMMENT '扩展',
  extcredits5 int(10) NOT NULL DEFAULT '0' COMMENT '扩展',
  extcredits6 int(10) NOT NULL DEFAULT '0' COMMENT '扩展',
  extcredits7 int(10) NOT NULL DEFAULT '0' COMMENT '扩展',
  extcredits8 int(10) NOT NULL DEFAULT '0' COMMENT '扩展',
  friends smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '好友个数 home',
  posts mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '帖子数',
  threads mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主题数',
  digestposts smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '精华数',
  doings smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '记录数',
  blogs smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '日志数',
  albums smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '相册数',
  sharings smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '分享数',
  attachsize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传附件占用的空间',
  views mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '空间查看数',
  oltime smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '在线时间',
  todayattachs smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '当天上传附件数',
  todayattachsize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当天上传附件容量',
  feeds mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '广播数',
  follower mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '听众数量',
  following mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '收听数量',
  newfollower mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '新增听众数量',
  blacklist mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '黑名单',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid),
  KEY posts (posts)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户统计表';

DROP TABLE IF EXISTS pre_common_member_crime;
CREATE TABLE pre_common_member_crime (
  cid bigint(20) unsigned NOT NULL COMMENT '自增ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被惩罚操作的用户ID',
  operatorid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '进行惩罚操作的用户ID',
  operator varchar(15) NOT NULL COMMENT '进行惩罚操作的用户名',
  `action` tinyint(5) NOT NULL COMMENT '惩罚行为',
  reason text NOT NULL COMMENT '惩罚理由',
  `create_at` datetime DEFAULT NULL COMMENT '惩罚操作时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (cid),
  KEY uid (uid,`action`,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户惩罚操作表';

DROP TABLE IF EXISTS pre_common_member_field_forum;
CREATE TABLE pre_common_member_field_forum (
  uid bigint(20) unsigned NOT NULL COMMENT '会员ID',
  publishfeed tinyint(3) NOT NULL DEFAULT '0' COMMENT '用户自定义发送哪些类型的feed(原字段为customaddfeed)',
  customshow tinyint(1) unsigned NOT NULL DEFAULT 26 COMMENT '自定义帖子显示模式',
  customstatus varchar(30) NOT NULL DEFAULT '' COMMENT '自定义头衔',
  medals text NOT NULL COMMENT '勋章信息',
  sightml text NOT NULL COMMENT '签名',
  groupterms text NOT NULL COMMENT '公共用户组',
  authstr varchar(20) NOT NULL DEFAULT '' COMMENT '找回密码验证串',
  `groups` mediumtext NOT NULL COMMENT '用户所有群组',
  attentiongroup varchar(255) NOT NULL DEFAULT '' COMMENT '用户偏好',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户论坛字段表';

DROP TABLE IF EXISTS pre_common_member_field_home;
CREATE TABLE pre_common_member_field_home (
  uid bigint(20) unsigned NOT NULL COMMENT '会员ID',
  videophoto varchar(255) NOT NULL DEFAULT '' COMMENT '视频认证照片地址',
  spacename varchar(255) NOT NULL DEFAULT '' COMMENT '空间名称',
  spacedescription varchar(255) NOT NULL DEFAULT '' COMMENT '空间简介',
  domain char(15) NOT NULL DEFAULT '' COMMENT '空间绑定二级域名',
  addsize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '额外授予的上传空间',
  addfriend smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '额外允许增加的好友数',
  menunum smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '应用显示个数',
  theme varchar(20) NOT NULL DEFAULT '' COMMENT '空间风格主题',
  spacecss text NOT NULL COMMENT '个人空间自定义css',
  blockposition text NOT NULL COMMENT ' 个人空间自定义模块位置及相关参数',
  recentnote text NOT NULL COMMENT '最近一次行为记录',
  spacenote text NOT NULL COMMENT '最近一次twitter',
  privacy text NOT NULL COMMENT '隐私设置(注意要和论坛发feed等开关的设置结合)',
  feedfriend mediumtext NOT NULL COMMENT '接受feed的好友缓存',
  acceptemail text NOT NULL COMMENT '接受新通知邮件及设置邮件接收参数',
  magicgift text NOT NULL COMMENT '道具红包卡相关信息',
  stickblogs text NOT NULL COMMENT '置顶的日志ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid),
  KEY domain (domain)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户家园设置表';

DROP TABLE IF EXISTS pre_common_member_forum_buylog;
CREATE TABLE pre_common_member_forum_buylog (
  uid bigint(20) unsigned NOT NULL COMMENT '会员ID',
  fid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '板块ID',
  credits int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已付金额',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid,fid),
  KEY fid (fid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户版块积分付费记录';

DROP TABLE IF EXISTS pre_common_member_grouppm;
CREATE TABLE pre_common_member_grouppm (
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  gpmid bigint(20) unsigned NOT NULL COMMENT '消息ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=未读 1=已读 -1=删除',
  dateline datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '阅读时间',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid,gpmid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '群发短消息用户记录表';

DROP TABLE IF EXISTS pre_common_member_log;
CREATE TABLE pre_common_member_log (
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `action` char(10) NOT NULL DEFAULT '' COMMENT 'add,update,delete',
  dateline datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '时间',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '漫游用户日志表';

DROP TABLE IF EXISTS pre_common_member_magic;
CREATE TABLE pre_common_member_magic (
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  magicid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '道具id',
  num smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '拥有数量',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid,magicid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户道具数据表';

DROP TABLE IF EXISTS pre_common_member_medal;
CREATE TABLE pre_common_member_medal (
  uid bigint(20) unsigned NOT NULL COMMENT '会员ID',
  medalid bigint(20) unsigned NOT NULL COMMENT '勋章ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid,medalid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户勋章数据表';

DROP TABLE IF EXISTS pre_common_member_newprompt;
CREATE TABLE pre_common_member_newprompt (
  uid bigint(20) unsigned NOT NULL COMMENT '会员ID',
  `data` varchar(255) NOT NULL DEFAULT '' COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户新提醒数量表';

DROP TABLE IF EXISTS pre_common_member_profile;
CREATE TABLE pre_common_member_profile (
  uid bigint(20) unsigned NOT NULL COMMENT '会员ID',
  realname varchar(255) NOT NULL DEFAULT '' COMMENT '实名',
  gender tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别',
  birthyear smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '出生年',
  birthmonth tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '出生月',
  birthday tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '出生日',
  constellation varchar(255) NOT NULL DEFAULT '' COMMENT '星座(根据生日自动计算)',
  zodiac varchar(255) NOT NULL DEFAULT '' COMMENT '生肖(根据生日自动计算)',
  telephone varchar(255) NOT NULL DEFAULT '' COMMENT '固定电话',
  mobile varchar(255) NOT NULL DEFAULT '' COMMENT '手机',
  idcardtype varchar(255) NOT NULL DEFAULT '' COMMENT '证件类型：身份证 护照 军官证等',
  idcard varchar(255) NOT NULL DEFAULT '' COMMENT '证件号码',
  address varchar(255) NOT NULL DEFAULT '' COMMENT '邮寄地址',
  zipcode varchar(255) NOT NULL DEFAULT '' COMMENT '邮编',
  nationality varchar(255) NOT NULL DEFAULT '' COMMENT '国籍',
  birthprovince varchar(255) NOT NULL DEFAULT '' COMMENT '出生省份',
  birthcity varchar(255) NOT NULL DEFAULT '' COMMENT '出生城市',
  birthdist varchar(20) NOT NULL DEFAULT '' COMMENT '出生行政区/县',
  birthcommunity varchar(255) NOT NULL DEFAULT '' COMMENT '出生小区',
  resideprovince varchar(255) NOT NULL DEFAULT '' COMMENT '居住省份',
  residecity varchar(255) NOT NULL DEFAULT '' COMMENT '居住城市',
  residedist varchar(20) NOT NULL DEFAULT '' COMMENT '居住行政区/县',
  residecommunity varchar(255) NOT NULL DEFAULT '' COMMENT '居住小区',
  residesuite varchar(255) NOT NULL DEFAULT '' COMMENT '小区、写字楼门牌号',
  graduateschool varchar(255) NOT NULL DEFAULT '' COMMENT '毕业学校',
  company varchar(255) NOT NULL DEFAULT '' COMMENT '公司',
  education varchar(255) NOT NULL DEFAULT '' COMMENT '学历',
  occupation varchar(255) NOT NULL DEFAULT '' COMMENT '职业',
  position varchar(255) NOT NULL DEFAULT '' COMMENT '职位',
  revenue varchar(255) NOT NULL DEFAULT '' COMMENT '年收入',
  affectivestatus varchar(255) NOT NULL DEFAULT '' COMMENT '情感状态',
  lookingfor varchar(255) NOT NULL DEFAULT '' COMMENT '交友目的（交友类型）',
  bloodtype varchar(255) NOT NULL DEFAULT '' COMMENT '血型',
  height varchar(255) NOT NULL DEFAULT '' COMMENT '身高',
  weight varchar(255) NOT NULL DEFAULT '' COMMENT '体重',
  alipay varchar(255) NOT NULL DEFAULT '' COMMENT '支付宝帐号',
  icq varchar(255) NOT NULL DEFAULT '' COMMENT 'ICQ',
  qq varchar(255) NOT NULL DEFAULT '' COMMENT 'QQ',
  yahoo varchar(255) NOT NULL DEFAULT '' COMMENT 'YAHOO',
  msn varchar(255) NOT NULL DEFAULT '' COMMENT 'MSN',
  taobao varchar(255) NOT NULL DEFAULT '' COMMENT '阿里旺旺',
  site varchar(255) NOT NULL DEFAULT '' COMMENT '主页',
  bio text NOT NULL COMMENT '自我介绍 来自论坛bio字段',
  interest text NOT NULL COMMENT '兴趣爱好',
  field1 text NOT NULL COMMENT '自定义字段1',
  field2 text NOT NULL COMMENT '自定义字段2',
  field3 text NOT NULL COMMENT '自定义字段3',
  field4 text NOT NULL COMMENT '自定义字段4',
  field5 text NOT NULL COMMENT '自定义字段5',
  field6 text NOT NULL COMMENT '自定义字段6',
  field7 text NOT NULL COMMENT '自定义字段7',
  field8 text NOT NULL COMMENT '自定义字段8',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户栏目表';

DROP TABLE IF EXISTS pre_common_member_profile_setting;
CREATE TABLE pre_common_member_profile_setting (
  fieldid varchar(255) NOT NULL DEFAULT '' COMMENT 'profile字段标志符',
  available tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可用',
  invisible tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  needverify tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要审核',
  title varchar(255) NOT NULL DEFAULT '' COMMENT '栏目标题',
  description varchar(255) NOT NULL DEFAULT '' COMMENT '解释说明',
  displayorder smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '显示顺序',
  required tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否必填内容',
  unchangeable tinyint(1) NOT NULL DEFAULT '0' COMMENT '不可修改',
  showincard tinyint(1) NOT NULL DEFAULT '0' COMMENT '在名片中显示',
  showinthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '在帖子中显示',
  showinregister tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否在注册页面显示',
  allowsearch tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可搜索',
  formtype varchar(255) NOT NULL COMMENT '表单元素类型',
  size smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '内容最大长度',
  choices text NOT NULL COMMENT '选填内容',
  validate text NOT NULL COMMENT '验证数据的正则表达式',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (fieldid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '个人信息扩展表';

DROP TABLE IF EXISTS pre_common_member_security;
CREATE TABLE pre_common_member_security (
  securityid bigint(20) unsigned NOT NULL COMMENT '审核项ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  username varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  fieldid varchar(255) NOT NULL DEFAULT '' COMMENT 'profile字段标志符',
  oldvalue text NOT NULL COMMENT '旧的profile字段值',
  newvalue text NOT NULL COMMENT '新的profile字段值',
  `create_at` datetime DEFAULT NULL COMMENT '提交日期',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (securityid),
  KEY uid (uid,fieldid),
  KEY dateline (dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '个人信息修改审核';

DROP TABLE IF EXISTS pre_common_member_secwhite;
CREATE TABLE pre_common_member_secwhite (
  uid int(10) NOT NULL COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid)
) ENGINE=HEAP COMMENT '用户被执行管理操作间隔时间表';

DROP TABLE IF EXISTS pre_common_member_stat_field;
CREATE TABLE pre_common_member_stat_field (
  optionid bigint(20) unsigned NOT NULL COMMENT '资料统计项 ID',
  fieldid varchar(255) NOT NULL DEFAULT '' COMMENT '资料项字段标志符',
  fieldvalue varchar(255) NOT NULL DEFAULT '' COMMENT '',
  `hash` varchar(255) NOT NULL DEFAULT '' COMMENT '由fieldid和fieldvalue生成的hash',
  users mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '对应用户数',
  updatetime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (optionid),
  KEY fieldid (fieldid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户资料统计项';

DROP TABLE IF EXISTS pre_common_member_status;
CREATE TABLE pre_common_member_status (
  uid bigint(20) unsigned NOT NULL COMMENT '会员ID',
  regip char(15) NOT NULL DEFAULT '' COMMENT '注册IP',
  lastip char(15) NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `port` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  lastvisit datetime DEFAULT '0000-00-00 00:00:00' COMMENT '最后访问',
  lastactivity int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后活动',
  lastpost datetime DEFAULT '0000-00-00 00:00:00' COMMENT '最后发表',
  lastsendmail int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上次发送email时间 home原字段为lastsend',
  invisible tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否隐身登录',
  buyercredit smallint(6) NOT NULL DEFAULT '0' COMMENT '买家信用等级及积分',
  sellercredit smallint(6) NOT NULL DEFAULT '0' COMMENT '卖家信用等级及积分',
  favtimes mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '个人空间收藏次数',
  sharetimes mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '个人空间分享次数',
  profileprogress tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '个人资料完成度',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid),
  KEY lastactivity (lastactivity,invisible)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户状态表';

DROP TABLE IF EXISTS pre_common_member_validate;
CREATE TABLE pre_common_member_validate (
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  submitdate datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '提交日期',
  moddate datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '审核日期',
  admin varchar(15) NOT NULL DEFAULT '' COMMENT '管理员名',
  submittimes tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '提交的次数',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  message text NOT NULL COMMENT '注册原因',
  remark text NOT NULL COMMENT '管理员留言',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户审核表';

DROP TABLE IF EXISTS pre_common_member_verify;
CREATE TABLE pre_common_member_verify (
  uid bigint(20) unsigned NOT NULL COMMENT '会员ID',
  verify1 tinyint(1) NOT NULL DEFAULT '0' COMMENT '认证1: -1:被拒绝 0:待审核 1:审核通过',
  verify2 tinyint(1) NOT NULL DEFAULT '0' COMMENT '认证2: -1:被拒绝 0:待审核 1:审核通过',
  verify3 tinyint(1) NOT NULL DEFAULT '0' COMMENT '认证3: -1:被拒绝 0:待审核 1:审核通过',
  verify4 tinyint(1) NOT NULL DEFAULT '0' COMMENT '认证4: -1:被拒绝 0:待审核 1:审核通过',
  verify5 tinyint(1) NOT NULL DEFAULT '0' COMMENT '认证5: -1:被拒绝 0:待审核 1:审核通过',
  verify6 tinyint(1) NOT NULL DEFAULT '0' COMMENT '认证6: -1:被拒绝 0:待审核 1:审核通过',
  verify7 tinyint(1) NOT NULL DEFAULT '0' COMMENT '认证7: -1:被拒绝 0:待审核 1:审核通过',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid),
  KEY verify1 (verify1),
  KEY verify2 (verify2),
  KEY verify3 (verify3),
  KEY verify4 (verify4),
  KEY verify5 (verify5),
  KEY verify6 (verify6),
  KEY verify7 (verify7)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户认证表';

DROP TABLE IF EXISTS pre_common_member_verify_info;
CREATE TABLE pre_common_member_verify_info (
  vid bigint(20) unsigned NOT NULL COMMENT '审核ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  username varchar(30) NOT NULL DEFAULT '' COMMENT '用户名',
  verifytype tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核类型0:资料审核, 1:认证1, 2:认证2, 3:认证3, 4:认证4, 5:认证5',
  flag tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1:被拒绝 0:待审核 1:审核通过',
  field text NOT NULL COMMENT '序列化存储变化值',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '提交日期',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (vid),
  KEY verifytype (verifytype,flag),
  KEY uid (uid,verifytype,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '个人信息修改审核';

DROP TABLE IF EXISTS pre_common_myapp;
CREATE TABLE pre_common_myapp (
  appid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '应用ID',
  appname varchar(60) NOT NULL DEFAULT '' COMMENT '应用名称',
  narrow tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示为窄的profile box',
  flag tinyint(1) NOT NULL DEFAULT '0' COMMENT '应用状态（黑白名单、默认应用等）',
  version mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '应用版本号',
  userpanelarea tinyint(1) NOT NULL DEFAULT '0' COMMENT 'userabout显示区域、1主区、2、副区、3应用区',
  canvastitle varchar(60) NOT NULL DEFAULT '' COMMENT 'canvas页面标题',
  fullscreen tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是全屏应用',
  displayuserpanel tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示应用右侧的用户菜单',
  displaymethod tinyint(1) NOT NULL DEFAULT '0' COMMENT '显示方式（iframe/myml）',
  displayorder smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '显示顺序',
  appstatus tinyint(2) NOT NULL DEFAULT '0' COMMENT '标识应用1:新、2:热',
  iconstatus tinyint(2) NOT NULL DEFAULT '0' COMMENT '应用图标是否已下载到本地。-1：失败；0：未下载；1：已下载',
  icondowntime datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '应用图标下载到本地时间',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (appid),
  KEY flag (flag,displayorder)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '漫游应用表';

DROP TABLE IF EXISTS pre_common_myinvite;
CREATE TABLE pre_common_myinvite (
  id bigint(20) unsigned NOT NULL COMMENT ' 邀请id',
  typename varchar(100) NOT NULL DEFAULT '' COMMENT '邀请名称',
  appid bigint(20) NOT NULL DEFAULT '0' COMMENT '应用id',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型(request 邀请/invite 请求)',
  fromuid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '邀请者id',
  touid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '接收者id',
  myml text NOT NULL COMMENT '邀请内容',
  `hash` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '发送邀请的时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY `hash` (`hash`),
  KEY uid (touid,create_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户邀请推广数据';

DROP TABLE IF EXISTS pre_common_mytask;
CREATE TABLE pre_common_mytask (
  uid bigint(20) unsigned NOT NULL COMMENT '用户Uid',
  username char(15) NOT NULL DEFAULT '' COMMENT '用户名',
  taskid bigint(20) unsigned NOT NULL COMMENT '任务id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '任务状态',
  csc char(255) NOT NULL DEFAULT '' COMMENT ' 任务进度',
  `create_at` datetime DEFAULT NULL COMMENT '申请任务时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid,taskid),
  KEY parter (taskid,create_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '我的任务表';

DROP TABLE IF EXISTS pre_common_nav;
CREATE TABLE pre_common_nav (
  id bigint(20) unsigned NOT NULL COMMENT '项目ID',
  parentid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父 id(navtype=0)',
  `name` varchar(255) NOT NULL COMMENT '导航名称',
  title varchar(255) NOT NULL COMMENT '导航说明',
  url varchar(255) NOT NULL COMMENT '导航链接',
  identifier varchar(255) NOT NULL COMMENT '链接标识/相关ID',
  target tinyint(1) NOT NULL DEFAULT '0' COMMENT '目标框架',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型 0 系统 1 自定义 3 插件 4 频道',
  available tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可用',
  displayorder tinyint(3) NOT NULL COMMENT '显示顺序',
  highlight tinyint(1) NOT NULL DEFAULT '0' COMMENT '样式(navtype=0)',
  `level` tinyint(1) NOT NULL DEFAULT '0' COMMENT '使用等级',
  subtype tinyint(1) NOT NULL DEFAULT '0' COMMENT '二级导航样式(navtype=0) 顶部导航位置(navtype=4)',
  subcols tinyint(1) NOT NULL DEFAULT '0' COMMENT '横排一行显示的条目数(navtype=0)',
  icon varchar(255) NOT NULL COMMENT '图标地址(navtype=1、3)',
  subname varchar(255) NOT NULL COMMENT '副导航名称(navtype=1)',
  suburl varchar(255) NOT NULL COMMENT '副导航地址(navtype=1)',
  navtype tinyint(1) NOT NULL DEFAULT '0' COMMENT '导航类型',
  logo varchar(255) NOT NULL COMMENT '自定义 Logo',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY navtype (navtype)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '自定义导航栏表';

DROP TABLE IF EXISTS pre_common_onlinetime;
CREATE TABLE pre_common_onlinetime (
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  thismonth smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '本月在线时间',
  total mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '总在线时间',
  lastupdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '在线时间表';

DROP TABLE IF EXISTS pre_common_optimizer;
CREATE TABLE pre_common_optimizer (
  k char(100) NOT NULL DEFAULT '' COMMENT '',
  v char(255) NOT NULL DEFAULT '' COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (k)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '后台-站长-优化大师';

DROP TABLE IF EXISTS pre_common_patch;
CREATE TABLE pre_common_patch (
  `serial` varchar(10) NOT NULL DEFAULT '' COMMENT '',
  rule text NOT NULL COMMENT '',
  note text NOT NULL COMMENT '',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (`serial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '漏洞补丁表';

DROP TABLE IF EXISTS pre_common_plugin;
CREATE TABLE pre_common_plugin (
  pluginid bigint(20) unsigned NOT NULL COMMENT '插件ID',
  available tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可用',
  adminid tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '使用插件的管理组',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '插件名称',
  identifier varchar(40) NOT NULL DEFAULT '' COMMENT '唯一标识符',
  description varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  datatables varchar(255) NOT NULL DEFAULT '' COMMENT '插件单独使用的数据表',
  `directory` varchar(100) NOT NULL DEFAULT '' COMMENT '插件目录',
  copyright varchar(100) NOT NULL DEFAULT '' COMMENT '插件版权',
  modules text NOT NULL COMMENT 'serialize后的插件配置',
  version varchar(20) NOT NULL DEFAULT '' COMMENT '版本',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (pluginid),
  UNIQUE KEY identifier (identifier)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '插件数据表DX插件（应用）信息都在此表';

DROP TABLE IF EXISTS pre_common_pluginvar;
CREATE TABLE pre_common_pluginvar (
  pluginvarid bigint(20) unsigned NOT NULL COMMENT '插件变量id',
  pluginid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '插件id',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '显示顺序',
  title varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  description varchar(255) NOT NULL DEFAULT '' COMMENT '解释说明',
  variable varchar(40) NOT NULL DEFAULT '' COMMENT '  变量名',
  `type` varchar(20) NOT NULL DEFAULT '类型',
  `value` text NOT NULL COMMENT '值',
  extra text NOT NULL COMMENT '附加',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (pluginvarid),
  KEY pluginid (pluginid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '插件设置数据表 保存插件设置里的各项参数';

DROP TABLE IF EXISTS pre_common_process;
CREATE TABLE pre_common_process (
  processid char(32) NOT NULL COMMENT '锁名称的md5',
  expiry datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '锁的过期时间',
  extra int(10) DEFAULT NULL COMMENT '锁的附属信息',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (processid),
  KEY expiry (expiry)
) ENGINE=HEAP COMMENT '防灌水功能用户记录表';

DROP TABLE IF EXISTS pre_common_regip;
CREATE TABLE pre_common_regip (
  ip char(15) NOT NULL DEFAULT '' COMMENT 'IP地址',
  dateline datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '限制时间',
  count smallint(6) NOT NULL DEFAULT '0' COMMENT '限制数量',
  KEY ip (ip)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '注册IP限制表';

DROP TABLE IF EXISTS pre_common_relatedlink;
CREATE TABLE pre_common_relatedlink (
  id bigint(20) unsigned NOT NULL COMMENT '',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '',
  url varchar(255) NOT NULL DEFAULT '' COMMENT '',
  extent tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '关联链接表';

DROP TABLE IF EXISTS pre_common_remote_port;
CREATE TABLE pre_common_remote_port (
  id bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '',
  idtype char(15) NOT NULL DEFAULT '' COMMENT '',
  useip char(15) NOT NULL DEFAULT '' COMMENT '',
  `port` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id,idtype)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '未使用的功能（冗余）';

DROP TABLE IF EXISTS pre_common_report;
CREATE TABLE pre_common_report (
  id bigint(20) unsigned NOT NULL COMMENT '记录ID',
  urlkey char(32) NOT NULL DEFAULT '' COMMENT '地址md5',
  url varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  message text NOT NULL COMMENT '举报理由',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '用户名',
  num smallint(6) unsigned NOT NULL DEFAULT 1 COMMENT '举报次数',
  opuid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  opname varchar(15) NOT NULL DEFAULT '' COMMENT '管理员姓名',
  optime datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '处理时间',
  opresult varchar(255) NOT NULL DEFAULT '' COMMENT '对举报人的奖惩',
  fid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '论坛ID',
  `create_at` datetime DEFAULT NULL COMMENT '举报时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY urlkey (urlkey),
  KEY fid (fid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户举报表';

DROP TABLE IF EXISTS pre_common_searchindex;
CREATE TABLE pre_common_searchindex (
  searchid bigint(20) unsigned NOT NULL COMMENT '缓存ID',
  srchmod tinyint(3) unsigned NOT NULL COMMENT 'mod模块',
  keywords varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  searchstring text NOT NULL COMMENT '查找字符串',
  useip varchar(15) NOT NULL DEFAULT '' COMMENT '搜索人IP',
  uid mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '搜索时间',
  expiration datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '过期时间',
  threadsortid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类信息ID',
  num smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '主题数量',
  ids text NOT NULL COMMENT '主题id序列',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (searchid),
  KEY srchmod (srchmod)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '搜索缓存表';

DROP TABLE IF EXISTS pre_common_seccheck;
CREATE TABLE pre_common_seccheck (
  ssid bigint(20) NOT NULL COMMENT '',
  dateline int(10) NOT NULL COMMENT '',
  `code` char(6) NOT NULL COMMENT '',
  succeed tinyint(1) NOT NULL COMMENT '',
  verified tinyint(1) NOT NULL COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (ssid),
  KEY dateline (dateline),
  KEY succeed (succeed),
  KEY verified (verified)
) ENGINE=HEAP COMMENT '防灌水 - 验证码';

DROP TABLE IF EXISTS pre_common_secquestion;
CREATE TABLE pre_common_secquestion (
  id bigint(20) unsigned NOT NULL COMMENT '验证问题ID',
  `type` tinyint(1) unsigned NOT NULL COMMENT '验证问题类型',
  question text NOT NULL COMMENT '验证问题',
  answer varchar(255) NOT NULL COMMENT '问题答案',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '防灌水 - 验证问题';

DROP TABLE IF EXISTS pre_common_session;
CREATE TABLE pre_common_session (
  sid char(6) NOT NULL DEFAULT '' COMMENT 'sid',
  ip1 tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'IP段',
  ip2 tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'IP段',
  ip3 tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'IP段',
  ip4 tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'IP段',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  username char(15) NOT NULL DEFAULT '' COMMENT '会员名',
  groupid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员组',
  invisible tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否隐身登录',
  `action` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '当前动作',
  lastactivity int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后活动时间',
  lastolupdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '在线时间最后更新',
  fid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '论坛id',
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题id',

  UNIQUE KEY sid (sid),
  KEY uid (uid)
) ENGINE=HEAP COMMENT '在线用户session临时记录（SID分配）';

DROP TABLE IF EXISTS pre_common_setting;
CREATE TABLE pre_common_setting (
  skey varchar(255) NOT NULL DEFAULT '' COMMENT '',
  svalue text NOT NULL COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (skey)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '后台各项设置参数表';

DROP TABLE IF EXISTS pre_common_smiley;
CREATE TABLE pre_common_smiley (
  id bigint(20) unsigned NOT NULL COMMENT '表情ID',
  typeid bigint(20) unsigned NOT NULL COMMENT '表情分类 ID',
  displayorder tinyint(1) NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `type` enum('smiley','stamp','stamplist') NOT NULL DEFAULT 'smiley' COMMENT '类型',
  `code` varchar(30) NOT NULL DEFAULT '' COMMENT '标记',
  url varchar(30) NOT NULL DEFAULT '' COMMENT '路径',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY `type` (`type`,displayorder)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '表情表';


DROP TABLE IF EXISTS pre_common_stat;
CREATE TABLE pre_common_stat (
  daytime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '时间',
  login int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登陆',
  mobilelogin int(10) unsigned NOT NULL DEFAULT '0' COMMENT '手机登陆',
  connectlogin int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'QQConnect登陆',
  register int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册',
  invite int(10) unsigned NOT NULL DEFAULT '0' COMMENT '邀请',
  appinvite int(10) unsigned NOT NULL DEFAULT '0' COMMENT '应用邀请',
  doing int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录',
  blog int(10) unsigned NOT NULL DEFAULT '0' COMMENT '日志',
  pic int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片',
  poll int(10) unsigned NOT NULL DEFAULT '0' COMMENT '投票',
  activity int(10) unsigned NOT NULL DEFAULT '0' COMMENT '活动',
  `share` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分享',
  thread int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题',
  docomment int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录评论',
  blogcomment int(10) unsigned NOT NULL DEFAULT '0' COMMENT '日志评论',
  piccomment int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片评论',
  sharecomment int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分享评论',
  reward int(10) unsigned NOT NULL DEFAULT '0' COMMENT '悬赏',
  debate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '辩论',
  trade int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品',
  `group` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  groupjoin int(10) unsigned NOT NULL DEFAULT '0' COMMENT '群组',
  groupthread int(10) unsigned NOT NULL DEFAULT '0' COMMENT '参与群组',
  grouppost int(10) unsigned NOT NULL DEFAULT '0' COMMENT '群组回复',
  post int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题回复',
  wall int(10) unsigned NOT NULL DEFAULT '0' COMMENT '留言',
  poke int(10) unsigned NOT NULL DEFAULT '0' COMMENT '打招呼',
  click int(10) unsigned NOT NULL DEFAULT '0' COMMENT '表态',
  sendpm int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发送PM',
  friend int(10) unsigned NOT NULL DEFAULT '0' COMMENT '成为好友',
  addfriend int(10) unsigned NOT NULL DEFAULT '0' COMMENT '好友请求',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (daytime)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '站点趋势统计记录';

DROP TABLE IF EXISTS pre_common_statuser;
CREATE TABLE pre_common_statuser (
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  daytime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '日期',
  `type` char(20) NOT NULL DEFAULT '' COMMENT '各种用户行为如：invite、register、login...',
  KEY uid (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '统计用户表';

DROP TABLE IF EXISTS pre_common_style;
CREATE TABLE pre_common_style (
  styleid bigint(20) unsigned NOT NULL COMMENT '风格id',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '风格名称',
  available tinyint(1) NOT NULL DEFAULT '1' COMMENT '风格是否可用',
  templateid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '对应模板id',
  extstyle varchar(255) NOT NULL DEFAULT '' COMMENT '配色',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (styleid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '风格表';

DROP TABLE IF EXISTS pre_common_stylevar;
CREATE TABLE pre_common_stylevar (
  stylevarid bigint(20) unsigned NOT NULL COMMENT '风格变量id',
  styleid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '风格id',
  variable text NOT NULL COMMENT '变量名',
  substitute text NOT NULL COMMENT '变量赋值',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (stylevarid),
  KEY styleid (styleid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '风格变量表';

DROP TABLE IF EXISTS pre_common_syscache;
CREATE TABLE pre_common_syscache (
  cname varchar(32) NOT NULL COMMENT '缓存名称',
  ctype tinyint(3) unsigned NOT NULL COMMENT '缓存类型 0=value, serialize=1',
  `data` mediumblob NOT NULL COMMENT '缓存数据',
  `create_at` datetime DEFAULT NULL COMMENT '缓存生成时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (cname)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '缓存数据表';

DROP TABLE IF EXISTS pre_common_tag;
CREATE TABLE pre_common_tag (
  tagid bigint(20) unsigned NOT NULL COMMENT '标签ID',
  tagname char(20) NOT NULL DEFAULT '' COMMENT '标签名',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '显示状态',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (tagid),
  KEY tagname (tagname),
  KEY `status` (`status`,tagid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '标签表';

DROP TABLE IF EXISTS pre_common_tagitem;
CREATE TABLE pre_common_tagitem (
  tagid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签ID',
  itemid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'itemID',
  idtype char(10) NOT NULL DEFAULT '' COMMENT '内容类型',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  UNIQUE KEY item (tagid,itemid,idtype),
  KEY idtype (idtype,itemid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '标签内容表';

DROP TABLE IF EXISTS pre_common_task;
CREATE TABLE pre_common_task (
  taskid bigint(20) unsigned NOT NULL COMMENT '任务id',
  relatedtaskid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '依存任务id',
  available tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '任务名称',
  description text NOT NULL COMMENT '任务描述',
  icon varchar(150) NOT NULL DEFAULT '' COMMENT '任务图标',
  applicants mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '已申请任务人次',
  achievers mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '已完成任务人次',
  tasklimits mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '允许申请并完成该任务的人次上限',
  applyperm text NOT NULL COMMENT '允许申请任务的用户组id, 格式: 1 2 3',
  scriptname varchar(50) NOT NULL DEFAULT '' COMMENT '任务脚本文件名',
  starttime datetime NOT NULL DEFAULT '0000-00-00 00:00:00'COMMENT '任务上线时间',
  endtime datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '任务下线时间',
  period int(10) unsigned NOT NULL DEFAULT '0' COMMENT '任务周期 单位：小时 默认为0表示一次性任务 设置为24即1天表示日常任务',
  periodtype tinyint(1) NOT NULL DEFAULT '0' COMMENT '任务间隔周期单位 0:小时 1:天 2:周 3:月',
  reward enum('credit','magic','medal','invite','group') NOT NULL DEFAULT 'credit' COMMENT '奖励类型',
  prize varchar(15) NOT NULL DEFAULT '' COMMENT '奖品: 哪一个扩展积分, 道具id, 勋章id,邀请码有效期， 特殊用户组id',
  bonus int(10) NOT NULL DEFAULT '0' COMMENT '  奖品数量/有效期',
  displayorder smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '显示顺序',
  version varchar(15) NOT NULL DEFAULT '' COMMENT '任务脚本版本号',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (taskid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '论坛任务表';

DROP TABLE IF EXISTS pre_common_taskvar;
CREATE TABLE pre_common_taskvar (
  taskvarid bigint(20) unsigned NOT NULL COMMENT '任务变量id',
  taskid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '任务id',
  sort enum('apply','complete') NOT NULL DEFAULT 'complete' COMMENT '变量类别',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '变量名称',
  description varchar(255) NOT NULL DEFAULT '' COMMENT '变量描述',
  variable varchar(40) NOT NULL DEFAULT '' COMMENT '变量名',
  `type` varchar(20) NOT NULL DEFAULT 'text' COMMENT '变量类型',
  `value` text NOT NULL COMMENT '变量值',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (taskvarid),
  KEY taskid (taskid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '论坛任务设置表';

DROP TABLE IF EXISTS pre_common_template;
CREATE TABLE pre_common_template (
  templateid bigint(20) unsigned NOT NULL COMMENT '模板id',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '名称',
  `directory` varchar(100) NOT NULL DEFAULT '' COMMENT '目录',
  copyright varchar(100) NOT NULL DEFAULT '' COMMENT '版权',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (templateid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '模板表';

DROP TABLE IF EXISTS pre_common_template_block;
CREATE TABLE pre_common_template_block (
  targettplname varchar(100) NOT NULL DEFAULT '' COMMENT '目标模板文件名',
  tpldirectory varchar(80) NOT NULL DEFAULT '' COMMENT '原模板所在目录',
  bid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '模块ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (targettplname,tpldirectory,bid),
  KEY bid (bid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '模板页面和模块的关联表';

DROP TABLE IF EXISTS pre_common_template_permission;
CREATE TABLE pre_common_template_permission (
  targettplname varchar(100) NOT NULL DEFAULT '' COMMENT '目标模板',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '  用户ID',
  allowmanage tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许管理',
  allowrecommend tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许推荐',
  needverify tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐需要审核',
  inheritedtplname varchar(255) NOT NULL DEFAULT '' COMMENT '继承自的模板名称',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (targettplname,uid),
  KEY uid (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'DIY模板页面权限表';

DROP TABLE IF EXISTS pre_common_uin_black;
CREATE TABLE pre_common_uin_black (
  uin char(40) NOT NULL COMMENT '',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uin),
  UNIQUE KEY uid (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'QQ互联黑名单表';

DROP TABLE IF EXISTS pre_common_usergroup;
CREATE TABLE pre_common_usergroup (
  groupid bigint(20) unsigned NOT NULL COMMENT '会员组ID',
  radminid tinyint(3) NOT NULL DEFAULT '0' COMMENT '关联关管理组',
  `type` enum('system','special','member') NOT NULL DEFAULT 'member' COMMENT '类型',
  `system` varchar(255) NOT NULL DEFAULT 'private' COMMENT '会员是否可以自由进出',
  grouptitle varchar(255) NOT NULL DEFAULT '' COMMENT '组头衔',
  creditshigher int(10) NOT NULL DEFAULT '0' COMMENT '该组的积分上限',
  creditslower int(10) NOT NULL DEFAULT '0' COMMENT '该组的积分下限',
  stars tinyint(3) NOT NULL DEFAULT '0' COMMENT '星星数量',
  color varchar(255) NOT NULL DEFAULT '' COMMENT '组头衔颜色',
  icon varchar(255) NOT NULL DEFAULT '' COMMENT '',
  allowvisit tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许访问',
  allowsendpm tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许发送短信息',
  allowinvite tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许使用邀请注册',
  allowmailinvite tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许通过论坛邮件系统发送邀请码',
  maxinvitenum tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '最大邀请码拥有数量',
  inviteprice smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '邀请码购买价格',
  maxinviteday datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '邀请码有效期',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (groupid),
  KEY creditsrange (creditshigher,creditslower)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户组表';

DROP TABLE IF EXISTS pre_common_usergroup_field;
CREATE TABLE `pre_common_usergroup_field` (
  `groupid` bigint(20) unsigned NOT NULL COMMENT '会员组ID',
  `readaccess` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '阅读权限',
  `allowpost` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许发帖',
  `allowreply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许回复',
  `allowpostpoll` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许发表投票',
  `allowpostreward` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许发表悬赏',
  `allowposttrade` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许发表交易',
  `allowpostactivity` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许发表活动',
  `allowdirectpost` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要审核',
  `allowgetattach` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许下载附件',
  `allowgetimage` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许查看图片',
  `allowpostattach` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许上传附件',
  `allowpostimage` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许上传图片',
  `allowvote` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许参与投票',
  `allowsearch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许搜索',
  `allowcstatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许自定义头衔',
  `allowinvisible` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许隐身登录',
  `allowtransfer` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许积分转帐',
  `allowsetreadperm` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许设置阅读权限',
  `allowsetattachperm` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许设置附件权限',
  `allowposttag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许使用标签',
  `allowhidecode` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许使用hide代码',
  `allowhtml` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许使用html',
  `allowanonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许匿名发帖',
  `allowsigbbcode` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许签名使用bbcode',
  `allowsigimgcode` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许使用img',
  `allowmagics` tinyint(1) unsigned NOT NULL COMMENT '允许使用道具',
  `disableperiodctrl` tinyint(1) NOT NULL DEFAULT '0' COMMENT '不受时间段限制',
  `reasonpm` tinyint(1) NOT NULL DEFAULT '0' COMMENT '操作理由短信通知作者',
  `maxprice` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '主题最大售价',
  `maxsigsize` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '最大签名尺寸',
  `maxattachsize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大附件尺寸',
  `maxsizeperday` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '每天最大附件总尺寸',
  `maxthreadsperhour` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '每小时发主题数限制',
  `maxpostsperhour` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '  每小时发回帖数限制',
  `attachextensions` char(100) NOT NULL DEFAULT '' COMMENT '  允许发表的附件类型',
  `raterange` char(150) NOT NULL DEFAULT '' COMMENT '评分范围',
  `loginreward` char(150) NOT NULL DEFAULT '',
  `mintradeprice` smallint(6) unsigned NOT NULL DEFAULT '1' COMMENT ' 交易最小积分',
  `maxtradeprice` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '交易最大积分',
  `minrewardprice` smallint(6) unsigned NOT NULL DEFAULT '1' COMMENT '悬赏最小积分',
  `maxrewardprice` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '悬赏最大积分',
  `magicsdiscount` tinyint(1) NOT NULL COMMENT '道具折扣',
  `maxmagicsweight` smallint(6) unsigned NOT NULL COMMENT ' 道具负载最大值',
  `allowpostdebate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许发表辩论',
  `tradestick` tinyint(1) unsigned NOT NULL COMMENT ' 可商品推荐数',
  `exempt` tinyint(1) unsigned NOT NULL COMMENT '用户组表达式',
  `maxattachnum` smallint(6) NOT NULL DEFAULT '0' COMMENT ' 最大每天附件数量',
  `allowposturl` tinyint(1) NOT NULL DEFAULT '3' COMMENT '是否允许发送含 url 内容',
  `allowrecommend` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否允许评价主题',
  `allowpostrushreply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '  允许发表抢楼帖',
  `maxfriendnum` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '最多好友数',
  `maxspacesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '空间大小',
  `allowcomment` tinyint(1) NOT NULL DEFAULT '0' COMMENT '  发表留言/评论',
  `allowcommentarticle` smallint(6) NOT NULL DEFAULT '0' COMMENT '发表文章的评论',
  `searchinterval` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '两次搜索操作间隔',
  `searchignore` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否免费搜索',
  `allowblog` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发表日志',
  `allowdoing` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发表记录',
  `allowupload` tinyint(1) NOT NULL DEFAULT '0' COMMENT '上传图片',
  `allowshare` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发布分享',
  `allowblogmod` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '发表日志需要审核',
  `allowdoingmod` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '发表记录需要审核',
  `allowuploadmod` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '上传图片需要审核',
  `allowsharemod` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '发布分享需要审核',
  `allowcss` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许自定义CSS',
  `allowpoke` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许打招呼',
  `allowfriend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许加好友',
  `allowclick` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许表态',
  `allowmagic` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许使用道具',
  `allowstat` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许查看趋势统计',
  `allowstatdata` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许查看统计数据报表',
  `videophotoignore` tinyint(1) NOT NULL DEFAULT '0' COMMENT '  视频认证限制',
  `allowviewvideophoto` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许查看视频认证',
  `allowmyop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许使用应用',
  `magicdiscount` tinyint(1) NOT NULL DEFAULT '0' COMMENT '购买道具折扣',
  `domainlength` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '二级域名最短长度',
  `seccode` tinyint(1) NOT NULL DEFAULT '1' COMMENT ' 发布操作需填验证码',
  `disablepostctrl` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发表是否受防灌水限制',
  `allowbuildgroup` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许建立群组，0为不允许',
  `allowgroupdirectpost` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT ' 是否允许直接在群组中发帖',
  `allowgroupposturl` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许在群组中发站外URL',
  `edittimelimit` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '编辑帖子时间限制',
  `allowpostarticle` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许发布文章',
  `allowdownlocalimg` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许下载本地图片',
  `allowdownremoteimg` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许下载远程图片',
  `allowpostarticlemod` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '发布文章是否需要审核',
  `allowspacediyhtml` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许自定义模块使用HTML',
  `allowspacediybbcode` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许自定义模块使用BBCODE',
  `allowspacediyimgcode` tinyint(1) NOT NULL DEFAULT '0' COMMENT '  允许自定义模块使用[img]',
  `allowcommentpost` tinyint(1) NOT NULL DEFAULT '2' COMMENT '允许帖子点评 0:禁止 1:楼主 2:回复 3:All',
  `allowcommentitem` tinyint(1) NOT NULL DEFAULT '0' COMMENT '  允许发表点评观点',
  `allowcommentreply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许发表回复点评',
  `allowreplycredit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许设置回帖奖励',
  `ignorecensor` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT ' 是否忽略要审核的关键字',
  `allowsendallpm` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT ' 是否不受“只接收好友短消息”设置的限制',
  `allowsendpmmaxnum` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '24小时内允许发短消息的数量',
  `maximagesize` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT ' 相册中允许最大图片大小',
  `allowmediacode` tinyint(1) NOT NULL DEFAULT '0' COMMENT '  允许使用多媒体代码',
  `allowbegincode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowat` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '允许@用户 0：禁止 n:发帖时@的数量',
  `allowsetpublishdate` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '允许定时发布主题',
  `allowfollowcollection` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '允许关注淘专辑数',
  `allowcommentcollection` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '允许评论淘专辑',
  `allowcreatecollection` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '允许创建淘专辑数',
  `forcesecques` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `forcelogin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `closead` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `buildgroupcredits` smallint(6) unsigned NOT NULL DEFAULT '0',
  `allowimgcontent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员用户组权限表';

DROP TABLE IF EXISTS pre_common_visit;
CREATE TABLE pre_common_visit (
  ip int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (ip),
  KEY ip (ip,`view`)
) ENGINE=HEAP COMMENT ='用户访问日志表';

DROP TABLE IF EXISTS pre_common_word;
CREATE TABLE pre_common_word (
  id bigint(20) unsigned NOT NULL COMMENT '词汇ID',
  admin varchar(15) NOT NULL DEFAULT '' COMMENT '管理员名',
  `type` bigint(20) NOT NULL DEFAULT '0' COMMENT '关键词分类',
  find varchar(255) NOT NULL DEFAULT '' COMMENT '不良词语',
  replacement varchar(255) NOT NULL DEFAULT '' COMMENT '替换内容',
  extra varchar(255) NOT NULL DEFAULT '' COMMENT '扩展信息',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '词语过滤表';

DROP TABLE IF EXISTS pre_common_word_type;
CREATE TABLE pre_common_word_type (
  id bigint(20) unsigned NOT NULL COMMENT '词语过滤分类ID',
  typename varchar(15) NOT NULL DEFAULT '' COMMENT '分类名称',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '词语过滤分类';

DROP TABLE IF EXISTS pre_connect_disktask;
CREATE TABLE pre_connect_disktask (
  taskid bigint(20) unsigned NOT NULL COMMENT '',
  aid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  openid char(32) NOT NULL DEFAULT '' COMMENT '',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '',
  verifycode char(32) NOT NULL DEFAULT '' COMMENT '',
  `status` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  downloadtime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  extra text,
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (taskid),
  KEY openid (openid),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'QQ互联计划任务表';

DROP TABLE IF EXISTS pre_connect_feedlog;
CREATE TABLE pre_connect_feedlog (
  flid bigint(20) unsigned NOT NULL COMMENT '',
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '',
  publishtimes mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  lastpublished int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (flid),
  UNIQUE KEY tid (tid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'QQ互联feed日志表插件';

DROP TABLE IF EXISTS pre_connect_memberbindlog;
CREATE TABLE pre_connect_memberbindlog (
  mblid bigint(20) unsigned NOT NULL COMMENT '',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uin char(40) NOT NULL COMMENT '',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (mblid),
  KEY uid (uid),
  KEY uin (uin),
  KEY dateline (dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'QQ互联用户绑定/解绑记录表 插件';

DROP TABLE IF EXISTS pre_connect_postfeedlog;
CREATE TABLE pre_connect_postfeedlog (
  flid bigint(20) unsigned NOT NULL COMMENT '',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  publishtimes mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  lastpublished int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (flid),
  UNIQUE KEY pid (pid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'QQ互联用户发帖日志表插件';

DROP TABLE IF EXISTS pre_connect_tthreadlog;
CREATE TABLE pre_connect_tthreadlog (
  twid char(16) NOT NULL COMMENT '',
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  conopenid char(32) NOT NULL COMMENT '',
  pagetime int(10) unsigned DEFAULT '0' COMMENT '会员ID',
  lasttwid char(16) DEFAULT NULL,
  nexttime int(10) unsigned DEFAULT '0' COMMENT '会员ID',
  updatetime int(10) unsigned DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (twid),
  KEY nexttime (tid,nexttime),
  KEY updatetime (tid,updatetime)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'QQ互联主题日志表插件';

DROP TABLE IF EXISTS pre_forum_access;
CREATE TABLE pre_forum_access (
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  fid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '论坛ID',
  allowview tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许浏览',
  allowpost tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许发表',
  allowreply tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许回复',
  allowgetattach tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许下载附件',
  allowgetimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许查看图片',
  allowpostattach tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许上传附件',
  allowpostimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许上传图片',
  adminuser bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid,fid),
  KEY listorder (fid,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '访问权限表';

DROP TABLE IF EXISTS pre_forum_activity;
CREATE TABLE pre_forum_activity (
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  aid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题图片ID',
  cost mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '每人花销',
  starttimefrom datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  starttimeto datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  place varchar(255) NOT NULL DEFAULT '' COMMENT '地点',
  class varchar(255) NOT NULL DEFAULT '' COMMENT '类别',
  gender tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别',
  number smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '人数',
  applynumber smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '已参加人数',
  expiration datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '报名截止日期',
  ufield text NOT NULL COMMENT '用户定制项目',
  credit smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '需消耗的积分',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (tid),
  KEY uid (uid,starttimefrom),
  KEY starttimefrom (starttimefrom),
  KEY expiration (expiration),
  KEY applynumber (applynumber)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_forum_activityapply;
CREATE TABLE pre_forum_activityapply (
  applyid bigint(20) unsigned NOT NULL COMMENT '申请ID',
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  username varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  message varchar(255) NOT NULL DEFAULT '' COMMENT '消息',
  verified tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核通过',
  payment mediumint(8) NOT NULL DEFAULT '0' COMMENT '每人花销',
  ufielddata text NOT NULL COMMENT '用户定制项目数据',
  `create_at` datetime DEFAULT NULL COMMENT '申请时间',
  `create_by` bigint(20) DEFAULT '' COMMENT '会员ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (applyid),
  KEY uid (uid),
  KEY tid (tid),
  KEY dateline (tid,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_forum_announcement;
CREATE TABLE pre_forum_announcement (
  id bigint(20) unsigned NOT NULL COMMENT '公告ID',
  author varchar(15) NOT NULL DEFAULT '' COMMENT '作者姓名',
  `subject` varchar(255) NOT NULL DEFAULT '' COMMENT '公告标题',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '公告类型',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '显示顺序',
  starttime datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  endtime datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  message text NOT NULL COMMENT '消息',
  `groups` text NOT NULL COMMENT '接受用户组',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY timespan (starttime,endtime)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公告表';

DROP TABLE IF EXISTS pre_forum_attachment;
CREATE TABLE pre_forum_attachment (
  aid bigint(20) unsigned NOT NULL COMMENT '附件ID',
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '帖子ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  tableid tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '附件表ID',
  downloads mediumint(8) NOT NULL DEFAULT '0' COMMENT '下载次数',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '附件索引表';

DROP TABLE IF EXISTS pre_forum_attachment_0;
CREATE TABLE pre_forum_attachment_0 (
  aid bigint(20) unsigned NOT NULL COMMENT '附件ID',
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '帖子ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  filesize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  attachment varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  remote tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否远程附件',
  description varchar(255) NOT NULL comment '说明',
  readperm tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '阅读权限',
  price smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '附件价格',
  isimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否图片',
  width smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '附件宽度',
  thumb tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是缩率图',
  picid bigint(20) NOT NULL DEFAULT '0' COMMENT '相册图片ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '附件表';

DROP TABLE IF EXISTS pre_forum_attachment_1;
CREATE TABLE pre_forum_attachment_1 (
  aid bigint(20) unsigned NOT NULL COMMENT '附件ID',
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '帖子ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  filesize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  attachment varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  remote tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否远程附件',
  description varchar(255) NOT NULL comment '说明',
  readperm tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '阅读权限',
  price smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '附件价格',
  isimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否图片',
  width smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '附件宽度',
  thumb tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是缩率图',
  picid bigint(20) NOT NULL DEFAULT '0' COMMENT '相册图片ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_forum_attachment_2;
CREATE TABLE pre_forum_attachment_2 (
  aid bigint(20) unsigned NOT NULL COMMENT '附件ID',
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '帖子ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  filesize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  attachment varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  remote tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否远程附件',
  description varchar(255) NOT NULL comment '说明',
  readperm tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '阅读权限',
  price smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '附件价格',
  isimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否图片',
  width smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '附件宽度',
  thumb tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是缩率图',
  picid bigint(20) NOT NULL DEFAULT '0' COMMENT '相册图片ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_forum_attachment_3;
CREATE TABLE pre_forum_attachment_3 (
  aid bigint(20) unsigned NOT NULL COMMENT '附件ID',
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '帖子ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  filesize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  attachment varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  remote tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否远程附件',
  description varchar(255) NOT NULL comment '说明',
  readperm tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '阅读权限',
  price smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '附件价格',
  isimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否图片',
  width smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '附件宽度',
  thumb tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是缩率图',
  picid bigint(20) NOT NULL DEFAULT '0' COMMENT '相册图片ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_forum_attachment_4;
CREATE TABLE pre_forum_attachment_4 (
  aid bigint(20) unsigned NOT NULL COMMENT '附件ID',
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '帖子ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  filesize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  attachment varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  remote tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否远程附件',
  description varchar(255) NOT NULL comment '说明',
  readperm tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '阅读权限',
  price smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '附件价格',
  isimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否图片',
  width smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '附件宽度',
  thumb tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是缩率图',
  picid bigint(20) NOT NULL DEFAULT '0' COMMENT '相册图片ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_forum_attachment_5;
CREATE TABLE pre_forum_attachment_5 (
  aid bigint(20) unsigned NOT NULL COMMENT '附件ID',
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '帖子ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  filesize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  attachment varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  remote tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否远程附件',
  description varchar(255) NOT NULL comment '说明',
  readperm tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '阅读权限',
  price smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '附件价格',
  isimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否图片',
  width smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '附件宽度',
  thumb tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是缩率图',
  picid bigint(20) NOT NULL DEFAULT '0' COMMENT '相册图片ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_forum_attachment_6;
CREATE TABLE pre_forum_attachment_6 (
  aid bigint(20) unsigned NOT NULL COMMENT '附件ID',
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '帖子ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  filesize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  attachment varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  remote tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否远程附件',
  description varchar(255) NOT NULL comment '说明',
  readperm tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '阅读权限',
  price smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '附件价格',
  isimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否图片',
  width smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '附件宽度',
  thumb tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是缩率图',
  picid bigint(20) NOT NULL DEFAULT '0' COMMENT '相册图片ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_forum_attachment_7;
CREATE TABLE pre_forum_attachment_7 (
  aid bigint(20) unsigned NOT NULL COMMENT '附件ID',
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '帖子ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  filesize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  attachment varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  remote tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否远程附件',
  description varchar(255) NOT NULL comment '说明',
  readperm tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '阅读权限',
  price smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '附件价格',
  isimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否图片',
  width smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '附件宽度',
  thumb tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是缩率图',
  picid bigint(20) NOT NULL DEFAULT '0' COMMENT '相册图片ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_forum_attachment_8;
CREATE TABLE pre_forum_attachment_8 (
  aid bigint(20) unsigned NOT NULL COMMENT '附件ID',
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '帖子ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  filesize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  attachment varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  remote tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否远程附件',
  description varchar(255) NOT NULL comment '说明',
  readperm tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '阅读权限',
  price smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '附件价格',
  isimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否图片',
  width smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '附件宽度',
  thumb tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是缩率图',
  picid bigint(20) NOT NULL DEFAULT '0' COMMENT '相册图片ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_forum_attachment_9;
CREATE TABLE pre_forum_attachment_9 (
  aid bigint(20) unsigned NOT NULL COMMENT '附件ID',
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '帖子ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  filesize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  attachment varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  remote tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否远程附件',
  description varchar(255) NOT NULL comment '说明',
  readperm tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '阅读权限',
  price smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '附件价格',
  isimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否图片',
  width smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '附件宽度',
  thumb tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是缩率图',
  picid bigint(20) NOT NULL DEFAULT '0' COMMENT '相册图片ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_forum_attachment_exif;
CREATE TABLE pre_forum_attachment_exif (
  aid bigint(20) unsigned NOT NULL COMMENT '附件ID',
  exif text NOT NULL COMMENT 'exif信息',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (aid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '缓存表';

DROP TABLE IF EXISTS pre_forum_attachment_unused;
CREATE TABLE pre_forum_attachment_unused (
  aid bigint(20) unsigned NOT NULL COMMENT '附件ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上传时间',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  filesize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  attachment varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  remote tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否远程附件',
  isimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否图片',
  width smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '附件宽度',
  thumb tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是缩率图',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (aid),
  KEY uid (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户临时附件表';

DROP TABLE IF EXISTS pre_forum_attachtype;
CREATE TABLE pre_forum_attachtype (
  id bigint(20) unsigned NOT NULL COMMENT '类型ID',
  fid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '论坛ID',
  extension char(12) NOT NULL DEFAULT '' COMMENT '扩展名',
  maxsize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '允许上传最大值',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY fid (fid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '附件类型表';

DROP TABLE IF EXISTS pre_forum_bbcode;
CREATE TABLE pre_forum_bbcode (
  id bigint(20) unsigned NOT NULL COMMENT '代码ID',
  available tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用',
  tag varchar(100) NOT NULL DEFAULT '' COMMENT '标签',
  icon varchar(255) NOT NULL COMMENT '图标',
  replacement text NOT NULL COMMENT '替换内容',
  example varchar(255) NOT NULL DEFAULT ''  COMMENT '例子',
  explanation text NOT NULL  COMMENT '解释说明',
  params tinyint(1) unsigned NOT NULL DEFAULT '1'  COMMENT '参数个数',
  prompt text NOT NULL  COMMENT '标签描述',
  nest tinyint(3) unsigned NOT NULL DEFAULT '1'  COMMENT '嵌套层次',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '显示顺序',
  perm text NOT NULL  COMMENT '有权使用的用户组',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'Discuz BBbcode 代码表';

DROP TABLE IF EXISTS pre_forum_collection;
CREATE TABLE pre_forum_collection (
  ctid bigint(20) unsigned NOT NULL COMMENT '专辑ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '用户名',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '专辑名',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  follownum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '订阅数',
  threadnum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主题数',
  commentnum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  lastupdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后变动时间',
  rate float NOT NULL DEFAULT '0' COMMENT '评分',
  ratenum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '评分次数',
  lastpost mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '最后主题ID',
  lastsubject varchar(80) NOT NULL DEFAULT '' COMMENT '最后主题标题',
  lastposttime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后主题时间',
  lastposter varchar(15) NOT NULL DEFAULT '' COMMENT '最后主题发帖者',
  lastvisit int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建者最后访问',
  keyword varchar(255) NOT NULL DEFAULT '' COMMENT '专辑关键词',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (ctid),
  KEY dateline (dateline),
  KEY hotcollection (threadnum,lastupdate),
  KEY follownum (follownum),
  KEY uid (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '淘帖专辑表';

DROP TABLE IF EXISTS pre_forum_collectioncomment;
CREATE TABLE pre_forum_collectioncomment (
  cid bigint(20) unsigned NOT NULL COMMENT '评论ID',
  ctid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '专辑ID',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '用户名',
  message text NOT NULL COMMENT '评论内容',
  useip varchar(16) NOT NULL DEFAULT '' COMMENT 'IP地址',
  `port` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  rate float NOT NULL DEFAULT '0' COMMENT '评分',
  `create_at` datetime DEFAULT NULL COMMENT '评论时间',
  `create_by` bigint(20) DEFAULT '' COMMENT '用户ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (cid),
  KEY ctid (ctid,dateline),
  KEY userrate (ctid,uid,rate)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '淘帖评论表';

DROP TABLE IF EXISTS pre_forum_collectionfollow;
CREATE TABLE pre_forum_collectionfollow (
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  username char(15) NOT NULL DEFAULT '' COMMENT '用户名',
  ctid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '专辑ID',
  lastvisit int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后访问专辑时间',
  `create_at` datetime DEFAULT NULL COMMENT '关注时间',
  `create_by` bigint(20) DEFAULT '' COMMENT '会员ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid,ctid),
  KEY ctid (ctid,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '淘帖关注表';

DROP TABLE IF EXISTS pre_forum_collectioninvite;
CREATE TABLE pre_forum_collectioninvite (
  ctid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '专辑ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '邀请合作者ID',
  `create_at` datetime DEFAULT NULL COMMENT '邀请时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (ctid,uid),
  KEY dateline (create_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '邀请管理淘专辑';

DROP TABLE IF EXISTS pre_forum_collectionrelated;
CREATE TABLE pre_forum_collectionrelated (
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  collection text NOT NULL COMMENT '专辑列表',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (tid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '淘帖主题被收入专辑表';

DROP TABLE IF EXISTS pre_forum_collectionteamworker;
CREATE TABLE pre_forum_collectionteamworker (
  ctid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '专辑ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '合作者ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '专辑名',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '用户名',
  lastvisit int(8) unsigned NOT NULL DEFAULT '0' COMMENT '最后访问专辑时间',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (ctid,uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '淘帖合作编辑表';

DROP TABLE IF EXISTS pre_forum_collectionthread;
CREATE TABLE pre_forum_collectionthread (
  ctid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '专辑ID',
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '专辑内主题ID',
  dateline datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '主题日期',
  reason varchar(255) NOT NULL DEFAULT '' COMMENT '推荐理由',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (ctid,tid),
  KEY ctid (ctid,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '淘帖包含主题表';

DROP TABLE IF EXISTS pre_forum_creditslog;
CREATE TABLE pre_forum_creditslog (
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  fromto char(15) NOT NULL DEFAULT '' COMMENT '来自/到',
  sendcredits tinyint(1) NOT NULL DEFAULT '0' COMMENT '转出积分字段',
  receivecredits tinyint(1) NOT NULL DEFAULT '0' COMMENT '接受积分字段',
  send int(10) unsigned NOT NULL DEFAULT '0' COMMENT '转出积分',
  receive int(10) unsigned NOT NULL DEFAULT '0' COMMENT '接受积分',
  operation char(3) NOT NULL DEFAULT '' COMMENT '操作',
  `create_at` datetime DEFAULT NULL COMMENT '转帐日期',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  KEY uid (uid,create_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '转帐记录表';

DROP TABLE IF EXISTS pre_forum_debate;
CREATE TABLE pre_forum_debate (
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发起人ID',
  starttime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  endtime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  affirmdebaters mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '正方辩论人数',
  negadebaters mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '反方辩论人数',
  affirmvotes mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '正方得票数',
  negavotes mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '反方得票数',
  umpire varchar(15) NOT NULL DEFAULT '' COMMENT '裁判用户名',
  winner tinyint(1) NOT NULL DEFAULT '0' COMMENT '获胜方',
  bestdebater varchar(50) NOT NULL DEFAULT '' COMMENT '最佳辩手用户名',
  affirmpoint text NOT NULL COMMENT '正方观点',
  negapoint text NOT NULL COMMENT '反方观点',
  umpirepoint text NOT NULL COMMENT '裁判观点，裁判结束辩论时填写',
  affirmvoterids text NOT NULL COMMENT '正方投票人的 id 集合',
  negavoterids text NOT NULL COMMENT '反方投票人的 id 集合',
  affirmreplies bigint(20) unsigned NOT NULL COMMENT '正方回复次数，用来翻页',
  negareplies bigint(20) unsigned NOT NULL COMMENT '反方回复次数，用来翻页',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (tid),
  KEY uid (uid,starttime)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '辩论主题表';

DROP TABLE IF EXISTS pre_forum_debatepost;
CREATE TABLE pre_forum_debatepost (
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '帖子ID',
  stand tinyint(1) NOT NULL DEFAULT '0' COMMENT '立场',
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发起人ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表的时间',
  voters mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '投票人数',
  voterids text NOT NULL COMMENT '投票人的 id 集合',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (pid),
  KEY pid (pid,stand),
  KEY tid (tid,uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '辩论帖子表';

DROP TABLE IF EXISTS pre_forum_faq;
CREATE TABLE pre_forum_faq (
  id bigint(20) NOT NULL COMMENT '帮助ID',
  fpid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '帮助父ID',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '排序',
  identifier varchar(20) NOT NULL COMMENT '帮助标识',
  keyword varchar(50) NOT NULL COMMENT '帮助关键词',
  title varchar(50) NOT NULL COMMENT '帮助标题',
  message text NOT NULL COMMENT '帮助内容',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY displayplay (displayorder)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '论坛帮助表';

DROP TABLE IF EXISTS pre_forum_filter_post;
CREATE TABLE pre_forum_filter_post (
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  postlength int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (tid,pid),
  KEY tid (tid,postlength)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '帖子是否水贴标记表';

DROP TABLE IF EXISTS pre_forum_forum;
CREATE TABLE pre_forum_forum (
  fid bigint(20) unsigned NOT NULL COMMENT '论坛ID',
  fup bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员上级论坛idID',
  `type` enum('group','forum','sub') NOT NULL DEFAULT 'forum' COMMENT '类型',
  `name` char(50) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '显示状态',
  displayorder smallint(6) NOT NULL DEFAULT '0' COMMENT '显示顺序',
  styleid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '风格ID',
  threads mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主题数量',
  posts mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '帖子数量',
  todayposts mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '今日发帖数量',
  yesterdayposts mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '昨日发帖数量',
  `rank` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '今日排名',
  oldrank smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '昨日排名',
  lastpost char(110) NOT NULL DEFAULT '' COMMENT '最后发表',
  domain char(15) NOT NULL DEFAULT '' COMMENT '绑定的二级域名',
  allowsmilies tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许使用表情',
  allowhtml tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许使用html',
  allowbbcode tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许bbcode',
  allowimgcode tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许img',
  allowmediacode tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许使用多媒体代码',
  allowanonymous tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许匿名',
  allowpostspecial smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '允许发表特殊主题',
  allowspecialonly tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '只允许发表特殊主题',
  allowappend tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启帖子补充',
  alloweditrules tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许版主修改论坛规则',
  allowfeed tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许推送动态,默认推送广播',
  allowside tinyint(1) NOT NULL DEFAULT '0' COMMENT '显示边栏',
  recyclebin tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用回收站',
  modnewposts tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核发帖',
  jammer tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用干扰码',
  disablewatermark tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否图片附件增加水印',
  inheritedmod tinyint(1) NOT NULL DEFAULT '0' COMMENT '本论坛或分类版主的权力继承到下级论坛',
  autoclose smallint(6) NOT NULL DEFAULT '0' COMMENT '自动关闭主题',
  forumcolumns tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '增加论坛水平横排设置',
  catforumcolumns tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '增加分区版块水平横排设置',
  threadcaches tinyint(1) NOT NULL DEFAULT '0' COMMENT '主题缓存功能设置',
  alloweditpost tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '允许编辑帖子',
  `simple` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '只显示子版块',
  modworks tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '本版有待处理的管理事项',
  allowglobalstick tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示全局置顶',
  `level` smallint(6) NOT NULL DEFAULT '0' COMMENT '群组等级',
  commoncredits int(10) unsigned NOT NULL DEFAULT '0' COMMENT '群组公共积分',
  archive tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有存档表',
  recommend smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '推荐到的版块',
  favtimes mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '版块或群组的收藏次数',
  sharetimes mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '版块或群组的分享次数',
  disablethumb tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否添加缩略图',
  disablecollect tinyint(1) NOT NULL DEFAULT '0' COMMENT '禁止淘帖',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (fid),
  KEY forum (`status`,`type`,displayorder),
  KEY fup_type (fup,`type`,displayorder),
  KEY fup (fup)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '版块表';

DROP TABLE IF EXISTS pre_forum_forum_threadtable;
CREATE TABLE pre_forum_forum_threadtable (
  fid bigint(20) unsigned NOT NULL COMMENT '版块ID',
  threadtableid bigint(20) unsigned NOT NULL COMMENT 'thread分区ID',
  threads int(11) unsigned NOT NULL DEFAULT '0' COMMENT '主题数',
  posts int(11) unsigned NOT NULL DEFAULT '0' COMMENT '帖子数',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (fid,threadtableid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '版块存档信息';

DROP TABLE IF EXISTS pre_forum_forumfield;
CREATE TABLE pre_forum_forumfield (
  fid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '版块ID',
  description text NOT NULL COMMENT '解释说明',
  `password` varchar(12) NOT NULL DEFAULT '' COMMENT '私密论坛密码',
  icon varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
  redirect varchar(255) NOT NULL DEFAULT '' COMMENT 'URL转发',
  attachextensions varchar(255) NOT NULL DEFAULT '' COMMENT '允许上传附件类型',
  creditspolicy mediumtext NOT NULL COMMENT '版块积分策略',
  formulaperm text NOT NULL COMMENT '版块权限表达式',
  moderators text NOT NULL COMMENT '版主列表，格式:admin',
  rules text NOT NULL COMMENT '版块规则',
  threadtypes text NOT NULL COMMENT '主题分类，序列化存放的设置，格式为一个数组',
  threadsorts text NOT NULL COMMENT '分类信息，序列化存放的设置，格式为一个数组',
  viewperm text NOT NULL COMMENT '阅读权限, 格式: 1 4 5',
  postperm text NOT NULL COMMENT '发表权限, 格式: 1 4 5',
  replyperm text NOT NULL COMMENT '回复权限, 格式: 1 4 5',
  getattachperm text NOT NULL COMMENT '下载附件权限, 格式: 1 4 5',
  postattachperm text NOT NULL COMMENT '上传附件权限, 格式: 1 4 5',
  postimageperm text NOT NULL COMMENT '上传图片权限, 格式: 1 4 5',
  spviewperm text NOT NULL COMMENT '不受限于版权权限表达式, 格式: 1 4 5',
  seotitle text NOT NULL COMMENT '版块seo标题',
  keywords text NOT NULL COMMENT '版块seo关键词',
  seodescription text NOT NULL COMMENT '版块seo描述',
  supe_pushsetting text NOT NULL COMMENT 'supe推送设置，序列化存放设置数据，格式为一个数组。',
  modrecommend text NOT NULL COMMENT '版主推荐规则',
  threadplugin text NOT NULL COMMENT '特殊主题插件数据',
  replybg text NOT NULL COMMENT '',
  extra text NOT NULL COMMENT '预留字段,如版块颜色，版块图标',
  jointype tinyint(1) NOT NULL DEFAULT '0' COMMENT '加入群组方式 -1为关闭，0为公开， 2邀请',
  gviewperm tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '群组浏览权限 0:仅成员 1:所有用户',
  membernum smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '群组成员数',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '群组创建时间',
  lastupdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '群组最后更新时间',
  activity int(10) unsigned NOT NULL DEFAULT '0' COMMENT '群组活跃度',
  founderuid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '群组创始人UID',
  foundername varchar(255) NOT NULL DEFAULT '' COMMENT '群组创始人名称',
  banner varchar(255) NOT NULL DEFAULT '' COMMENT '群组头图片',
  groupnum smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '分类下的群组数量',
  commentitem text NOT NULL COMMENT '主题点评预置观点',
  relatedgroup text NOT NULL COMMENT '相关的群组',
  picstyle tinyint(1) NOT NULL DEFAULT '0' COMMENT '帖子列表是否以图片形式显示 0:否 1:是',
  widthauto tinyint(1) NOT NULL DEFAULT '0' COMMENT '默认是否宽屏 0:全局 -1:宽屏 1:窄屏',
  noantitheft tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  noforumhidewater tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  noforumrecommend tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  livetid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '',
  price mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (fid),
  KEY membernum (membernum),
  KEY dateline (dateline),
  KEY lastupdate (lastupdate),
  KEY activity (activity)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '版块扩展表';

DROP TABLE IF EXISTS pre_forum_forumrecommend;
CREATE TABLE pre_forum_forumrecommend (
  fid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '版块ID',
  tid bigint(20) unsigned NOT NULL COMMENT '帖子ID',
  typeid bigint(20) NOT NULL COMMENT '是否含有附件图片',
  displayorder tinyint(1) NOT NULL COMMENT '推荐顺序',
  `subject` char(80) NOT NULL COMMENT '推荐主题标题',
  author char(15) NOT NULL COMMENT '推荐主题作者',
  authorid bigint(20) NOT NULL COMMENT '推荐主题作者ID',
  moderatorid bigint(20) NOT NULL COMMENT '推荐管理人员ID',
  expiration int(10) unsigned NOT NULL COMMENT '推荐主题有效期',
  position tinyint(1) NOT NULL DEFAULT '0' COMMENT '显示位置',
  highlight tinyint(1) NOT NULL DEFAULT '0' COMMENT '高亮颜色',
  aid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件ID',
  filename char(100) NOT NULL DEFAULT '' COMMENT '附件文件',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (tid),
  KEY displayorder (fid,displayorder),
  KEY position (position)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '版主推荐表';

DROP TABLE IF EXISTS pre_forum_groupcreditslog;
CREATE TABLE pre_forum_groupcreditslog (
  fid bigint(20) unsigned NOT NULL COMMENT '群组ID',
  uid bigint(20) unsigned NOT NULL COMMENT '成员UID',
  logdate int(8) NOT NULL DEFAULT '0' COMMENT '记录时间',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (fid,uid,logdate)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '群组积分日志表';

DROP TABLE IF EXISTS pre_forum_groupfield;
CREATE TABLE pre_forum_groupfield (
  fid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '群组关联fID',
  privacy tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '成员隐私设置',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '邀请时间',
  `type` varchar(255) NOT NULL COMMENT '缓存类型',
  `data` text NOT NULL COMMENT '缓存数据',
  UNIQUE KEY `types` (fid,`type`),
  KEY fid (fid),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '群组参数设置表';

DROP TABLE IF EXISTS pre_forum_groupinvite;
CREATE TABLE pre_forum_groupinvite (
  fid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '群组ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '邀请人ID',
  inviteuid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被邀请人ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '邀请时间',
  UNIQUE KEY ids (fid,inviteuid),
  KEY dateline (dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '群主邀请表';

DROP TABLE IF EXISTS pre_forum_grouplevel;
CREATE TABLE pre_forum_grouplevel (
  levelid bigint(20) unsigned NOT NULL COMMENT '',
  `type` enum('special','default') NOT NULL DEFAULT 'default',
  leveltitle varchar(255) NOT NULL DEFAULT '' COMMENT '',
  creditshigher int(10) NOT NULL DEFAULT '0' COMMENT '',
  creditslower int(10) NOT NULL DEFAULT '0' COMMENT '',
  icon varchar(255) NOT NULL DEFAULT '' COMMENT '',
  creditspolicy text NOT NULL COMMENT '',
  postpolicy text NOT NULL COMMENT '',
  specialswitch text NOT NULL COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (levelid),
  KEY creditsrange (creditshigher,creditslower)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '群组等级表';

DROP TABLE IF EXISTS pre_forum_groupuser;
CREATE TABLE pre_forum_groupuser (
  fid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username char(15) NOT NULL COMMENT '',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '',
  threads mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  replies mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  joindateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  lastupdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  privacy tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (fid,uid),
  KEY uid_lastupdate (uid,lastupdate),
  KEY userlist (fid,`level`,lastupdate)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '群组成员表';

DROP TABLE IF EXISTS pre_forum_hotreply_member;
CREATE TABLE pre_forum_hotreply_member (
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '帖子ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  attitude tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户投票值',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (pid,uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '回帖投票会员记录表（热帖）';

DROP TABLE IF EXISTS pre_forum_hotreply_number;
CREATE TABLE pre_forum_hotreply_number (
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '帖子ID',
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  support smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '支持数',
  `against` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '反对数',
  total mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '总数',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (pid),
  KEY tid (tid,total)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '回帖投票';

DROP TABLE IF EXISTS pre_forum_imagetype;
CREATE TABLE pre_forum_imagetype (
  typeid bigint(20) unsigned NOT NULL COMMENT '分类ID',
  available tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `name` char(20) NOT NULL COMMENT '分类名称',
  `type` enum('smiley','icon','avatar') NOT NULL DEFAULT 'smiley' COMMENT '分类类型',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '分类顺序',
  `directory` char(100) NOT NULL COMMENT '图片目录',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (typeid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '图片 表情 头像等 分类';

DROP TABLE IF EXISTS pre_forum_medal;
CREATE TABLE pre_forum_medal (
  medalid bigint(20) unsigned NOT NULL COMMENT '',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '',
  available tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  image varchar(255) NOT NULL DEFAULT '' COMMENT '',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  description varchar(255) NOT NULL COMMENT '',
  expiration smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  permission mediumtext NOT NULL COMMENT '',
  credit tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  price bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (medalid),
  KEY displayorder (displayorder),
  KEY available (available,displayorder)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '勋章表';

DROP TABLE IF EXISTS pre_forum_medallog;
CREATE TABLE pre_forum_medallog (
  id bigint(20) unsigned NOT NULL COMMENT '',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  medalid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  expiration int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY `type` (`type`),
  KEY `status` (`status`,expiration),
  KEY uid (uid,medalid,`type`),
  KEY dateline (dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '勋章日志表';

DROP TABLE IF EXISTS pre_forum_memberrecommend;
CREATE TABLE pre_forum_memberrecommend (
  tid bigint(20) unsigned NOT NULL COMMENT '',
  recommenduid bigint(20) unsigned NOT NULL COMMENT '',
  dateline int(10) unsigned NOT NULL COMMENT '',
  KEY tid (tid),
  KEY uid (recommenduid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户推荐表';

DROP TABLE IF EXISTS pre_forum_moderator;
CREATE TABLE pre_forum_moderator (
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  fid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '论坛ID',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '显示顺序',
  inherited tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否继承',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid,fid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '版主表';

DROP TABLE IF EXISTS pre_forum_modwork;
CREATE TABLE pre_forum_modwork (
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  modaction char(3) NOT NULL DEFAULT '' COMMENT '动作',
  dateline date NOT NULL DEFAULT '2006-01-01' COMMENT '时间段',
  count smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  posts smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '发表数',
  KEY uid (uid,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '论坛管理统计表';

DROP TABLE IF EXISTS pre_forum_newthread;
CREATE TABLE pre_forum_newthread (
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '',
  fid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (tid),
  KEY fid (fid),
  KEY dateline (dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '最新主题索引表';

DROP TABLE IF EXISTS pre_forum_onlinelist;
CREATE TABLE pre_forum_onlinelist (
  groupid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  title varchar(30) NOT NULL DEFAULT '' COMMENT '',
  url varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '在线列表定制';

DROP TABLE IF EXISTS pre_forum_order;
CREATE TABLE pre_forum_order (
  orderid char(32) NOT NULL DEFAULT '' COMMENT '',
  `status` char(3) NOT NULL DEFAULT '' COMMENT '',
  buyer char(50) NOT NULL DEFAULT '' COMMENT '',
  admin char(15) NOT NULL DEFAULT '' COMMENT '',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '',
  amount int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  price float(7,2) unsigned NOT NULL DEFAULT '0.00',
  submitdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  confirmdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  email char(40) NOT NULL DEFAULT '' COMMENT '',
  ip char(15) NOT NULL DEFAULT '' COMMENT '',
  UNIQUE KEY orderid (orderid),
  KEY submitdate (submitdate),
  KEY uid (uid,submitdate)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '订单信息表';

DROP TABLE IF EXISTS pre_forum_poll;
CREATE TABLE pre_forum_poll (
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  overt tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否公开投票参与人',
  multiple tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否多选',
  visible tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否投票后可见',
  maxchoices tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '最大可选项数',
  isimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  expiration int(10) unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  pollpreview varchar(255) NOT NULL DEFAULT '' COMMENT '选项内容前两项预览',
  voters bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '投票人数',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (tid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '投票表';

DROP TABLE IF EXISTS pre_forum_polloption;
CREATE TABLE pre_forum_polloption (
  polloptionid bigint(20) unsigned NOT NULL COMMENT '选项ID',
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  votes bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '票数',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '显示顺序',
  polloption varchar(80) NOT NULL DEFAULT '' COMMENT '选项内容',
  voterids mediumtext NOT NULL COMMENT '投票人ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (polloptionid),
  KEY tid (tid,displayorder)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '投票选项表';

DROP TABLE IF EXISTS pre_forum_polloption_image;
CREATE TABLE pre_forum_polloption_image (
  aid bigint(20) unsigned NOT NULL COMMENT '图片附件ID',
  poid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '选项ID',
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '帖子ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  filesize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  attachment varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  remote tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否远程附件',
  width smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '附件宽度',
  thumb tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有缩略图',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (aid),
  KEY poid (poid),
  KEY tid (tid),
  KEY uid (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '投票主题-图片选项-附件存放表';

DROP TABLE IF EXISTS pre_forum_pollvoter;
CREATE TABLE pre_forum_pollvoter (
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '  主题ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '会员名',
  `options` text NOT NULL COMMENT '选项          分隔',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表时间',
  KEY tid (tid),
  KEY uid (uid,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '投票用户表';

DROP TABLE IF EXISTS pre_forum_post;
CREATE TABLE `pre_forum_post` (
  `pid` bigint(20) unsigned NOT NULL COMMENT '帖子ID',
  `fid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '论坛ID',
  `tid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `first` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是首贴 1表示帖子 0表示回帖',
  `author` varchar(15) NOT NULL DEFAULT '' COMMENT '作者姓名',
  `authorid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '作者ID',
  `subject` varchar(80) NOT NULL DEFAULT '' COMMENT '标题',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表时间',
  `message` mediumtext NOT NULL COMMENT '消息',
  `useip` varchar(15) NOT NULL DEFAULT '' COMMENT '发帖者IP',
  `port` smallint(6) unsigned NOT NULL DEFAULT '0',
  `invisible` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否通过审核',
  `anonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否匿名',
  `usesig` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用签名',
  `htmlon` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许HTML',
  `bbcodeoff` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否关闭BBCODE',
  `smileyoff` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否关闭表情',
  `parseurloff` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许粘贴URL',
  `attachment` tinyint(1) NOT NULL DEFAULT '0' COMMENT '附件',
  `rate` smallint(6) NOT NULL DEFAULT '0' COMMENT '评分分数',
  `ratetimes` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '评分次数',
  `status` int(10) NOT NULL DEFAULT '0' COMMENT '帖子状态',
  `tags` varchar(255) NOT NULL DEFAULT '0' COMMENT '存放tag',
  `comment` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否存在点评',
  `replycredit` int(10) NOT NULL DEFAULT '0' COMMENT '回帖获得积分记录',
  `position` int(8) unsigned NOT NULL COMMENT '帖子位置/楼层信息',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (`pid`) USING BTREE,
  UNIQUE KEY `pid` (`pid`),
  UNIQUE KEY `tidposition` (`tid`,`position`) USING BTREE,
  KEY `fid` (`fid`),
  KEY `authorid` (`authorid`,`invisible`),
  KEY `dateline` (`dateline`),
  KEY `invisible` (`invisible`),
  KEY `displayorder` (`tid`,`invisible`,`dateline`),
  KEY `first` (`tid`,`first`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帖子表';


DROP TABLE IF EXISTS pre_forum_post_location;
CREATE TABLE pre_forum_post_location (
  pid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '所属贴子编号pID',
  tid bigint(20) unsigned DEFAULT '0' COMMENT '帖子tID',
  uid bigint(20) unsigned DEFAULT '0' COMMENT '用户ID',
  mapx varchar(255) NOT NULL COMMENT '坐标X',
  mapy varchar(255) NOT NULL COMMENT '坐标Y',
  location varchar(255) NOT NULL COMMENT '位置信息',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (pid),
  KEY tid (tid),
  KEY uid (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '帖子地理位置表';

DROP TABLE IF EXISTS pre_forum_post_moderate;
CREATE TABLE pre_forum_post_moderate (
  id bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'ID',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态 0 审核中，1 已忽略',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '审核时间',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY `status` (`status`,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '帖子审核数据表';

DROP TABLE IF EXISTS pre_forum_post_tableid;
CREATE TABLE pre_forum_post_tableid (
  pid bigint(20) unsigned NOT NULL COMMENT 'Post ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (pid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '分表协调表';

DROP TABLE IF EXISTS pre_forum_postcache;
CREATE TABLE pre_forum_postcache (
  pid int(10) unsigned NOT NULL COMMENT '',
  `comment` text NOT NULL COMMENT '点评内容缓存',
  rate text NOT NULL COMMENT '评分情况缓存',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '缓存时间',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (pid),
  KEY dateline (dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '论坛帖子缓存表';

DROP TABLE IF EXISTS pre_forum_postcomment;
CREATE TABLE pre_forum_postcomment (
  id bigint(20) unsigned NOT NULL COMMENT '',
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '帖子ID',
  author varchar(15) NOT NULL DEFAULT '' COMMENT '作者',
  authorid bigint(20) NOT NULL DEFAULT '0' COMMENT '作者ID 0为游客　-1为观点',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '时间',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT '点评内容',
  score tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否包含点评观点',
  useip varchar(15) NOT NULL DEFAULT '' COMMENT '发帖者IP',
  `port` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  rpid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联的帖子ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY tid (tid),
  KEY authorid (authorid),
  KEY score (score),
  KEY rpid (rpid),
  KEY pid (pid,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '点评帖子表';

DROP TABLE IF EXISTS pre_forum_postlog;
CREATE TABLE pre_forum_postlog (
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '',
  fid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `action` char(10) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (pid,tid),
  KEY fid (fid),
  KEY uid (uid),
  KEY dateline (dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '漫游帖子日志';

DROP TABLE IF EXISTS pre_forum_poststick;
CREATE TABLE pre_forum_poststick (
  tid bigint(20) unsigned NOT NULL COMMENT '所属贴子编号tID',
  pid int(10) unsigned NOT NULL COMMENT '所属主题编号pID',
  position int(10) unsigned NOT NULL COMMENT '所在楼层',
  dateline int(10) unsigned NOT NULL COMMENT '置顶时间',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (tid,pid),
  KEY dateline (tid,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '回帖置顶表';

DROP TABLE IF EXISTS pre_forum_promotion;
CREATE TABLE pre_forum_promotion (
  ip char(15) NOT NULL DEFAULT '' COMMENT 'IP地址',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  username char(15) NOT NULL DEFAULT '' COMMENT '会员名',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (ip)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '论坛推广';

DROP TABLE IF EXISTS pre_forum_ratelog;
CREATE TABLE pre_forum_ratelog (
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '帖子ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  username char(15) NOT NULL DEFAULT '' COMMENT '会员名',
  extcredits tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '评分字段',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评分时间',
  score smallint(6) NOT NULL DEFAULT '0' COMMENT '分数',
  reason char(40) NOT NULL DEFAULT '' COMMENT '操作理由',
  KEY pid (pid,dateline),
  KEY dateline (dateline),
  KEY uid (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '帖子评分记录表';

DROP TABLE IF EXISTS pre_forum_relatedthread;
CREATE TABLE pre_forum_relatedthread (
  tid bigint(20) NOT NULL DEFAULT '0' COMMENT '主题ID',
  `type` enum('general','trade') NOT NULL DEFAULT 'general' COMMENT '关键词类型',
  expiration int(10) NOT NULL DEFAULT '0' COMMENT '过期时间',
  keywords varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  relatedthreads text NOT NULL COMMENT '相关主题序列',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (tid,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '相关主题表';

DROP TABLE IF EXISTS pre_forum_replycredit;
CREATE TABLE pre_forum_replycredit (
  tid mediumint(6) unsigned NOT NULL COMMENT '主题tID',
  extcredits mediumint(6) unsigned NOT NULL DEFAULT '0' COMMENT '单次回复奖励额度',
  extcreditstype tinyint(1) NOT NULL DEFAULT '0' COMMENT '本规则下奖励积分的类型',
  times smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '回复奖励次数',
  membertimes smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '单个用户参与次数',
  random tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户设置的回帖奖励几率',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (tid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '主题回帖获得积分规则表';

DROP TABLE IF EXISTS pre_forum_rsscache;
CREATE TABLE pre_forum_rsscache (
  lastupdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  fid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '',
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  forum char(50) NOT NULL DEFAULT '' COMMENT '',
  author char(15) NOT NULL DEFAULT '' COMMENT '',
  `subject` char(80) NOT NULL DEFAULT '' COMMENT '',
  description char(255) NOT NULL DEFAULT '' COMMENT '',
  guidetype char(10) NOT NULL DEFAULT '' COMMENT '',
  UNIQUE KEY tid (tid),
  KEY fid (fid,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'rss缓存表';

DROP TABLE IF EXISTS pre_forum_sofa;
CREATE TABLE pre_forum_sofa (
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '',
  fid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (tid),
  KEY ftid (fid,tid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '优化大师的记录数据';

DROP TABLE IF EXISTS pre_forum_spacecache;
CREATE TABLE pre_forum_spacecache (
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '',
  variable varchar(20) NOT NULL COMMENT '',
  `value` text NOT NULL COMMENT '',
  expiration int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid,variable)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'space缓存表';

DROP TABLE IF EXISTS pre_forum_statlog;
CREATE TABLE pre_forum_statlog (
  logdate date NOT NULL COMMENT '日志日期',
  fid bigint(20) unsigned NOT NULL COMMENT '版块ID',
  `type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  `value` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录值',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (logdate,fid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '版块统计日志表';

DROP TABLE IF EXISTS pre_forum_thread;
CREATE TABLE pre_forum_thread (
  tid bigint(20) unsigned NOT NULL COMMENT '主题ID',
  fid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '上级论坛',
  posttableid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '帖子表ID',
  typeid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题分类ID',
  sortid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类信息ID',
  readperm tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '阅读权限',
  price smallint(6) NOT NULL DEFAULT '0' COMMENT '价格',
  author char(15) NOT NULL DEFAULT '' COMMENT '会员名',
  authorid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `subject` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表时间',
  lastpost int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后发表',
  lastposter char(15) NOT NULL DEFAULT '' COMMENT '最后发表人ID',
  views int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览次数',
  replies mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '回复次数',
  displayorder tinyint(1) NOT NULL DEFAULT '0' COMMENT '显示顺序',
  highlight tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否高亮',
  digest tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否精华',
  rate tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否评分',
  special tinyint(1) NOT NULL DEFAULT '0' COMMENT '特殊主题,1:投票;2:商品;3:悬赏;4:活动;5:辩论贴;127:插件相关',
  attachment tinyint(1) NOT NULL DEFAULT '0' COMMENT '附件,0无附件 1普通附件 2有图片附件',
  moderated tinyint(1) NOT NULL DEFAULT '0' COMMENT ' 是否被管理员改动',
  closed mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '是否关闭',
  stickreply tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有回帖置顶',
  recommends smallint(6) NOT NULL DEFAULT '0' COMMENT '推荐指数',
  recommend_add smallint(6) NOT NULL DEFAULT '0' COMMENT '支持人数',
  recommend_sub smallint(6) NOT NULL DEFAULT '0' COMMENT '反对人数',
  heats int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题热度值',
  `status` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '位运算存储 0x0000 - FFFF 总共支持16个标志位[1]',
  isgroup tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为群组帖子',
  favtimes mediumint(8) NOT NULL DEFAULT '0' COMMENT '主题收藏次数',
  sharetimes mediumint(8) NOT NULL DEFAULT '0' COMMENT '主题分享次数',
  stamp tinyint(3) NOT NULL DEFAULT '-1' COMMENT '主题图章',
  icon tinyint(3) NOT NULL DEFAULT '-1' COMMENT '主题图标',
  pushedaid bigint(20) NOT NULL DEFAULT '0' COMMENT '被推送到的文章aID',
  cover smallint(6) NOT NULL DEFAULT '0' COMMENT '主题封面 负数:远程　正数:本地 0:无封面',
  replycredit smallint(6) NOT NULL DEFAULT '0' COMMENT '回帖奖励积分主题记录积分值',
  relatebytag char(255) NOT NULL DEFAULT '0' COMMENT '根据帖子标签取的相关主题id (time /t tid,...)',
  maxposition int(8) unsigned NOT NULL DEFAULT '0' COMMENT '最大回帖位置信息',
  bgcolor char(8) NOT NULL DEFAULT '' COMMENT '',
  comments int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点评数',
  hidden smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (tid),
  KEY digest (digest),
  KEY sortid (sortid),
  KEY displayorder (fid,displayorder,lastpost),
  KEY typeid (fid,typeid,displayorder,lastpost),
  KEY recommends (recommends),
  KEY heats (heats),
  KEY authorid (authorid),
  KEY isgroup (isgroup,lastpost),
  KEY special (special)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '主题表';

DROP TABLE IF EXISTS pre_forum_thread_moderate;
CREATE TABLE pre_forum_thread_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ID',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态 0 审核中，1 已忽略',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '审核时间',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY `status` (`status`,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '主题审核数据表';

DROP TABLE IF EXISTS pre_forum_threadaddviews;
CREATE TABLE pre_forum_threadaddviews (
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  addviews int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (tid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '主题查看数延时更新表';

DROP TABLE IF EXISTS pre_forum_threadcalendar;
CREATE TABLE pre_forum_threadcalendar (
  cid bigint(20) unsigned NOT NULL COMMENT '',
  fid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  hotnum int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (cid),
  KEY fid (fid,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '热门主题索引表';

DROP TABLE IF EXISTS pre_forum_threadclass;
CREATE TABLE pre_forum_threadclass (
  typeid bigint(20) unsigned NOT NULL COMMENT '分类ID',
  fid bigint(20) unsigned NOT NULL COMMENT '所属版块ID',
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  displayorder mediumint(9) NOT NULL COMMENT '显示顺序',
  icon varchar(255) NOT NULL COMMENT '分类图标URL',
  moderators tinyint(1) NOT NULL DEFAULT '0' COMMENT '仅管理者可用',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (typeid),
  KEY fid (fid,displayorder)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '主题分类表';

DROP TABLE IF EXISTS pre_forum_threadclosed;
CREATE TABLE pre_forum_threadclosed (
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被移动主题tID',
  redirect bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '移动后的主题tID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (tid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '移动主题标记表';

DROP TABLE IF EXISTS pre_forum_threaddisablepos;
CREATE TABLE pre_forum_threaddisablepos (
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '对应源主题',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (tid)
) ENGINE=HEAP;

DROP TABLE IF EXISTS pre_forum_threadhidelog;
CREATE TABLE pre_forum_threadhidelog (
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被隐藏TID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '操作者uID',
  UNIQUE KEY uid (tid,uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '主题隐藏日志表';

DROP TABLE IF EXISTS pre_forum_threadhot;
CREATE TABLE pre_forum_threadhot (
  cid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '',
  fid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '',
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (cid,tid),
  KEY fid (fid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '热门主题索引表';

DROP TABLE IF EXISTS pre_forum_threadimage;
CREATE TABLE pre_forum_threadimage (
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  attachment varchar(255) NOT NULL DEFAULT '' COMMENT '',
  remote tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  KEY tid (tid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_forum_threadlog;
CREATE TABLE pre_forum_threadlog (
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  fid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  otherid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `action` char(10) NOT NULL COMMENT '',
  expiry int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (tid,fid,uid),
  KEY dateline (dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_forum_threadmod;
CREATE TABLE `pre_forum_threadmod` (
  `id` bigint(20) unsigned NOT NULL COMMENT '主键',
  `tid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `username` char(15) NOT NULL DEFAULT '' COMMENT '会员名',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '有效时间',
  `action` char(5) NOT NULL DEFAULT '' COMMENT '操作',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `magicid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '使用道具ID',
  `stamp` tinyint(3) NOT NULL DEFAULT '0' COMMENT '主题图章/图标ID',
  `reason` char(40) NOT NULL DEFAULT '' COMMENT '操作原因',
  `create_at` datetime DEFAULT NULL COMMENT '操作时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`,`create_at`),
  KEY `expiration` (`expiration`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主题管理记录表';

DROP TABLE IF EXISTS pre_forum_threadpartake;
CREATE TABLE pre_forum_threadpartake (
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '参与时间',
  KEY tid (tid,uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '主题参与者记录表';

DROP TABLE IF EXISTS pre_forum_threadpreview;
CREATE TABLE pre_forum_threadpreview (
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `relay` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '转播次数',
  content text NOT NULL COMMENT '主题内容预览',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (tid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '服务于广播';

DROP TABLE IF EXISTS pre_forum_threadprofile;
CREATE TABLE pre_forum_threadprofile (
  id bigint(20) unsigned NOT NULL COMMENT '',
  `name` char(100) NOT NULL DEFAULT '' COMMENT '',
  template text NOT NULL COMMENT '',
  `global` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY `global` (`global`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '贴内用户信息布局方案';

DROP TABLE IF EXISTS pre_forum_threadprofile_group;
CREATE TABLE pre_forum_threadprofile_group (
  gid bigint(20) NOT NULL COMMENT '',
  tpid bigint(20) unsigned NOT NULL COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (gid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '贴内用户信息【用户组】布局方案';

DROP TABLE IF EXISTS pre_forum_threadrush;
CREATE TABLE pre_forum_threadrush (
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  stopfloor bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '截止楼层',
  starttimefrom int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  starttimeto int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  rewardfloor text NOT NULL COMMENT '奖励楼层',
  creditlimit int(10) NOT NULL DEFAULT '-996' COMMENT '积分下限',
  replylimit smallint(6) NOT NULL DEFAULT '0' COMMENT '楼层限制',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (tid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '抢楼设置表';

DROP TABLE IF EXISTS pre_forum_threadtype;
CREATE TABLE pre_forum_threadtype (
  typeid bigint(20) unsigned NOT NULL COMMENT '分类信息ID',
  fid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '',
  displayorder smallint(6) NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  description varchar(255) NOT NULL DEFAULT '' COMMENT '解释说明',
  icon varchar(255) NOT NULL DEFAULT '' COMMENT '分类图标URL',
  special smallint(6) NOT NULL DEFAULT '0' COMMENT '分类状态',
  modelid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类模型ID',
  expiration tinyint(1) NOT NULL DEFAULT '0' COMMENT '分类有效期',
  template text NOT NULL COMMENT '分类信息内容模板',
  stemplate text NOT NULL COMMENT '分类信息主题模板',
  ptemplate text NOT NULL COMMENT '分类信息发帖模板',
  btemplate text NOT NULL COMMENT '分类信息模块调用模板',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (typeid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '分类信息表';

DROP TABLE IF EXISTS pre_forum_trade;
CREATE TABLE pre_forum_trade (
  tid bigint(20) unsigned NOT NULL COMMENT '',
  pid int(10) unsigned NOT NULL COMMENT '',
  typeid bigint(20) unsigned NOT NULL COMMENT '',
  sellerid bigint(20) unsigned NOT NULL COMMENT '',
  seller char(15) NOT NULL COMMENT '',
  account char(50) NOT NULL COMMENT '',
  tenpayaccount char(20) NOT NULL DEFAULT '' COMMENT '',
  `subject` char(100) NOT NULL COMMENT '',
  price decimal(8,2) NOT NULL COMMENT '',
  amount smallint(6) unsigned NOT NULL DEFAULT '1',
  quality tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  locus char(20) NOT NULL COMMENT '',
  transport tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  ordinaryfee smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  expressfee smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  emsfee smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  itemtype tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  expiration int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  lastbuyer char(15) NOT NULL COMMENT '',
  lastupdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  totalitems smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  tradesum decimal(8,2) NOT NULL DEFAULT '0.00',
  closed tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  aid bigint(20) unsigned NOT NULL COMMENT '',
  displayorder tinyint(1) NOT NULL COMMENT '',
  costprice decimal(8,2) NOT NULL COMMENT '',
  credit int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  costcredit int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  credittradesum int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (tid,pid),
  KEY pid (pid),
  KEY sellerid (sellerid),
  KEY totalitems (totalitems),
  KEY tradesum (tradesum),
  KEY displayorder (tid,displayorder),
  KEY sellertrades (sellerid,tradesum,totalitems),
  KEY typeid (typeid),
  KEY credittradesum (credittradesum),
  KEY expiration (expiration)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '商品数据表';

DROP TABLE IF EXISTS pre_forum_tradecomment;
CREATE TABLE pre_forum_tradecomment (
  id bigint(20) NOT NULL COMMENT '',
  orderid char(32) NOT NULL COMMENT '',
  pid int(10) unsigned NOT NULL COMMENT '',
  `type` tinyint(1) NOT NULL COMMENT '',
  raterid bigint(20) unsigned NOT NULL COMMENT '',
  rater char(15) NOT NULL COMMENT '',
  rateeid bigint(20) unsigned NOT NULL COMMENT '',
  ratee char(15) NOT NULL COMMENT '',
  message char(200) NOT NULL COMMENT '',
  explanation char(200) NOT NULL COMMENT '',
  score tinyint(1) NOT NULL COMMENT '',
  dateline int(10) unsigned NOT NULL COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY raterid (raterid,`type`,dateline),
  KEY rateeid (rateeid,`type`,dateline),
  KEY orderid (orderid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_forum_tradelog;
CREATE TABLE pre_forum_tradelog (
  tid bigint(20) unsigned NOT NULL COMMENT '',
  pid int(10) unsigned NOT NULL COMMENT '',
  orderid varchar(32) NOT NULL COMMENT '',
  tradeno varchar(32) NOT NULL COMMENT '',
  paytype tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `subject` varchar(100) NOT NULL COMMENT '',
  price decimal(8,2) NOT NULL DEFAULT '0.00',
  quality tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  itemtype tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  number smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  tax decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  locus varchar(100) NOT NULL COMMENT '',
  sellerid bigint(20) unsigned NOT NULL COMMENT '',
  seller varchar(15) NOT NULL COMMENT '',
  selleraccount varchar(50) NOT NULL COMMENT '',
  tenpayaccount varchar(20) NOT NULL DEFAULT '0' COMMENT '会员ID',
  buyerid bigint(20) unsigned NOT NULL COMMENT '',
  buyer varchar(15) NOT NULL COMMENT '',
  buyercontact varchar(50) NOT NULL COMMENT '',
  buyercredits smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  buyermsg varchar(200) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  lastupdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  offline tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  buyername varchar(50) NOT NULL COMMENT '',
  buyerzip varchar(10) NOT NULL COMMENT '',
  buyerphone varchar(20) NOT NULL COMMENT '',
  buyermobile varchar(20) NOT NULL COMMENT '',
  transport tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  transportfee smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  baseprice decimal(8,2) NOT NULL COMMENT '',
  discount tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  ratestatus tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  message text NOT NULL COMMENT '',
  credit int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  basecredit int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  UNIQUE KEY orderid (orderid),
  KEY sellerid (sellerid),
  KEY buyerid (buyerid),
  KEY `status` (`status`),
  KEY buyerlog (buyerid,`status`,lastupdate),
  KEY sellerlog (sellerid,`status`,lastupdate),
  KEY tid (tid,pid),
  KEY pid (pid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_forum_typeoption;
CREATE TABLE pre_forum_typeoption (
  optionid bigint(20) unsigned NOT NULL COMMENT '分类信息项目ID',
  classid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类信息上级项目ID',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '分类信息排序',
  expiration tinyint(1) NOT NULL COMMENT '分类信息项目是否受有效期限制',
  protect varchar(255) NOT NULL COMMENT '分类信息项目是否是保护项目',
  title varchar(255) NOT NULL DEFAULT '' COMMENT '分类信息项目标题',
  description varchar(255) NOT NULL DEFAULT '' COMMENT '分类信息项目描述',
  identifier varchar(255) NOT NULL DEFAULT '' COMMENT '分类信息项目标识',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '分类信息项目类型',
  unit varchar(255) NOT NULL COMMENT '分类信息项目单位',
  rules mediumtext NOT NULL COMMENT '分类信息项目规则',
  permprompt mediumtext NOT NULL COMMENT '分类信息项目权限提示',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (optionid),
  KEY classid (classid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '分类信息设置项目表';

DROP TABLE IF EXISTS pre_forum_typeoptionvar;
CREATE TABLE pre_forum_typeoptionvar (
  sortid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类信息ID',
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类信息数据对应帖子ID',
  fid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类信息数据对应帖子板块ID',
  optionid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类信息数据对应选项ID',
  expiration int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类信息数据有效期',
  `value` mediumtext NOT NULL COMMENT '分类信息数据数值',
  KEY sortid (sortid),
  KEY tid (tid),
  KEY fid (fid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '分类信息项目数据表';

DROP TABLE IF EXISTS pre_forum_typevar;
CREATE TABLE pre_forum_typevar (
  sortid bigint(20) NOT NULL DEFAULT '0' COMMENT '分类信息ID',
  optionid bigint(20) NOT NULL DEFAULT '0' COMMENT '分类信息对应项目ID',
  available tinyint(1) NOT NULL DEFAULT '0' COMMENT '分类信息对应项目是否可用',
  required tinyint(1) NOT NULL DEFAULT '0' COMMENT '分类信息对应项目是否必填',
  unchangeable tinyint(1) NOT NULL DEFAULT '0' COMMENT '分类信息对应项目是否可修改',
  search tinyint(1) NOT NULL DEFAULT '0' COMMENT '分类信息对应项目是否可搜索',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '分类信息对应项目顺序',
  subjectshow tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  UNIQUE KEY optionid (sortid,optionid),
  KEY sortid (sortid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '分类信息对应项目表';

DROP TABLE IF EXISTS pre_forum_warning;
CREATE TABLE pre_forum_warning (
  wid bigint(20) unsigned NOT NULL COMMENT '',
  pid int(10) unsigned NOT NULL COMMENT '',
  operatorid bigint(20) unsigned NOT NULL COMMENT '',
  operator char(15) NOT NULL COMMENT '',
  authorid bigint(20) unsigned NOT NULL COMMENT '',
  author char(15) NOT NULL COMMENT '',
  dateline int(10) unsigned NOT NULL COMMENT '',
  reason char(40) NOT NULL COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (wid),
  UNIQUE KEY pid (pid),
  KEY authorid (authorid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '警告记录表';

DROP TABLE IF EXISTS pre_home_album;
CREATE TABLE pre_home_album (
  albumid bigint(20) unsigned NOT NULL COMMENT '',
  albumname varchar(50) NOT NULL DEFAULT '' COMMENT '',
  catid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  updatetime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  picnum smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  pic varchar(255) NOT NULL DEFAULT '' COMMENT '',
  picflag tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  friend tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `password` varchar(10) NOT NULL DEFAULT '' COMMENT '',
  target_ids text NOT NULL COMMENT '',
  favtimes mediumint(8) unsigned NOT NULL COMMENT '',
  sharetimes mediumint(8) unsigned NOT NULL COMMENT '',
  depict text NOT NULL COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (albumid),
  KEY uid (uid,updatetime),
  KEY updatetime (updatetime)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '相册表';

DROP TABLE IF EXISTS pre_home_album_category;
CREATE TABLE pre_home_album_category (
  catid bigint(20) unsigned NOT NULL COMMENT '',
  upid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  catname varchar(255) NOT NULL DEFAULT '' COMMENT '',
  num mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  displayorder smallint(6) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (catid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_home_appcreditlog;
CREATE TABLE pre_home_appcreditlog (
  logid bigint(20) unsigned NOT NULL COMMENT '',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  appid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  appname varchar(60) NOT NULL DEFAULT '' COMMENT '',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  credit mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  note text NOT NULL COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (logid),
  KEY uid (uid,dateline),
  KEY appid (appid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '漫游应用积分操作记录表';

DROP TABLE IF EXISTS pre_home_blacklist;
CREATE TABLE pre_home_blacklist (
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  buid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid,buid),
  KEY uid (uid,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '屏蔽黑名单表';

DROP TABLE IF EXISTS pre_home_blog;
CREATE TABLE pre_home_blog (
  blogid bigint(20) unsigned NOT NULL COMMENT '',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  username char(15) NOT NULL DEFAULT '' COMMENT '',
  `subject` char(80) NOT NULL DEFAULT '' COMMENT '',
  classid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  catid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  viewnum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  replynum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  hot mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  picflag tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  noreply tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  friend tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `password` char(10) NOT NULL DEFAULT '' COMMENT '',
  favtimes mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  sharetimes mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  click1 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  click2 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  click3 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  click4 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  click5 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  click6 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  click7 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  click8 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (blogid),
  KEY uid (uid,dateline),
  KEY hot (hot),
  KEY dateline (dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '日志表';

DROP TABLE IF EXISTS pre_home_blog_category;
CREATE TABLE pre_home_blog_category (
  catid bigint(20) unsigned NOT NULL COMMENT '',
  upid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  catname varchar(255) NOT NULL DEFAULT '' COMMENT '',
  num mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  displayorder smallint(6) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (catid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '日志系统栏目';

DROP TABLE IF EXISTS pre_home_blog_moderate;
CREATE TABLE pre_home_blog_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY `status` (`status`,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '日志审核数据表';

DROP TABLE IF EXISTS pre_home_blogfield;
CREATE TABLE pre_home_blogfield (
  blogid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  pic varchar(255) NOT NULL DEFAULT '' COMMENT '',
  tag varchar(255) NOT NULL DEFAULT '' COMMENT '',
  message mediumtext NOT NULL COMMENT '',
  postip varchar(255) NOT NULL DEFAULT '' COMMENT '',
  `port` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  related text NOT NULL COMMENT '',
  relatedtime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  target_ids text NOT NULL COMMENT '',
  hotuser text NOT NULL COMMENT '',
  magiccolor tinyint(6) NOT NULL DEFAULT '0' COMMENT '会员ID',
  magicpaper tinyint(6) NOT NULL DEFAULT '0' COMMENT '会员ID',
  pushedaid bigint(20) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (blogid),
  KEY uid (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '日志字段表';

DROP TABLE IF EXISTS pre_home_class;
CREATE TABLE pre_home_class (
  classid bigint(20) unsigned NOT NULL COMMENT '',
  classname char(40) NOT NULL DEFAULT '' COMMENT '',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (classid),
  KEY uid (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '日志个人分类表';

DROP TABLE IF EXISTS pre_home_click;
CREATE TABLE pre_home_click (
  clickid bigint(20) unsigned NOT NULL COMMENT '',
  `name` char(50) NOT NULL DEFAULT '' COMMENT '',
  icon char(100) NOT NULL DEFAULT '' COMMENT '',
  idtype char(15) NOT NULL DEFAULT '' COMMENT '',
  available tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  displayorder tinyint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (clickid),
  KEY idtype (idtype,displayorder)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '表态动作';

DROP TABLE IF EXISTS pre_home_clickuser;
CREATE TABLE pre_home_clickuser (
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  id bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  idtype varchar(15) NOT NULL DEFAULT '' COMMENT '',
  clickid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  KEY id (id,idtype,dateline),
  KEY uid (uid,idtype,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户表态表';

DROP TABLE IF EXISTS pre_home_comment;
CREATE TABLE pre_home_comment (
  cid bigint(20) unsigned NOT NULL COMMENT '',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  id bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  idtype varchar(20) NOT NULL DEFAULT '' COMMENT '',
  authorid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  author varchar(15) NOT NULL DEFAULT '' COMMENT '',
  ip varchar(20) NOT NULL DEFAULT '' COMMENT '',
  `port` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  message text NOT NULL COMMENT '',
  magicflicker tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (cid),
  KEY authorid (authorid,idtype),
  KEY id (id,idtype,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户评论表';

DROP TABLE IF EXISTS pre_home_comment_moderate;
CREATE TABLE pre_home_comment_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  idtype varchar(15) NOT NULL DEFAULT '' COMMENT '',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY idtype (idtype,`status`,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_home_docomment;
CREATE TABLE pre_home_docomment (
  id bigint(20) unsigned NOT NULL COMMENT '',
  upid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  doid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  message text NOT NULL COMMENT '',
  ip varchar(20) NOT NULL DEFAULT '' COMMENT '',
  grade smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY doid (doid,dateline),
  KEY dateline (dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_home_doing;
CREATE TABLE pre_home_doing (
  doid bigint(20) unsigned NOT NULL COMMENT '',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  `from` varchar(20) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  message text NOT NULL COMMENT '',
  ip varchar(20) NOT NULL DEFAULT '' COMMENT '',
  `port` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  replynum int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (doid),
  KEY uid (uid,dateline),
  KEY dateline (dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_home_doing_moderate;
CREATE TABLE pre_home_doing_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY `status` (`status`,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_home_favorite;
CREATE TABLE pre_home_favorite (
  favid bigint(20) unsigned NOT NULL COMMENT '',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  id bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  idtype varchar(255) NOT NULL DEFAULT '' COMMENT '',
  spaceuid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  title varchar(255) NOT NULL DEFAULT '' COMMENT '',
  description text NOT NULL COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (favid),
  KEY idtype (id,idtype),
  KEY uid (uid,idtype,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_home_feed;
CREATE TABLE pre_home_feed (
  feedid bigint(20) unsigned NOT NULL COMMENT '',
  appid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  icon varchar(30) NOT NULL DEFAULT '' COMMENT '',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  friend tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  hash_template varchar(32) NOT NULL DEFAULT '' COMMENT '',
  hash_data varchar(32) NOT NULL DEFAULT '' COMMENT '',
  title_template text NOT NULL COMMENT '',
  title_data text NOT NULL COMMENT '',
  body_template text NOT NULL COMMENT '',
  body_data text NOT NULL COMMENT '',
  body_general text NOT NULL COMMENT '',
  image_1 varchar(255) NOT NULL DEFAULT '' COMMENT '',
  image_1_link varchar(255) NOT NULL DEFAULT '' COMMENT '',
  image_2 varchar(255) NOT NULL DEFAULT '' COMMENT '',
  image_2_link varchar(255) NOT NULL DEFAULT '' COMMENT '',
  image_3 varchar(255) NOT NULL DEFAULT '' COMMENT '',
  image_3_link varchar(255) NOT NULL DEFAULT '' COMMENT '',
  image_4 varchar(255) NOT NULL DEFAULT '' COMMENT '',
  image_4_link varchar(255) NOT NULL DEFAULT '' COMMENT '',
  target_ids text NOT NULL COMMENT '',
  id bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  idtype varchar(15) NOT NULL DEFAULT '' COMMENT '',
  hot mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (feedid),
  KEY uid (uid,dateline),
  KEY dateline (dateline),
  KEY hot (hot),
  KEY id (id,idtype)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_home_feed_app;
CREATE TABLE pre_home_feed_app (
  feedid bigint(20) unsigned NOT NULL COMMENT '',
  appid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  icon varchar(30) NOT NULL DEFAULT '' COMMENT '',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  friend tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  hash_template varchar(32) NOT NULL DEFAULT '' COMMENT '',
  hash_data varchar(32) NOT NULL DEFAULT '' COMMENT '',
  title_template text NOT NULL COMMENT '',
  title_data text NOT NULL COMMENT '',
  body_template text NOT NULL COMMENT '',
  body_data text NOT NULL COMMENT '',
  body_general text NOT NULL COMMENT '',
  image_1 varchar(255) NOT NULL DEFAULT '' COMMENT '',
  image_1_link varchar(255) NOT NULL DEFAULT '' COMMENT '',
  image_2 varchar(255) NOT NULL DEFAULT '' COMMENT '',
  image_2_link varchar(255) NOT NULL DEFAULT '' COMMENT '',
  image_3 varchar(255) NOT NULL DEFAULT '' COMMENT '',
  image_3_link varchar(255) NOT NULL DEFAULT '' COMMENT '',
  image_4 varchar(255) NOT NULL DEFAULT '' COMMENT '',
  image_4_link varchar(255) NOT NULL DEFAULT '' COMMENT '',
  target_ids text NOT NULL COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (feedid),
  KEY uid (uid,dateline),
  KEY dateline (dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_home_follow;
CREATE TABLE pre_home_follow (
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  username char(15) NOT NULL DEFAULT '' COMMENT '',
  followuid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  fusername char(15) NOT NULL DEFAULT '' COMMENT '',
  bkname varchar(255) NOT NULL DEFAULT '' COMMENT '',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  mutual tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid,followuid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_home_follow_feed;
CREATE TABLE pre_home_follow_feed (
  feedid bigint(20) unsigned NOT NULL COMMENT '',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  note text NOT NULL COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (feedid),
  KEY uid (uid,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_home_follow_feed_archiver;
CREATE TABLE pre_home_follow_feed_archiver (
  feedid bigint(20) unsigned NOT NULL COMMENT '',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  note text NOT NULL COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (feedid),
  KEY uid (uid,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_home_friend;
CREATE TABLE pre_home_friend (
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  fuid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  fusername varchar(15) NOT NULL DEFAULT '' COMMENT '',
  gid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  num mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  note varchar(255) NOT NULL DEFAULT '' COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid,fuid),
  KEY fuid (fuid),
  KEY uid (uid,num,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_home_friend_request;
CREATE TABLE pre_home_friend_request (
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  fuid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  fusername char(15) NOT NULL DEFAULT '' COMMENT '',
  gid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  note char(60) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid,fuid),
  KEY fuid (fuid),
  KEY dateline (uid,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_home_friendlog;
CREATE TABLE pre_home_friendlog (
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  fuid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `action` varchar(10) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid,fuid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_home_notification;
CREATE TABLE pre_home_notification (
  id bigint(20) unsigned NOT NULL COMMENT '',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '',
  `new` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  authorid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  author varchar(15) NOT NULL DEFAULT '' COMMENT '',
  note text NOT NULL COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  from_id bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  from_idtype varchar(20) NOT NULL DEFAULT '' COMMENT '',
  from_num mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  category tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY uid (uid,`new`),
  KEY category (uid,category,dateline),
  KEY by_type (uid,`type`,dateline),
  KEY from_id (from_id,from_idtype)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_home_pic;
CREATE TABLE pre_home_pic (
  picid bigint(20) NOT NULL COMMENT '',
  albumid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  postip varchar(255) NOT NULL DEFAULT '' COMMENT '',
  `port` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '',
  title varchar(255) NOT NULL DEFAULT '' COMMENT '',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '',
  size int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  filepath varchar(255) NOT NULL DEFAULT '' COMMENT '',
  thumb tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  remote tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  hot mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  sharetimes mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  click1 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  click2 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  click3 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  click4 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  click5 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  click6 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  click7 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  click8 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  magicframe tinyint(6) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (picid),
  KEY uid (uid),
  KEY albumid (albumid,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_home_pic_moderate;
CREATE TABLE pre_home_pic_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY `status` (`status`,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_home_picfield;
CREATE TABLE pre_home_picfield (
  picid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  hotuser text NOT NULL COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (picid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_home_poke;
CREATE TABLE pre_home_poke (
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  fromuid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  fromusername varchar(15) NOT NULL DEFAULT '' COMMENT '',
  note varchar(255) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  iconid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid,fromuid),
  KEY uid (uid,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_home_pokearchive;
CREATE TABLE pre_home_pokearchive (
  pid bigint(20) NOT NULL COMMENT '',
  pokeuid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  fromuid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  note varchar(255) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  iconid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (pid),
  KEY pokeuid (pokeuid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_home_share;
CREATE TABLE pre_home_share (
  sid bigint(20) unsigned NOT NULL COMMENT '',
  itemid bigint(20) unsigned NOT NULL COMMENT '',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  fromuid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  title_template text NOT NULL COMMENT '',
  body_template text NOT NULL COMMENT '',
  body_data text NOT NULL COMMENT '',
  body_general text NOT NULL COMMENT '',
  image varchar(255) NOT NULL DEFAULT '' COMMENT '',
  image_link varchar(255) NOT NULL DEFAULT '' COMMENT '',
  hot mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  hotuser text NOT NULL COMMENT '',
  `status` tinyint(1) NOT NULL COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (sid),
  KEY uid (uid,dateline),
  KEY hot (hot),
  KEY dateline (dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_home_share_moderate;
CREATE TABLE pre_home_share_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY `status` (`status`,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_home_show;
CREATE TABLE pre_home_show (
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  unitprice int(10) unsigned NOT NULL DEFAULT '1',
  credit int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  note varchar(100) NOT NULL DEFAULT '' COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid),
  KEY unitprice (unitprice),
  KEY credit (credit)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_home_specialuser;
CREATE TABLE pre_home_specialuser (
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) NOT NULL DEFAULT '0' COMMENT '会员ID',
  reason text NOT NULL COMMENT '',
  opuid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  opusername varchar(15) NOT NULL DEFAULT '' COMMENT '',
  displayorder mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  KEY uid (uid,`status`),
  KEY displayorder (`status`,displayorder)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_home_userapp;
CREATE TABLE pre_home_userapp (
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  appid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  appname varchar(60) NOT NULL DEFAULT '' COMMENT '',
  privacy tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  allowsidenav tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  allowfeed tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  allowprofilelink tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  narrow tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  menuorder smallint(6) NOT NULL DEFAULT '0' COMMENT '会员ID',
  displayorder smallint(6) NOT NULL DEFAULT '0' COMMENT '会员ID',
  KEY uid (uid,appid),
  KEY menuorder (uid,menuorder),
  KEY displayorder (uid,displayorder)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_home_userappfield;
CREATE TABLE pre_home_userappfield (
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  appid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  profilelink text NOT NULL COMMENT '',
  myml text NOT NULL COMMENT '',
  KEY uid (uid,appid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_home_visitor;
CREATE TABLE pre_home_visitor (
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  vuid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  vusername char(15) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid,vuid),
  KEY vuid (vuid),
  KEY dateline (dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_mobile_setting;
CREATE TABLE pre_mobile_setting (
  skey varchar(255) NOT NULL DEFAULT '' COMMENT '',
  svalue text NOT NULL COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (skey)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_portal_article_content;
CREATE TABLE pre_portal_article_content (
  cid bigint(20) unsigned NOT NULL COMMENT '',
  aid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  idtype varchar(255) NOT NULL DEFAULT '' COMMENT '',
  title varchar(255) NOT NULL DEFAULT '' COMMENT '',
  content text NOT NULL COMMENT '',
  pageorder smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (cid),
  KEY aid (aid,pageorder),
  KEY pageorder (pageorder)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_portal_article_count;
CREATE TABLE pre_portal_article_count (
  aid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  catid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  viewnum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  commentnum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  favtimes mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  sharetimes mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (aid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_portal_article_moderate;
CREATE TABLE pre_portal_article_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY `status` (`status`,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_portal_article_related;
CREATE TABLE pre_portal_article_related (
  aid bigint(20) unsigned NOT NULL COMMENT '',
  raid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  displayorder mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (aid,raid),
  KEY aid (aid,displayorder)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_portal_article_title;
CREATE TABLE pre_portal_article_title (
  aid bigint(20) unsigned NOT NULL COMMENT '',
  catid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  bid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  username varchar(255) NOT NULL DEFAULT '' COMMENT '',
  title varchar(255) NOT NULL DEFAULT '' COMMENT '',
  highlight varchar(255) NOT NULL DEFAULT '' COMMENT '',
  author varchar(255) NOT NULL DEFAULT '' COMMENT '',
  `from` varchar(255) NOT NULL DEFAULT '' COMMENT '',
  fromurl varchar(255) NOT NULL DEFAULT '' COMMENT '',
  url varchar(255) NOT NULL DEFAULT '' COMMENT '',
  summary varchar(255) NOT NULL DEFAULT '' COMMENT '',
  pic varchar(255) NOT NULL DEFAULT '' COMMENT '',
  thumb tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  remote tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  idtype varchar(255) NOT NULL DEFAULT '' COMMENT '',
  contents smallint(6) NOT NULL DEFAULT '0' COMMENT '会员ID',
  allowcomment tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  owncomment tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  click1 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  click2 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  click3 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  click4 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  click5 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  click6 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  click7 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  click8 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  tag tinyint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  showinnernav tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  preaid bigint(20) unsigned NOT NULL COMMENT '',
  nextaid bigint(20) unsigned NOT NULL COMMENT '',
  htmlmade tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  htmlname varchar(255) NOT NULL DEFAULT '' COMMENT '',
  htmldir varchar(255) NOT NULL DEFAULT '' COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (aid),
  KEY catid (catid,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_portal_article_trash;
CREATE TABLE pre_portal_article_trash (
  aid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  content text NOT NULL COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (aid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_portal_attachment;
CREATE TABLE pre_portal_attachment (
  attachid bigint(20) unsigned NOT NULL COMMENT '',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '',
  filetype varchar(255) NOT NULL DEFAULT '' COMMENT '',
  filesize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  attachment varchar(255) NOT NULL DEFAULT '' COMMENT '',
  isimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  thumb tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  remote tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  aid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (attachid),
  KEY aid (aid,attachid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_portal_category;
CREATE TABLE pre_portal_category (
  catid bigint(20) unsigned NOT NULL COMMENT '',
  upid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  catname varchar(255) NOT NULL DEFAULT '' COMMENT '',
  articles mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  allowcomment tinyint(1) NOT NULL DEFAULT '1',
  displayorder smallint(6) NOT NULL DEFAULT '0' COMMENT '会员ID',
  notinheritedarticle tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  notinheritedblock tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  domain varchar(255) NOT NULL DEFAULT '' COMMENT '',
  url varchar(255) NOT NULL DEFAULT '' COMMENT '',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  username varchar(255) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  closed tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  shownav tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  description text NOT NULL COMMENT '',
  seotitle text NOT NULL COMMENT '',
  keyword text NOT NULL COMMENT '',
  primaltplname varchar(255) NOT NULL DEFAULT '' COMMENT '',
  articleprimaltplname varchar(255) NOT NULL DEFAULT '' COMMENT '',
  disallowpublish tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  foldername varchar(255) NOT NULL DEFAULT '' COMMENT '',
  notshowarticlesummay varchar(255) NOT NULL DEFAULT '' COMMENT '',
  perpage smallint(6) NOT NULL DEFAULT '0' COMMENT '会员ID',
  maxpages smallint(6) NOT NULL DEFAULT '0' COMMENT '会员ID',
  noantitheft tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  lastpublish int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (catid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_portal_category_permission;
CREATE TABLE pre_portal_category_permission (
  catid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  allowpublish tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  allowmanage tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  inheritedcatid bigint(20) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (catid,uid),
  KEY uid (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_portal_comment;
CREATE TABLE pre_portal_comment (
  cid bigint(20) unsigned NOT NULL COMMENT '',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  username varchar(255) NOT NULL DEFAULT '' COMMENT '',
  id bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  idtype varchar(20) NOT NULL DEFAULT '' COMMENT '',
  postip varchar(255) NOT NULL DEFAULT '' COMMENT '',
  `port` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  message text NOT NULL COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (cid),
  KEY idtype (id,idtype,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_portal_comment_moderate;
CREATE TABLE pre_portal_comment_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  idtype varchar(15) NOT NULL DEFAULT '' COMMENT '',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY idtype (idtype,`status`,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_portal_rsscache;
CREATE TABLE pre_portal_rsscache (
  lastupdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  catid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  aid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  catname char(50) NOT NULL DEFAULT '' COMMENT '',
  author char(15) NOT NULL DEFAULT '' COMMENT '',
  `subject` char(80) NOT NULL DEFAULT '' COMMENT '',
  description char(255) NOT NULL DEFAULT '' COMMENT '',
  UNIQUE KEY aid (aid),
  KEY catid (catid,dateline)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_portal_topic;
CREATE TABLE pre_portal_topic (
  topicid bigint(20) unsigned NOT NULL COMMENT '',
  title varchar(255) NOT NULL DEFAULT '' COMMENT '',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '',
  domain varchar(255) NOT NULL DEFAULT '' COMMENT '',
  summary text NOT NULL COMMENT '',
  keyword text NOT NULL COMMENT '',
  cover varchar(255) NOT NULL DEFAULT '' COMMENT '',
  picflag tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  primaltplname varchar(255) NOT NULL DEFAULT '' COMMENT '',
  useheader tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  usefooter tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  username varchar(255) NOT NULL DEFAULT '' COMMENT '',
  viewnum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  closed tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  allowcomment tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  commentnum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  htmlmade tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  htmldir varchar(255) NOT NULL DEFAULT '' COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (topicid),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_portal_topic_pic;
CREATE TABLE pre_portal_topic_pic (
  picid bigint(20) NOT NULL COMMENT '',
  topicid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  uid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '',
  title varchar(255) NOT NULL DEFAULT '' COMMENT '',
  size int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  filepath varchar(255) NOT NULL DEFAULT '' COMMENT '',
  thumb tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  remote tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (picid),
  KEY topicid (topicid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_security_evilpost;
CREATE TABLE pre_security_evilpost (
  pid int(10) unsigned NOT NULL COMMENT '',
  tid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  evilcount int(10) NOT NULL DEFAULT '0' COMMENT '会员ID',
  eviltype mediumint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  createtime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  operateresult tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  isreported tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  censorword char(50) NOT NULL COMMENT '',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (pid),
  KEY `type` (tid,`type`),
  KEY operateresult (operateresult,createtime)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_security_eviluser;
CREATE TABLE pre_security_eviluser (
  uid int(10) unsigned NOT NULL COMMENT '',
  evilcount int(10) NOT NULL DEFAULT '0' COMMENT '会员ID',
  eviltype mediumint(20) unsigned NOT NULL DEFAULT '0' COMMENT '',
  createtime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  operateresult tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  isreported tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (uid),
  KEY operateresult (operateresult,createtime)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

DROP TABLE IF EXISTS pre_security_failedlog;
CREATE TABLE pre_security_failedlog (
  id bigint(20) NOT NULL COMMENT '',
  reporttype char(20) NOT NULL COMMENT '',
  tid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  uid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  failcount int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  createtime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  posttime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  delreason char(255) NOT NULL COMMENT '',
  scheduletime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  lastfailtime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  extra1 int(10) unsigned NOT NULL COMMENT '',
  extra2 char(255) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (id),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '';

