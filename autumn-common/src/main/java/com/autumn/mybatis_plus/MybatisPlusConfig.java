package com.autumn.mybatis_plus;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan("com.autumn.*.mapper")
public class MybatisPlusConfig {
}
