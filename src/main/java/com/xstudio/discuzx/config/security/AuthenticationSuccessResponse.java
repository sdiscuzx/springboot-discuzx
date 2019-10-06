package com.xstudio.discuzx.config.security;

import lombok.Data;

import java.io.Serializable;

/**
 * @author xiaobiao
 * @version 2019/10/6
 */
@Data
public class AuthenticationSuccessResponse implements Serializable {
    private static final long serialVersionUID = -8147988546129513305L;
    private String username;
}
