package com.xstudio.discuzx.model;

import com.xstudio.common.service.BaseModelObject;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 *
 * This class was generated by MyBatis Generator.
 * This class corresponds to the database table pre_common_member
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class CommonMember extends BaseModelObject implements Serializable {
    /**
     * Database Column Remarks:
     *   会员ID
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pre_common_member.uid
     *
     * @mbg.generated
     */
    private Long uid;

    /**
     * Database Column Remarks:
     *   邮箱
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pre_common_member.email
     *
     * @mbg.generated
     */
    private String email;

    /**
     * Database Column Remarks:
     *   用户名
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pre_common_member.username
     *
     * @mbg.generated
     */
    private String username;

    /**
     * Database Column Remarks:
     *   密码
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pre_common_member.password
     *
     * @mbg.generated
     */
    private String password;

    /**
     * Database Column Remarks:
     *   判断用户是否已经删除 需要discuz程序加判断，并增加整体清理的功能。原home字段为flag
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pre_common_member.status
     *
     * @mbg.generated
     */
    private Boolean status;

    /**
     * Database Column Remarks:
     *   email是否经过验证 1=验证通过 0=未验证 home字段为emailcheck
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pre_common_member.emailstatus
     *
     * @mbg.generated
     */
    private Boolean emailstatus;

    /**
     * Database Column Remarks:
     *   是否有头像 1=已上传 0=未上传 home字段为avatar
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pre_common_member.avatarstatus
     *
     * @mbg.generated
     */
    private Boolean avatarstatus;

    /**
     * Database Column Remarks:
     *   视频认证状态 1=是 0=否
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pre_common_member.videophotostatus
     *
     * @mbg.generated
     */
    private Boolean videophotostatus;

    /**
     * Database Column Remarks:
     *    管理组ID 1=管理员 2=超级版主 3=版主
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pre_common_member.adminid
     *
     * @mbg.generated
     */
    private Boolean adminid;

    /**
     * Database Column Remarks:
     *   会员组groupid
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pre_common_member.groupid
     *
     * @mbg.generated
     */
    private Long groupid;

    /**
     * Database Column Remarks:
     *   扩展用户组有效期
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pre_common_member.groupexpiry
     *
     * @mbg.generated
     */
    private Integer groupexpiry;

    /**
     * Database Column Remarks:
     *   扩展用户组ID数组
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pre_common_member.extgroupids
     *
     * @mbg.generated
     */
    private String extgroupids;

    /**
     * Database Column Remarks:
     *   注册时间
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pre_common_member.regdate
     *
     * @mbg.generated
     */
    private Integer regdate;

    /**
     * Database Column Remarks:
     *   总积分
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pre_common_member.credits
     *
     * @mbg.generated
     */
    private Integer credits;

    /**
     * Database Column Remarks:
     *   短信声音
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pre_common_member.notifysound
     *
     * @mbg.generated
     */
    private Boolean notifysound;

    /**
     * Database Column Remarks:
     *   时区校正
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pre_common_member.timeoffset
     *
     * @mbg.generated
     */
    private String timeoffset;

    /**
     * Database Column Remarks:
     *   新短消息数量
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pre_common_member.newpm
     *
     * @mbg.generated
     */
    private Short newpm;

    /**
     * Database Column Remarks:
     *   新提醒数目
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pre_common_member.newprompt
     *
     * @mbg.generated
     */
    private Short newprompt;

    /**
     * Database Column Remarks:
     *   访问权限
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pre_common_member.accessmasks
     *
     * @mbg.generated
     */
    private Boolean accessmasks;

    /**
     * Database Column Remarks:
     *   管理权限
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pre_common_member.allowadmincp
     *
     * @mbg.generated
     */
    private Boolean allowadmincp;

    /**
     * Database Column Remarks:
     *   是否只接收好友短消息
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pre_common_member.onlyacceptfriendpm
     *
     * @mbg.generated
     */
    private Boolean onlyacceptfriendpm;

    /**
     * Database Column Remarks:
     *   用户是否绑定QC
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pre_common_member.conisbind
     *
     * @mbg.generated
     */
    private Boolean conisbind;

    /**
     * Database Column Remarks:
     *   是否被冻结
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pre_common_member.freeze
     *
     * @mbg.generated
     */
    private Boolean freeze;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table pre_common_member
     *
     * @mbg.generated
     */
    private static final long serialVersionUID = 1L;

    @Override
    public void setKey(Object key) {
        if (null == key ||  "null".equals(key)) {
            setUid(null);
            return;
        }
        setUid(Long.valueOf(String.valueOf(key)));
    }

    @Override
    public String getKey() {
        return String.valueOf(getUid());
    }
}