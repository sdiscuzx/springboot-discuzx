package com.xstudio.discuzx;

import com.xstudio.spring.web.SpringContextProvider;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

@SpringBootApplication(scanBasePackages = "com.xstudio")
public class DiscuzxApplication {

    public static void main(String[] args) {
        ConfigurableApplicationContext run = SpringApplication.run(DiscuzxApplication.class, args);
        SpringContextProvider.setApplicationContext(run);
    }

}
