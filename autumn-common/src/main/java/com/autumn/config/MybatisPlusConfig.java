package com.autumn.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan("com.autumn.*.mapper")
public class MybatisPlusConfig {
}
