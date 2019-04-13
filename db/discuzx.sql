/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100138
 Source Host           : localhost:3306
 Source Schema         : discuzx

 Target Server Type    : MySQL
 Target Server Version : 100138
 File Encoding         : 65001

 Date: 13/04/2019 17:13:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pre_common_credit_rule_log
-- ----------------------------
DROP TABLE IF EXISTS `pre_common_credit_rule_log`;
CREATE TABLE `pre_common_credit_rule_log`  (
  `clid` bigint(20) UNSIGNED NOT NULL COMMENT '策略日志ID',
  `uid` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '策略日志所有者uID',
  `rid` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '策略ID',
  `fid` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '版块ID',
  `total` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '策略被执行总次数',
  `cyclenum` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '周期被执行次数',
  `extcredits1` int(10) NOT NULL DEFAULT 0 COMMENT '扩展1',
  `extcredits2` int(10) NOT NULL DEFAULT 0 COMMENT '扩展2',
  `extcredits3` int(10) NOT NULL DEFAULT 0 COMMENT '扩展3',
  `extcredits4` int(10) NOT NULL DEFAULT 0 COMMENT '扩展4',
  `extcredits5` int(10) NOT NULL DEFAULT 0 COMMENT '扩展5',
  `extcredits6` int(10) NOT NULL DEFAULT 0 COMMENT '扩展6',
  `extcredits7` int(10) NOT NULL DEFAULT 0 COMMENT '扩展7',
  `extcredits8` int(10) NOT NULL DEFAULT 0 COMMENT '扩展8',
  `starttime` datetime(0) NOT NULL COMMENT '周期开始时间',
  `dateline` datetime(0) NOT NULL COMMENT '策略最后执行时间',
  `create_at` datetime(0) NOT NULL COMMENT '创建时间',
  `create_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime(0) NOT NULL COMMENT '更新时间',
  `update_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人ID',
  PRIMARY KEY (`clid`) USING BTREE,
  INDEX `uid`(`uid`, `rid`, `fid`) USING BTREE,
  INDEX `dateline`(`dateline`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '积分规则日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pre_common_member
-- ----------------------------
DROP TABLE IF EXISTS `pre_common_member`;
CREATE TABLE `pre_common_member`  (
  `uid` bigint(20) UNSIGNED NOT NULL COMMENT '会员ID',
  `email` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `username` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '判断用户是否已经删除 需要discuz程序加判断，并增加整体清理的功能。原home字段为flag',
  `emailstatus` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email是否经过验证 1=验证通过 0=未验证 home字段为emailcheck',
  `avatarstatus` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有头像 1=已上传 0=未上传 home字段为avatar',
  `videophotostatus` tinyint(1) NOT NULL DEFAULT 0 COMMENT '视频认证状态 1=是 0=否',
  `adminid` tinyint(1) NOT NULL DEFAULT 0 COMMENT ' 管理组ID 1=管理员 2=超级版主 3=版主',
  `groupid` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员组groupid',
  `groupexpiry` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '扩展用户组有效期',
  `extgroupids` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '扩展用户组ID数组',
  `regdate` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '注册时间',
  `credits` int(10) NOT NULL DEFAULT 0 COMMENT '总积分',
  `notifysound` tinyint(1) NOT NULL DEFAULT 0 COMMENT '短信声音',
  `timeoffset` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '时区校正',
  `newpm` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '新短消息数量',
  `newprompt` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '新提醒数目',
  `accessmasks` tinyint(1) NOT NULL DEFAULT 0 COMMENT '访问权限',
  `allowadmincp` tinyint(1) NOT NULL DEFAULT 0 COMMENT '管理权限',
  `onlyacceptfriendpm` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否只接收好友短消息',
  `conisbind` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户是否绑定QC',
  `freeze` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否被冻结',
  `create_at` datetime(0) NOT NULL COMMENT '创建时间',
  `create_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime(0) NOT NULL COMMENT '更新时间',
  `update_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人ID',
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `email`(`email`) USING BTREE,
  INDEX `groupid`(`groupid`) USING BTREE,
  INDEX `conisbind`(`conisbind`) USING BTREE,
  INDEX `regdate`(`regdate`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户主表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pre_common_member_count
-- ----------------------------
DROP TABLE IF EXISTS `pre_common_member_count`;
CREATE TABLE `pre_common_member_count`  (
  `uid` bigint(20) UNSIGNED NOT NULL COMMENT '会员ID',
  `extcredits1` int(10) NOT NULL DEFAULT 0 COMMENT '声望',
  `extcredits2` int(10) NOT NULL DEFAULT 0 COMMENT '金钱',
  `extcredits3` int(10) NOT NULL DEFAULT 0 COMMENT '扩展',
  `extcredits4` int(10) NOT NULL DEFAULT 0 COMMENT '扩展',
  `extcredits5` int(10) NOT NULL DEFAULT 0 COMMENT '扩展',
  `extcredits6` int(10) NOT NULL DEFAULT 0 COMMENT '扩展',
  `extcredits7` int(10) NOT NULL DEFAULT 0 COMMENT '扩展',
  `extcredits8` int(10) NOT NULL DEFAULT 0 COMMENT '扩展',
  `friends` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '好友个数 home',
  `posts` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '帖子数',
  `threads` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '主题数',
  `digestposts` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '精华数',
  `doings` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '记录数',
  `blogs` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '日志数',
  `albums` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '相册数',
  `sharings` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分享数',
  `attachsize` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上传附件占用的空间',
  `views` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '空间查看数',
  `oltime` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '在线时间',
  `todayattachs` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '当天上传附件数',
  `todayattachsize` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '当天上传附件容量',
  `feeds` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '广播数',
  `follower` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '听众数量',
  `following` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收听数量',
  `newfollower` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '新增听众数量',
  `blacklist` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '黑名单',
  `create_at` datetime(0) NOT NULL COMMENT '创建时间',
  `create_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime(0) NOT NULL COMMENT '更新时间',
  `update_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人ID',
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `posts`(`posts`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户统计表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pre_common_member_newprompt
-- ----------------------------
DROP TABLE IF EXISTS `pre_common_member_newprompt`;
CREATE TABLE `pre_common_member_newprompt`  (
  `uid` bigint(20) UNSIGNED NOT NULL COMMENT '会员ID',
  `data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `create_at` datetime(0) NOT NULL COMMENT '创建时间',
  `create_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime(0) NOT NULL COMMENT '更新时间',
  `update_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人ID',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户新提醒数量表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pre_common_member_status
-- ----------------------------
DROP TABLE IF EXISTS `pre_common_member_status`;
CREATE TABLE `pre_common_member_status`  (
  `uid` bigint(20) UNSIGNED NOT NULL COMMENT '会员ID',
  `regip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '注册IP',
  `lastip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `port` smallint(6) UNSIGNED NOT NULL DEFAULT 0,
  `lastvisit` datetime(0) NULL COMMENT '最后访问',
  `lastactivity` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后活动',
  `lastpost` datetime(0) NULL COMMENT '最后发表',
  `lastsendmail` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上次发送email时间 home原字段为lastsend',
  `invisible` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否隐身登录',
  `buyercredit` smallint(6) NOT NULL DEFAULT 0 COMMENT '买家信用等级及积分',
  `sellercredit` smallint(6) NOT NULL DEFAULT 0 COMMENT '卖家信用等级及积分',
  `favtimes` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '个人空间收藏次数',
  `sharetimes` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '个人空间分享次数',
  `profileprogress` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '个人资料完成度',
  `create_at` datetime(0) NOT NULL COMMENT '创建时间',
  `create_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime(0) NOT NULL COMMENT '更新时间',
  `update_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人ID',
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `lastactivity`(`lastactivity`, `invisible`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户状态表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pre_common_statuser
-- ----------------------------
DROP TABLE IF EXISTS `pre_common_statuser`;
CREATE TABLE `pre_common_statuser`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `uid` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `type` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '各种用户行为如：invite、register、login...',
  `create_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime(0) NOT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '统计用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pre_common_usergroup
-- ----------------------------
DROP TABLE IF EXISTS `pre_common_usergroup`;
CREATE TABLE `pre_common_usergroup`  (
  `groupid` bigint(20) UNSIGNED NOT NULL COMMENT '会员组ID',
  `radminid` tinyint(3) NOT NULL DEFAULT 0 COMMENT '关联关管理组',
  `type` enum('system','special','member') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'member' COMMENT '类型',
  `system` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'private' COMMENT '会员是否可以自由进出',
  `grouptitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '组头衔',
  `creditshigher` int(10) NOT NULL DEFAULT 0 COMMENT '该组的积分上限',
  `creditslower` int(10) NOT NULL DEFAULT 0 COMMENT '该组的积分下限',
  `stars` tinyint(3) NOT NULL DEFAULT 0 COMMENT '星星数量',
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '组头衔颜色',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `allowvisit` tinyint(1) NOT NULL DEFAULT 0 COMMENT '允许访问',
  `allowsendpm` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否允许发送短信息',
  `allowinvite` tinyint(1) NOT NULL DEFAULT 0 COMMENT '允许使用邀请注册',
  `allowmailinvite` tinyint(1) NOT NULL DEFAULT 0 COMMENT '允许通过论坛邮件系统发送邀请码',
  `maxinvitenum` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大邀请码拥有数量',
  `inviteprice` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '邀请码购买价格',
  `maxinviteday` datetime(0) NOT NULL COMMENT '邀请码有效期',
  `create_at` datetime(0) NOT NULL COMMENT '创建时间',
  `create_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人ID',
  `update_at` datetime(0) NOT NULL COMMENT '更新时间',
  `update_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人ID',
  PRIMARY KEY (`groupid`) USING BTREE,
  INDEX `creditsrange`(`creditshigher`, `creditslower`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户组表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pre_ucenter_failedlogins
-- ----------------------------
DROP TABLE IF EXISTS `pre_ucenter_failedlogins`;
CREATE TABLE `pre_ucenter_failedlogins`  (
  `ip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `count` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败次数',
  `create_at` datetime(0) NOT NULL COMMENT '创建时间',
  `id` bigint(20) UNSIGNED NOT NULL COMMENT '主键',
  `update_at` datetime(0) NOT NULL COMMENT '最后更新时间',
  `create_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人ID',
  `update_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户登录失败情况表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for pre_ucenter_members
-- ----------------------------
DROP TABLE IF EXISTS `pre_ucenter_members`;
CREATE TABLE `pre_ucenter_members`  (
  `uid` bigint(20) UNSIGNED NOT NULL COMMENT '会员UID',
  `username` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `email` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `myid` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `myidkey` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `regip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '注册IP',
  `lastloginip` int(10) NOT NULL DEFAULT 0 COMMENT '最后登录IP',
  `lastlogintime` datetime(0) NOT NULL COMMENT '最后登录时间',
  `salt` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '盐',
  `secques` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '安全提示问题(独立加密)',
  `create_at` datetime(0) NOT NULL COMMENT '注册日期',
  `create_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '注册操作的人员ID',
  `update_at` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人ID',
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `email`(`email`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员信息' ROW_FORMAT = Fixed;

SET FOREIGN_KEY_CHECKS = 1;
