package com.autumn.mybatisPlus;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan("com.*.*.mapper")
public class MybatisPlusConfig {
}
