package com.xstudio.utils;

/**
 * @author Beeant on 2017/2/26.
 */
public enum EnError {
    DEFAULT(0,""),
    NO_MATCH(1,"没有匹配项"),
    INSERT_NONE(2, "插入失败"),
    DELETE_NONE(3, "删除失败"),
    UPDATE_NONE(4, "更新失败"),
    CONFLICT(5,"已存在"),
    SQL_ERROR(900,"SQL执行失败"),

    FORBIDDEN(403,"未授权操作"),
    UNAUTHORIZED(401, "未登录"),
    AccountExpired(401,"登录超时"),

    INVALID_USERNAME(30000, "用户名错误"),
    INVALID_PASSWORD(30001, "密码错误"),
    INVALID_FILE_TYPE(30002, "不允许的文件类型"),
    /**
     * 执行失败
     */
    EXECUTE_FAILED(40000,"执行失败"),
    /**
     * 系统异常
     */
    SYSTEM_ERROR(40001,"系统异常"),
    TIMEOUT(40002,"调用超时"),
    OVER_FREQUENCY(40003,"调用过快，超过频率限制"),
    OVER_TIMES(40004,"超过总次数限制"),
    NONEMPTY_PARAM(40005,"缺少必填参数"),
    ILLEGAL_PARAM(40006,"参数不合法"),
    ERROR_SIGN(40007,"签名不正确"),
    SERVICE_INVALID(40008,"服务不可用"),
    CU_API_ERROR(40009, "联通接口异常"),
    CRM_API_ERROR(40010, "调用CRM接口异常"),
    NO_AUTHED(40011,"该车辆未实名认证"),
    NO_PICTURE(40013,"缺少图片参数"),
    FILE_ERROR(40012,"文件类型不对"),
    NO_FILE(40012,"缺少文件参数");



    private Integer code = 0;

    private String description = "";

    /**
     * Getter for property 'code'.
     *
     * @return Value for property 'code'.
     */
    public Integer getCode() {
        return code;
    }

    /**
     * Getter for property 'description'.
     *
     * @return Value for property 'description'.
     */
    public String getDescription() {
        return description;
    }

    EnError(Integer code, String description) {
        this.code = code;
        this.description = description;
    }
}
