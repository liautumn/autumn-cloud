-- MySQL dump 10.13  Distrib 5.7.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: autumn_cloud_nacos
-- ------------------------------------------------------
-- Server version	5.7.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `config_info`
--

DROP TABLE IF EXISTS `config_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `c_use` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `effect` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `c_schema` text COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info`
--

LOCK TABLES `config_info` WRITE;
/*!40000 ALTER TABLE `config_info` DISABLE KEYS */;
INSERT INTO `config_info` VALUES (1,'sa-token-config.yml','DEFAULT_GROUP','# Sa-Token配置\r\nsa-token:\r\n  # token名称 (同时也是cookie名称)\r\n  token-name: autumn-token\r\n  # token有效期，单位s 默认30天, -1代表永不过期\r\n  timeout: 2592000\r\n  # token临时有效期 (指定时间内无操作就视为token过期) 单位: 秒\r\n  activity-timeout: -1\r\n  # 是否允许同一账号并发登录 (为true时允许一起登录, 为false时新登录挤掉旧登录)\r\n  is-concurrent: false\r\n  # 在多人登录同一账号时，是否共用一个token (为true时所有登录共用一个token, 为false时每次登录新建一个token)\r\n  is-share: false\r\n  # token风格\r\n  token-style: random-64\r\n  # 是否输出操作日志\r\n  is-log: false','e8cd1607884c1dd43486c71467b05fd0','2023-05-29 01:18:36','2023-05-29 01:18:36',NULL,'172.18.0.1','','dev',NULL,NULL,NULL,'yaml',NULL),(2,'redis-config.yml','DEFAULT_GROUP','spring:\n  # redis 配置\n  redis:\n    # 地址\n    host: 127.0.0.1\n    # 端口，默认为6379\n    port: 6379\n    # 数据库索引\n    database: 1\n    # 密码\n    password: zhuang2001\n    # 连接超时时间\n    timeout: 10s\n    lettuce:\n      pool:\n        # 连接池中的最小空闲连接\n        min-idle: 0\n        # 连接池中的最大空闲连接\n        max-idle: 8\n        # 连接池的最大数据库连接数\n        max-active: 8\n        # #连接池最大阻塞等待时间（使用负值表示没有限制）\n        max-wait: -1ms','969036755ad438cbadf88722c7c7db3e','2023-05-29 01:18:36','2023-05-29 01:35:59','nacos','172.18.0.1','','dev','','','','yaml',''),(3,'autumn-system-dev.yml','DEFAULT_GROUP','spring:\n  # 数据库配置\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n    username: root\n    password: zhuang2001\n  \nautumn:\n  password:\n    salt: kjsdafhjekhiohni','66d2d8248f8da1bdd46c8c045979755c','2023-05-29 01:18:36','2023-05-29 01:34:23','nacos','172.18.0.1','','dev','','','','yaml',''),(4,'autumn-gateway-dev.yml','DEFAULT_GROUP','spring:\n  cloud:\n    gateway:\n      routes:\n        - id: system_router\n          uri: lb://autumn-system\n          predicates:\n            - Path=/system/**\n        - id: demo_router\n          uri: lb://autumn-demo\n          predicates:\n            - Path=/demo/**','7041a9ced5fd71c694c5f367c0e09843','2023-05-29 01:18:36','2023-05-29 01:18:36',NULL,'172.18.0.1','','dev',NULL,NULL,NULL,'yaml',NULL),(5,'mybatis-plus-config.yml','DEFAULT_GROUP','#mybatis-plus配置\nmybatis-plus:\n  type-aliases-package: com.autumn.*.entity\n  #mapper-locations: classpath:mapper/*.xml\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    # 开启驼峰命名\n    map-underscore-to-camel-case: true\n  global-config:\n    db-config:\n      logic-delete-field: delFlag\n      logic-delete-value: 0\n      logic-not-delete-value: 1','394cbcbc4236a58e5172296485a78dbe','2023-05-29 01:18:36','2023-05-31 06:57:46','nacos','172.18.0.1','','dev','','','','yaml',''),(6,'autumn-demo-dev.yml','DEFAULT_GROUP','spring:\n  # 数据库配置\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n    username: root\n    password: zhuang2001','fa6950d26aac89aad457063317a849e0','2023-05-29 01:18:36','2023-05-29 01:35:36','nacos','172.18.0.1','','dev','','','','yaml',''),(7,'global-config.yml','DEFAULT_GROUP','spring:\r\n  main:\r\n    #允许存在多个Feign调用相同Service的接口\r\n    allow-bean-definition-overriding: true\r\n# SpringBoot的日志级别默认为info,大于full,导致feign的日志配置不会输出，所以加以下配置\r\nlogging:\r\n  level:\r\n    com.dt.springcloud.openfeign: debug\r\n# feign日志全局配置\r\nfeign:\r\n  client:\r\n    config:\r\n      #想要调用的微服务名称(default全局)\r\n      default:\r\n        logger-level: BASIC\r\n        # 连接超时时间，默认2s\r\n        connectTimeout: 5000\r\n        # 请求处理超时时间，默认5s\r\n        readTimeout: 10000\r\n        request-interceptors: com.autumn.open_feign.FeignAuthRequestInterceptor\r\n    ','c3ff9097b7da58aaab9784daa2332517','2023-05-29 01:18:36','2023-05-29 01:18:36',NULL,'172.18.0.1','','dev',NULL,NULL,NULL,'yaml',NULL);
/*!40000 ALTER TABLE `config_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_aggr`
--

DROP TABLE IF EXISTS `config_info_aggr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info_aggr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='增加租户字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_aggr`
--

LOCK TABLES `config_info_aggr` WRITE;
/*!40000 ALTER TABLE `config_info_aggr` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_aggr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_beta`
--

DROP TABLE IF EXISTS `config_info_beta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info_beta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_beta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_beta`
--

LOCK TABLES `config_info_beta` WRITE;
/*!40000 ALTER TABLE `config_info_beta` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_beta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_tag`
--

DROP TABLE IF EXISTS `config_info_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_tag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_tag`
--

LOCK TABLES `config_info_tag` WRITE;
/*!40000 ALTER TABLE `config_info_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_tags_relation`
--

DROP TABLE IF EXISTS `config_tags_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_tags_relation` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_tag_relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_tags_relation`
--

LOCK TABLES `config_tags_relation` WRITE;
/*!40000 ALTER TABLE `config_tags_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_tags_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_capacity`
--

DROP TABLE IF EXISTS `group_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='集群、各Group容量信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_capacity`
--

LOCK TABLES `group_capacity` WRITE;
/*!40000 ALTER TABLE `group_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `his_config_info`
--

DROP TABLE IF EXISTS `his_config_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `his_config_info` (
  `id` bigint(64) unsigned NOT NULL,
  `nid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text COLLATE utf8_bin,
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `op_type` char(10) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='多租户改造';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `his_config_info`
--

LOCK TABLES `his_config_info` WRITE;
/*!40000 ALTER TABLE `his_config_info` DISABLE KEYS */;
INSERT INTO `his_config_info` VALUES (0,1,'sa-token-config.yml','DEFAULT_GROUP','','# Sa-Token配置\r\nsa-token:\r\n  # token名称 (同时也是cookie名称)\r\n  token-name: autumn-token\r\n  # token有效期，单位s 默认30天, -1代表永不过期\r\n  timeout: 2592000\r\n  # token临时有效期 (指定时间内无操作就视为token过期) 单位: 秒\r\n  activity-timeout: -1\r\n  # 是否允许同一账号并发登录 (为true时允许一起登录, 为false时新登录挤掉旧登录)\r\n  is-concurrent: false\r\n  # 在多人登录同一账号时，是否共用一个token (为true时所有登录共用一个token, 为false时每次登录新建一个token)\r\n  is-share: false\r\n  # token风格\r\n  token-style: random-64\r\n  # 是否输出操作日志\r\n  is-log: false','e8cd1607884c1dd43486c71467b05fd0','2023-05-29 01:18:36','2023-05-29 01:18:36',NULL,'172.18.0.1','I','dev'),(0,2,'redis-config.yml','DEFAULT_GROUP','','spring:\r\n  # redis 配置\r\n  redis:\r\n    # 地址\r\n    host: 127.0.0.1\r\n    # 端口，默认为6379\r\n    port: 6379\r\n    # 数据库索引\r\n    database: 1\r\n    # 密码\r\n    password:\r\n    # 连接超时时间\r\n    timeout: 10s\r\n    lettuce:\r\n      pool:\r\n        # 连接池中的最小空闲连接\r\n        min-idle: 0\r\n        # 连接池中的最大空闲连接\r\n        max-idle: 8\r\n        # 连接池的最大数据库连接数\r\n        max-active: 8\r\n        # #连接池最大阻塞等待时间（使用负值表示没有限制）\r\n        max-wait: -1ms','6b4cbe7aafccb146a3360b5c032b48d2','2023-05-29 01:18:36','2023-05-29 01:18:36',NULL,'172.18.0.1','I','dev'),(0,3,'autumn-system-dev.yml','DEFAULT_GROUP','','spring:\n  # 数据库配置\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n    username: root\n    password: 123456\n  \nautumn:\n  password:\n    salt: kjsdafhjekhiohni','7b077b518823f37e20b927bdf05ff369','2023-05-29 01:18:36','2023-05-29 01:18:36',NULL,'172.18.0.1','I','dev'),(0,4,'autumn-gateway-dev.yml','DEFAULT_GROUP','','spring:\n  cloud:\n    gateway:\n      routes:\n        - id: system_router\n          uri: lb://autumn-system\n          predicates:\n            - Path=/system/**\n        - id: demo_router\n          uri: lb://autumn-demo\n          predicates:\n            - Path=/demo/**','7041a9ced5fd71c694c5f367c0e09843','2023-05-29 01:18:36','2023-05-29 01:18:36',NULL,'172.18.0.1','I','dev'),(0,5,'mybatis-plus-config.yml','DEFAULT_GROUP','','#mybatis-plus配置\nmybatis-plus:\n  type-aliases-package: com.autumn.*.entity\n  #mapper-locations: classpath:mapper/*.xml\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    # 开启驼峰命名\n    map-underscore-to-camel-case: true\n  global-config:\n    db-config:\n      logic-delete-field: delFlag\n      logic-delete-value: 1\n      logic-not-delete-value: 0','a17e133e69949efc44da475ddeebd71f','2023-05-29 01:18:36','2023-05-29 01:18:36',NULL,'172.18.0.1','I','dev'),(0,6,'autumn-demo-dev.yml','DEFAULT_GROUP','','spring:\n  # 数据库配置\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n    username: root\n    password: 123456','8646466cd4e02cd6ec8e4b359ac8c892','2023-05-29 01:18:36','2023-05-29 01:18:36',NULL,'172.18.0.1','I','dev'),(0,7,'global-config.yml','DEFAULT_GROUP','','spring:\r\n  main:\r\n    #允许存在多个Feign调用相同Service的接口\r\n    allow-bean-definition-overriding: true\r\n# SpringBoot的日志级别默认为info,大于full,导致feign的日志配置不会输出，所以加以下配置\r\nlogging:\r\n  level:\r\n    com.dt.springcloud.openfeign: debug\r\n# feign日志全局配置\r\nfeign:\r\n  client:\r\n    config:\r\n      #想要调用的微服务名称(default全局)\r\n      default:\r\n        logger-level: BASIC\r\n        # 连接超时时间，默认2s\r\n        connectTimeout: 5000\r\n        # 请求处理超时时间，默认5s\r\n        readTimeout: 10000\r\n        request-interceptors: com.autumn.open_feign.FeignAuthRequestInterceptor\r\n    ','c3ff9097b7da58aaab9784daa2332517','2023-05-29 01:18:36','2023-05-29 01:18:36',NULL,'172.18.0.1','I','dev'),(2,8,'redis-config.yml','DEFAULT_GROUP','','spring:\r\n  # redis 配置\r\n  redis:\r\n    # 地址\r\n    host: 127.0.0.1\r\n    # 端口，默认为6379\r\n    port: 6379\r\n    # 数据库索引\r\n    database: 1\r\n    # 密码\r\n    password:\r\n    # 连接超时时间\r\n    timeout: 10s\r\n    lettuce:\r\n      pool:\r\n        # 连接池中的最小空闲连接\r\n        min-idle: 0\r\n        # 连接池中的最大空闲连接\r\n        max-idle: 8\r\n        # 连接池的最大数据库连接数\r\n        max-active: 8\r\n        # #连接池最大阻塞等待时间（使用负值表示没有限制）\r\n        max-wait: -1ms','6b4cbe7aafccb146a3360b5c032b48d2','2023-05-29 01:19:50','2023-05-29 01:19:50','nacos','172.18.0.1','U','dev'),(6,9,'autumn-demo-dev.yml','DEFAULT_GROUP','','spring:\n  # 数据库配置\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n    username: root\n    password: 123456','8646466cd4e02cd6ec8e4b359ac8c892','2023-05-29 01:20:23','2023-05-29 01:20:24','nacos','172.18.0.1','U','dev'),(3,10,'autumn-system-dev.yml','DEFAULT_GROUP','','spring:\n  # 数据库配置\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n    username: root\n    password: 123456\n  \nautumn:\n  password:\n    salt: kjsdafhjekhiohni','7b077b518823f37e20b927bdf05ff369','2023-05-29 01:20:45','2023-05-29 01:20:45','nacos','172.18.0.1','U','dev'),(3,11,'autumn-system-dev.yml','DEFAULT_GROUP','','spring:\n  # 数据库配置\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://autumn-mysql:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n    username: root\n    password: zhuang2001\n  \nautumn:\n  password:\n    salt: kjsdafhjekhiohni','13eb199bac23b49093abd0134b1a3b59','2023-05-29 01:34:22','2023-05-29 01:34:23','nacos','172.18.0.1','U','dev'),(6,12,'autumn-demo-dev.yml','DEFAULT_GROUP','','spring:\n  # 数据库配置\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://autumn-mysql:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n    username: root\n    password: zhuang2001','f449a0cd6c16b32c258224a6641fa253','2023-05-29 01:35:35','2023-05-29 01:35:36','nacos','172.18.0.1','U','dev'),(2,13,'redis-config.yml','DEFAULT_GROUP','','spring:\n  # redis 配置\n  redis:\n    # 地址\n    host: autumn-redis\n    # 端口，默认为6379\n    port: 6379\n    # 数据库索引\n    database: 1\n    # 密码\n    password: zhuang2001\n    # 连接超时时间\n    timeout: 10s\n    lettuce:\n      pool:\n        # 连接池中的最小空闲连接\n        min-idle: 0\n        # 连接池中的最大空闲连接\n        max-idle: 8\n        # 连接池的最大数据库连接数\n        max-active: 8\n        # #连接池最大阻塞等待时间（使用负值表示没有限制）\n        max-wait: -1ms','906c19c71da9b3eb7a90ad24c7df73a6','2023-05-29 01:35:58','2023-05-29 01:35:59','nacos','172.18.0.1','U','dev'),(5,14,'mybatis-plus-config.yml','DEFAULT_GROUP','','#mybatis-plus配置\nmybatis-plus:\n  type-aliases-package: com.autumn.*.entity\n  #mapper-locations: classpath:mapper/*.xml\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    # 开启驼峰命名\n    map-underscore-to-camel-case: true\n  global-config:\n    db-config:\n      logic-delete-field: delFlag\n      logic-delete-value: 1\n      logic-not-delete-value: 0','a17e133e69949efc44da475ddeebd71f','2023-05-31 06:57:46','2023-05-31 06:57:46','nacos','172.18.0.1','U','dev');
/*!40000 ALTER TABLE `his_config_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `role` varchar(50) NOT NULL,
  `resource` varchar(255) NOT NULL,
  `action` varchar(8) NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `username` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  UNIQUE KEY `idx_user_role` (`username`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('nacos','ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_capacity`
--

DROP TABLE IF EXISTS `tenant_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='租户容量信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_capacity`
--

LOCK TABLES `tenant_capacity` WRITE;
/*!40000 ALTER TABLE `tenant_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_info`
--

DROP TABLE IF EXISTS `tenant_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='tenant_info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_info`
--

LOCK TABLES `tenant_info` WRITE;
/*!40000 ALTER TABLE `tenant_info` DISABLE KEYS */;
INSERT INTO `tenant_info` VALUES (1,'1','dev','dev','开发环境','nacos',1685323082813,1685323082813);
/*!40000 ALTER TABLE `tenant_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('nacos','$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-02  9:41:01
