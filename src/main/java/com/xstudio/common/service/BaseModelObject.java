package com.xstudio.common.service;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;
import java.util.Date;


/**
 * 数据库基础对象
 *
 * @author xiaobiao on 2017/2/24.
 */
public abstract class BaseModelObject implements Serializable {


    public abstract String getKey();

    public abstract void setKey(Object key);

    /**
     * 租户ID
     */
    private String tenantId;

    /**
     * 创建时间
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date createAt;

    /**
     * 创建人ID
     */
    private String createBy;

    /**
     * 更新时间
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date updateAt;

    /**
     * 更新人ID
     */
    private String updateBy;

    /**
     * 创建开始时间
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date createAtBegin;

    /**
     * 创建结束时间
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date createAtEnd;

    /**
     * 更新开始时间
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date updateAtBegin;

    /**
     * 更新介绍时间
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date updateAtEnd;


    /**
     * Getter for property 'tenantId'.
     *
     * @return Value for property 'tenantId'.
     */
    public String getTenantId() {
        return tenantId;
    }

    /**
     * Setter for property 'tenantId'.
     *
     * @param tenantId Value to set for property 'tenantId'.
     */
    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }

    /**
     * Getter for property 'createAt'.
     *
     * @return Value for property 'createAt'.
     */
    public Date getCreateAt() {
        return createAt;
    }

    /**
     * Setter for property 'createAt'.
     *
     * @param createAt Value to set for property 'createAt'.
     */
    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    /**
     * Getter for property 'createBy'.
     *
     * @return Value for property 'createBy'.
     */
    public String getCreateBy() {
        return createBy;
    }

    /**
     * Setter for property 'createBy'.
     *
     * @param createBy Value to set for property 'createBy'.
     */
    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    /**
     * Getter for property 'updateAt'.
     *
     * @return Value for property 'updateAt'.
     */
    public Date getUpdateAt() {
        return updateAt;
    }

    /**
     * Setter for property 'updateAt'.
     *
     * @param updateAt Value to set for property 'updateAt'.
     */
    public void setUpdateAt(Date updateAt) {
        this.updateAt = updateAt;
    }

    /**
     * Getter for property 'updateBy'.
     *
     * @return Value for property 'updateBy'.
     */
    public String getUpdateBy() {
        return updateBy;
    }

    /**
     * Setter for property 'updateBy'.
     *
     * @param updateBy Value to set for property 'updateBy'.
     */
    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    /**
     * Getter for property 'createAtBegin'.
     *
     * @return Value for property 'createAtBegin'.
     */
    public Date getCreateAtBegin() {
        return createAtBegin;
    }

    /**
     * Setter for property 'createAtBegin'.
     *
     * @param createAtBegin Value to set for property 'createAtBegin'.
     */
    public void setCreateAtBegin(Date createAtBegin) {
        this.createAtBegin = createAtBegin;
    }

    /**
     * Getter for property 'createAtEnd'.
     *
     * @return Value for property 'createAtEnd'.
     */
    public Date getCreateAtEnd() {
        return createAtEnd;
    }

    /**
     * Setter for property 'createAtEnd'.
     *
     * @param createAtEnd Value to set for property 'createAtEnd'.
     */
    public void setCreateAtEnd(Date createAtEnd) {
        this.createAtEnd = createAtEnd;
    }

    /**
     * Getter for property 'updateAtBegin'.
     *
     * @return Value for property 'updateAtBegin'.
     */
    public Date getUpdateAtBegin() {
        return updateAtBegin;
    }

    /**
     * Setter for property 'updateAtBegin'.
     *
     * @param updateAtBegin Value to set for property 'updateAtBegin'.
     */
    public void setUpdateAtBegin(Date updateAtBegin) {
        this.updateAtBegin = updateAtBegin;
    }

    /**
     * Getter for property 'updateAtEnd'.
     *
     * @return Value for property 'updateAtEnd'.
     */
    public Date getUpdateAtEnd() {
        return updateAtEnd;
    }

    /**
     * Setter for property 'updateAtEnd'.
     *
     * @param updateAtEnd Value to set for property 'updateAtEnd'.
     */
    public void setUpdateAtEnd(Date updateAtEnd) {
        this.updateAtEnd = updateAtEnd;
    }

}
