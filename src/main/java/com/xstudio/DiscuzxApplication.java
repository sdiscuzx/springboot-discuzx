package com.xstudio;

import com.xstudio.spring.web.SpringContextUtil;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceTransactionManagerAutoConfiguration;
import org.springframework.context.ApplicationContext;

@SpringBootApplication(
        exclude = {
                DataSourceAutoConfiguration.class,
                DataSourceTransactionManagerAutoConfiguration.class
        }
)
public class DiscuzxApplication {

    public static void main(String[] args) {
        ApplicationContext run = SpringApplication.run(DiscuzxApplication.class, args);
        SpringContextUtil.setApplicationContext(run);
    }

}
