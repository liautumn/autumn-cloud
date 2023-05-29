-- MySQL dump 10.13  Distrib 5.7.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: autumn_cloud
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
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2023-05-25 03:10:55','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2023-05-25 03:10:55','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2023-05-25 03:10:55','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2023-05-25 03:10:55','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2023-05-25 03:10:55','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2023-05-25 03:10:55','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(11) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-25 03:10:49','',NULL),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-25 03:10:49','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-25 03:10:49','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-25 03:10:49','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-25 03:10:49','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-25 03:10:50','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-25 03:10:50','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-25 03:10:50','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-25 03:10:50','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-25 03:10:50','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(11) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2023-05-25 03:10:55','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2023-05-25 03:10:55','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2023-05-25 03:10:55','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2023-05-25 03:10:55','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2023-05-25 03:10:55','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2023-05-25 03:10:55','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2023-05-25 03:10:55','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2023-05-25 03:10:55','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2023-05-25 03:10:55','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2023-05-25 03:10:55','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2023-05-25 03:10:55','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2023-05-25 03:10:55','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2023-05-25 03:10:55','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2023-05-25 03:10:55','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2023-05-25 03:10:55','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2023-05-25 03:10:55','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2023-05-25 03:10:55','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2023-05-25 03:10:55','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2023-05-25 03:10:55','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2023-05-25 03:10:55','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2023-05-25 03:10:55','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2023-05-25 03:10:55','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2023-05-25 03:10:55','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2023-05-25 03:10:55','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2023-05-25 03:10:55','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2023-05-25 03:10:55','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2023-05-25 03:10:55','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2023-05-25 03:10:55','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2023-05-25 03:10:55','',NULL,'停用状态');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2023-05-25 03:10:54','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2023-05-25 03:10:54','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2023-05-25 03:10:54','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2023-05-25 03:10:54','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2023-05-25 03:10:54','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2023-05-25 03:10:54','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2023-05-25 03:10:54','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2023-05-25 03:10:54','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2023-05-25 03:10:55','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2023-05-25 03:10:55','',NULL,'登录状态列表');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2023-05-25 03:10:56','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2023-05-25 03:10:56','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2023-05-25 03:10:56','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(11) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(11) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(11) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2000 DEFAULT CHARSET=utf8mb4 COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system','系统管理目录','0','admin','2023-05-25 03:10:50','',NULL),(2,'系统监控',0,2,'monitor',NULL,'',1,0,'M','0','0','','monitor','系统监控目录','0','admin','2023-05-25 03:10:50','',NULL),(3,'系统工具',0,3,'tool',NULL,'',1,0,'M','0','0','','tool','系统工具目录','0','admin','2023-05-25 03:10:50','',NULL),(4,'若依官网',0,4,'http://ruoyi.vip',NULL,'',0,0,'M','0','0','','guide','若依官网地址','0','admin','2023-05-25 03:10:50','',NULL),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','用户管理菜单','0','admin','2023-05-25 03:10:50','',NULL),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','角色管理菜单','0','admin','2023-05-25 03:10:50','',NULL),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','菜单管理菜单','0','admin','2023-05-25 03:10:50','',NULL),(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','部门管理菜单','0','admin','2023-05-25 03:10:50','',NULL),(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','岗位管理菜单','0','admin','2023-05-25 03:10:50','',NULL),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','字典管理菜单','0','admin','2023-05-25 03:10:50','',NULL),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','参数设置菜单','0','admin','2023-05-25 03:10:50','',NULL),(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','通知公告菜单','0','admin','2023-05-25 03:10:50','',NULL),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','日志管理菜单','0','admin','2023-05-25 03:10:51','',NULL),(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','在线用户菜单','0','admin','2023-05-25 03:10:51','',NULL),(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','定时任务菜单','0','admin','2023-05-25 03:10:51','',NULL),(111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','数据监控菜单','0','admin','2023-05-25 03:10:51','',NULL),(112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','服务监控菜单','0','admin','2023-05-25 03:10:51','',NULL),(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','缓存监控菜单','0','admin','2023-05-25 03:10:51','',NULL),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','缓存列表菜单','0','admin','2023-05-25 03:10:51','',NULL),(115,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','表单构建菜单','0','admin','2023-05-25 03:10:51','',NULL),(116,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','代码生成菜单','0','admin','2023-05-25 03:10:51','',NULL),(117,'系统接口',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','系统接口菜单','0','admin','2023-05-25 03:10:51','',NULL),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','操作日志菜单','0','admin','2023-05-25 03:10:51','',NULL),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','登录日志菜单','0','admin','2023-05-25 03:10:51','',NULL),(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','','0','admin','2023-05-25 03:10:51','',NULL),(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','','0','admin','2023-05-25 03:10:51','',NULL),(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','','0','admin','2023-05-25 03:10:51','',NULL),(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','','0','admin','2023-05-25 03:10:51','',NULL),(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','','0','admin','2023-05-25 03:10:51','',NULL),(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','','0','admin','2023-05-25 03:10:51','',NULL),(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','','0','admin','2023-05-25 03:10:51','',NULL),(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','','0','admin','2023-05-25 03:10:51','',NULL),(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','','0','admin','2023-05-25 03:10:51','',NULL),(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','','0','admin','2023-05-25 03:10:51','',NULL),(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','','0','admin','2023-05-25 03:10:51','',NULL),(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','','0','admin','2023-05-25 03:10:51','',NULL),(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','','0','admin','2023-05-25 03:10:51','',NULL),(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','','0','admin','2023-05-25 03:10:51','',NULL),(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','','0','admin','2023-05-25 03:10:51','',NULL),(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','','0','admin','2023-05-25 03:10:51','',NULL),(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','','0','admin','2023-05-25 03:10:51','',NULL),(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','','0','admin','2023-05-25 03:10:51','',NULL),(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','','0','admin','2023-05-25 03:10:51','',NULL),(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','','0','admin','2023-05-25 03:10:51','',NULL),(1020,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','','0','admin','2023-05-25 03:10:51','',NULL),(1021,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','','0','admin','2023-05-25 03:10:51','',NULL),(1022,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','','0','admin','2023-05-25 03:10:51','',NULL),(1023,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','','0','admin','2023-05-25 03:10:51','',NULL),(1024,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','','0','admin','2023-05-25 03:10:51','',NULL),(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','','0','admin','2023-05-25 03:10:51','',NULL),(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','','0','admin','2023-05-25 03:10:51','',NULL),(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','','0','admin','2023-05-25 03:10:51','',NULL),(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','','0','admin','2023-05-25 03:10:51','',NULL),(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','','0','admin','2023-05-25 03:10:52','',NULL),(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','','0','admin','2023-05-25 03:10:52','',NULL),(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','','0','admin','2023-05-25 03:10:52','',NULL),(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','','0','admin','2023-05-25 03:10:52','',NULL),(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','','0','admin','2023-05-25 03:10:52','',NULL),(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','','0','admin','2023-05-25 03:10:52','',NULL),(1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','','0','admin','2023-05-25 03:10:52','',NULL),(1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','','0','admin','2023-05-25 03:10:52','',NULL),(1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','','0','admin','2023-05-25 03:10:52','',NULL),(1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','','0','admin','2023-05-25 03:10:52','',NULL),(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','','0','admin','2023-05-25 03:10:52','',NULL),(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','','0','admin','2023-05-25 03:10:52','',NULL),(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','','0','admin','2023-05-25 03:10:52','',NULL),(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','','0','admin','2023-05-25 03:10:52','',NULL),(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','','0','admin','2023-05-25 03:10:52','',NULL),(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','','0','admin','2023-05-25 03:10:52','',NULL),(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','','0','admin','2023-05-25 03:10:52','',NULL),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','','0','admin','2023-05-25 03:10:52','',NULL),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','','0','admin','2023-05-25 03:10:52','',NULL),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','','0','admin','2023-05-25 03:10:52','',NULL),(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','','0','admin','2023-05-25 03:10:52','',NULL),(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','','0','admin','2023-05-25 03:10:52','',NULL),(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','','0','admin','2023-05-25 03:10:52','',NULL),(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','','0','admin','2023-05-25 03:10:52','',NULL),(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','','0','admin','2023-05-25 03:10:52','',NULL),(1054,'任务导出',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','','0','admin','2023-05-25 03:10:52','',NULL),(1055,'生成查询',116,1,'#','','',1,0,'F','0','0','tool:gen:query','#','','0','admin','2023-05-25 03:10:52','',NULL),(1056,'生成修改',116,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','','0','admin','2023-05-25 03:10:52','',NULL),(1057,'生成删除',116,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','','0','admin','2023-05-25 03:10:52','',NULL),(1058,'导入代码',116,4,'#','','',1,0,'F','0','0','tool:gen:import','#','','0','admin','2023-05-25 03:10:52','',NULL),(1059,'预览代码',116,5,'#','','',1,0,'F','0','0','tool:gen:preview','#','','0','admin','2023-05-25 03:10:52','',NULL),(1060,'生成代码',116,6,'#','','',1,0,'F','0','0','tool:gen:code','#','','0','admin','2023-05-25 03:10:52','',NULL);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',_binary '新版本内容','0','admin','2023-05-25 03:10:56','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1',_binary '维护内容','0','admin','2023-05-25 03:10:56','',NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(11) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(11) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(11) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(11) NOT NULL COMMENT '显示顺序',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'','0','0','admin','2023-05-25 03:10:50','',NULL),(2,'se','项目经理',2,'','0','0','admin','2023-05-25 03:10:50','',NULL),(3,'hr','人力资源',3,'','0','0','admin','2023-05-25 03:10:50','',NULL),(4,'user','普通员工',4,'','0','0','admin','2023-05-25 03:10:50','',NULL);
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'超级管理员','0','0','admin','2023-05-25 03:10:50','',NULL),(2,'普通角色','common',2,'2',1,1,'普通角色','0','0','admin','2023-05-25 03:10:50','',NULL);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_dept` (
  `role_dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `role_menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(200) NOT NULL COMMENT '密码',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (2,NULL,'admin','管理员','00','','','0','','6186b6850150072ea3981c523e0180b34d8285172161fdd8e1e2d263dae3d3f91fe78873d4b698c0873d7657e7571ba97bfae48a8f10c07606355a9fb7087754',NULL,'0','',NULL,'0','',NULL,'',NULL),(112,NULL,'zhangsan','张三4','00','','','','','123456','','0','',NULL,'0','admin','2023-05-26 17:20:22','admin','2023-05-27 09:16:59');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_post` (
  `user_role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `user_role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-29  9:38:50
