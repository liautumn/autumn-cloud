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
  `encrypted_data_key` text COLLATE utf8_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info`
--

LOCK TABLES `config_info` WRITE;
/*!40000 ALTER TABLE `config_info` DISABLE KEYS */;
INSERT INTO `config_info` VALUES (16,'sa-token-config.yml','DEFAULT_GROUP','# Sa-Token配置\r\nsa-token:\r\n  # token名称 (同时也是cookie名称)\r\n  token-name: autumn-token\r\n  # token有效期，单位s 默认30天, -1代表永不过期\r\n  timeout: 2592000\r\n  # token临时有效期 (指定时间内无操作就视为token过期) 单位: 秒\r\n  activity-timeout: -1\r\n  # 是否允许同一账号并发登录 (为true时允许一起登录, 为false时新登录挤掉旧登录)\r\n  is-concurrent: false\r\n  # 在多人登录同一账号时，是否共用一个token (为true时所有登录共用一个token, 为false时每次登录新建一个token)\r\n  is-share: false\r\n  # token风格\r\n  token-style: random-64\r\n  # 是否输出操作日志\r\n  is-log: false','e8cd1607884c1dd43486c71467b05fd0','2023-06-12 01:08:38','2023-06-12 01:08:38',NULL,'172.18.0.1','','dev',NULL,NULL,NULL,'yaml',NULL,''),(17,'redis-config.yml','DEFAULT_GROUP','spring:\n  # redis 配置\n  redis:\n    # 地址\n    host: 127.0.0.1\n    # 端口，默认为6379\n    port: 6379\n    # 数据库索引\n    database: 1\n    # 密码\n    password: zhuang2001\n    # 连接超时时间\n    timeout: 10s\n    lettuce:\n      pool:\n        # 连接池中的最小空闲连接\n        min-idle: 0\n        # 连接池中的最大空闲连接\n        max-idle: 8\n        # 连接池的最大数据库连接数\n        max-active: 8\n        # #连接池最大阻塞等待时间（使用负值表示没有限制）\n        max-wait: -1ms','969036755ad438cbadf88722c7c7db3e','2023-06-12 01:08:38','2023-06-12 01:08:38',NULL,'172.18.0.1','','dev',NULL,NULL,NULL,'yaml',NULL,''),(18,'autumn-system-dev.yml','DEFAULT_GROUP','spring:\n  # 数据库配置\n  datasource:\n    # 读写分离配置\n    #driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\n    #url: jdbc:shardingsphere:classpath:sharding-read-write.yaml\n    # 非读写分离配置\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n    username: root\n    password: zhuang2001','bb41ad17bc2c7fe0704798ea64921c04','2023-06-12 01:08:38','2023-06-12 01:08:38',NULL,'172.18.0.1','','dev',NULL,NULL,NULL,'yaml',NULL,''),(19,'autumn-gateway-dev.yml','DEFAULT_GROUP','spring:\n  cloud:\n    gateway:\n      routes:\n        - id: auth_router\n          uri: lb://autumn-auth\n          predicates:\n            - Path=/auth/**\n        - id: system_router\n          uri: lb://autumn-system\n          predicates:\n            - Path=/system/**\n        - id: generate_router\n          uri: lb://autumn-generate\n          predicates:\n            - Path=/generate/**\n        - id: demo_router\n          uri: lb://autumn-demo\n          predicates:\n            - Path=/demo/**','724245b2dfbbf145a96eb00fd708bbd5','2023-06-12 01:08:38','2023-06-12 01:10:00','nacos','172.18.0.1','','dev','','','','yaml','',''),(20,'mybatis-plus-config.yml','DEFAULT_GROUP','#mybatis-plus配置\nmybatis-plus:\n  type-aliases-package: com.autumn.*.entity\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    # 开启驼峰命名\n    map-underscore-to-camel-case: true\n  global-config:\n    db-config:\n      logic-delete-field: delFlag\n      logic-delete-value: 0\n      logic-not-delete-value: 1','1454394a59bba4a7ecad8dd272191122','2023-06-12 01:08:38','2023-06-12 01:08:38',NULL,'172.18.0.1','','dev',NULL,NULL,NULL,'yaml',NULL,''),(21,'autumn-demo-dev.yml','DEFAULT_GROUP','spring:\n  # 数据库配置\n  datasource:\n    # 读写分离配置\n    #driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\n    #url: jdbc:shardingsphere:classpath:sharding-read-write.yaml\n    # 非读写分离配置\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n    username: root\n    password: zhuang2001','bb41ad17bc2c7fe0704798ea64921c04','2023-06-12 01:08:38','2023-06-12 01:08:38',NULL,'172.18.0.1','','dev',NULL,NULL,NULL,'yaml',NULL,''),(22,'global-config.yml','DEFAULT_GROUP','spring:\n  main:\n    #允许存在多个Feign调用相同Service的接口\n    allow-bean-definition-overriding: true\npagehelper:\n  helper-dialect: mysql\n# SpringBoot的日志级别默认为info,大于full,导致feign的日志配置不会输出，所以加以下配置\nlogging:\n  level:\n    com.dt.springcloud.openfeign: debug\n# feign日志全局配置\nfeign:\n  client:\n    config:\n      #想要调用的微服务名称(default全局)\n      default:\n        logger-level: BASIC\n        # 连接超时时间，默认2s\n        connectTimeout: 5000\n        # 请求处理超时时间，默认5s\n        readTimeout: 10000\n        request-interceptors: com.autumn.open_feign.FeignAuthRequestInterceptor\nminio:\n  #Minio服务所在地址\n  endpoint: http://127.0.0.1:9000\n  #访问的key\n  accessKey: zhuang2001\n  #访问的秘钥\n  secretKey: zhuang2001\n  #存储桶名称\n  bucketName: files\n    ','56bf472aeb7b1271a928aaeadce06f58','2023-06-12 01:08:38','2023-06-12 01:18:02','nacos','172.18.0.1','','dev','','','','yaml','',''),(23,'sharding-read-write.yaml','DEFAULT_GROUP','mode:\r\n  type: Standalone\r\n  repository:\r\n    type: JDBC\r\n\r\ndataSources:\r\n  master:\r\n    dataSourceClassName: com.zaxxer.hikari.HikariDataSource\r\n    driverClassName: com.mysql.cj.jdbc.Driver\r\n    jdbcUrl: jdbc:mysql://127.0.0.1:3307/test_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true\r\n    username: root\r\n    password: zhuang2001\r\n  slave1:\r\n    dataSourceClassName: com.zaxxer.hikari.HikariDataSource\r\n    driverClassName: com.mysql.cj.jdbc.Driver\r\n    jdbcUrl: jdbc:mysql://127.0.0.1:3308/test_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true\r\n    username: root\r\n    password: zhuang2001\r\n  slave2:\r\n    dataSourceClassName: com.zaxxer.hikari.HikariDataSource\r\n    driverClassName: com.mysql.cj.jdbc.Driver\r\n    jdbcUrl: jdbc:mysql://127.0.0.1:3309/test_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true\r\n    username: root\r\n    password: zhuang2001\r\n\r\nrules:\r\n- !READWRITE_SPLITTING\r\n  dataSources:\r\n    readwrite_ds:\r\n      staticStrategy:\r\n        # 写\r\n        writeDataSourceName: master\r\n        # 读\r\n        readDataSourceNames:\r\n          - slave1\r\n          - slave2\r\n      loadBalancerName: roundRobin\r\n  # 策略\r\n  loadBalancers:\r\n    roundRobin:\r\n      type: ROUND_ROBIN # 轮询\r\n\r\nprops:\r\n  sql-show: true','fae38621f427776bf0637269bfd5f1f5','2023-06-12 01:08:38','2023-06-12 01:08:38',NULL,'172.18.0.1','','dev',NULL,NULL,NULL,'yaml',NULL,''),(24,'autumn-auth-dev.yml','DEFAULT_GROUP','spring:\n  # 数据库配置\n  datasource:\n    # 读写分离配置\n    #driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\n    #url: jdbc:shardingsphere:classpath:sharding-read-write.yaml\n    # 非读写分离配置\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n    username: root\n    password: zhuang2001\n  \nautumn:\n  password:\n    salt: kjsdafhjekhiohni','3f7166aaa8dbb8c8d230be61fe3a9982','2023-06-12 01:08:38','2023-06-12 01:08:38',NULL,'172.18.0.1','','dev',NULL,NULL,NULL,'yaml',NULL,''),(25,'autumn-generate-dev.yml','DEFAULT_GROUP','spring:\r\n  # 数据库配置\r\n  datasource:\r\n    # 读写分离配置\r\n    #driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\r\n    #url: jdbc:shardingsphere:classpath:sharding-read-write.yaml\r\n    # 非读写分离配置\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\r\n    username: root\r\n    password: zhuang2001','b1ee192e864548bd8be6a7ddcda54227','2023-06-12 01:08:38','2023-06-12 01:08:38',NULL,'172.18.0.1','','dev',NULL,NULL,NULL,'yaml',NULL,'');
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
  `encrypted_data_key` text COLLATE utf8_bin NOT NULL COMMENT '秘钥',
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
  `encrypted_data_key` text COLLATE utf8_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='多租户改造';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `his_config_info`
--

LOCK TABLES `his_config_info` WRITE;
/*!40000 ALTER TABLE `his_config_info` DISABLE KEYS */;
INSERT INTO `his_config_info` VALUES (0,1,'sa-token-config.yml','DEFAULT_GROUP','','# Sa-Token配置\r\nsa-token:\r\n  # token名称 (同时也是cookie名称)\r\n  token-name: autumn-token\r\n  # token有效期，单位s 默认30天, -1代表永不过期\r\n  timeout: 2592000\r\n  # token临时有效期 (指定时间内无操作就视为token过期) 单位: 秒\r\n  activity-timeout: -1\r\n  # 是否允许同一账号并发登录 (为true时允许一起登录, 为false时新登录挤掉旧登录)\r\n  is-concurrent: false\r\n  # 在多人登录同一账号时，是否共用一个token (为true时所有登录共用一个token, 为false时每次登录新建一个token)\r\n  is-share: false\r\n  # token风格\r\n  token-style: random-64\r\n  # 是否输出操作日志\r\n  is-log: false','e8cd1607884c1dd43486c71467b05fd0','2023-06-07 01:31:32','2023-06-07 01:31:32',NULL,'172.18.0.1','I','dev',''),(0,2,'redis-config.yml','DEFAULT_GROUP','','spring:\n  # redis 配置\n  redis:\n    # 地址\n    host: 127.0.0.1\n    # 端口，默认为6379\n    port: 6379\n    # 数据库索引\n    database: 1\n    # 密码\n    password: zhuang2001\n    # 连接超时时间\n    timeout: 10s\n    lettuce:\n      pool:\n        # 连接池中的最小空闲连接\n        min-idle: 0\n        # 连接池中的最大空闲连接\n        max-idle: 8\n        # 连接池的最大数据库连接数\n        max-active: 8\n        # #连接池最大阻塞等待时间（使用负值表示没有限制）\n        max-wait: -1ms','969036755ad438cbadf88722c7c7db3e','2023-06-07 01:31:32','2023-06-07 01:31:32',NULL,'172.18.0.1','I','dev',''),(0,3,'autumn-system-dev.yml','DEFAULT_GROUP','','spring:\n  # 数据库配置\n  datasource:\n    # 读写分离配置\n    driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\n    url: jdbc:shardingsphere:classpath:sharding-read-write.yaml\n    # 非读写分离配置\n    #driver-class-name: com.mysql.cj.jdbc.Driver\n    #url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n    #username: root\n    #password: zhuang2001\n  \nautumn:\n  password:\n    salt: kjsdafhjekhiohni','e792ab231418fd2630bd748b571858e4','2023-06-07 01:31:32','2023-06-07 01:31:32',NULL,'172.18.0.1','I','dev',''),(0,4,'autumn-gateway-dev.yml','DEFAULT_GROUP','','spring:\n  cloud:\n    gateway:\n      routes:\n        - id: system_router\n          uri: lb://autumn-system\n          predicates:\n            - Path=/system/**\n        - id: demo_router\n          uri: lb://autumn-demo\n          predicates:\n            - Path=/demo/**','7041a9ced5fd71c694c5f367c0e09843','2023-06-07 01:31:32','2023-06-07 01:31:32',NULL,'172.18.0.1','I','dev',''),(0,5,'mybatis-plus-config.yml','DEFAULT_GROUP','','#mybatis-plus配置\nmybatis-plus:\n  type-aliases-package: com.autumn.*.entity\n  #mapper-locations: classpath:mapper/*.xml\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    # 开启驼峰命名\n    map-underscore-to-camel-case: true\n  global-config:\n    db-config:\n      logic-delete-field: delFlag\n      logic-delete-value: 0\n      logic-not-delete-value: 1','394cbcbc4236a58e5172296485a78dbe','2023-06-07 01:31:32','2023-06-07 01:31:32',NULL,'172.18.0.1','I','dev',''),(0,6,'autumn-demo-dev.yml','DEFAULT_GROUP','','spring:\n  # 数据库配置\n  datasource:\n    # 读写分离配置\n    driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\n    url: jdbc:shardingsphere:classpath:sharding-read-write.yaml\n    # 非读写分离配置\n    #driver-class-name: com.mysql.cj.jdbc.Driver\n    #url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n    #username: root\n    #password: zhuang2001','f4803ad196e9e1321852b8d85c5480d7','2023-06-07 01:31:32','2023-06-07 01:31:32',NULL,'172.18.0.1','I','dev',''),(0,7,'global-config.yml','DEFAULT_GROUP','','spring:\r\n  main:\r\n    #允许存在多个Feign调用相同Service的接口\r\n    allow-bean-definition-overriding: true\r\n# SpringBoot的日志级别默认为info,大于full,导致feign的日志配置不会输出，所以加以下配置\r\nlogging:\r\n  level:\r\n    com.dt.springcloud.openfeign: debug\r\n# feign日志全局配置\r\nfeign:\r\n  client:\r\n    config:\r\n      #想要调用的微服务名称(default全局)\r\n      default:\r\n        logger-level: BASIC\r\n        # 连接超时时间，默认2s\r\n        connectTimeout: 5000\r\n        # 请求处理超时时间，默认5s\r\n        readTimeout: 10000\r\n        request-interceptors: com.autumn.open_feign.FeignAuthRequestInterceptor\r\n    ','c3ff9097b7da58aaab9784daa2332517','2023-06-07 01:31:32','2023-06-07 01:31:32',NULL,'172.18.0.1','I','dev',''),(0,8,'sharding-read-write.yaml','DEFAULT_GROUP','','mode:\r\n  type: Standalone\r\n  repository:\r\n    type: JDBC\r\n\r\ndataSources:\r\n  master:\r\n    dataSourceClassName: com.zaxxer.hikari.HikariDataSource\r\n    driverClassName: com.mysql.cj.jdbc.Driver\r\n    jdbcUrl: jdbc:mysql://127.0.0.1:3307/test_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true\r\n    username: root\r\n    password: zhuang2001\r\n  slave1:\r\n    dataSourceClassName: com.zaxxer.hikari.HikariDataSource\r\n    driverClassName: com.mysql.cj.jdbc.Driver\r\n    jdbcUrl: jdbc:mysql://127.0.0.1:3308/test_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true\r\n    username: root\r\n    password: zhuang2001\r\n  slave2:\r\n    dataSourceClassName: com.zaxxer.hikari.HikariDataSource\r\n    driverClassName: com.mysql.cj.jdbc.Driver\r\n    jdbcUrl: jdbc:mysql://127.0.0.1:3309/test_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true\r\n    username: root\r\n    password: zhuang2001\r\n\r\nrules:\r\n- !READWRITE_SPLITTING\r\n  dataSources:\r\n    readwrite_ds:\r\n      staticStrategy:\r\n        # 写\r\n        writeDataSourceName: master\r\n        # 读\r\n        readDataSourceNames:\r\n          - slave1\r\n          - slave2\r\n      loadBalancerName: roundRobin\r\n  # 策略\r\n  loadBalancers:\r\n    roundRobin:\r\n      type: ROUND_ROBIN # 轮询\r\n\r\nprops:\r\n  sql-show: true','fae38621f427776bf0637269bfd5f1f5','2023-06-07 01:31:32','2023-06-07 01:31:32',NULL,'172.18.0.1','I','dev',''),(7,9,'global-config.yml','DEFAULT_GROUP','','spring:\r\n  main:\r\n    #允许存在多个Feign调用相同Service的接口\r\n    allow-bean-definition-overriding: true\r\n# SpringBoot的日志级别默认为info,大于full,导致feign的日志配置不会输出，所以加以下配置\r\nlogging:\r\n  level:\r\n    com.dt.springcloud.openfeign: debug\r\n# feign日志全局配置\r\nfeign:\r\n  client:\r\n    config:\r\n      #想要调用的微服务名称(default全局)\r\n      default:\r\n        logger-level: BASIC\r\n        # 连接超时时间，默认2s\r\n        connectTimeout: 5000\r\n        # 请求处理超时时间，默认5s\r\n        readTimeout: 10000\r\n        request-interceptors: com.autumn.open_feign.FeignAuthRequestInterceptor\r\n    ','c3ff9097b7da58aaab9784daa2332517','2023-06-07 01:32:33','2023-06-07 01:32:33','nacos','172.18.0.1','U','dev',''),(4,10,'autumn-gateway-dev.yml','DEFAULT_GROUP','','spring:\n  cloud:\n    gateway:\n      routes:\n        - id: system_router\n          uri: lb://autumn-system\n          predicates:\n            - Path=/system/**\n        - id: demo_router\n          uri: lb://autumn-demo\n          predicates:\n            - Path=/demo/**','7041a9ced5fd71c694c5f367c0e09843','2023-06-07 02:25:49','2023-06-07 02:25:50','nacos','172.18.0.1','U','dev',''),(0,11,'autumn-auth.yml','DEFAULT_GROUP','','spring:\r\n  # 数据库配置\r\n  datasource:\r\n    # 读写分离配置\r\n    driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\r\n    url: jdbc:shardingsphere:classpath:sharding-read-write.yaml\r\n    # 非读写分离配置\r\n    #driver-class-name: com.mysql.cj.jdbc.Driver\r\n    #url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\r\n    #username: root\r\n    #password: zhuang2001\r\n  \r\nautumn:\r\n  password:\r\n    salt: kjsdafhjekhiohni','222bee8e9cb939a05ccc902cb38c260f','2023-06-07 02:28:21','2023-06-07 02:28:22','nacos','172.18.0.1','I','dev',''),(3,12,'autumn-system-dev.yml','DEFAULT_GROUP','','spring:\n  # 数据库配置\n  datasource:\n    # 读写分离配置\n    driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\n    url: jdbc:shardingsphere:classpath:sharding-read-write.yaml\n    # 非读写分离配置\n    #driver-class-name: com.mysql.cj.jdbc.Driver\n    #url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n    #username: root\n    #password: zhuang2001\n  \nautumn:\n  password:\n    salt: kjsdafhjekhiohni','e792ab231418fd2630bd748b571858e4','2023-06-07 02:28:34','2023-06-07 02:28:35','nacos','172.18.0.1','U','dev',''),(11,13,'autumn-auth.yml','DEFAULT_GROUP','','spring:\r\n  # 数据库配置\r\n  datasource:\r\n    # 读写分离配置\r\n    driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\r\n    url: jdbc:shardingsphere:classpath:sharding-read-write.yaml\r\n    # 非读写分离配置\r\n    #driver-class-name: com.mysql.cj.jdbc.Driver\r\n    #url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\r\n    #username: root\r\n    #password: zhuang2001\r\n  \r\nautumn:\r\n  password:\r\n    salt: kjsdafhjekhiohni','222bee8e9cb939a05ccc902cb38c260f','2023-06-07 02:30:52','2023-06-07 02:30:52','nacos','172.18.0.1','D','dev',''),(0,14,'autumn-auth-dev.yml','DEFAULT_GROUP','','spring:\r\n  # 数据库配置\r\n  datasource:\r\n    # 读写分离配置\r\n    driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\r\n    url: jdbc:shardingsphere:classpath:sharding-read-write.yaml\r\n    # 非读写分离配置\r\n    #driver-class-name: com.mysql.cj.jdbc.Driver\r\n    #url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\r\n    #username: root\r\n    #password: zhuang2001\r\n  \r\nautumn:\r\n  password:\r\n    salt: kjsdafhjekhiohni','222bee8e9cb939a05ccc902cb38c260f','2023-06-07 02:31:08','2023-06-07 02:31:09','nacos','172.18.0.1','I','dev',''),(2,15,'redis-config.yml','DEFAULT_GROUP','','spring:\n  # redis 配置\n  redis:\n    # 地址\n    host: 127.0.0.1\n    # 端口，默认为6379\n    port: 6379\n    # 数据库索引\n    database: 1\n    # 密码\n    password: zhuang2001\n    # 连接超时时间\n    timeout: 10s\n    lettuce:\n      pool:\n        # 连接池中的最小空闲连接\n        min-idle: 0\n        # 连接池中的最大空闲连接\n        max-idle: 8\n        # 连接池的最大数据库连接数\n        max-active: 8\n        # #连接池最大阻塞等待时间（使用负值表示没有限制）\n        max-wait: -1ms','969036755ad438cbadf88722c7c7db3e','2023-06-07 02:50:23','2023-06-07 02:50:23','nacos','172.18.0.1','U','dev',''),(5,16,'mybatis-plus-config.yml','DEFAULT_GROUP','','#mybatis-plus配置\nmybatis-plus:\n  type-aliases-package: com.autumn.*.entity\n  #mapper-locations: classpath:mapper/*.xml\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    # 开启驼峰命名\n    map-underscore-to-camel-case: true\n  global-config:\n    db-config:\n      logic-delete-field: delFlag\n      logic-delete-value: 0\n      logic-not-delete-value: 1','394cbcbc4236a58e5172296485a78dbe','2023-06-07 02:50:48','2023-06-07 02:50:48','nacos','172.18.0.1','U','dev',''),(6,17,'autumn-demo-dev.yml','DEFAULT_GROUP','','spring:\n  # 数据库配置\n  datasource:\n    # 读写分离配置\n    driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\n    url: jdbc:shardingsphere:classpath:sharding-read-write.yaml\n    # 非读写分离配置\n    #driver-class-name: com.mysql.cj.jdbc.Driver\n    #url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n    #username: root\n    #password: zhuang2001','f4803ad196e9e1321852b8d85c5480d7','2023-06-07 02:51:03','2023-06-07 02:51:03','nacos','172.18.0.1','U','dev',''),(3,18,'autumn-system-dev.yml','DEFAULT_GROUP','','spring:\n  # 数据库配置\n  datasource:\n    # 读写分离配置\n    driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\n    url: jdbc:shardingsphere:classpath:sharding-read-write.yaml\n    # 非读写分离配置\n    #driver-class-name: com.mysql.cj.jdbc.Driver\n    #url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n    #username: root\n    #password: zhuang2001','f4803ad196e9e1321852b8d85c5480d7','2023-06-07 02:51:22','2023-06-07 02:51:22','nacos','172.18.0.1','U','dev',''),(6,19,'autumn-demo-dev.yml','DEFAULT_GROUP','','spring:\n  # 数据库配置\n  datasource:\n    # 读写分离配置\n    driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\n    url: jdbc:shardingsphere:classpath:sharding-read-write.yaml\n    # 非读写分离配置\n    #driver-class-name: com.mysql.cj.jdbc.Driver\n    #url: jdbc:mysql://autumn-mysql:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n    #username: root\n    #password: zhuang2001','091dd9f4a14f4cc5f922b76ee3263adb','2023-06-07 02:51:43','2023-06-07 02:51:44','nacos','172.18.0.1','U','dev',''),(3,20,'autumn-system-dev.yml','DEFAULT_GROUP','','spring:\n  # 数据库配置\n  datasource:\n    # 读写分离配置\n    driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\n    url: jdbc:shardingsphere:classpath:sharding-read-write.yaml\n    # 非读写分离配置\n    #driver-class-name: com.mysql.cj.jdbc.Driver\n    #url: jdbc:mysql://autumn-mysql:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n    #username: root\n    #password: zhuang2001','091dd9f4a14f4cc5f922b76ee3263adb','2023-06-07 02:52:04','2023-06-07 02:52:04','nacos','172.18.0.1','U','dev',''),(13,21,'autumn-auth-dev.yml','DEFAULT_GROUP','','spring:\r\n  # 数据库配置\r\n  datasource:\r\n    # 读写分离配置\r\n    driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\r\n    url: jdbc:shardingsphere:classpath:sharding-read-write.yaml\r\n    # 非读写分离配置\r\n    #driver-class-name: com.mysql.cj.jdbc.Driver\r\n    #url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\r\n    #username: root\r\n    #password: zhuang2001\r\n  \r\nautumn:\r\n  password:\r\n    salt: kjsdafhjekhiohni','222bee8e9cb939a05ccc902cb38c260f','2023-06-07 02:52:40','2023-06-07 02:52:41','nacos','172.18.0.1','U','dev',''),(13,22,'autumn-auth-dev.yml','DEFAULT_GROUP','','spring:\n  # 数据库配置\n  datasource:\n    # 读写分离配置\n    #driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\n    #url: jdbc:shardingsphere:classpath:sharding-read-write.yaml\n    # 非读写分离配置\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n    username: root\n    password: zhuang2001\n  \nautumn:\n  password:\n    salt: kjsdafhjekhiohni','3f7166aaa8dbb8c8d230be61fe3a9982','2023-06-07 02:53:09','2023-06-07 02:53:10','nacos','172.18.0.1','U','dev',''),(2,23,'redis-config.yml','DEFAULT_GROUP','','spring:\n  # redis 配置\n  redis:\n    # 地址\n    host: autumn-redis\n    # 端口，默认为6379\n    port: 6379\n    # 数据库索引\n    database: 1\n    # 密码\n    password: zhuang2001\n    # 连接超时时间\n    timeout: 10s\n    lettuce:\n      pool:\n        # 连接池中的最小空闲连接\n        min-idle: 0\n        # 连接池中的最大空闲连接\n        max-idle: 8\n        # 连接池的最大数据库连接数\n        max-active: 8\n        # #连接池最大阻塞等待时间（使用负值表示没有限制）\n        max-wait: -1ms','906c19c71da9b3eb7a90ad24c7df73a6','2023-06-07 02:53:30','2023-06-07 02:53:30','nacos','172.18.0.1','U','dev',''),(3,24,'autumn-system-dev.yml','DEFAULT_GROUP','','spring:\n  # 数据库配置\n  datasource:\n    # 读写分离配置\n    #driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\n    #url: jdbc:shardingsphere:classpath:sharding-read-write.yaml\n    # 非读写分离配置\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://autumn-mysql:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n    username: root\n    password: zhuang2001','5c009bfcf769786b2839a07feb71cf82','2023-06-07 02:53:44','2023-06-07 02:53:44','nacos','172.18.0.1','U','dev',''),(6,25,'autumn-demo-dev.yml','DEFAULT_GROUP','','spring:\n  # 数据库配置\n  datasource:\n    # 读写分离配置\n    #driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\n    #url: jdbc:shardingsphere:classpath:sharding-read-write.yaml\n    # 非读写分离配置\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://autumn-mysql:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n    username: root\n    password: zhuang2001','5c009bfcf769786b2839a07feb71cf82','2023-06-07 02:53:58','2023-06-07 02:53:58','nacos','172.18.0.1','U','dev',''),(0,26,'autumn-generate-dev.yml','DEFAULT_GROUP','','spring:\r\n  # 数据库配置\r\n  datasource:\r\n    # 读写分离配置\r\n    #driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\r\n    #url: jdbc:shardingsphere:classpath:sharding-read-write.yaml\r\n    # 非读写分离配置\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\r\n    username: root\r\n    password: zhuang2001','b1ee192e864548bd8be6a7ddcda54227','2023-06-11 10:21:14','2023-06-11 10:21:14','nacos','172.18.0.1','I','dev',''),(4,27,'autumn-gateway-dev.yml','DEFAULT_GROUP','','spring:\n  cloud:\n    gateway:\n      routes:\n        - id: auth_router\n          uri: lb://autumn-auth\n          predicates:\n            - Path=/auth/**\n        - id: system_router\n          uri: lb://autumn-system\n          predicates:\n            - Path=/system/**\n        - id: demo_router\n          uri: lb://autumn-demo\n          predicates:\n            - Path=/demo/**','8650d07478c44983965412e5ca9062c4','2023-06-12 01:07:47','2023-06-12 01:07:47','nacos','172.18.0.1','U','dev',''),(1,28,'sa-token-config.yml','DEFAULT_GROUP','','# Sa-Token配置\r\nsa-token:\r\n  # token名称 (同时也是cookie名称)\r\n  token-name: autumn-token\r\n  # token有效期，单位s 默认30天, -1代表永不过期\r\n  timeout: 2592000\r\n  # token临时有效期 (指定时间内无操作就视为token过期) 单位: 秒\r\n  activity-timeout: -1\r\n  # 是否允许同一账号并发登录 (为true时允许一起登录, 为false时新登录挤掉旧登录)\r\n  is-concurrent: false\r\n  # 在多人登录同一账号时，是否共用一个token (为true时所有登录共用一个token, 为false时每次登录新建一个token)\r\n  is-share: false\r\n  # token风格\r\n  token-style: random-64\r\n  # 是否输出操作日志\r\n  is-log: false','e8cd1607884c1dd43486c71467b05fd0','2023-06-12 01:08:30','2023-06-12 01:08:31',NULL,'172.18.0.1','D','dev',''),(2,29,'redis-config.yml','DEFAULT_GROUP','','spring:\n  # redis 配置\n  redis:\n    # 地址\n    host: 127.0.0.1\n    # 端口，默认为6379\n    port: 6379\n    # 数据库索引\n    database: 1\n    # 密码\n    password: zhuang2001\n    # 连接超时时间\n    timeout: 10s\n    lettuce:\n      pool:\n        # 连接池中的最小空闲连接\n        min-idle: 0\n        # 连接池中的最大空闲连接\n        max-idle: 8\n        # 连接池的最大数据库连接数\n        max-active: 8\n        # #连接池最大阻塞等待时间（使用负值表示没有限制）\n        max-wait: -1ms','969036755ad438cbadf88722c7c7db3e','2023-06-12 01:08:30','2023-06-12 01:08:31',NULL,'172.18.0.1','D','dev',''),(3,30,'autumn-system-dev.yml','DEFAULT_GROUP','','spring:\n  # 数据库配置\n  datasource:\n    # 读写分离配置\n    #driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\n    #url: jdbc:shardingsphere:classpath:sharding-read-write.yaml\n    # 非读写分离配置\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n    username: root\n    password: zhuang2001','bb41ad17bc2c7fe0704798ea64921c04','2023-06-12 01:08:30','2023-06-12 01:08:31',NULL,'172.18.0.1','D','dev',''),(4,31,'autumn-gateway-dev.yml','DEFAULT_GROUP','','spring:\n  cloud:\n    gateway:\n      routes:\n        - id: auth_router\n          uri: lb://autumn-auth\n          predicates:\n            - Path=/auth/**\n        - id: system_router\n          uri: lb://autumn-system\n          predicates:\n            - Path=/system/**\n        - id: generate_router\n          uri: lb://autumn-generate\n          predicates:\n            - Path=/generate/**\n        - id: demo_router\n          uri: lb://autumn-demo\n          predicates:\n            - Path=/demo/**','724245b2dfbbf145a96eb00fd708bbd5','2023-06-12 01:08:30','2023-06-12 01:08:31',NULL,'172.18.0.1','D','dev',''),(5,32,'mybatis-plus-config.yml','DEFAULT_GROUP','','#mybatis-plus配置\nmybatis-plus:\n  type-aliases-package: com.autumn.*.entity\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    # 开启驼峰命名\n    map-underscore-to-camel-case: true\n  global-config:\n    db-config:\n      logic-delete-field: delFlag\n      logic-delete-value: 0\n      logic-not-delete-value: 1','1454394a59bba4a7ecad8dd272191122','2023-06-12 01:08:30','2023-06-12 01:08:31',NULL,'172.18.0.1','D','dev',''),(6,33,'autumn-demo-dev.yml','DEFAULT_GROUP','','spring:\n  # 数据库配置\n  datasource:\n    # 读写分离配置\n    #driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\n    #url: jdbc:shardingsphere:classpath:sharding-read-write.yaml\n    # 非读写分离配置\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n    username: root\n    password: zhuang2001','bb41ad17bc2c7fe0704798ea64921c04','2023-06-12 01:08:30','2023-06-12 01:08:31',NULL,'172.18.0.1','D','dev',''),(7,34,'global-config.yml','DEFAULT_GROUP','','spring:\n  main:\n    #允许存在多个Feign调用相同Service的接口\n    allow-bean-definition-overriding: true\npagehelper:\n  helper-dialect: mysql\n# SpringBoot的日志级别默认为info,大于full,导致feign的日志配置不会输出，所以加以下配置\nlogging:\n  level:\n    com.dt.springcloud.openfeign: debug\n# feign日志全局配置\nfeign:\n  client:\n    config:\n      #想要调用的微服务名称(default全局)\n      default:\n        logger-level: BASIC\n        # 连接超时时间，默认2s\n        connectTimeout: 5000\n        # 请求处理超时时间，默认5s\n        readTimeout: 10000\n        request-interceptors: com.autumn.open_feign.FeignAuthRequestInterceptor\n    ','2a43f89acf2ffcbf3dcb01e7c86b5764','2023-06-12 01:08:30','2023-06-12 01:08:31',NULL,'172.18.0.1','D','dev',''),(8,35,'sharding-read-write.yaml','DEFAULT_GROUP','','mode:\r\n  type: Standalone\r\n  repository:\r\n    type: JDBC\r\n\r\ndataSources:\r\n  master:\r\n    dataSourceClassName: com.zaxxer.hikari.HikariDataSource\r\n    driverClassName: com.mysql.cj.jdbc.Driver\r\n    jdbcUrl: jdbc:mysql://127.0.0.1:3307/test_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true\r\n    username: root\r\n    password: zhuang2001\r\n  slave1:\r\n    dataSourceClassName: com.zaxxer.hikari.HikariDataSource\r\n    driverClassName: com.mysql.cj.jdbc.Driver\r\n    jdbcUrl: jdbc:mysql://127.0.0.1:3308/test_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true\r\n    username: root\r\n    password: zhuang2001\r\n  slave2:\r\n    dataSourceClassName: com.zaxxer.hikari.HikariDataSource\r\n    driverClassName: com.mysql.cj.jdbc.Driver\r\n    jdbcUrl: jdbc:mysql://127.0.0.1:3309/test_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true\r\n    username: root\r\n    password: zhuang2001\r\n\r\nrules:\r\n- !READWRITE_SPLITTING\r\n  dataSources:\r\n    readwrite_ds:\r\n      staticStrategy:\r\n        # 写\r\n        writeDataSourceName: master\r\n        # 读\r\n        readDataSourceNames:\r\n          - slave1\r\n          - slave2\r\n      loadBalancerName: roundRobin\r\n  # 策略\r\n  loadBalancers:\r\n    roundRobin:\r\n      type: ROUND_ROBIN # 轮询\r\n\r\nprops:\r\n  sql-show: true','fae38621f427776bf0637269bfd5f1f5','2023-06-12 01:08:30','2023-06-12 01:08:31',NULL,'172.18.0.1','D','dev',''),(13,36,'autumn-auth-dev.yml','DEFAULT_GROUP','','spring:\n  # 数据库配置\n  datasource:\n    # 读写分离配置\n    #driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\n    #url: jdbc:shardingsphere:classpath:sharding-read-write.yaml\n    # 非读写分离配置\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n    username: root\n    password: zhuang2001\n  \nautumn:\n  password:\n    salt: kjsdafhjekhiohni','3f7166aaa8dbb8c8d230be61fe3a9982','2023-06-12 01:08:30','2023-06-12 01:08:31',NULL,'172.18.0.1','D','dev',''),(14,37,'autumn-generate-dev.yml','DEFAULT_GROUP','','spring:\r\n  # 数据库配置\r\n  datasource:\r\n    # 读写分离配置\r\n    #driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\r\n    #url: jdbc:shardingsphere:classpath:sharding-read-write.yaml\r\n    # 非读写分离配置\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\r\n    username: root\r\n    password: zhuang2001','b1ee192e864548bd8be6a7ddcda54227','2023-06-12 01:08:30','2023-06-12 01:08:31',NULL,'172.18.0.1','D','dev',''),(0,38,'sa-token-config.yml','DEFAULT_GROUP','','# Sa-Token配置\r\nsa-token:\r\n  # token名称 (同时也是cookie名称)\r\n  token-name: autumn-token\r\n  # token有效期，单位s 默认30天, -1代表永不过期\r\n  timeout: 2592000\r\n  # token临时有效期 (指定时间内无操作就视为token过期) 单位: 秒\r\n  activity-timeout: -1\r\n  # 是否允许同一账号并发登录 (为true时允许一起登录, 为false时新登录挤掉旧登录)\r\n  is-concurrent: false\r\n  # 在多人登录同一账号时，是否共用一个token (为true时所有登录共用一个token, 为false时每次登录新建一个token)\r\n  is-share: false\r\n  # token风格\r\n  token-style: random-64\r\n  # 是否输出操作日志\r\n  is-log: false','e8cd1607884c1dd43486c71467b05fd0','2023-06-12 01:08:37','2023-06-12 01:08:38',NULL,'172.18.0.1','I','dev',''),(0,39,'redis-config.yml','DEFAULT_GROUP','','spring:\n  # redis 配置\n  redis:\n    # 地址\n    host: 127.0.0.1\n    # 端口，默认为6379\n    port: 6379\n    # 数据库索引\n    database: 1\n    # 密码\n    password: zhuang2001\n    # 连接超时时间\n    timeout: 10s\n    lettuce:\n      pool:\n        # 连接池中的最小空闲连接\n        min-idle: 0\n        # 连接池中的最大空闲连接\n        max-idle: 8\n        # 连接池的最大数据库连接数\n        max-active: 8\n        # #连接池最大阻塞等待时间（使用负值表示没有限制）\n        max-wait: -1ms','969036755ad438cbadf88722c7c7db3e','2023-06-12 01:08:37','2023-06-12 01:08:38',NULL,'172.18.0.1','I','dev',''),(0,40,'autumn-system-dev.yml','DEFAULT_GROUP','','spring:\n  # 数据库配置\n  datasource:\n    # 读写分离配置\n    #driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\n    #url: jdbc:shardingsphere:classpath:sharding-read-write.yaml\n    # 非读写分离配置\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n    username: root\n    password: zhuang2001','bb41ad17bc2c7fe0704798ea64921c04','2023-06-12 01:08:37','2023-06-12 01:08:38',NULL,'172.18.0.1','I','dev',''),(0,41,'autumn-gateway-dev.yml','DEFAULT_GROUP','','spring:\n  cloud:\n    gateway:\n      routes:\n        - id: auth_router\n          uri: lb://autumn-auth\n          predicates:\n            - Path=/auth/**\n        - id: system_router\n          uri: lb://autumn-system\n          predicates:\n            - Path=/system/**\n        - id: demo_router\n          uri: lb://autumn-demo\n          predicates:\n            - Path=/demo/**','8650d07478c44983965412e5ca9062c4','2023-06-12 01:08:37','2023-06-12 01:08:38',NULL,'172.18.0.1','I','dev',''),(0,42,'mybatis-plus-config.yml','DEFAULT_GROUP','','#mybatis-plus配置\nmybatis-plus:\n  type-aliases-package: com.autumn.*.entity\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    # 开启驼峰命名\n    map-underscore-to-camel-case: true\n  global-config:\n    db-config:\n      logic-delete-field: delFlag\n      logic-delete-value: 0\n      logic-not-delete-value: 1','1454394a59bba4a7ecad8dd272191122','2023-06-12 01:08:37','2023-06-12 01:08:38',NULL,'172.18.0.1','I','dev',''),(0,43,'autumn-demo-dev.yml','DEFAULT_GROUP','','spring:\n  # 数据库配置\n  datasource:\n    # 读写分离配置\n    #driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\n    #url: jdbc:shardingsphere:classpath:sharding-read-write.yaml\n    # 非读写分离配置\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n    username: root\n    password: zhuang2001','bb41ad17bc2c7fe0704798ea64921c04','2023-06-12 01:08:37','2023-06-12 01:08:38',NULL,'172.18.0.1','I','dev',''),(0,44,'global-config.yml','DEFAULT_GROUP','','spring:\n  main:\n    #允许存在多个Feign调用相同Service的接口\n    allow-bean-definition-overriding: true\npagehelper:\n  helper-dialect: mysql\n# SpringBoot的日志级别默认为info,大于full,导致feign的日志配置不会输出，所以加以下配置\nlogging:\n  level:\n    com.dt.springcloud.openfeign: debug\n# feign日志全局配置\nfeign:\n  client:\n    config:\n      #想要调用的微服务名称(default全局)\n      default:\n        logger-level: BASIC\n        # 连接超时时间，默认2s\n        connectTimeout: 5000\n        # 请求处理超时时间，默认5s\n        readTimeout: 10000\n        request-interceptors: com.autumn.open_feign.FeignAuthRequestInterceptor\n    ','2a43f89acf2ffcbf3dcb01e7c86b5764','2023-06-12 01:08:37','2023-06-12 01:08:38',NULL,'172.18.0.1','I','dev',''),(0,45,'sharding-read-write.yaml','DEFAULT_GROUP','','mode:\r\n  type: Standalone\r\n  repository:\r\n    type: JDBC\r\n\r\ndataSources:\r\n  master:\r\n    dataSourceClassName: com.zaxxer.hikari.HikariDataSource\r\n    driverClassName: com.mysql.cj.jdbc.Driver\r\n    jdbcUrl: jdbc:mysql://127.0.0.1:3307/test_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true\r\n    username: root\r\n    password: zhuang2001\r\n  slave1:\r\n    dataSourceClassName: com.zaxxer.hikari.HikariDataSource\r\n    driverClassName: com.mysql.cj.jdbc.Driver\r\n    jdbcUrl: jdbc:mysql://127.0.0.1:3308/test_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true\r\n    username: root\r\n    password: zhuang2001\r\n  slave2:\r\n    dataSourceClassName: com.zaxxer.hikari.HikariDataSource\r\n    driverClassName: com.mysql.cj.jdbc.Driver\r\n    jdbcUrl: jdbc:mysql://127.0.0.1:3309/test_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true\r\n    username: root\r\n    password: zhuang2001\r\n\r\nrules:\r\n- !READWRITE_SPLITTING\r\n  dataSources:\r\n    readwrite_ds:\r\n      staticStrategy:\r\n        # 写\r\n        writeDataSourceName: master\r\n        # 读\r\n        readDataSourceNames:\r\n          - slave1\r\n          - slave2\r\n      loadBalancerName: roundRobin\r\n  # 策略\r\n  loadBalancers:\r\n    roundRobin:\r\n      type: ROUND_ROBIN # 轮询\r\n\r\nprops:\r\n  sql-show: true','fae38621f427776bf0637269bfd5f1f5','2023-06-12 01:08:37','2023-06-12 01:08:38',NULL,'172.18.0.1','I','dev',''),(0,46,'autumn-auth-dev.yml','DEFAULT_GROUP','','spring:\n  # 数据库配置\n  datasource:\n    # 读写分离配置\n    #driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\n    #url: jdbc:shardingsphere:classpath:sharding-read-write.yaml\n    # 非读写分离配置\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n    username: root\n    password: zhuang2001\n  \nautumn:\n  password:\n    salt: kjsdafhjekhiohni','3f7166aaa8dbb8c8d230be61fe3a9982','2023-06-12 01:08:37','2023-06-12 01:08:38',NULL,'172.18.0.1','I','dev',''),(0,47,'autumn-generate-dev.yml','DEFAULT_GROUP','','spring:\r\n  # 数据库配置\r\n  datasource:\r\n    # 读写分离配置\r\n    #driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\r\n    #url: jdbc:shardingsphere:classpath:sharding-read-write.yaml\r\n    # 非读写分离配置\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://127.0.0.1:3306/autumn_cloud?useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\r\n    username: root\r\n    password: zhuang2001','b1ee192e864548bd8be6a7ddcda54227','2023-06-12 01:08:37','2023-06-12 01:08:38',NULL,'172.18.0.1','I','dev',''),(22,48,'global-config.yml','DEFAULT_GROUP','','spring:\n  main:\n    #允许存在多个Feign调用相同Service的接口\n    allow-bean-definition-overriding: true\npagehelper:\n  helper-dialect: mysql\n# SpringBoot的日志级别默认为info,大于full,导致feign的日志配置不会输出，所以加以下配置\nlogging:\n  level:\n    com.dt.springcloud.openfeign: debug\n# feign日志全局配置\nfeign:\n  client:\n    config:\n      #想要调用的微服务名称(default全局)\n      default:\n        logger-level: BASIC\n        # 连接超时时间，默认2s\n        connectTimeout: 5000\n        # 请求处理超时时间，默认5s\n        readTimeout: 10000\n        request-interceptors: com.autumn.open_feign.FeignAuthRequestInterceptor\n    ','2a43f89acf2ffcbf3dcb01e7c86b5764','2023-06-12 01:09:30','2023-06-12 01:09:31','nacos','172.18.0.1','U','dev',''),(19,49,'autumn-gateway-dev.yml','DEFAULT_GROUP','','spring:\n  cloud:\n    gateway:\n      routes:\n        - id: auth_router\n          uri: lb://autumn-auth\n          predicates:\n            - Path=/auth/**\n        - id: system_router\n          uri: lb://autumn-system\n          predicates:\n            - Path=/system/**\n        - id: demo_router\n          uri: lb://autumn-demo\n          predicates:\n            - Path=/demo/**','8650d07478c44983965412e5ca9062c4','2023-06-12 01:09:59','2023-06-12 01:10:00','nacos','172.18.0.1','U','dev',''),(22,50,'global-config.yml','DEFAULT_GROUP','','spring:\n  main:\n    #允许存在多个Feign调用相同Service的接口\n    allow-bean-definition-overriding: true\npagehelper:\n  helper-dialect: mysql\n# SpringBoot的日志级别默认为info,大于full,导致feign的日志配置不会输出，所以加以下配置\nlogging:\n  level:\n    com.dt.springcloud.openfeign: debug\n# feign日志全局配置\nfeign:\n  client:\n    config:\n      #想要调用的微服务名称(default全局)\n      default:\n        logger-level: BASIC\n        # 连接超时时间，默认2s\n        connectTimeout: 5000\n        # 请求处理超时时间，默认5s\n        readTimeout: 10000\n        request-interceptors: com.autumn.open_feign.FeignAuthRequestInterceptor\nminio:\n  #Minio服务所在地址\n  endpoint: http://127.0.0.1:9000\n  #访问的key\n  accessKey: R8fI3CYwoJVXQ9TAGkPb\n  #访问的秘钥\n  secretKey: nCalwY7rgJRLRGA5gKyyjyKY9jJNryGyOqWgEnf8\n  #存储桶名称\n  bucketName: files\n    ','a8c8727740186adc31128474c6f90bfd','2023-06-12 01:17:12','2023-06-12 01:17:13','nacos','172.18.0.1','U','dev',''),(22,51,'global-config.yml','DEFAULT_GROUP','','spring:\n  main:\n    #允许存在多个Feign调用相同Service的接口\n    allow-bean-definition-overriding: true\npagehelper:\n  helper-dialect: mysql\n# SpringBoot的日志级别默认为info,大于full,导致feign的日志配置不会输出，所以加以下配置\nlogging:\n  level:\n    com.dt.springcloud.openfeign: debug\n# feign日志全局配置\nfeign:\n  client:\n    config:\n      #想要调用的微服务名称(default全局)\n      default:\n        logger-level: BASIC\n        # 连接超时时间，默认2s\n        connectTimeout: 5000\n        # 请求处理超时时间，默认5s\n        readTimeout: 10000\n        request-interceptors: com.autumn.open_feign.FeignAuthRequestInterceptor\nminio:\n  #Minio服务所在地址\n  endpoint: http://127.0.0.1:9000\n  #访问的key\n  accessKey: admin\n  #访问的秘钥\n  secretKey: zhuang2001\n  #存储桶名称\n  bucketName: files\n    ','8e9debdc733a29681d7bcdd632461ed4','2023-06-12 01:18:01','2023-06-12 01:18:02','nacos','172.18.0.1','U','dev','');
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
INSERT INTO `tenant_info` VALUES (1,'1','dev','dev','开发环境','nacos',1686101481903,1686101481903);
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

-- Dump completed on 2023-06-14 18:10:34
