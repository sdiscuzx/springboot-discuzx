package com.xstudio;

import com.xstudio.utils.ContextUtil;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

@SpringBootApplication
public class DiscuzxApplication {

    public static void main(String[] args) {
        ConfigurableApplicationContext run = SpringApplication.run(DiscuzxApplication.class, args);
        ContextUtil.setContext(run);
    }

}
