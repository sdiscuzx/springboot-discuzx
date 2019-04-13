package com.xstudio.utils;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import lombok.Data;
import org.springframework.util.CollectionUtils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 统一消息返回对象
 * <p>
 *
 * @author xiaobiao on 2016/12/28.
 */
@Data
public class Msg<T> implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 错误码
     */
    private Integer code = EnError.DEFAULT.getCode();

    /**
     * 返回的数据，可以任意集合或对象
     */
    private T data;

    /**
     * 是否成功
     */
    private Boolean success;

    /**
     * 结果说明
     */
    private String msg = EnError.DEFAULT.getDescription();

    private List<String> msgs;

    public Msg() {
    }

    public Msg(EnError error) {
        this.code = error.getCode();
        this.msg = error.getDescription();
    }

    public Msg(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Msg(T data) {
        this.data = data;
    }

    public Msg(Integer code, T data, String msg) {
        this.code = code;
        this.data = data;
        this.msg = msg;
    }

    public Boolean getSuccess() {
        return 0 == this.code;
    }

    public void setResult(EnError result) {
        this.code = result.getCode();
        this.msg = result.getDescription();
    }

    public void setErrorResult(Msg errorMsg) {
        this.msg = errorMsg.getMsg();
        this.code = errorMsg.getCode();
    }

    public void setMessage(Integer code, String msg, Object obj) {
        this.code = code;
        this.data = JSON.parseObject(JSON.toJSONString(obj), new TypeReference<T>() {
        });
        this.msg = msg;
    }

    public void addMsg(String msg) {
        if (CollectionUtils.isEmpty(msgs)) {
            msgs = new ArrayList<>();
        }
        msgs.add(msg);
    }
}
