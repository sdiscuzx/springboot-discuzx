package com.xstudio.discuzx.config;

import com.xstudio.discuzx.config.security.Md5Encoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * discuzx加密算法
 * md5(md5($password).$user['salt'])
 *
 * @author Beeant
 * @version 2020/6/13
 */
public class DiscuzxPasswordEncoder implements PasswordEncoder {
    @Override
    public String encode(CharSequence rawPassword) {
        return null;
    }

    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        Md5Encoder md5Encoder = new Md5Encoder();
        String encode = md5Encoder.encode(rawPassword.toString());
        return encode.equals(encodedPassword);
    }

    public boolean matches(String rawPassword, String encodedPassword, String salt) {
        Md5Encoder md5Encoder = new Md5Encoder();
        String encode = md5Encoder.encode(rawPassword);
        return matches(encode + salt, encodedPassword);
    }
}
