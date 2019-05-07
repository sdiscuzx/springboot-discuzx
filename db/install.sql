--
-- DiscuzX INSTALL MAKE SQL DUMP V1.0
-- DO NOT modify this file
--
-- Create: 2013-08-27 16:12:45
--
DROP TABLE IF EXISTS pre_common_admincp_cmenu;
CREATE TABLE pre_common_admincp_cmenu (
  id smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  title varchar(255) NOT NULL COMMENT '菜单名称' ,
  url varchar(255) NOT NULL COMMENT '菜单地址' ,
  sort tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型,备用',
  displayorder tinyint(3) NOT NULL COMMENT '显示顺序',
  clicks smallint(6) unsigned NOT NULL DEFAULT '1' COMMENT '点击数,备用',
  uid mediumint(8) unsigned NOT NULL COMMENT '添加用户' ,
  dateline int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (id),
  KEY uid (uid),
  KEY displayorder (displayorder)
) TYPE=MyISAM COMMENT = '后台菜单收藏表';

DROP TABLE IF EXISTS pre_common_admincp_group;
CREATE TABLE pre_common_admincp_group (
  cpgroupid smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '后台组ID',
  cpgroupname varchar(255) NOT NULL COMMENT '后台组名称',
  PRIMARY KEY (cpgroupid)
) TYPE=MyISAM COMMENT = '后台管理组';

DROP TABLE IF EXISTS pre_common_admincp_member;
CREATE TABLE pre_common_admincp_member (
  uid int(10) unsigned NOT NULL COMMENT '成员uid',
  cpgroupid int(10) unsigned NOT NULL COMMENT '成员组id',
  customperm text NOT NULL COMMENT '自定义管理权限',
  PRIMARY KEY (uid)
) TYPE=MyISAM COMMENT = '后台管理成员';

DROP TABLE IF EXISTS pre_common_admincp_perm;
CREATE TABLE pre_common_admincp_perm (
  cpgroupid smallint(6) unsigned NOT NULL COMMENT '后台组id',
  perm varchar(255) NOT NULL COMMENT '后台组权限',
  UNIQUE KEY cpgroupperm (cpgroupid,perm)
) TYPE=MyISAM COMMENT = '后台权限表';

DROP TABLE IF EXISTS pre_common_admincp_session;
CREATE TABLE pre_common_admincp_session (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  adminid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '管理组id',
  panel tinyint(1) NOT NULL DEFAULT '0' COMMENT '面板位置',
  ip varchar(15) NOT NULL DEFAULT '' COMMENT 'IP',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后动作时间',
  errorcount tinyint(1) NOT NULL DEFAULT '0' COMMENT '登录错误次数',
  `storage` mediumtext NOT NULL COMMENT '临时内容存储',
  PRIMARY KEY (uid,panel)
) TYPE=MyISAM COMMENT = '后台session表';

DROP TABLE IF EXISTS pre_common_admingroup;
CREATE TABLE pre_common_admingroup (
  admingid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '所属管理员分组ID',
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
  allowlivethread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许直播主题',
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
  alloweditusertag tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理用户标签',
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
  allowmakehtml tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许生成HTML',
  PRIMARY KEY (admingid)
) TYPE=MyISAM COMMENT = '管理组表';

DROP TABLE IF EXISTS pre_common_adminnote;
CREATE TABLE pre_common_adminnote (
  id mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '后台留言id',
  admin varchar(15) NOT NULL DEFAULT '' COMMENT '管理员姓名',
  access tinyint(3) NOT NULL DEFAULT '0' COMMENT '哪组可以看到信息',
  adminid tinyint(3) NOT NULL DEFAULT '0' COMMENT '管理员id',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表时间',
  expiration int(10) unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  message text NOT NULL COMMENT '消息',
  PRIMARY KEY (id)
) TYPE=MyISAM COMMENT = '后台留言表';

DROP TABLE IF EXISTS pre_common_advertisement;
CREATE TABLE pre_common_advertisement (
  advid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告id',
  available tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `type` varchar(50) NOT NULL DEFAULT '0' COMMENT '类型',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '显示顺序',
  title varchar(255) NOT NULL DEFAULT '' COMMENT '广告标题',
  targets text NOT NULL COMMENT '投放范围',
  parameters text NOT NULL COMMENT '参数n序列化存放的数组数据',
  `code` text NOT NULL COMMENT '代码',
  starttime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  endtime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  PRIMARY KEY (advid)
) TYPE=MyISAM COMMENT = '广告数据表';

DROP TABLE IF EXISTS pre_common_advertisement_custom;
CREATE TABLE pre_common_advertisement_custom (
  id smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '自定义广告类型id',
  `name` varchar(255) NOT NULL COMMENT '名称',
  PRIMARY KEY (id) COMMENT '',
  KEY `name` (`name`)
) TYPE=MyISAM COMMENT = '自定义广告数据表';

DROP TABLE IF EXISTS pre_common_banned;
CREATE TABLE pre_common_banned (
  id smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '禁止id',
  ip1 smallint(3) NOT NULL DEFAULT '0' COMMENT 'IP分段1',
  ip2 smallint(3) NOT NULL DEFAULT '0' COMMENT 'IP分段2',
  ip3 smallint(3) NOT NULL DEFAULT '0' COMMENT 'IP分段3',
  ip4 smallint(3) NOT NULL DEFAULT '0' COMMENT 'IP分段4',
  admin varchar(15) NOT NULL DEFAULT '' COMMENT '管理员姓名',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '禁止时间',
  expiration int(10) unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  PRIMARY KEY (id)
) TYPE=MyISAM COMMENT = '禁止访问表';

DROP TABLE IF EXISTS pre_common_block;
CREATE TABLE pre_common_block (
  bid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '模块ID',
  blockclass varchar(255) NOT NULL DEFAULT '0' COMMENT '模块分类 article/pic/member/board/poll',
  blocktype tinyint(1) NOT NULL DEFAULT '0' COMMENT '调用类型 0为模板调用 1为js调用',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '模块标名称',
  title text NOT NULL COMMENT '模块标题名',
  classname varchar(255) NOT NULL DEFAULT '' COMMENT '指定样式class',
  summary text NOT NULL COMMENT '模块自定义内容',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '创建者用户ID',
  username varchar(255) NOT NULL DEFAULT '' COMMENT '创建者用户名',
  styleid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '模块风格ID',
  blockstyle text NOT NULL COMMENT '自定义风格',
  picwidth smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '显示图片长度',
  picheight smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '显示图片宽度',
  target varchar(255) NOT NULL DEFAULT '' COMMENT '模块链接打开方式: _blank, _self, _top',
  dateformat varchar(255) NOT NULL DEFAULT '' COMMENT '时间格式： H:i； u； Y-m-d等',
  dateuformat tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否使用个性化时间格式',
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
  PRIMARY KEY (bid)
) TYPE=MyISAM COMMENT = '模块表';

DROP TABLE IF EXISTS pre_common_block_favorite;
CREATE TABLE pre_common_block_favorite (
  favid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏id',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  bid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '模块id',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏时间',
  PRIMARY KEY (favid),
  KEY uid (uid,dateline)
) TYPE=MyISAM COMMENT = '模块收藏表';

DROP TABLE IF EXISTS pre_common_block_item;
CREATE TABLE pre_common_block_item (
  itemid int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '信息ID',
  bid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '模块ID',
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
  startdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间戳',
  enddate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间戳',
  PRIMARY KEY (itemid),
  KEY bid (bid)
) TYPE=MyISAM COMMENT = '模块数据表';

DROP TABLE IF EXISTS pre_common_block_item_data;
CREATE TABLE pre_common_block_item_data (
  dataid int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '推荐信息ID',
  bid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '模块ID',
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
  startdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间戳',
  enddate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间戳',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '推荐者 UID',
  username varchar(255) NOT NULL DEFAULT '' COMMENT '推荐者用户名',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '推荐日期',
  isverified tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已通过审核',
  verifiedtime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '通过审核日期',
  stickgrade tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '置顶等级： 0～10',
  PRIMARY KEY (dataid),
  KEY bid (bid,stickgrade,displayorder,verifiedtime)
) TYPE=MyISAM COMMENT = '模块推荐信息表';

DROP TABLE IF EXISTS pre_common_block_permission;
CREATE TABLE pre_common_block_permission (
  bid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '模块ID',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  allowmanage tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许管理',
  allowrecommend tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许推荐',
  needverify tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐需要审核',
  inheritedtplname varchar(255) NOT NULL DEFAULT '' COMMENT '继承自的模板名称',
  PRIMARY KEY (bid,uid),
  KEY uid (uid)
) TYPE=MyISAM COMMENT = '模块权限表';

DROP TABLE IF EXISTS pre_common_block_pic;
CREATE TABLE pre_common_block_pic (
  picid int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  bid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '模块ID',
  itemid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '信息ID',
  pic varchar(255) NOT NULL DEFAULT '' COMMENT '信息图片',
  picflag tinyint(1) NOT NULL DEFAULT '0' COMMENT '图片类型 0为本地 1为ftp远程',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '信息类型 0为模块缩略图 1为上传的图',
  PRIMARY KEY (picid) ,
  KEY bid (bid,itemid )
) TYPE=MyISAM COMMENT = '模块使用图片表';

DROP TABLE IF EXISTS pre_common_block_style;
CREATE TABLE pre_common_block_style (
  styleid smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '模块样式ID',
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
  PRIMARY KEY (styleid),
  KEY `hash` (`hash`),
  KEY blockclass (blockclass)
) TYPE=MyISAM COMMENT = '模块模板表';

DROP TABLE IF EXISTS pre_common_block_xml;
CREATE TABLE pre_common_block_xml (
  id smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT 'XML扩展 名称',
  version varchar(255) NOT NULL COMMENT 'XML扩展 版本',
  url varchar(255) NOT NULL COMMENT 'XML扩展 URL',
  clientid varchar(255) NOT NULL COMMENT '客户端ID',
  `key` varchar(255) NOT NULL COMMENT '通信密钥',
  signtype varchar(255) NOT NULL COMMENT '签名的加密方式：目前只支持MD5方式，空为不使用签名，直接使用通信密钥',
  `data` text NOT NULL COMMENT 'XML扩展 数据',
  PRIMARY KEY (id)
) TYPE=MyISAM COMMENT = '模块 XML 扩展类数据表';

DROP TABLE IF EXISTS pre_common_cache;
CREATE TABLE pre_common_cache (
  cachekey varchar(255) NOT NULL DEFAULT '' COMMENT '',
  cachevalue mediumblob NOT NULL COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (cachekey)
) TYPE=MyISAM COMMENT = '通用缓存表';

