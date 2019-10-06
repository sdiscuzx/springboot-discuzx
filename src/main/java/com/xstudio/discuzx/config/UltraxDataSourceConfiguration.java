package com.xstudio.discuzx.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.xstudio.spring.mybatis.SqlSessionFactoryUtil;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.mybatis.spring.boot.autoconfigure.ConfigurationCustomizer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.sql.DataSource;

/**
 * @author xiaobiao
 * @version 2019/10/2
 */

@Configuration
@MapperScan(annotationClass = Mapper.class, basePackages = {"com.xstudio.discuzx.ultrax.mapper"}, sqlSessionFactoryRef = "ultraxSqlSessionFactory")
public class UltraxDataSourceConfiguration {

    /**
     * 将MybatisConfig类中初始化的对象注入进来
     */
    @Autowired
    private ConfigurationCustomizer customizer;

    @Primary
    @Bean(name = "ultraxDataSource")
    @ConfigurationProperties(prefix = "spring.datasource.druid.ultrax")
    public DruidDataSource ultraxDataSource() {
        return new DruidDataSource();
    }

    @Bean("ultraxSqlSessionFactory")
    public SqlSessionFactory ultraxSqlSessionFactory(@Qualifier("ultraxDataSource") DataSource dataSource) throws Exception {
        return SqlSessionFactoryUtil.getSqlSessionFactory(dataSource
                , "classpath:/mybatis/mysql/ultrax/**/**.xml"
                , "com.xstudio.discuzx.ultrax.model"
                , customizer);
    }

    @Bean(name = "discuzxTransactionManager")
    public DataSourceTransactionManager ultraxTransactionManager(@Qualifier("ultraxDataSource") DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }

    /**
     * SqlSessionTemplate 是 SqlSession接口的实现类，是spring-mybatis中的，实现了SqlSession线程安全
     */
    @Bean(name = "ultraxSqlSessionTemplate")
    public SqlSessionTemplate ultraxSqlSessionTemplate(@Qualifier("ultraxSqlSessionFactory") SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }
}