DROP TABLE IF EXISTS pre_common_card;
CREATE TABLE pre_common_card (
  id char(255) NOT NULL DEFAULT '' COMMENT '',
  typeid smallint(6) unsigned NOT NULL DEFAULT '1' COMMENT '',
  maketype tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  makeruid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  price mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  extcreditskey tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  extcreditsval int(10) NOT NULL DEFAULT '0' COMMENT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  cleardateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  useddateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (id),
  KEY dateline (dateline)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_card_log;
CREATE TABLE pre_common_card_log (
  id smallint(6) NOT NULL AUTO_INCREMENT COMMENT '',
  uid mediumint(8) NOT NULL DEFAULT '0' COMMENT '',
  username varchar(20) NOT NULL DEFAULT '' COMMENT '',
  cardrule varchar(255) NOT NULL DEFAULT '' COMMENT '',
  info text NOT NULL COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  description mediumtext NOT NULL COMMENT '',
  operation tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (id),
  KEY dateline (dateline),
  KEY operation_dateline (operation,dateline)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_card_type;
CREATE TABLE pre_common_card_type (
  id smallint(6) NOT NULL AUTO_INCREMENT COMMENT '',
  typename char(20) NOT NULL DEFAULT '' COMMENT '',
  PRIMARY KEY (id)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_connect_guest;
CREATE TABLE pre_common_connect_guest (
  conopenid char(32) NOT NULL DEFAULT '' COMMENT '',
  conuin char(40) NOT NULL DEFAULT '' COMMENT '',
  conuinsecret char(16) NOT NULL DEFAULT '' COMMENT '',
  conqqnick char(100) NOT NULL DEFAULT '' COMMENT '',
  conuintoken char(32) NOT NULL DEFAULT '' COMMENT '',
  PRIMARY KEY (conopenid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_credit_log;
CREATE TABLE pre_common_credit_log (
  logid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户uid',
  operation char(3) NOT NULL DEFAULT '' COMMENT '操作类型',
  relatedid int(10) unsigned NOT NULL COMMENT '操作相关ID',
  dateline int(10) unsigned NOT NULL COMMENT '记录时间',
  extcredits1 int(10) NOT NULL COMMENT '积分1变化值',
  extcredits2 int(10) NOT NULL COMMENT '积分2变化值',
  extcredits3 int(10) NOT NULL COMMENT '积分3变化值',
  extcredits4 int(10) NOT NULL COMMENT '积分4变化值',
  extcredits5 int(10) NOT NULL COMMENT '积分5变化值',
  extcredits6 int(10) NOT NULL COMMENT '积分6变化值',
  extcredits7 int(10) NOT NULL COMMENT '积分7变化值',
  extcredits8 int(10) NOT NULL COMMENT '积分8变化值',
  PRIMARY KEY (logid),
  KEY uid (uid) ,
  KEY operation (operation),
  KEY relatedid (relatedid),
  KEY dateline (dateline)
) TYPE=MyISAM COMMENT = '积分日志表';

DROP TABLE IF EXISTS pre_common_credit_log_field;
CREATE TABLE pre_common_credit_log_field (
  logid mediumint(8) unsigned NOT NULL COMMENT 'id',
  title varchar(100) NOT NULL COMMENT '记录标题',
  `text` text NOT NULL COMMENT '记录说明',
  KEY logid (logid)
) TYPE=MyISAM COMMENT = '积分日志详情';

DROP TABLE IF EXISTS pre_common_credit_rule;
CREATE TABLE pre_common_credit_rule (
  rid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT ' 规则ID',
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
  fids text NOT NULL COMMENT '记录自定义策略版块ID',
  PRIMARY KEY (rid),
  UNIQUE KEY `action` (`action`)
) TYPE=MyISAM COMMENT = '积分规则表';

DROP TABLE IF EXISTS pre_common_credit_rule_log;
CREATE TABLE pre_common_credit_rule_log (
  clid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '策略日志ID',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '策略日志所有者uid',
  rid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '策略ID',
  fid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '版块ID',
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
  starttime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '周期开始时间',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '策略最后执行时间',
  PRIMARY KEY (clid),
  KEY uid (uid,rid,fid) ,
  KEY dateline (dateline)
) TYPE=MyISAM COMMENT = '积分规则日志表';

DROP TABLE IF EXISTS pre_common_credit_rule_log_field;
CREATE TABLE pre_common_credit_rule_log_field (
  clid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '策略日志ID',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '策略日志所有者uid',
  info text NOT NULL COMMENT '记录信息防重',
  `user` text NOT NULL COMMENT '记录用户防重',
  app text NOT NULL COMMENT '记录应用防重',
  PRIMARY KEY (uid,clid)
) TYPE=MyISAM COMMENT = '积分规则日志扩展表';

DROP TABLE IF EXISTS pre_common_cron;
CREATE TABLE pre_common_cron (
  cronid smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  available tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  `type` enum('user','system','plugin') NOT NULL DEFAULT 'user' COMMENT '',
  `name` char(50) NOT NULL DEFAULT '' COMMENT '',
  filename char(50) NOT NULL DEFAULT '' COMMENT '',
  lastrun int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  nextrun int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  weekday tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  `day` tinyint(2) NOT NULL DEFAULT '0' COMMENT '',
  `hour` tinyint(2) NOT NULL DEFAULT '0' COMMENT '',
  `minute` char(36) NOT NULL DEFAULT '' COMMENT '',
  PRIMARY KEY (cronid) COMMENT '',
  KEY nextrun (available,nextrun COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_devicetoken;
CREATE TABLE pre_common_devicetoken (
  uid mediumint(8) unsigned NOT NULL COMMENT '',
  token char(50) NOT NULL COMMENT '',
  PRIMARY KEY (uid) COMMENT '',
  KEY token (token)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_district;
CREATE TABLE pre_common_district (
  id mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '地区ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '地区名称',
  `level` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '地区等级：1，省级；2，市级；3，县级；4，乡镇',
  usetype tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '使用对象：0:都不启用; 1:出生地; 2:居住地; 3:都启用',
  upid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上级地区ID',
  displayorder smallint(6) NOT NULL DEFAULT '0' COMMENT '显示顺序',
  PRIMARY KEY (id) ,
  KEY upid (upid,displayorder )
) TYPE=MyISAM COMMENT = '地区表';

DROP TABLE IF EXISTS pre_common_diy_data;
CREATE TABLE pre_common_diy_data (
  targettplname varchar(100) NOT NULL DEFAULT '' COMMENT '',
  tpldirectory varchar(80) NOT NULL DEFAULT '' COMMENT '',
  primaltplname varchar(255) NOT NULL DEFAULT '' COMMENT '',
  diycontent mediumtext NOT NULL COMMENT '',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (targettplname,tpldirectory COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_domain;
CREATE TABLE pre_common_domain (
  domain char(30) NOT NULL DEFAULT '' COMMENT '域名前缀',
  domainroot char(60) NOT NULL DEFAULT '' COMMENT '二级域名后缀',
  id mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '对应对象id',
  idtype char(15) NOT NULL DEFAULT '' COMMENT '对应对象类型subarea:分区、forum:版块、home:个人空间、group:群组、topic:专题、channel:频道、plugin:插件',
  PRIMARY KEY (id,idtype),
  KEY domain (domain,domainroot),
  KEY idtype (idtype)
) TYPE=MyISAM COMMENT = '二级域名表';

DROP TABLE IF EXISTS pre_common_failedip;
CREATE TABLE pre_common_failedip (
  ip char(7) NOT NULL DEFAULT '' COMMENT '失败IP',
  lastupdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次尝试时间',
  count tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '尝试次数',
  PRIMARY KEY (ip,lastupdate),
  KEY lastupdate (lastupdate)
) TYPE=MyISAM COMMENT = 'IP段记录表';

DROP TABLE IF EXISTS pre_common_failedlogin;
CREATE TABLE pre_common_failedlogin (
  ip char(15) NOT NULL DEFAULT '' COMMENT '失败IP',
  username char(32) NOT NULL DEFAULT '' COMMENT '失败时的用户名',
  count tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '尝试次数',
  lastupdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次尝试时间',
  PRIMARY KEY (ip,username)
) TYPE=MyISAM COMMENT = '失败登录表';

DROP TABLE IF EXISTS pre_common_friendlink;
CREATE TABLE pre_common_friendlink (
  id smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '',
  url varchar(255) NOT NULL DEFAULT '' COMMENT '',
  description mediumtext NOT NULL COMMENT '',
  logo varchar(255) NOT NULL DEFAULT '' COMMENT '',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (id)
) TYPE=MyISAM COMMENT = '友情链接表';

DROP TABLE IF EXISTS pre_common_grouppm;
CREATE TABLE pre_common_grouppm (
  id smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  authorid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  author varchar(15) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  message text NOT NULL COMMENT '',
  numbers mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (id)
) TYPE=MyISAM COMMENT = '群发短消息表';

DROP TABLE IF EXISTS pre_common_invite;
CREATE TABLE pre_common_invite (
  id mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `code` char(20) NOT NULL DEFAULT '' COMMENT '',
  fuid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  fusername char(20) NOT NULL DEFAULT '' COMMENT '',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  email char(40) NOT NULL DEFAULT '' COMMENT '',
  inviteip char(15) NOT NULL DEFAULT '' COMMENT '',
  appid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  endtime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  regdateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '',
  orderid char(32) NOT NULL DEFAULT '' COMMENT '',
  PRIMARY KEY (id) ,
  KEY uid (uid,dateline)
) TYPE=MyISAM COMMENT ='邀请表';

DROP TABLE IF EXISTS pre_common_magic;
CREATE TABLE pre_common_magic (
  magicid smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  available tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  `name` varchar(50) NOT NULL COMMENT '',
  identifier varchar(40) NOT NULL COMMENT '',
  description varchar(255) NOT NULL COMMENT '',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  credit tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  price mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  num smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  salevolume smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  supplytype tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  supplynum smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  useperoid tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  usenum smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  weight tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '',
  magicperm text NOT NULL COMMENT '',
  useevent tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (magicid) COMMENT '',
  UNIQUE KEY identifier (identifier) COMMENT '',
  KEY displayorder (available,displayorder COMMENT '')
) TYPE=MyISAM COMMENT = '道具数据表';

DROP TABLE IF EXISTS pre_common_magiclog;
CREATE TABLE pre_common_magiclog (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  magicid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `action` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  amount smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  credit tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  price mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  targetid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  idtype char(6) DEFAULT NULL COMMENT '',
  targetuid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  KEY uid (uid,dateline) COMMENT '添加时间',
  KEY `action` (`action`) COMMENT '',
  KEY targetuid (targetuid,dateline) COMMENT '添加时间',
  KEY magicid (magicid,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_mailcron;
CREATE TABLE pre_common_mailcron (
  cid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  touid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  email varchar(100) NOT NULL DEFAULT '' COMMENT '',
  sendtime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (cid) COMMENT '',
  KEY sendtime (sendtime)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_mailqueue;
CREATE TABLE pre_common_mailqueue (
  qid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  cid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `subject` text NOT NULL COMMENT '',
  message text NOT NULL COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (qid) COMMENT '',
  KEY mcid (cid,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_member;
CREATE TABLE pre_common_member (
  uid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员id',
  email char(40) NOT NULL DEFAULT '' COMMENT '邮箱',
  username char(15) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '判断用户是否已经删除 需要discuz程序加判断，并增加整体清理的功能。原home字段为flag',
  emailstatus tinyint(1) NOT NULL DEFAULT '0' COMMENT 'email是否经过验证 home字段为emailcheck',
  avatarstatus tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有头像 home字段为avatar',
  videophotostatus tinyint(1) NOT NULL DEFAULT '0' COMMENT '视频认证状态 home',
  adminid tinyint(1) NOT NULL DEFAULT '0' COMMENT '管理员id',
  groupid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '会员组id',
  groupexpiry int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户组有效期',
  extgroupids char(20) NOT NULL DEFAULT '' COMMENT '扩展用户组',
  regdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  credits int(10) NOT NULL DEFAULT '0' COMMENT '总积分',
  notifysound tinyint(1) NOT NULL DEFAULT '0' COMMENT '短信声音',
  timeoffset char(4) NOT NULL DEFAULT '' COMMENT '时区校正',
  newpm smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '新短消息数量',
  newprompt smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '新提醒数目',
  accessmasks tinyint(1) NOT NULL DEFAULT '0' COMMENT '标志',
  allowadmincp tinyint(1) NOT NULL DEFAULT '0' COMMENT '标志',
  onlyacceptfriendpm tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否只接收好友短消息',
  conisbind tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户是否绑定QC',
  freeze tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否冻结',
  PRIMARY KEY (uid) ,
  UNIQUE KEY username (username),
  KEY email (email) ,
  KEY groupid (groupid),
  KEY conisbind (conisbind) ,
  KEY regdate (regdate)
) TYPE=MyISAM COMMENT = '用户主表';

DROP TABLE IF EXISTS pre_common_member_action_log;
CREATE TABLE pre_common_member_action_log (
  id mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录id',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `action` tinyint(5) NOT NULL DEFAULT '0' COMMENT '操作代码',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (id) ,
  KEY dateline (dateline,`action`,uid)
) TYPE=MyISAM comment = '用户操作日志表';

DROP TABLE IF EXISTS pre_common_member_connect;
CREATE TABLE pre_common_member_connect (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  conuin char(40) NOT NULL DEFAULT '' COMMENT '',
  conuinsecret char(16) NOT NULL DEFAULT '' COMMENT '',
  conopenid char(32) NOT NULL DEFAULT '' COMMENT '',
  conisfeed tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  conispublishfeed tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  conispublisht tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  conisregister tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  conisqzoneavatar tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  conisqqshow tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  conuintoken char(32) NOT NULL DEFAULT '' COMMENT '',
  PRIMARY KEY (uid) COMMENT '',
  KEY conuin (conuin) COMMENT '',
  KEY conopenid (conopenid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_member_count;
CREATE TABLE pre_common_member_count (
  uid mediumint(8) unsigned NOT NULL COMMENT '会员id',
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
  attachsize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传附件占用的空间 home',
  views mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '空间查看数',
  oltime smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '在线时间',
  todayattachs smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '当天上传附件数',
  todayattachsize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当天上传附件容量',
  feeds mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '广播数',
  follower mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '听众数量',
  following mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '收听数量',
  newfollower mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '新增听众数量',
  blacklist mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '拉黑用户数',
  PRIMARY KEY (uid) ,
  KEY posts (posts)
) TYPE=MyISAM comment = '用户统计表';

DROP TABLE IF EXISTS pre_common_member_crime;
CREATE TABLE pre_common_member_crime (
  cid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '被惩罚操作的用户id',
  operatorid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '进行惩罚操作的用户id',
  operator varchar(15) NOT NULL COMMENT '进行惩罚操作的用户id',
  `action` tinyint(5) NOT NULL COMMENT '惩罚行为',
  reason text NOT NULL COMMENT '惩罚理由',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '惩罚操作时间',
  PRIMARY KEY (cid) ,
  KEY uid (uid,`action`,dateline)
) TYPE=MyISAM comment = '用户惩罚操作表';

DROP TABLE IF EXISTS pre_common_member_field_forum;
CREATE TABLE pre_common_member_field_forum (
  uid mediumint(8) unsigned NOT NULL COMMENT '会员id',
  publishfeed tinyint(3) NOT NULL DEFAULT '0' COMMENT '用户自定义发送哪些类型的feed(原字段为customaddfeed)',
  customshow tinyint(1) unsigned NOT NULL DEFAULT '26' COMMENT '自定义帖子显示模式',
  customstatus varchar(30) NOT NULL DEFAULT '' COMMENT '自定义头衔',
  medals text NOT NULL COMMENT '勋章信息',
  sightml text NOT NULL COMMENT '签名',
  groupterms text NOT NULL COMMENT '公共用户组',
  authstr varchar(20) NOT NULL DEFAULT '' COMMENT '找回密码验证串',
  `groups` mediumtext NOT NULL COMMENT '用户所有群组',
  attentiongroup varchar(255) NOT NULL DEFAULT '' COMMENT '用户偏好',
  PRIMARY KEY (uid)
) TYPE=MyISAM comment = '用户论坛字段表';

DROP TABLE IF EXISTS pre_common_member_field_home;
CREATE TABLE pre_common_member_field_home (
  uid mediumint(8) unsigned NOT NULL COMMENT '',
  videophoto varchar(255) NOT NULL DEFAULT '' COMMENT '',
  spacename varchar(255) NOT NULL DEFAULT '' COMMENT '',
  spacedescription varchar(255) NOT NULL DEFAULT '' COMMENT '',
  domain char(15) NOT NULL DEFAULT '' COMMENT '',
  addsize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  addfriend smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  menunum smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  theme varchar(20) NOT NULL DEFAULT '' COMMENT '',
  spacecss text NOT NULL COMMENT '',
  blockposition text NOT NULL COMMENT '',
  recentnote text NOT NULL COMMENT '',
  spacenote text NOT NULL COMMENT '',
  privacy text NOT NULL COMMENT '',
  feedfriend mediumtext NOT NULL COMMENT '',
  acceptemail text NOT NULL COMMENT '',
  magicgift text NOT NULL COMMENT '',
  stickblogs text NOT NULL COMMENT '',
  PRIMARY KEY (uid) COMMENT '',
  KEY domain (domain)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_member_forum_buylog;
CREATE TABLE pre_common_member_forum_buylog (
  uid mediumint(8) unsigned NOT NULL COMMENT '',
  fid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  credits int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (uid,fid) COMMENT '',
  KEY fid (fid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_member_grouppm;
CREATE TABLE pre_common_member_grouppm (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  gpmid smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (uid,gpmid COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_member_log;
CREATE TABLE pre_common_member_log (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `action` char(10) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (uid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_member_magic;
CREATE TABLE pre_common_member_magic (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  magicid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  num smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (uid,magicid COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_member_medal;
CREATE TABLE pre_common_member_medal (
  uid mediumint(8) unsigned NOT NULL COMMENT '',
  medalid smallint(6) unsigned NOT NULL COMMENT '',
  PRIMARY KEY (uid,medalid COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_member_newprompt;
CREATE TABLE pre_common_member_newprompt (
  uid mediumint(8) unsigned NOT NULL COMMENT '',
  `data` varchar(255) NOT NULL DEFAULT '' COMMENT '',
  PRIMARY KEY (uid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_member_profile;
CREATE TABLE pre_common_member_profile (
  uid mediumint(8) unsigned NOT NULL COMMENT '',
  realname varchar(255) NOT NULL DEFAULT '' COMMENT '',
  gender tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  birthyear smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  birthmonth tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '',
  birthday tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '',
  constellation varchar(255) NOT NULL DEFAULT '' COMMENT '',
  zodiac varchar(255) NOT NULL DEFAULT '' COMMENT '',
  telephone varchar(255) NOT NULL DEFAULT '' COMMENT '',
  mobile varchar(255) NOT NULL DEFAULT '' COMMENT '',
  idcardtype varchar(255) NOT NULL DEFAULT '' COMMENT '',
  idcard varchar(255) NOT NULL DEFAULT '' COMMENT '',
  address varchar(255) NOT NULL DEFAULT '' COMMENT '',
  zipcode varchar(255) NOT NULL DEFAULT '' COMMENT '',
  nationality varchar(255) NOT NULL DEFAULT '' COMMENT '',
  birthprovince varchar(255) NOT NULL DEFAULT '' COMMENT '',
  birthcity varchar(255) NOT NULL DEFAULT '' COMMENT '',
  birthdist varchar(20) NOT NULL DEFAULT '' COMMENT '',
  birthcommunity varchar(255) NOT NULL DEFAULT '' COMMENT '',
  resideprovince varchar(255) NOT NULL DEFAULT '' COMMENT '',
  residecity varchar(255) NOT NULL DEFAULT '' COMMENT '',
  residedist varchar(20) NOT NULL DEFAULT '' COMMENT '',
  residecommunity varchar(255) NOT NULL DEFAULT '' COMMENT '',
  residesuite varchar(255) NOT NULL DEFAULT '' COMMENT '',
  graduateschool varchar(255) NOT NULL DEFAULT '' COMMENT '',
  company varchar(255) NOT NULL DEFAULT '' COMMENT '',
  education varchar(255) NOT NULL DEFAULT '' COMMENT '',
  occupation varchar(255) NOT NULL DEFAULT '' COMMENT '',
  position varchar(255) NOT NULL DEFAULT '' COMMENT '',
  revenue varchar(255) NOT NULL DEFAULT '' COMMENT '',
  affectivestatus varchar(255) NOT NULL DEFAULT '' COMMENT '',
  lookingfor varchar(255) NOT NULL DEFAULT '' COMMENT '',
  bloodtype varchar(255) NOT NULL DEFAULT '' COMMENT '',
  height varchar(255) NOT NULL DEFAULT '' COMMENT '',
  weight varchar(255) NOT NULL DEFAULT '' COMMENT '',
  alipay varchar(255) NOT NULL DEFAULT '' COMMENT '',
  icq varchar(255) NOT NULL DEFAULT '' COMMENT '',
  qq varchar(255) NOT NULL DEFAULT '' COMMENT '',
  yahoo varchar(255) NOT NULL DEFAULT '' COMMENT '',
  msn varchar(255) NOT NULL DEFAULT '' COMMENT '',
  taobao varchar(255) NOT NULL DEFAULT '' COMMENT '',
  site varchar(255) NOT NULL DEFAULT '' COMMENT '',
  bio text NOT NULL COMMENT '',
  interest text NOT NULL COMMENT '',
  field1 text NOT NULL COMMENT '',
  field2 text NOT NULL COMMENT '',
  field3 text NOT NULL COMMENT '',
  field4 text NOT NULL COMMENT '',
  field5 text NOT NULL COMMENT '',
  field6 text NOT NULL COMMENT '',
  field7 text NOT NULL COMMENT '',
  field8 text NOT NULL COMMENT '',
  PRIMARY KEY (uid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_member_profile_setting;
CREATE TABLE pre_common_member_profile_setting (
  fieldid varchar(255) NOT NULL DEFAULT '' COMMENT '',
  available tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  invisible tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  needverify tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  title varchar(255) NOT NULL DEFAULT '' COMMENT '',
  description varchar(255) NOT NULL DEFAULT '' COMMENT '',
  displayorder smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  required tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  unchangeable tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  showincard tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  showinthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  showinregister tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowsearch tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  formtype varchar(255) NOT NULL COMMENT '',
  size smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  choices text NOT NULL COMMENT '',
  validate text NOT NULL COMMENT '',
  PRIMARY KEY (fieldid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_member_security;
CREATE TABLE pre_common_member_security (
  securityid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username varchar(255) NOT NULL DEFAULT '' COMMENT '',
  fieldid varchar(255) NOT NULL DEFAULT '' COMMENT '',
  oldvalue text NOT NULL COMMENT '',
  newvalue text NOT NULL COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (securityid) COMMENT '',
  KEY uid (uid,fieldid) COMMENT '',
  KEY dateline (datelin添加时间e)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_member_secwhite;
CREATE TABLE pre_common_member_secwhite (
  uid int(10) NOT NULL COMMENT '',
  dateline int(10) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (uid)
) TYPE=HEAP;

DROP TABLE IF EXISTS pre_common_member_stat_field;
CREATE TABLE pre_common_member_stat_field (
  optionid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  fieldid varchar(255) NOT NULL DEFAULT '' COMMENT '',
  fieldvalue varchar(255) NOT NULL DEFAULT '' COMMENT '',
  `hash` varchar(255) NOT NULL DEFAULT '' COMMENT '',
  users mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  updatetime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (optionid) COMMENT '',
  KEY fieldid (fieldid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_member_status;
CREATE TABLE pre_common_member_status (
  uid mediumint(8) unsigned NOT NULL COMMENT '',
  regip char(15) NOT NULL DEFAULT '' COMMENT '',
  lastip char(15) NOT NULL DEFAULT '' COMMENT '',
  `port` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  lastvisit int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  lastactivity int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  lastpost int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  lastsendmail int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  invisible tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  buyercredit smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  sellercredit smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  favtimes mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  sharetimes mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  profileprogress tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (uid) COMMENT '',
  KEY lastactivity (lastactivity,invisible COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_member_validate;
CREATE TABLE pre_common_member_validate (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  submitdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  moddate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  admin varchar(15) NOT NULL DEFAULT '' COMMENT '',
  submittimes tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  message text NOT NULL COMMENT '',
  remark text NOT NULL COMMENT '',
  PRIMARY KEY (uid) COMMENT '',
  KEY `status` (`status`)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_member_verify;
CREATE TABLE pre_common_member_verify (
  uid mediumint(8) unsigned NOT NULL COMMENT '',
  verify1 tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  verify2 tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  verify3 tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  verify4 tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  verify5 tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  verify6 tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  verify7 tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (uid) COMMENT '',
  KEY verify1 (verify1) COMMENT '',
  KEY verify2 (verify2) COMMENT '',
  KEY verify3 (verify3) COMMENT '',
  KEY verify4 (verify4) COMMENT '',
  KEY verify5 (verify5) COMMENT '',
  KEY verify6 (verify6) COMMENT '',
  KEY verify7 (verify7)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_member_verify_info;
CREATE TABLE pre_common_member_verify_info (
  vid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username varchar(30) NOT NULL DEFAULT '' COMMENT '',
  verifytype tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  flag tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  field text NOT NULL COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (vid) COMMENT '',
  KEY verifytype (verifytype,flag) COMMENT '',
  KEY uid (uid,verifytype,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_myapp;
CREATE TABLE pre_common_myapp (
  appid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  appname varchar(60) NOT NULL DEFAULT '' COMMENT '',
  narrow tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  flag tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  version mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  userpanelarea tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  canvastitle varchar(60) NOT NULL DEFAULT '' COMMENT '',
  fullscreen tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  displayuserpanel tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  displaymethod tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  displayorder smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  appstatus tinyint(2) NOT NULL DEFAULT '0' COMMENT '',
  iconstatus tinyint(2) NOT NULL DEFAULT '0' COMMENT '',
  icondowntime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (appid) COMMENT '',
  KEY flag (flag,displayorder COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_myinvite;
CREATE TABLE pre_common_myinvite (
  id mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  typename varchar(100) NOT NULL DEFAULT '' COMMENT '',
  appid mediumint(8) NOT NULL DEFAULT '0' COMMENT '',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  fromuid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  touid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  myml text NOT NULL COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `hash` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (id) COMMENT '',
  KEY `hash` (`hash`) COMMENT '',
  KEY uid (touid,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_mytask;
CREATE TABLE pre_common_mytask (
  uid mediumint(8) unsigned NOT NULL COMMENT '',
  username char(15) NOT NULL DEFAULT '' COMMENT '',
  taskid smallint(6) unsigned NOT NULL COMMENT '',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  csc char(255) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (uid,taskid) COMMENT '',
  KEY parter (taskid,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_nav;
CREATE TABLE pre_common_nav (
  id smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  parentid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `name` varchar(255) NOT NULL COMMENT '',
  title varchar(255) NOT NULL COMMENT '',
  url varchar(255) NOT NULL COMMENT '',
  identifier varchar(255) NOT NULL COMMENT '',
  target tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  available tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  displayorder tinyint(3) NOT NULL COMMENT '',
  highlight tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  `level` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  subtype tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  subcols tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  icon varchar(255) NOT NULL COMMENT '',
  subname varchar(255) NOT NULL COMMENT '',
  suburl varchar(255) NOT NULL COMMENT '',
  navtype tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  logo varchar(255) NOT NULL COMMENT '',
  PRIMARY KEY (id) COMMENT '',
  KEY navtype (navtype)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_onlinetime;
CREATE TABLE pre_common_onlinetime (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  thismonth smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  total mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  lastupdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (uid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_optimizer;
CREATE TABLE pre_common_optimizer (
  k char(100) NOT NULL DEFAULT '' COMMENT '',
  v char(255) NOT NULL DEFAULT '' COMMENT '',
  PRIMARY KEY (k)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_patch;
CREATE TABLE pre_common_patch (
  `serial` varchar(10) NOT NULL DEFAULT '' COMMENT '',
  rule text NOT NULL COMMENT '',
  note text NOT NULL COMMENT '',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`serial`)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_plugin;
CREATE TABLE pre_common_plugin (
  pluginid smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  available tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  adminid tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '',
  identifier varchar(40) NOT NULL DEFAULT '' COMMENT '',
  description varchar(255) NOT NULL DEFAULT '' COMMENT '',
  datatables varchar(255) NOT NULL DEFAULT '' COMMENT '',
  `directory` varchar(100) NOT NULL DEFAULT '' COMMENT '',
  copyright varchar(100) NOT NULL DEFAULT '' COMMENT '',
  modules text NOT NULL COMMENT '',
  version varchar(20) NOT NULL DEFAULT '' COMMENT '',
  PRIMARY KEY (pluginid) COMMENT '',
  UNIQUE KEY identifier (identifier)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_pluginvar;
CREATE TABLE pre_common_pluginvar (
  pluginvarid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  pluginid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  title varchar(100) NOT NULL DEFAULT '' COMMENT '',
  description varchar(255) NOT NULL DEFAULT '' COMMENT '',
  variable varchar(40) NOT NULL DEFAULT '' COMMENT '',
  `type` varchar(20) NOT NULL DEFAULT 'text' COMMENT '',
  `value` text NOT NULL COMMENT '',
  extra text NOT NULL COMMENT '',
  PRIMARY KEY (pluginvarid) COMMENT '',
  KEY pluginid (pluginid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_process;
CREATE TABLE pre_common_process (
  processid char(32) NOT NULL COMMENT '',
  expiry int(10) DEFAULT NULL COMMENT '',
  extra int(10) DEFAULT NULL COMMENT '',
  PRIMARY KEY (processid) COMMENT '',
  KEY expiry (expiry)
) TYPE=HEAP;

DROP TABLE IF EXISTS pre_common_regip;
CREATE TABLE pre_common_regip (
  ip char(15) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  count smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  KEY ip (ip)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_relatedlink;
CREATE TABLE pre_common_relatedlink (
  id smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '',
  url varchar(255) NOT NULL DEFAULT '' COMMENT '',
  extent tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (id)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_remote_port;
CREATE TABLE pre_common_remote_port (
  id mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  idtype char(15) NOT NULL DEFAULT '' COMMENT '',
  useip char(15) NOT NULL DEFAULT '' COMMENT '',
  `port` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (id,idtype COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_report;
CREATE TABLE pre_common_report (
  id mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  urlkey char(32) NOT NULL DEFAULT '' COMMENT '',
  url varchar(255) NOT NULL DEFAULT '' COMMENT '',
  message text NOT NULL COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  num smallint(6) unsigned NOT NULL DEFAULT '1' COMMENT '',
  opuid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  opname varchar(15) NOT NULL DEFAULT '' COMMENT '',
  optime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  opresult varchar(255) NOT NULL DEFAULT '' COMMENT '',
  fid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (id) COMMENT '',
  KEY urlkey (urlkey) COMMENT '',
  KEY fid (fid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_searchindex;
CREATE TABLE pre_common_searchindex (
  searchid int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  srchmod tinyint(3) unsigned NOT NULL COMMENT '',
  keywords varchar(255) NOT NULL DEFAULT '' COMMENT '',
  searchstring text NOT NULL COMMENT '',
  useip varchar(15) NOT NULL DEFAULT '' COMMENT '',
  uid mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  expiration int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  threadsortid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  num smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  ids text NOT NULL COMMENT '',
  PRIMARY KEY (searchid) COMMENT '',
  KEY srchmod (srchmod)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_seccheck;
CREATE TABLE pre_common_seccheck (
  ssid int(10) NOT NULL AUTO_INCREMENT COMMENT '',
  dateline int(10) NOT NULL COMMENT '添加时间',
  `code` char(6) NOT NULL COMMENT '',
  succeed tinyint(1) NOT NULL COMMENT '',
  verified tinyint(1) NOT NULL COMMENT '',
  PRIMARY KEY (ssid) COMMENT '',
  KEY dateline (dateline) COMMENT '添加时间',
  KEY succeed (succeed) COMMENT '',
  KEY verified (verified)
) TYPE=HEAP;

DROP TABLE IF EXISTS pre_common_secquestion;
CREATE TABLE pre_common_secquestion (
  id smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  `type` tinyint(1) unsigned NOT NULL COMMENT '',
  question text NOT NULL COMMENT '',
  answer varchar(255) NOT NULL COMMENT '',
  PRIMARY KEY (id)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_session;
CREATE TABLE pre_common_session (
  sid char(6) NOT NULL DEFAULT '' COMMENT '',
  ip1 tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '',
  ip2 tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '',
  ip3 tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '',
  ip4 tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username char(15) NOT NULL DEFAULT '' COMMENT '',
  groupid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  invisible tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  `action` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  lastactivity int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  lastolupdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  fid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  UNIQUE KEY sid (sid) COMMENT '',
  KEY uid (uid)
) TYPE=HEAP;

DROP TABLE IF EXISTS pre_common_setting;
CREATE TABLE pre_common_setting (
  skey varchar(255) NOT NULL DEFAULT '' COMMENT '',
  svalue text NOT NULL COMMENT '',
  PRIMARY KEY (skey)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_smiley;
CREATE TABLE pre_common_smiley (
  id smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  typeid smallint(6) unsigned NOT NULL COMMENT '',
  displayorder tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  `type` enum('smiley','stamp','stamplist') NOT NULL DEFAULT 'smiley' COMMENT '',
  `code` varchar(30) NOT NULL DEFAULT '' COMMENT '',
  url varchar(30) NOT NULL DEFAULT '' COMMENT '',
  PRIMARY KEY (id) COMMENT '',
  KEY `type` (`type`,displayorder COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_sphinxcounter;
CREATE TABLE pre_common_sphinxcounter (
  indexid tinyint(1) NOT NULL COMMENT '',
  maxid int(10) NOT NULL COMMENT '',
  PRIMARY KEY (indexid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_stat;
CREATE TABLE pre_common_stat (
  daytime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  login int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  mobilelogin int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  connectlogin int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  register int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  invite int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  appinvite int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  doing int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  blog int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  pic int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  poll int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  activity int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `share` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  thread int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  docomment int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  blogcomment int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  piccomment int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  sharecomment int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  reward int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  debate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  trade int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `group` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  groupjoin int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  groupthread int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  grouppost int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  post int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  wall int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  poke int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  click int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  sendpm int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  friend int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  addfriend int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (daytime)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_statuser;
CREATE TABLE pre_common_statuser (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  daytime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `type` char(20) NOT NULL DEFAULT '' COMMENT '',
  KEY uid (uid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_style;
CREATE TABLE pre_common_style (
  styleid smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '',
  available tinyint(1) NOT NULL DEFAULT '1' COMMENT '',
  templateid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  extstyle varchar(255) NOT NULL DEFAULT '' COMMENT '',
  PRIMARY KEY (styleid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_stylevar;
CREATE TABLE pre_common_stylevar (
  stylevarid smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  styleid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  variable text NOT NULL COMMENT '',
  substitute text NOT NULL COMMENT '',
  PRIMARY KEY (stylevarid) COMMENT '',
  KEY styleid (styleid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_syscache;
CREATE TABLE pre_common_syscache (
  cname varchar(32) NOT NULL COMMENT '',
  ctype tinyint(3) unsigned NOT NULL COMMENT '',
  dateline int(10) unsigned NOT NULL COMMENT '添加时间',
  `data` mediumblob NOT NULL COMMENT '',
  PRIMARY KEY (cname)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_tag;
CREATE TABLE pre_common_tag (
  tagid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  tagname char(20) NOT NULL DEFAULT '' COMMENT '',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (tagid) COMMENT '',
  KEY tagname (tagname) COMMENT '',
  KEY `status` (`status`,tagid COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_tagitem;
CREATE TABLE pre_common_tagitem (
  tagid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  itemid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  idtype char(10) NOT NULL DEFAULT '' COMMENT '',
  UNIQUE KEY item (tagid,itemid,idtype) COMMENT '',
  KEY idtype (idtype,itemid COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_task;
CREATE TABLE pre_common_task (
  taskid smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  relatedtaskid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  available tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '',
  description text NOT NULL COMMENT '',
  icon varchar(150) NOT NULL DEFAULT '' COMMENT '',
  applicants mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  achievers mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  tasklimits mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  applyperm text NOT NULL COMMENT '',
  scriptname varchar(50) NOT NULL DEFAULT '' COMMENT '',
  starttime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  endtime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  period int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  periodtype tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  reward enum('credit','magic','medal','invite','group') NOT NULL DEFAULT 'credit' COMMENT '',
  prize varchar(15) NOT NULL DEFAULT '' COMMENT '',
  bonus int(10) NOT NULL DEFAULT '0' COMMENT '',
  displayorder smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  version varchar(15) NOT NULL DEFAULT '' COMMENT '',
  PRIMARY KEY (taskid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_taskvar;
CREATE TABLE pre_common_taskvar (
  taskvarid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  taskid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  sort enum('apply','complete') NOT NULL DEFAULT 'complete' COMMENT '',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '',
  description varchar(255) NOT NULL DEFAULT '' COMMENT '',
  variable varchar(40) NOT NULL DEFAULT '' COMMENT '',
  `type` varchar(20) NOT NULL DEFAULT 'text' COMMENT '',
  `value` text NOT NULL COMMENT '',
  PRIMARY KEY (taskvarid) COMMENT '',
  KEY taskid (taskid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_template;
CREATE TABLE pre_common_template (
  templateid smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '',
  `directory` varchar(100) NOT NULL DEFAULT '' COMMENT '',
  copyright varchar(100) NOT NULL DEFAULT '' COMMENT '',
  PRIMARY KEY (templateid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_template_block;
CREATE TABLE pre_common_template_block (
  targettplname varchar(100) NOT NULL DEFAULT '' COMMENT '',
  tpldirectory varchar(80) NOT NULL DEFAULT '' COMMENT '',
  bid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (targettplname,tpldirectory,bid) COMMENT '',
  KEY bid (bid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_template_permission;
CREATE TABLE pre_common_template_permission (
  targettplname varchar(100) NOT NULL DEFAULT '' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  allowmanage tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowrecommend tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  needverify tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  inheritedtplname varchar(255) NOT NULL DEFAULT '' COMMENT '',
  PRIMARY KEY (targettplname,uid) COMMENT '',
  KEY uid (uid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_uin_black;
CREATE TABLE pre_common_uin_black (
  uin char(40) NOT NULL COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (uin) COMMENT '',
  UNIQUE KEY uid (uid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_usergroup;
CREATE TABLE pre_common_usergroup (
  groupid smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  radminid tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  `type` enum('system','special','member') NOT NULL DEFAULT 'member' COMMENT '',
  `system` varchar(255) NOT NULL DEFAULT 'private' COMMENT '',
  grouptitle varchar(255) NOT NULL DEFAULT '' COMMENT '',
  creditshigher int(10) NOT NULL DEFAULT '0' COMMENT '',
  creditslower int(10) NOT NULL DEFAULT '0' COMMENT '',
  stars tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  color varchar(255) NOT NULL DEFAULT '' COMMENT '',
  icon varchar(255) NOT NULL DEFAULT '' COMMENT '',
  allowvisit tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowsendpm tinyint(1) NOT NULL DEFAULT '1' COMMENT '',
  allowinvite tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowmailinvite tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  maxinvitenum tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '',
  inviteprice smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  maxinviteday smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (groupid) COMMENT '',
  KEY creditsrange (creditshigher,creditslower COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_usergroup_field;
CREATE TABLE pre_common_usergroup_field (
  groupid smallint(6) unsigned NOT NULL COMMENT '',
  readaccess tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '',
  allowpost tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowreply tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowpostpoll tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowpostreward tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowposttrade tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowpostactivity tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowdirectpost tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowgetattach tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowgetimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowpostattach tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowpostimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowvote tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowsearch tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowcstatus tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowinvisible tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowtransfer tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowsetreadperm tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowsetattachperm tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowposttag tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowhidecode tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowhtml tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowanonymous tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowsigbbcode tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowsigimgcode tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowmagics tinyint(1) unsigned NOT NULL COMMENT '',
  disableperiodctrl tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  reasonpm tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  maxprice smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  maxsigsize smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  maxattachsize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  maxsizeperday int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  maxthreadsperhour tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '',
  maxpostsperhour tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '',
  attachextensions char(100) NOT NULL DEFAULT '' COMMENT '',
  raterange char(150) NOT NULL DEFAULT '' COMMENT '',
  loginreward char(150) NOT NULL DEFAULT '' COMMENT '',
  mintradeprice smallint(6) unsigned NOT NULL DEFAULT '1' COMMENT '',
  maxtradeprice smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  minrewardprice smallint(6) unsigned NOT NULL DEFAULT '1' COMMENT '',
  maxrewardprice smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  magicsdiscount tinyint(1) NOT NULL COMMENT '',
  maxmagicsweight smallint(6) unsigned NOT NULL COMMENT '',
  allowpostdebate tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  tradestick tinyint(1) unsigned NOT NULL COMMENT '',
  exempt tinyint(1) unsigned NOT NULL COMMENT '',
  maxattachnum smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  allowposturl tinyint(1) NOT NULL DEFAULT '3' COMMENT '',
  allowrecommend tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '',
  allowpostrushreply tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  maxfriendnum smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  maxspacesize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  allowcomment tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowcommentarticle smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  searchinterval smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  searchignore tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowblog tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowdoing tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowupload tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowshare tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowblogmod tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  allowdoingmod tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  allowuploadmod tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  allowsharemod tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  allowcss tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowpoke tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowfriend tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowclick tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowmagic tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowstat tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowstatdata tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  videophotoignore tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowviewvideophoto tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowmyop tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  magicdiscount tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  domainlength smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  seccode tinyint(1) NOT NULL DEFAULT '1' COMMENT '',
  disablepostctrl tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowbuildgroup tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  allowgroupdirectpost tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  allowgroupposturl tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  edittimelimit smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  allowpostarticle tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowdownlocalimg tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowdownremoteimg tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowpostarticlemod tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  allowspacediyhtml tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowspacediybbcode tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowspacediyimgcode tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowcommentpost tinyint(1) NOT NULL DEFAULT '2' COMMENT '',
  allowcommentitem tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowcommentreply tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowreplycredit tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  ignorecensor tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  allowsendallpm tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  allowsendpmmaxnum smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  maximagesize mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  allowmediacode tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowbegincode tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  allowat smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  allowsetpublishdate tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  allowfollowcollection tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  allowcommentcollection tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  allowcreatecollection smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  forcesecques tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  forcelogin tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  closead tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  buildgroupcredits smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  allowimgcontent tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (groupid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_visit;
CREATE TABLE pre_common_visit (
  ip int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (ip) COMMENT '',
  KEY ip (ip,`view` COMMENT '')
) TYPE=HEAP;

DROP TABLE IF EXISTS pre_common_word;
CREATE TABLE pre_common_word (
  id smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  admin varchar(15) NOT NULL DEFAULT '' COMMENT '',
  `type` smallint(6) NOT NULL DEFAULT '1' COMMENT '',
  find varchar(255) NOT NULL DEFAULT '' COMMENT '',
  replacement varchar(255) NOT NULL DEFAULT '' COMMENT '',
  extra varchar(255) NOT NULL DEFAULT '' COMMENT '',
  PRIMARY KEY (id)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_common_word_type;
CREATE TABLE pre_common_word_type (
  id smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  typename varchar(15) NOT NULL DEFAULT '' COMMENT '',
  PRIMARY KEY (id)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_connect_disktask;
CREATE TABLE pre_connect_disktask (
  taskid int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  aid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  openid char(32) NOT NULL DEFAULT '' COMMENT '',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '',
  verifycode char(32) NOT NULL DEFAULT '' COMMENT '',
  `status` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  downloadtime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  extra text COMMENT '',
  PRIMARY KEY (taskid) COMMENT '',
  KEY openid (openid) COMMENT '',
  KEY `status` (`status`)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_connect_feedlog;
CREATE TABLE pre_connect_feedlog (
  flid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  publishtimes mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  lastpublished int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '',
  PRIMARY KEY (flid) COMMENT '',
  UNIQUE KEY tid (tid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_connect_memberbindlog;
CREATE TABLE pre_connect_memberbindlog (
  mblid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uin char(40) NOT NULL COMMENT '',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (mblid) COMMENT '',
  KEY uid (uid) COMMENT '',
  KEY uin (uin) COMMENT '',
  KEY dateline (datelin添加时间e)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_connect_postfeedlog;
CREATE TABLE pre_connect_postfeedlog (
  flid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  publishtimes mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  lastpublished int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '',
  PRIMARY KEY (flid) COMMENT '',
  UNIQUE KEY pid (pid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_connect_tthreadlog;
CREATE TABLE pre_connect_tthreadlog (
  twid char(16) NOT NULL COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  conopenid char(32) NOT NULL COMMENT '',
  pagetime int(10) unsigned DEFAULT '0' COMMENT '',
  lasttwid char(16) DEFAULT NULL COMMENT '',
  nexttime int(10) unsigned DEFAULT '0' COMMENT '',
  updatetime int(10) unsigned DEFAULT '0' COMMENT '',
  dateline int(10) unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (twid) COMMENT '',
  KEY nexttime (tid,nexttime) COMMENT '',
  KEY updatetime (tid,updatetime COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_access;
CREATE TABLE pre_forum_access (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  fid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  allowview tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowpost tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowreply tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowgetattach tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowgetimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowpostattach tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowpostimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  adminuser mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (uid,fid) COMMENT '',
  KEY listorder (fid,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_activity;
CREATE TABLE pre_forum_activity (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  aid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  cost mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  starttimefrom int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  starttimeto int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  place varchar(255) NOT NULL DEFAULT '' COMMENT '',
  class varchar(255) NOT NULL DEFAULT '' COMMENT '',
  gender tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  number smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '',
  applynumber smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '',
  expiration int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  ufield text NOT NULL COMMENT '',
  credit smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (tid) COMMENT '',
  KEY uid (uid,starttimefrom) COMMENT '',
  KEY starttimefrom (starttimefrom) COMMENT '',
  KEY expiration (expiration) COMMENT '',
  KEY applynumber (applynumber)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_activityapply;
CREATE TABLE pre_forum_activityapply (
  applyid int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username varchar(255) NOT NULL DEFAULT '' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  message varchar(255) NOT NULL DEFAULT '' COMMENT '',
  verified tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  payment mediumint(8) NOT NULL DEFAULT '0' COMMENT '',
  ufielddata text NOT NULL COMMENT '',
  PRIMARY KEY (applyid) COMMENT '',
  KEY uid (uid) COMMENT '',
  KEY tid (tid) COMMENT '',
  KEY dateline (tid,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_announcement;
CREATE TABLE pre_forum_announcement (
  id smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  author varchar(15) NOT NULL DEFAULT '' COMMENT '',
  `subject` varchar(255) NOT NULL DEFAULT '' COMMENT '',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  starttime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  endtime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  message text NOT NULL COMMENT '',
  `groups` text NOT NULL COMMENT '',
  PRIMARY KEY (id) COMMENT '',
  KEY timespan (starttime,endtime COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_attachment;
CREATE TABLE pre_forum_attachment (
  aid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  tableid tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  downloads mediumint(8) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (aid) COMMENT '',
  KEY tid (tid) COMMENT '',
  KEY pid (pid) COMMENT '',
  KEY uid (uid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_attachment_0;
CREATE TABLE pre_forum_attachment_0 (
  aid mediumint(8) unsigned NOT NULL COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '',
  filesize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  attachment varchar(255) NOT NULL DEFAULT '' COMMENT '',
  remote tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  description varchar(255) NOT NULL COMMENT '',
  readperm tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '',
  price smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  isimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  width smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  thumb tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  picid mediumint(8) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (aid) COMMENT '',
  KEY tid (tid) COMMENT '',
  KEY pid (pid) COMMENT '',
  KEY uid (uid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_attachment_1;
CREATE TABLE pre_forum_attachment_1 (
  aid mediumint(8) unsigned NOT NULL COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '',
  filesize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  attachment varchar(255) NOT NULL DEFAULT '' COMMENT '',
  remote tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  description varchar(255) NOT NULL COMMENT '',
  readperm tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '',
  price smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  isimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  width smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  thumb tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  picid mediumint(8) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (aid) COMMENT '',
  KEY tid (tid) COMMENT '',
  KEY pid (pid) COMMENT '',
  KEY uid (uid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_attachment_2;
CREATE TABLE pre_forum_attachment_2 (
  aid mediumint(8) unsigned NOT NULL COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '',
  filesize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  attachment varchar(255) NOT NULL DEFAULT '' COMMENT '',
  remote tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  description varchar(255) NOT NULL COMMENT '',
  readperm tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '',
  price smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  isimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  width smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  thumb tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  picid mediumint(8) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (aid) COMMENT '',
  KEY tid (tid) COMMENT '',
  KEY pid (pid) COMMENT '',
  KEY uid (uid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_attachment_3;
CREATE TABLE pre_forum_attachment_3 (
  aid mediumint(8) unsigned NOT NULL COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '',
  filesize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  attachment varchar(255) NOT NULL DEFAULT '' COMMENT '',
  remote tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  description varchar(255) NOT NULL COMMENT '',
  readperm tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '',
  price smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  isimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  width smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  thumb tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  picid mediumint(8) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (aid) COMMENT '',
  KEY tid (tid) COMMENT '',
  KEY pid (pid) COMMENT '',
  KEY uid (uid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_attachment_4;
CREATE TABLE pre_forum_attachment_4 (
  aid mediumint(8) unsigned NOT NULL COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '',
  filesize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  attachment varchar(255) NOT NULL DEFAULT '' COMMENT '',
  remote tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  description varchar(255) NOT NULL COMMENT '',
  readperm tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '',
  price smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  isimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  width smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  thumb tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  picid mediumint(8) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (aid) COMMENT '',
  KEY tid (tid) COMMENT '',
  KEY pid (pid) COMMENT '',
  KEY uid (uid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_attachment_5;
CREATE TABLE pre_forum_attachment_5 (
  aid mediumint(8) unsigned NOT NULL COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '',
  filesize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  attachment varchar(255) NOT NULL DEFAULT '' COMMENT '',
  remote tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  description varchar(255) NOT NULL COMMENT '',
  readperm tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '',
  price smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  isimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  width smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  thumb tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  picid mediumint(8) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (aid) COMMENT '',
  KEY tid (tid) COMMENT '',
  KEY pid (pid) COMMENT '',
  KEY uid (uid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_attachment_6;
CREATE TABLE pre_forum_attachment_6 (
  aid mediumint(8) unsigned NOT NULL COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '',
  filesize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  attachment varchar(255) NOT NULL DEFAULT '' COMMENT '',
  remote tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  description varchar(255) NOT NULL COMMENT '',
  readperm tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '',
  price smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  isimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  width smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  thumb tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  picid mediumint(8) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (aid) COMMENT '',
  KEY tid (tid) COMMENT '',
  KEY pid (pid) COMMENT '',
  KEY uid (uid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_attachment_7;
CREATE TABLE pre_forum_attachment_7 (
  aid mediumint(8) unsigned NOT NULL COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '',
  filesize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  attachment varchar(255) NOT NULL DEFAULT '' COMMENT '',
  remote tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  description varchar(255) NOT NULL COMMENT '',
  readperm tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '',
  price smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  isimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  width smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  thumb tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  picid mediumint(8) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (aid) COMMENT '',
  KEY tid (tid) COMMENT '',
  KEY pid (pid) COMMENT '',
  KEY uid (uid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_attachment_8;
CREATE TABLE pre_forum_attachment_8 (
  aid mediumint(8) unsigned NOT NULL COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '',
  filesize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  attachment varchar(255) NOT NULL DEFAULT '' COMMENT '',
  remote tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  description varchar(255) NOT NULL COMMENT '',
  readperm tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '',
  price smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  isimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  width smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  thumb tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  picid mediumint(8) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (aid) COMMENT '',
  KEY tid (tid) COMMENT '',
  KEY pid (pid) COMMENT '',
  KEY uid (uid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_attachment_9;
CREATE TABLE pre_forum_attachment_9 (
  aid mediumint(8) unsigned NOT NULL COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '',
  filesize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  attachment varchar(255) NOT NULL DEFAULT '' COMMENT '',
  remote tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  description varchar(255) NOT NULL COMMENT '',
  readperm tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '',
  price smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  isimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  width smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  thumb tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  picid mediumint(8) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (aid) COMMENT '',
  KEY tid (tid) COMMENT '',
  KEY pid (pid) COMMENT '',
  KEY uid (uid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_attachment_exif;
CREATE TABLE pre_forum_attachment_exif (
  aid mediumint(8) unsigned NOT NULL COMMENT '',
  exif text NOT NULL COMMENT '',
  PRIMARY KEY (aid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_attachment_unused;
CREATE TABLE pre_forum_attachment_unused (
  aid mediumint(8) unsigned NOT NULL COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '',
  filesize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  attachment varchar(255) NOT NULL DEFAULT '' COMMENT '',
  remote tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  isimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  width smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  thumb tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (aid) COMMENT '',
  KEY uid (uid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_attachtype;
CREATE TABLE pre_forum_attachtype (
  id smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  fid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  extension char(12) NOT NULL DEFAULT '' COMMENT '',
  maxsize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (id) COMMENT '',
  KEY fid (fid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_bbcode;
CREATE TABLE pre_forum_bbcode (
  id mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  available tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  tag varchar(100) NOT NULL DEFAULT '' COMMENT '',
  icon varchar(255) NOT NULL COMMENT '',
  replacement text NOT NULL COMMENT '',
  example varchar(255) NOT NULL DEFAULT '' COMMENT '',
  explanation text NOT NULL COMMENT '',
  params tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '',
  prompt text NOT NULL COMMENT '',
  nest tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  perm text NOT NULL COMMENT '',
  PRIMARY KEY (id)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_collection;
CREATE TABLE pre_forum_collection (
  ctid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  follownum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  threadnum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  commentnum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '',
  lastupdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  rate float NOT NULL DEFAULT '0' COMMENT '',
  ratenum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  lastpost mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  lastsubject varchar(80) NOT NULL DEFAULT '' COMMENT '',
  lastposttime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  lastposter varchar(15) NOT NULL DEFAULT '' COMMENT '',
  lastvisit int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  keyword varchar(255) NOT NULL DEFAULT '' COMMENT '',
  PRIMARY KEY (ctid) COMMENT '',
  KEY dateline (dateline) COMMENT '添加时间',
  KEY hotcollection (threadnum,lastupdate) COMMENT '',
  KEY follownum (follownum) COMMENT '',
  KEY uid (uid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_collectioncomment;
CREATE TABLE pre_forum_collectioncomment (
  cid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  ctid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  message text NOT NULL COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  useip varchar(16) NOT NULL DEFAULT '' COMMENT '',
  `port` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  rate float NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (cid) COMMENT '',
  KEY ctid (ctid,dateline) COMMENT '添加时间',
  KEY userrate (ctid,uid,rate COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_collectionfollow;
CREATE TABLE pre_forum_collectionfollow (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username char(15) NOT NULL DEFAULT '' COMMENT '',
  ctid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  lastvisit int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (uid,ctid) COMMENT '',
  KEY ctid (ctid,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_collectioninvite;
CREATE TABLE pre_forum_collectioninvite (
  ctid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (ctid,uid) COMMENT '',
  KEY dateline (datelin添加时间e)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_collectionrelated;
CREATE TABLE pre_forum_collectionrelated (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  collection text NOT NULL COMMENT '',
  PRIMARY KEY (tid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_collectionteamworker;
CREATE TABLE pre_forum_collectionteamworker (
  ctid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  lastvisit int(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (ctid,uid COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_collectionthread;
CREATE TABLE pre_forum_collectionthread (
  ctid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  reason varchar(255) NOT NULL DEFAULT '' COMMENT '',
  PRIMARY KEY (ctid,tid) COMMENT '',
  KEY ctid (ctid,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_creditslog;
CREATE TABLE pre_forum_creditslog (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  fromto char(15) NOT NULL DEFAULT '' COMMENT '',
  sendcredits tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  receivecredits tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  send int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  receive int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  operation char(3) NOT NULL DEFAULT '' COMMENT '',
  KEY uid (uid,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_debate;
CREATE TABLE pre_forum_debate (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  starttime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  endtime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  affirmdebaters mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  negadebaters mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  affirmvotes mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  negavotes mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  umpire varchar(15) NOT NULL DEFAULT '' COMMENT '',
  winner tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  bestdebater varchar(50) NOT NULL DEFAULT '' COMMENT '',
  affirmpoint text NOT NULL COMMENT '',
  negapoint text NOT NULL COMMENT '',
  umpirepoint text NOT NULL COMMENT '',
  affirmvoterids text NOT NULL COMMENT '',
  negavoterids text NOT NULL COMMENT '',
  affirmreplies mediumint(8) unsigned NOT NULL COMMENT '',
  negareplies mediumint(8) unsigned NOT NULL COMMENT '',
  PRIMARY KEY (tid) COMMENT '',
  KEY uid (uid,starttime COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_debatepost;
CREATE TABLE pre_forum_debatepost (
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  stand tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  voters mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  voterids text NOT NULL COMMENT '',
  PRIMARY KEY (pid) COMMENT '',
  KEY pid (pid,stand) COMMENT '',
  KEY tid (tid,uid COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_faq;
CREATE TABLE pre_forum_faq (
  id smallint(6) NOT NULL AUTO_INCREMENT COMMENT '',
  fpid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  identifier varchar(20) NOT NULL COMMENT '',
  keyword varchar(50) NOT NULL COMMENT '',
  title varchar(50) NOT NULL COMMENT '',
  message text NOT NULL COMMENT '',
  PRIMARY KEY (id) COMMENT '',
  KEY displayplay (displayorder)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_filter_post;
CREATE TABLE pre_forum_filter_post (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  postlength int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (tid,pid) COMMENT '',
  KEY tid (tid,postlength COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_forum;
CREATE TABLE pre_forum_forum (
  fid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  fup mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `type` enum('group','forum','sub') NOT NULL DEFAULT 'forum' COMMENT '',
  `name` char(50) NOT NULL DEFAULT '' COMMENT '',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  displayorder smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  styleid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  threads mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  posts mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  todayposts mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  yesterdayposts mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `rank` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  oldrank smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  lastpost char(110) NOT NULL DEFAULT '' COMMENT '',
  domain char(15) NOT NULL DEFAULT '' COMMENT '',
  allowsmilies tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowhtml tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowbbcode tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowimgcode tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowmediacode tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowanonymous tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowpostspecial smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  allowspecialonly tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  allowappend tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  alloweditrules tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowfeed tinyint(1) NOT NULL DEFAULT '1' COMMENT '',
  allowside tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  recyclebin tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  modnewposts tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  jammer tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  disablewatermark tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  inheritedmod tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  autoclose smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  forumcolumns tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '',
  catforumcolumns tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '',
  threadcaches tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  alloweditpost tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '',
  `simple` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  modworks tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  allowglobalstick tinyint(1) NOT NULL DEFAULT '1' COMMENT '',
  `level` smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  commoncredits int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  archive tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  recommend smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  favtimes mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  sharetimes mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  disablethumb tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  disablecollect tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (fid) COMMENT '',
  KEY forum (`status`,`type`,displayorder) COMMENT '',
  KEY fup_type (fup,`type`,displayorder) COMMENT '',
  KEY fup (fup)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_forum_threadtable;
CREATE TABLE pre_forum_forum_threadtable (
  fid smallint(6) unsigned NOT NULL COMMENT '',
  threadtableid smallint(6) unsigned NOT NULL COMMENT '',
  threads int(11) unsigned NOT NULL DEFAULT '0' COMMENT '',
  posts int(11) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (fid,threadtableid COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_forumfield;
CREATE TABLE pre_forum_forumfield (
  fid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  description text NOT NULL COMMENT '',
  `password` varchar(12) NOT NULL DEFAULT '' COMMENT '',
  icon varchar(255) NOT NULL DEFAULT '' COMMENT '',
  redirect varchar(255) NOT NULL DEFAULT '' COMMENT '',
  attachextensions varchar(255) NOT NULL DEFAULT '' COMMENT '',
  creditspolicy mediumtext NOT NULL COMMENT '',
  formulaperm text NOT NULL COMMENT '',
  moderators text NOT NULL COMMENT '',
  rules text NOT NULL COMMENT '',
  threadtypes text NOT NULL COMMENT '',
  threadsorts text NOT NULL COMMENT '',
  viewperm text NOT NULL COMMENT '',
  postperm text NOT NULL COMMENT '',
  replyperm text NOT NULL COMMENT '',
  getattachperm text NOT NULL COMMENT '',
  postattachperm text NOT NULL COMMENT '',
  postimageperm text NOT NULL COMMENT '',
  spviewperm text NOT NULL COMMENT '',
  seotitle text NOT NULL COMMENT '',
  keywords text NOT NULL COMMENT '',
  seodescription text NOT NULL COMMENT '',
  supe_pushsetting text NOT NULL COMMENT '',
  modrecommend text NOT NULL COMMENT '',
  threadplugin text NOT NULL COMMENT '',
  replybg text NOT NULL COMMENT '',
  extra text NOT NULL COMMENT '',
  jointype tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  gviewperm tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  membernum smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  lastupdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  activity int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  founderuid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  foundername varchar(255) NOT NULL DEFAULT '' COMMENT '',
  banner varchar(255) NOT NULL DEFAULT '' COMMENT '',
  groupnum smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  commentitem text NOT NULL COMMENT '',
  relatedgroup text NOT NULL COMMENT '',
  picstyle tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  widthauto tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  noantitheft tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  noforumhidewater tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  noforumrecommend tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  livetid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  price mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (fid) COMMENT '',
  KEY membernum (membernum) COMMENT '',
  KEY dateline (dateline) COMMENT '添加时间',
  KEY lastupdate (lastupdate) COMMENT '',
  KEY activity (activity)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_forumrecommend;
CREATE TABLE pre_forum_forumrecommend (
  fid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  tid mediumint(8) unsigned NOT NULL COMMENT '',
  typeid smallint(6) NOT NULL COMMENT '',
  displayorder tinyint(1) NOT NULL COMMENT '',
  `subject` char(80) NOT NULL COMMENT '',
  author char(15) NOT NULL COMMENT '',
  authorid mediumint(8) NOT NULL COMMENT '',
  moderatorid mediumint(8) NOT NULL COMMENT '',
  expiration int(10) unsigned NOT NULL COMMENT '',
  position tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  highlight tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  aid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  filename char(100) NOT NULL DEFAULT '' COMMENT '',
  PRIMARY KEY (tid) COMMENT '',
  KEY displayorder (fid,displayorder) COMMENT '',
  KEY position (position)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_groupcreditslog;
CREATE TABLE pre_forum_groupcreditslog (
  fid mediumint(8) unsigned NOT NULL COMMENT '',
  uid mediumint(8) unsigned NOT NULL COMMENT '',
  logdate int(8) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (fid,uid,logdate COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_groupfield;
CREATE TABLE pre_forum_groupfield (
  fid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  privacy tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `type` varchar(255) NOT NULL COMMENT '',
  `data` text NOT NULL COMMENT '',
  UNIQUE KEY `types` (fid,`type`) COMMENT '',
  KEY fid (fid) COMMENT '',
  KEY `type` (`type`)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_groupinvite;
CREATE TABLE pre_forum_groupinvite (
  fid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  inviteuid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  UNIQUE KEY ids (fid,inviteuid) COMMENT '',
  KEY dateline (datelin添加时间e)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_grouplevel;
CREATE TABLE pre_forum_grouplevel (
  levelid smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  `type` enum('special','default') NOT NULL DEFAULT 'default' COMMENT '',
  leveltitle varchar(255) NOT NULL DEFAULT '' COMMENT '',
  creditshigher int(10) NOT NULL DEFAULT '0' COMMENT '',
  creditslower int(10) NOT NULL DEFAULT '0' COMMENT '',
  icon varchar(255) NOT NULL DEFAULT '' COMMENT '',
  creditspolicy text NOT NULL COMMENT '',
  postpolicy text NOT NULL COMMENT '',
  specialswitch text NOT NULL COMMENT '',
  PRIMARY KEY (levelid) COMMENT '',
  KEY creditsrange (creditshigher,creditslower COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_groupuser;
CREATE TABLE pre_forum_groupuser (
  fid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username char(15) NOT NULL COMMENT '',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '',
  threads mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  replies mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  joindateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  lastupdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  privacy tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (fid,uid) COMMENT '',
  KEY uid_lastupdate (uid,lastupdate) COMMENT '',
  KEY userlist (fid,`level`,lastupdate COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_hotreply_member;
CREATE TABLE pre_forum_hotreply_member (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  attitude tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (pid,uid COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_hotreply_number;
CREATE TABLE pre_forum_hotreply_number (
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  support smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `against` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  total mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (pid) COMMENT '',
  KEY tid (tid,total COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_imagetype;
CREATE TABLE pre_forum_imagetype (
  typeid smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  available tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  `name` char(20) NOT NULL COMMENT '',
  `type` enum('smiley','icon','avatar') NOT NULL DEFAULT 'smiley' COMMENT '',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  `directory` char(100) NOT NULL COMMENT '',
  PRIMARY KEY (typeid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_medal;
CREATE TABLE pre_forum_medal (
  medalid smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '',
  available tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  image varchar(255) NOT NULL DEFAULT '' COMMENT '',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  description varchar(255) NOT NULL COMMENT '',
  expiration smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  permission mediumtext NOT NULL COMMENT '',
  credit tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  price mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (medalid) COMMENT '',
  KEY displayorder (displayorder) COMMENT '',
  KEY available (available,displayorder COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_medallog;
CREATE TABLE pre_forum_medallog (
  id mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  medalid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  expiration int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (id) COMMENT '',
  KEY `type` (`type`) COMMENT '',
  KEY `status` (`status`,expiration) COMMENT '',
  KEY uid (uid,medalid,`type`) COMMENT '',
  KEY dateline (datelin添加时间e)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_memberrecommend;
CREATE TABLE pre_forum_memberrecommend (
  tid mediumint(8) unsigned NOT NULL COMMENT '',
  recommenduid mediumint(8) unsigned NOT NULL COMMENT '',
  dateline int(10) unsigned NOT NULL COMMENT '添加时间',
  KEY tid (tid) COMMENT '',
  KEY uid (recommenduid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_moderator;
CREATE TABLE pre_forum_moderator (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  fid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  inherited tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (uid,fid COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_modwork;
CREATE TABLE pre_forum_modwork (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  modaction char(3) NOT NULL DEFAULT '' COMMENT '',
  dateline date NOT NULL DEFAULT '2006-01-01' COMMENT '添加时间',
  count smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  posts smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  KEY uid (uid,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_newthread;
CREATE TABLE pre_forum_newthread (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  fid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (tid) COMMENT '',
  KEY fid (fid) COMMENT '',
  KEY dateline (datelin添加时间e)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_onlinelist;
CREATE TABLE pre_forum_onlinelist (
  groupid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  title varchar(30) NOT NULL DEFAULT '' COMMENT '',
  url varchar(30) NOT NULL DEFAULT ''
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_order;
CREATE TABLE pre_forum_order (
  orderid char(32) NOT NULL DEFAULT '' COMMENT '',
  `status` char(3) NOT NULL DEFAULT '' COMMENT '',
  buyer char(50) NOT NULL DEFAULT '' COMMENT '',
  admin char(15) NOT NULL DEFAULT '' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  amount int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  price float(7,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '',
  submitdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  confirmdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  email char(40) NOT NULL DEFAULT '' COMMENT '',
  ip char(15) NOT NULL DEFAULT '' COMMENT '',
  UNIQUE KEY orderid (orderid) COMMENT '',
  KEY submitdate (submitdate) COMMENT '',
  KEY uid (uid,submitdate COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_poll;
CREATE TABLE pre_forum_poll (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  overt tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  multiple tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  visible tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  maxchoices tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '',
  isimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  expiration int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  pollpreview varchar(255) NOT NULL DEFAULT '' COMMENT '',
  voters mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (tid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_polloption;
CREATE TABLE pre_forum_polloption (
  polloptionid int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  votes mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  polloption varchar(80) NOT NULL DEFAULT '' COMMENT '',
  voterids mediumtext NOT NULL COMMENT '',
  PRIMARY KEY (polloptionid) COMMENT '',
  KEY tid (tid,displayorder COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_polloption_image;
CREATE TABLE pre_forum_polloption_image (
  aid int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  poid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '',
  filesize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  attachment varchar(255) NOT NULL DEFAULT '' COMMENT '',
  remote tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  width smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  thumb tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (aid) COMMENT '',
  KEY poid (poid) COMMENT '',
  KEY tid (tid) COMMENT '',
  KEY uid (uid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_pollvoter;
CREATE TABLE pre_forum_pollvoter (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  `options` text NOT NULL COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  KEY tid (tid) COMMENT '',
  KEY uid (uid,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_post;
CREATE TABLE pre_forum_post (
  pid int(10) unsigned NOT NULL COMMENT '',
  fid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `first` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  author varchar(15) NOT NULL DEFAULT '' COMMENT '',
  authorid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `subject` varchar(80) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  message mediumtext NOT NULL COMMENT '',
  useip varchar(15) NOT NULL DEFAULT '' COMMENT '',
  `port` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  invisible tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  anonymous tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  usesig tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  htmlon tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  bbcodeoff tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  smileyoff tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  parseurloff tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  attachment tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  rate smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  ratetimes tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `status` int(10) NOT NULL DEFAULT '0' COMMENT '',
  tags varchar(255) NOT NULL DEFAULT '0' COMMENT '',
  `comment` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  replycredit int(10) NOT NULL DEFAULT '0' COMMENT '',
  position int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  PRIMARY KEY (tid,position) COMMENT '',
  UNIQUE KEY pid (pid) COMMENT '',
  KEY fid (fid) COMMENT '',
  KEY authorid (authorid,invisible) COMMENT '',
  KEY dateline (dateline) COMMENT '添加时间',
  KEY invisible (invisible) COMMENT '',
  KEY displayorder (tid,invisible,dateline) COMMENT '添加时间',
  KEY `first` (tid,`first` COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_post_location;
CREATE TABLE pre_forum_post_location (
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  tid mediumint(8) unsigned DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned DEFAULT '0' COMMENT '',
  mapx varchar(255) NOT NULL COMMENT '',
  mapy varchar(255) NOT NULL COMMENT '',
  location varchar(255) NOT NULL COMMENT '',
  PRIMARY KEY (pid) COMMENT '',
  KEY tid (tid) COMMENT '',
  KEY uid (uid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_post_moderate;
CREATE TABLE pre_forum_post_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (id) COMMENT '',
  KEY `status` (`status`,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_post_tableid;
CREATE TABLE pre_forum_post_tableid (
  pid int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  PRIMARY KEY (pid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_postcache;
CREATE TABLE pre_forum_postcache (
  pid int(10) unsigned NOT NULL COMMENT '',
  `comment` text NOT NULL COMMENT '',
  rate text NOT NULL COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (pid) COMMENT '',
  KEY dateline (datelin添加时间e)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_postcomment;
CREATE TABLE pre_forum_postcomment (
  id int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  author varchar(15) NOT NULL DEFAULT '' COMMENT '',
  authorid mediumint(8) NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT '',
  score tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  useip varchar(15) NOT NULL DEFAULT '' COMMENT '',
  `port` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  rpid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (id) COMMENT '',
  KEY tid (tid) COMMENT '',
  KEY authorid (authorid) COMMENT '',
  KEY score (score) COMMENT '',
  KEY rpid (rpid) COMMENT '',
  KEY pid (pid,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_postlog;
CREATE TABLE pre_forum_postlog (
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  fid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `action` char(10) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (pid,tid) COMMENT '',
  KEY fid (fid) COMMENT '',
  KEY uid (uid) COMMENT '',
  KEY dateline (datelin添加时间e)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_poststick;
CREATE TABLE pre_forum_poststick (
  tid mediumint(8) unsigned NOT NULL COMMENT '',
  pid int(10) unsigned NOT NULL COMMENT '',
  position int(10) unsigned NOT NULL COMMENT '',
  dateline int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (tid,pid) COMMENT '',
  KEY dateline (tid,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_promotion;
CREATE TABLE pre_forum_promotion (
  ip char(15) NOT NULL DEFAULT '' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username char(15) NOT NULL DEFAULT '' COMMENT '',
  PRIMARY KEY (ip)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_ratelog;
CREATE TABLE pre_forum_ratelog (
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username char(15) NOT NULL DEFAULT '' COMMENT '',
  extcredits tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  score smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  reason char(40) NOT NULL DEFAULT '' COMMENT '',
  KEY pid (pid,dateline) COMMENT '添加时间',
  KEY dateline (dateline) COMMENT '添加时间',
  KEY uid (uid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_relatedthread;
CREATE TABLE pre_forum_relatedthread (
  tid mediumint(8) NOT NULL DEFAULT '0' COMMENT '',
  `type` enum('general','trade') NOT NULL DEFAULT 'general' COMMENT '',
  expiration int(10) NOT NULL DEFAULT '0' COMMENT '',
  keywords varchar(255) NOT NULL DEFAULT '' COMMENT '',
  relatedthreads text NOT NULL COMMENT '',
  PRIMARY KEY (tid,`type` COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_replycredit;
CREATE TABLE pre_forum_replycredit (
  tid mediumint(6) unsigned NOT NULL COMMENT '',
  extcredits mediumint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  extcreditstype tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  times smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  membertimes smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  random tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (tid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_rsscache;
CREATE TABLE pre_forum_rsscache (
  lastupdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  fid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  forum char(50) NOT NULL DEFAULT '' COMMENT '',
  author char(15) NOT NULL DEFAULT '' COMMENT '',
  `subject` char(80) NOT NULL DEFAULT '' COMMENT '',
  description char(255) NOT NULL DEFAULT '' COMMENT '',
  guidetype char(10) NOT NULL DEFAULT '' COMMENT '',
  UNIQUE KEY tid (tid) COMMENT '',
  KEY fid (fid,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_sofa;
CREATE TABLE pre_forum_sofa (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  fid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (tid) COMMENT '',
  KEY ftid (fid,tid COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_spacecache;
CREATE TABLE pre_forum_spacecache (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  variable varchar(20) NOT NULL COMMENT '',
  `value` text NOT NULL COMMENT '',
  expiration int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (uid,variable COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_statlog;
CREATE TABLE pre_forum_statlog (
  logdate date NOT NULL COMMENT '',
  fid mediumint(8) unsigned NOT NULL COMMENT '',
  `type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `value` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (logdate,fid COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_thread;
CREATE TABLE pre_forum_thread (
  tid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  fid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  posttableid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  typeid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  sortid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  readperm tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '',
  price smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  author char(15) NOT NULL DEFAULT '' COMMENT '',
  authorid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `subject` char(80) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  lastpost int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  lastposter char(15) NOT NULL DEFAULT '' COMMENT '',
  views int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  replies mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  displayorder tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  highlight tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  digest tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  rate tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  special tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  attachment tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  moderated tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  closed mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  stickreply tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  recommends smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  recommend_add smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  recommend_sub smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  heats int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `status` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  isgroup tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  favtimes mediumint(8) NOT NULL DEFAULT '0' COMMENT '',
  sharetimes mediumint(8) NOT NULL DEFAULT '0' COMMENT '',
  stamp tinyint(3) NOT NULL DEFAULT '-1' COMMENT '',
  icon tinyint(3) NOT NULL DEFAULT '-1' COMMENT '',
  pushedaid mediumint(8) NOT NULL DEFAULT '0' COMMENT '',
  cover smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  replycredit smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  relatebytag char(255) NOT NULL DEFAULT '0' COMMENT '',
  maxposition int(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  bgcolor char(8) NOT NULL DEFAULT '' COMMENT '',
  comments int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  hidden smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (tid) COMMENT '',
  KEY digest (digest) COMMENT '',
  KEY sortid (sortid) COMMENT '',
  KEY displayorder (fid,displayorder,lastpost) COMMENT '',
  KEY typeid (fid,typeid,displayorder,lastpost) COMMENT '',
  KEY recommends (recommends) COMMENT '',
  KEY heats (heats) COMMENT '',
  KEY authorid (authorid) COMMENT '',
  KEY isgroup (isgroup,lastpost) COMMENT '',
  KEY special (special)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_thread_moderate;
CREATE TABLE pre_forum_thread_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (id) COMMENT '',
  KEY `status` (`status`,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_threadaddviews;
CREATE TABLE pre_forum_threadaddviews (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  addviews int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (tid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_threadcalendar;
CREATE TABLE pre_forum_threadcalendar (
  cid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  fid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  hotnum int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (cid) COMMENT '',
  KEY fid (fid,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_threadclass;
CREATE TABLE pre_forum_threadclass (
  typeid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  fid mediumint(8) unsigned NOT NULL COMMENT '',
  `name` varchar(255) NOT NULL COMMENT '',
  displayorder mediumint(9) NOT NULL COMMENT '',
  icon varchar(255) NOT NULL COMMENT '',
  moderators tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (typeid) COMMENT '',
  KEY fid (fid,displayorder COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_threadclosed;
CREATE TABLE pre_forum_threadclosed (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  redirect mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (tid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_threaddisablepos;
CREATE TABLE pre_forum_threaddisablepos (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (tid)
) TYPE=HEAP;

DROP TABLE IF EXISTS pre_forum_threadhidelog;
CREATE TABLE pre_forum_threadhidelog (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  UNIQUE KEY uid (tid,uid COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_threadhot;
CREATE TABLE pre_forum_threadhot (
  cid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  fid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (cid,tid) COMMENT '',
  KEY fid (fid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_threadimage;
CREATE TABLE pre_forum_threadimage (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  attachment varchar(255) NOT NULL DEFAULT '' COMMENT '',
  remote tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  KEY tid (tid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_threadlog;
CREATE TABLE pre_forum_threadlog (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  fid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  otherid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `action` char(10) NOT NULL COMMENT '',
  expiry int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (tid,fid,uid) COMMENT '',
  KEY dateline (datelin添加时间e)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_threadmod;
CREATE TABLE pre_forum_threadmod (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username char(15) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  expiration int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `action` char(5) NOT NULL DEFAULT '' COMMENT '',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  magicid smallint(6) unsigned NOT NULL COMMENT '',
  stamp tinyint(3) NOT NULL COMMENT '',
  reason char(40) NOT NULL DEFAULT '' COMMENT '',
  KEY tid (tid,dateline) COMMENT '添加时间',
  KEY expiration (expiration,`status` COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_threadpartake;
CREATE TABLE pre_forum_threadpartake (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  KEY tid (tid,uid COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_threadpreview;
CREATE TABLE pre_forum_threadpreview (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `relay` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  content text NOT NULL COMMENT '',
  PRIMARY KEY (tid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_threadprofile;
CREATE TABLE pre_forum_threadprofile (
  id mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  `name` char(100) NOT NULL DEFAULT '' COMMENT '',
  template text NOT NULL COMMENT '',
  `global` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (id) COMMENT '',
  KEY `global` (`global`)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_threadprofile_group;
CREATE TABLE pre_forum_threadprofile_group (
  gid mediumint(8) NOT NULL COMMENT '',
  tpid mediumint(8) unsigned NOT NULL COMMENT '',
  PRIMARY KEY (gid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_threadrush;
CREATE TABLE pre_forum_threadrush (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  stopfloor mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  starttimefrom int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  starttimeto int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  rewardfloor text NOT NULL COMMENT '',
  creditlimit int(10) NOT NULL DEFAULT '-996' COMMENT '',
  replylimit smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (tid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_threadtype;
CREATE TABLE pre_forum_threadtype (
  typeid smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  fid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  displayorder smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '',
  description varchar(255) NOT NULL DEFAULT '' COMMENT '',
  icon varchar(255) NOT NULL DEFAULT '' COMMENT '',
  special smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  modelid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  expiration tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  template text NOT NULL COMMENT '',
  stemplate text NOT NULL COMMENT '',
  ptemplate text NOT NULL COMMENT '',
  btemplate text NOT NULL COMMENT '',
  PRIMARY KEY (typeid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_trade;
CREATE TABLE pre_forum_trade (
  tid mediumint(8) unsigned NOT NULL COMMENT '',
  pid int(10) unsigned NOT NULL COMMENT '',
  typeid smallint(6) unsigned NOT NULL COMMENT '',
  sellerid mediumint(8) unsigned NOT NULL COMMENT '',
  seller char(15) NOT NULL COMMENT '',
  account char(50) NOT NULL COMMENT '',
  tenpayaccount char(20) NOT NULL DEFAULT '' COMMENT '',
  `subject` char(100) NOT NULL COMMENT '',
  price decimal(8,2) NOT NULL COMMENT '',
  amount smallint(6) unsigned NOT NULL DEFAULT '1' COMMENT '',
  quality tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  locus char(20) NOT NULL COMMENT '',
  transport tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  ordinaryfee smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '',
  expressfee smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '',
  emsfee smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '',
  itemtype tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  expiration int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  lastbuyer char(15) NOT NULL COMMENT '',
  lastupdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  totalitems smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '',
  tradesum decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '',
  closed tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  aid mediumint(8) unsigned NOT NULL COMMENT '',
  displayorder tinyint(1) NOT NULL COMMENT '',
  costprice decimal(8,2) NOT NULL COMMENT '',
  credit int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  costcredit int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  credittradesum int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (tid,pid) COMMENT '',
  KEY pid (pid) COMMENT '',
  KEY sellerid (sellerid) COMMENT '',
  KEY totalitems (totalitems) COMMENT '',
  KEY tradesum (tradesum) COMMENT '',
  KEY displayorder (tid,displayorder) COMMENT '',
  KEY sellertrades (sellerid,tradesum,totalitems) COMMENT '',
  KEY typeid (typeid) COMMENT '',
  KEY credittradesum (credittradesum) COMMENT '',
  KEY expiration (expiration)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_tradecomment;
CREATE TABLE pre_forum_tradecomment (
  id mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '',
  orderid char(32) NOT NULL COMMENT '',
  pid int(10) unsigned NOT NULL COMMENT '',
  `type` tinyint(1) NOT NULL COMMENT '',
  raterid mediumint(8) unsigned NOT NULL COMMENT '',
  rater char(15) NOT NULL COMMENT '',
  rateeid mediumint(8) unsigned NOT NULL COMMENT '',
  ratee char(15) NOT NULL COMMENT '',
  message char(200) NOT NULL COMMENT '',
  explanation char(200) NOT NULL COMMENT '',
  score tinyint(1) NOT NULL COMMENT '',
  dateline int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (id) COMMENT '',
  KEY raterid (raterid,`type`,dateline) COMMENT '添加时间',
  KEY rateeid (rateeid,`type`,dateline) COMMENT '添加时间',
  KEY orderid (orderid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_tradelog;
CREATE TABLE pre_forum_tradelog (
  tid mediumint(8) unsigned NOT NULL COMMENT '',
  pid int(10) unsigned NOT NULL COMMENT '',
  orderid varchar(32) NOT NULL COMMENT '',
  tradeno varchar(32) NOT NULL COMMENT '',
  paytype tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `subject` varchar(100) NOT NULL COMMENT '',
  price decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '',
  quality tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  itemtype tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  number smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '',
  tax decimal(6,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '',
  locus varchar(100) NOT NULL COMMENT '',
  sellerid mediumint(8) unsigned NOT NULL COMMENT '',
  seller varchar(15) NOT NULL COMMENT '',
  selleraccount varchar(50) NOT NULL COMMENT '',
  tenpayaccount varchar(20) NOT NULL DEFAULT '0' COMMENT '',
  buyerid mediumint(8) unsigned NOT NULL COMMENT '',
  buyer varchar(15) NOT NULL COMMENT '',
  buyercontact varchar(50) NOT NULL COMMENT '',
  buyercredits smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '',
  buyermsg varchar(200) DEFAULT NULL COMMENT '',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  lastupdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  offline tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  buyername varchar(50) NOT NULL COMMENT '',
  buyerzip varchar(10) NOT NULL COMMENT '',
  buyerphone varchar(20) NOT NULL COMMENT '',
  buyermobile varchar(20) NOT NULL COMMENT '',
  transport tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  transportfee smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  baseprice decimal(8,2) NOT NULL COMMENT '',
  discount tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  ratestatus tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  message text NOT NULL COMMENT '',
  credit int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  basecredit int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  UNIQUE KEY orderid (orderid) COMMENT '',
  KEY sellerid (sellerid) COMMENT '',
  KEY buyerid (buyerid) COMMENT '',
  KEY `status` (`status`) COMMENT '',
  KEY buyerlog (buyerid,`status`,lastupdate) COMMENT '',
  KEY sellerlog (sellerid,`status`,lastupdate) COMMENT '',
  KEY tid (tid,pid) COMMENT '',
  KEY pid (pid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_typeoption;
CREATE TABLE pre_forum_typeoption (
  optionid smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  classid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  expiration tinyint(1) NOT NULL COMMENT '',
  protect varchar(255) NOT NULL COMMENT '',
  title varchar(255) NOT NULL DEFAULT '' COMMENT '',
  description varchar(255) NOT NULL DEFAULT '' COMMENT '',
  identifier varchar(255) NOT NULL DEFAULT '' COMMENT '',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '',
  unit varchar(255) NOT NULL COMMENT '',
  rules mediumtext NOT NULL COMMENT '',
  permprompt mediumtext NOT NULL COMMENT '',
  PRIMARY KEY (optionid) COMMENT '',
  KEY classid (classid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_typeoptionvar;
CREATE TABLE pre_forum_typeoptionvar (
  sortid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  fid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  optionid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  expiration int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `value` mediumtext NOT NULL COMMENT '',
  KEY sortid (sortid) COMMENT '',
  KEY tid (tid) COMMENT '',
  KEY fid (fid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_typevar;
CREATE TABLE pre_forum_typevar (
  sortid smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  optionid smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  available tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  required tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  unchangeable tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  search tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  subjectshow tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  UNIQUE KEY optionid (sortid,optionid) COMMENT '',
  KEY sortid (sortid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_forum_warning;
CREATE TABLE pre_forum_warning (
  wid int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  pid int(10) unsigned NOT NULL COMMENT '',
  operatorid mediumint(8) unsigned NOT NULL COMMENT '',
  operator char(15) NOT NULL COMMENT '',
  authorid mediumint(8) unsigned NOT NULL COMMENT '',
  author char(15) NOT NULL COMMENT '',
  dateline int(10) unsigned NOT NULL COMMENT '添加时间',
  reason char(40) NOT NULL COMMENT '',
  PRIMARY KEY (wid) COMMENT '',
  UNIQUE KEY pid (pid) COMMENT '',
  KEY authorid (authorid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_album;
CREATE TABLE pre_home_album (
  albumid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  albumname varchar(50) NOT NULL DEFAULT '' COMMENT '',
  catid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  updatetime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  picnum smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  pic varchar(255) NOT NULL DEFAULT '' COMMENT '',
  picflag tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  friend tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  `password` varchar(10) NOT NULL DEFAULT '' COMMENT '',
  target_ids text NOT NULL COMMENT '',
  favtimes mediumint(8) unsigned NOT NULL COMMENT '',
  sharetimes mediumint(8) unsigned NOT NULL COMMENT '',
  depict text NOT NULL COMMENT '',
  PRIMARY KEY (albumid) COMMENT '',
  KEY uid (uid,updatetime) COMMENT '',
  KEY updatetime (updatetime)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_album_category;
CREATE TABLE pre_home_album_category (
  catid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  upid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  catname varchar(255) NOT NULL DEFAULT '' COMMENT '',
  num mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  displayorder smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (catid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_appcreditlog;
CREATE TABLE pre_home_appcreditlog (
  logid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  appid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  appname varchar(60) NOT NULL DEFAULT '' COMMENT '',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  credit mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  note text NOT NULL COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (logid) COMMENT '',
  KEY uid (uid,dateline) COMMENT '添加时间',
  KEY appid (appid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_blacklist;
CREATE TABLE pre_home_blacklist (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  buid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (uid,buid) COMMENT '',
  KEY uid (uid,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_blog;
CREATE TABLE pre_home_blog (
  blogid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username char(15) NOT NULL DEFAULT '' COMMENT '',
  `subject` char(80) NOT NULL DEFAULT '' COMMENT '',
  classid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  catid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  viewnum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  replynum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  hot mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  picflag tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  noreply tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  friend tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  `password` char(10) NOT NULL DEFAULT '' COMMENT '',
  favtimes mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  sharetimes mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  click1 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  click2 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  click3 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  click4 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  click5 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  click6 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  click7 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  click8 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (blogid) COMMENT '',
  KEY uid (uid,dateline) COMMENT '添加时间',
  KEY hot (hot) COMMENT '',
  KEY dateline (datelin添加时间e)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_blog_category;
CREATE TABLE pre_home_blog_category (
  catid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  upid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  catname varchar(255) NOT NULL DEFAULT '' COMMENT '',
  num mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  displayorder smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (catid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_blog_moderate;
CREATE TABLE pre_home_blog_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (id) COMMENT '',
  KEY `status` (`status`,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_blogfield;
CREATE TABLE pre_home_blogfield (
  blogid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  pic varchar(255) NOT NULL DEFAULT '' COMMENT '',
  tag varchar(255) NOT NULL DEFAULT '' COMMENT '',
  message mediumtext NOT NULL COMMENT '',
  postip varchar(255) NOT NULL DEFAULT '' COMMENT '',
  `port` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  related text NOT NULL COMMENT '',
  relatedtime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  target_ids text NOT NULL COMMENT '',
  hotuser text NOT NULL COMMENT '',
  magiccolor tinyint(6) NOT NULL DEFAULT '0' COMMENT '',
  magicpaper tinyint(6) NOT NULL DEFAULT '0' COMMENT '',
  pushedaid mediumint(8) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (blogid) COMMENT '',
  KEY uid (uid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_class;
CREATE TABLE pre_home_class (
  classid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  classname char(40) NOT NULL DEFAULT '' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (classid) COMMENT '',
  KEY uid (uid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_click;
CREATE TABLE pre_home_click (
  clickid smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  `name` char(50) NOT NULL DEFAULT '' COMMENT '',
  icon char(100) NOT NULL DEFAULT '' COMMENT '',
  idtype char(15) NOT NULL DEFAULT '' COMMENT '',
  available tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  displayorder tinyint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (clickid) COMMENT '',
  KEY idtype (idtype,displayorder COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_clickuser;
CREATE TABLE pre_home_clickuser (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  id mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  idtype varchar(15) NOT NULL DEFAULT '' COMMENT '',
  clickid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  KEY id (id,idtype,dateline) COMMENT '添加时间',
  KEY uid (uid,idtype,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_comment;
CREATE TABLE pre_home_comment (
  cid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  id mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  idtype varchar(20) NOT NULL DEFAULT '' COMMENT '',
  authorid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  author varchar(15) NOT NULL DEFAULT '' COMMENT '',
  ip varchar(20) NOT NULL DEFAULT '' COMMENT '',
  `port` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  message text NOT NULL COMMENT '',
  magicflicker tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (cid) COMMENT '',
  KEY authorid (authorid,idtype) COMMENT '',
  KEY id (id,idtype,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_comment_moderate;
CREATE TABLE pre_home_comment_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  idtype varchar(15) NOT NULL DEFAULT '' COMMENT '',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (id) COMMENT '',
  KEY idtype (idtype,`status`,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_docomment;
CREATE TABLE pre_home_docomment (
  id int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  upid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  doid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  message text NOT NULL COMMENT '',
  ip varchar(20) NOT NULL DEFAULT '' COMMENT '',
  grade smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (id) COMMENT '',
  KEY doid (doid,dateline) COMMENT '添加时间',
  KEY dateline (datelin添加时间e)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_doing;
CREATE TABLE pre_home_doing (
  doid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  `from` varchar(20) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  message text NOT NULL COMMENT '',
  ip varchar(20) NOT NULL DEFAULT '' COMMENT '',
  `port` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  replynum int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (doid) COMMENT '',
  KEY uid (uid,dateline) COMMENT '添加时间',
  KEY dateline (datelin添加时间e)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_doing_moderate;
CREATE TABLE pre_home_doing_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (id) COMMENT '',
  KEY `status` (`status`,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_favorite;
CREATE TABLE pre_home_favorite (
  favid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  id mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  idtype varchar(255) NOT NULL DEFAULT '' COMMENT '',
  spaceuid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  title varchar(255) NOT NULL DEFAULT '' COMMENT '',
  description text NOT NULL COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (favid) COMMENT '',
  KEY idtype (id,idtype) COMMENT '',
  KEY uid (uid,idtype,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_feed;
CREATE TABLE pre_home_feed (
  feedid int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  appid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  icon varchar(30) NOT NULL DEFAULT '' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  friend tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
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
  id mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  idtype varchar(15) NOT NULL DEFAULT '' COMMENT '',
  hot mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (feedid) COMMENT '',
  KEY uid (uid,dateline) COMMENT '添加时间',
  KEY dateline (dateline) COMMENT '添加时间',
  KEY hot (hot) COMMENT '',
  KEY id (id,idtype COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_feed_app;
CREATE TABLE pre_home_feed_app (
  feedid int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  appid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  icon varchar(30) NOT NULL DEFAULT '' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  friend tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
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
  PRIMARY KEY (feedid) COMMENT '',
  KEY uid (uid,dateline) COMMENT '添加时间',
  KEY dateline (datelin添加时间e)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_follow;
CREATE TABLE pre_home_follow (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username char(15) NOT NULL DEFAULT '' COMMENT '',
  followuid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  fusername char(15) NOT NULL DEFAULT '' COMMENT '',
  bkname varchar(255) NOT NULL DEFAULT '' COMMENT '',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  mutual tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (uid,followuid COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_follow_feed;
CREATE TABLE pre_home_follow_feed (
  feedid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  note text NOT NULL COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (feedid) COMMENT '',
  KEY uid (uid,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_follow_feed_archiver;
CREATE TABLE pre_home_follow_feed_archiver (
  feedid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  note text NOT NULL COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (feedid) COMMENT '',
  KEY uid (uid,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_friend;
CREATE TABLE pre_home_friend (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  fuid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  fusername varchar(15) NOT NULL DEFAULT '' COMMENT '',
  gid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  num mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  note varchar(255) NOT NULL DEFAULT '' COMMENT '',
  PRIMARY KEY (uid,fuid) COMMENT '',
  KEY fuid (fuid) COMMENT '',
  KEY uid (uid,num,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_friend_request;
CREATE TABLE pre_home_friend_request (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  fuid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  fusername char(15) NOT NULL DEFAULT '' COMMENT '',
  gid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  note char(60) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (uid,fuid) COMMENT '',
  KEY fuid (fuid) COMMENT '',
  KEY dateline (uid,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_friendlog;
CREATE TABLE pre_home_friendlog (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  fuid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `action` varchar(10) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (uid,fuid COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_notification;
CREATE TABLE pre_home_notification (
  id mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '',
  `new` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  authorid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  author varchar(15) NOT NULL DEFAULT '' COMMENT '',
  note text NOT NULL COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  from_id mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  from_idtype varchar(20) NOT NULL DEFAULT '' COMMENT '',
  from_num mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  category tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (id) COMMENT '',
  KEY uid (uid,`new`) COMMENT '',
  KEY category (uid,category,dateline) COMMENT '添加时间',
  KEY by_type (uid,`type`,dateline) COMMENT '添加时间',
  KEY from_id (from_id,from_idtype COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_pic;
CREATE TABLE pre_home_pic (
  picid mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '',
  albumid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  postip varchar(255) NOT NULL DEFAULT '' COMMENT '',
  `port` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '',
  title varchar(255) NOT NULL DEFAULT '' COMMENT '',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '',
  size int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  filepath varchar(255) NOT NULL DEFAULT '' COMMENT '',
  thumb tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  remote tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  hot mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  sharetimes mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  click1 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  click2 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  click3 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  click4 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  click5 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  click6 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  click7 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  click8 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  magicframe tinyint(6) NOT NULL DEFAULT '0' COMMENT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (picid) COMMENT '',
  KEY uid (uid) COMMENT '',
  KEY albumid (albumid,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_pic_moderate;
CREATE TABLE pre_home_pic_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (id) COMMENT '',
  KEY `status` (`status`,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_picfield;
CREATE TABLE pre_home_picfield (
  picid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  hotuser text NOT NULL COMMENT '',
  PRIMARY KEY (picid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_poke;
CREATE TABLE pre_home_poke (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  fromuid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  fromusername varchar(15) NOT NULL DEFAULT '' COMMENT '',
  note varchar(255) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  iconid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (uid,fromuid) COMMENT '',
  KEY uid (uid,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_pokearchive;
CREATE TABLE pre_home_pokearchive (
  pid mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '',
  pokeuid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  fromuid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  note varchar(255) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  iconid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (pid) COMMENT '',
  KEY pokeuid (pokeuid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_share;
CREATE TABLE pre_home_share (
  sid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  itemid mediumint(8) unsigned NOT NULL COMMENT '',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  fromuid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  title_template text NOT NULL COMMENT '',
  body_template text NOT NULL COMMENT '',
  body_data text NOT NULL COMMENT '',
  body_general text NOT NULL COMMENT '',
  image varchar(255) NOT NULL DEFAULT '' COMMENT '',
  image_link varchar(255) NOT NULL DEFAULT '' COMMENT '',
  hot mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  hotuser text NOT NULL COMMENT '',
  `status` tinyint(1) NOT NULL COMMENT '',
  PRIMARY KEY (sid) COMMENT '',
  KEY uid (uid,dateline) COMMENT '添加时间',
  KEY hot (hot) COMMENT '',
  KEY dateline (datelin添加时间e)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_share_moderate;
CREATE TABLE pre_home_share_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (id) COMMENT '',
  KEY `status` (`status`,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_show;
CREATE TABLE pre_home_show (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  unitprice int(10) unsigned NOT NULL DEFAULT '1' COMMENT '',
  credit int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  note varchar(100) NOT NULL DEFAULT '' COMMENT '',
  PRIMARY KEY (uid) COMMENT '',
  KEY unitprice (unitprice) COMMENT '',
  KEY credit (credit)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_specialuser;
CREATE TABLE pre_home_specialuser (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  reason text NOT NULL COMMENT '',
  opuid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  opusername varchar(15) NOT NULL DEFAULT '' COMMENT '',
  displayorder mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  KEY uid (uid,`status`) COMMENT '',
  KEY displayorder (`status`,displayorder COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_userapp;
CREATE TABLE pre_home_userapp (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  appid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  appname varchar(60) NOT NULL DEFAULT '' COMMENT '',
  privacy tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowsidenav tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowfeed tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowprofilelink tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  narrow tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  menuorder smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  displayorder smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  KEY uid (uid,appid) COMMENT '',
  KEY menuorder (uid,menuorder) COMMENT '',
  KEY displayorder (uid,displayorder COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_userappfield;
CREATE TABLE pre_home_userappfield (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  appid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  profilelink text NOT NULL COMMENT '',
  myml text NOT NULL COMMENT '',
  KEY uid (uid,appid COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_home_visitor;
CREATE TABLE pre_home_visitor (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  vuid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  vusername char(15) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (uid,vuid) COMMENT '',
  KEY vuid (vuid) COMMENT '',
  KEY dateline (datelin添加时间e)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_mobile_setting;
CREATE TABLE pre_mobile_setting (
  skey varchar(255) NOT NULL DEFAULT '' COMMENT '',
  svalue text NOT NULL COMMENT '',
  PRIMARY KEY (skey)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_portal_article_content;
CREATE TABLE pre_portal_article_content (
  cid int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  aid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  idtype varchar(255) NOT NULL DEFAULT '' COMMENT '',
  title varchar(255) NOT NULL DEFAULT '' COMMENT '',
  content text NOT NULL COMMENT '',
  pageorder smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (cid) COMMENT '',
  KEY aid (aid,pageorder) COMMENT '',
  KEY pageorder (pageorder)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_portal_article_count;
CREATE TABLE pre_portal_article_count (
  aid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  catid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  viewnum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  commentnum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  favtimes mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  sharetimes mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (aid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_portal_article_moderate;
CREATE TABLE pre_portal_article_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (id) COMMENT '',
  KEY `status` (`status`,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_portal_article_related;
CREATE TABLE pre_portal_article_related (
  aid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  raid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  displayorder mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (aid,raid) COMMENT '',
  KEY aid (aid,displayorder COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_portal_article_title;
CREATE TABLE pre_portal_article_title (
  aid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  catid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  bid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username varchar(255) NOT NULL DEFAULT '' COMMENT '',
  title varchar(255) NOT NULL DEFAULT '' COMMENT '',
  highlight varchar(255) NOT NULL DEFAULT '' COMMENT '',
  author varchar(255) NOT NULL DEFAULT '' COMMENT '',
  `from` varchar(255) NOT NULL DEFAULT '' COMMENT '',
  fromurl varchar(255) NOT NULL DEFAULT '' COMMENT '',
  url varchar(255) NOT NULL DEFAULT '' COMMENT '',
  summary varchar(255) NOT NULL DEFAULT '' COMMENT '',
  pic varchar(255) NOT NULL DEFAULT '' COMMENT '',
  thumb tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  remote tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  idtype varchar(255) NOT NULL DEFAULT '' COMMENT '',
  contents smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  allowcomment tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  owncomment tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  click1 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  click2 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  click3 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  click4 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  click5 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  click6 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  click7 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  click8 smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  tag tinyint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  showinnernav tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  preaid mediumint(8) unsigned NOT NULL COMMENT '',
  nextaid mediumint(8) unsigned NOT NULL COMMENT '',
  htmlmade tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  htmlname varchar(255) NOT NULL DEFAULT '' COMMENT '',
  htmldir varchar(255) NOT NULL DEFAULT '' COMMENT '',
  PRIMARY KEY (aid) COMMENT '',
  KEY catid (catid,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_portal_article_trash;
CREATE TABLE pre_portal_article_trash (
  aid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  content text NOT NULL COMMENT '',
  PRIMARY KEY (aid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_portal_attachment;
CREATE TABLE pre_portal_attachment (
  attachid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '',
  filetype varchar(255) NOT NULL DEFAULT '' COMMENT '',
  filesize int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  attachment varchar(255) NOT NULL DEFAULT '' COMMENT '',
  isimage tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  thumb tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  remote tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  aid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (attachid) COMMENT '',
  KEY aid (aid,attachid COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_portal_category;
CREATE TABLE pre_portal_category (
  catid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  upid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  catname varchar(255) NOT NULL DEFAULT '' COMMENT '',
  articles mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  allowcomment tinyint(1) NOT NULL DEFAULT '1' COMMENT '',
  displayorder smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  notinheritedarticle tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  notinheritedblock tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  domain varchar(255) NOT NULL DEFAULT '' COMMENT '',
  url varchar(255) NOT NULL DEFAULT '' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username varchar(255) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  closed tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  shownav tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  description text NOT NULL COMMENT '',
  seotitle text NOT NULL COMMENT '',
  keyword text NOT NULL COMMENT '',
  primaltplname varchar(255) NOT NULL DEFAULT '' COMMENT '',
  articleprimaltplname varchar(255) NOT NULL DEFAULT '' COMMENT '',
  disallowpublish tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  foldername varchar(255) NOT NULL DEFAULT '' COMMENT '',
  notshowarticlesummay varchar(255) NOT NULL DEFAULT '' COMMENT '',
  perpage smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  maxpages smallint(6) NOT NULL DEFAULT '0' COMMENT '',
  noantitheft tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  lastpublish int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (catid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_portal_category_permission;
CREATE TABLE pre_portal_category_permission (
  catid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  allowpublish tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowmanage tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  inheritedcatid mediumint(8) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (catid,uid) COMMENT '',
  KEY uid (uid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_portal_comment;
CREATE TABLE pre_portal_comment (
  cid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username varchar(255) NOT NULL DEFAULT '' COMMENT '',
  id mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  idtype varchar(20) NOT NULL DEFAULT '' COMMENT '',
  postip varchar(255) NOT NULL DEFAULT '' COMMENT '',
  `port` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  message text NOT NULL COMMENT '',
  PRIMARY KEY (cid) COMMENT '',
  KEY idtype (id,idtype,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_portal_comment_moderate;
CREATE TABLE pre_portal_comment_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  idtype varchar(15) NOT NULL DEFAULT '' COMMENT '',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (id) COMMENT '',
  KEY idtype (idtype,`status`,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_portal_rsscache;
CREATE TABLE pre_portal_rsscache (
  lastupdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  catid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  aid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  catname char(50) NOT NULL DEFAULT '' COMMENT '',
  author char(15) NOT NULL DEFAULT '' COMMENT '',
  `subject` char(80) NOT NULL DEFAULT '' COMMENT '',
  description char(255) NOT NULL DEFAULT '' COMMENT '',
  UNIQUE KEY aid (aid) COMMENT '',
  KEY catid (catid,dateline COMMENT '添加时间')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_portal_topic;
CREATE TABLE pre_portal_topic (
  topicid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '',
  title varchar(255) NOT NULL DEFAULT '' COMMENT '',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '',
  domain varchar(255) NOT NULL DEFAULT '' COMMENT '',
  summary text NOT NULL COMMENT '',
  keyword text NOT NULL COMMENT '',
  cover varchar(255) NOT NULL DEFAULT '' COMMENT '',
  picflag tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  primaltplname varchar(255) NOT NULL DEFAULT '' COMMENT '',
  useheader tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  usefooter tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username varchar(255) NOT NULL DEFAULT '' COMMENT '',
  viewnum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  closed tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  allowcomment tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  commentnum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  htmlmade tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  htmldir varchar(255) NOT NULL DEFAULT '' COMMENT '',
  PRIMARY KEY (topicid) COMMENT '',
  KEY `name` (`name`)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_portal_topic_pic;
CREATE TABLE pre_portal_topic_pic (
  picid mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '',
  topicid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  filename varchar(255) NOT NULL DEFAULT '' COMMENT '',
  title varchar(255) NOT NULL DEFAULT '' COMMENT '',
  size int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  filepath varchar(255) NOT NULL DEFAULT '' COMMENT '',
  thumb tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  remote tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (picid) COMMENT '',
  KEY topicid (topicid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_security_evilpost;
CREATE TABLE pre_security_evilpost (
  pid int(10) unsigned NOT NULL COMMENT '',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  evilcount int(10) NOT NULL DEFAULT '0' COMMENT '',
  eviltype mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  createtime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  operateresult tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  isreported tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  censorword char(50) NOT NULL COMMENT '',
  PRIMARY KEY (pid) COMMENT '',
  KEY `type` (tid,`type`) COMMENT '',
  KEY operateresult (operateresult,createtime COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_security_eviluser;
CREATE TABLE pre_security_eviluser (
  uid int(10) unsigned NOT NULL COMMENT '',
  evilcount int(10) NOT NULL DEFAULT '0' COMMENT '',
  eviltype mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '',
  createtime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  operateresult tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '',
  isreported tinyint(1) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (uid) COMMENT '',
  KEY operateresult (operateresult,createtime COMMENT '')
) TYPE=MyISAM;

DROP TABLE IF EXISTS pre_security_failedlog;
CREATE TABLE pre_security_failedlog (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '',
  reporttype char(20) NOT NULL COMMENT '',
  tid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  uid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  failcount int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  createtime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  posttime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  delreason char(255) NOT NULL COMMENT '',
  scheduletime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  lastfailtime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '',
  extra1 int(10) unsigned NOT NULL COMMENT '',
  extra2 char(255) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (id) COMMENT '',
  KEY pid (pid) COMMENT '',
  KEY uid (uid)
) TYPE=MyISAM;

