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
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dept` (
  `id` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '部门名称',
  `order_num` int(11) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 DEFAULT '0' COMMENT '是否停用（0是 1否）',
  `del_flag` char(1) CHARACTER SET utf8mb4 DEFAULT '1' COMMENT '删除标志（0代表删除 1代表存在）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES ('100',0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-25 03:10:49','',NULL),('101',100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-25 03:10:49','',NULL),('102',100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-25 03:10:49','',NULL),('103',101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-25 03:10:49','',NULL),('104',101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-25 03:10:49','',NULL),('105',101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-25 03:10:50','',NULL),('106',101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-25 03:10:50','',NULL),('107',101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-25 03:10:50','',NULL),('108',102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-25 03:10:50','',NULL),('109',102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-25 03:10:50','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_data` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字典数据表ID',
  `parent_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '父节点ID',
  `dict_type_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字典类型表ID',
  `dict_label` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据标签',
  `dict_value` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据键值',
  `dict_sort` int(11) DEFAULT NULL COMMENT '显示排序',
  `dict_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据类型',
  `css_class` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '样式属性',
  `echo_class` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '回显样式',
  `is_default` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '是否默认（0是 1否）',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '是否停用（0是 1否）',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '删除标志（0代表删除 1代表存在）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES ('1668438545397800961','0','1667436790484566018','男','0',1,'sex','1','1','1','1','1','1','admin','2023-06-13 10:02:02','admin','2023-06-13 10:03:37'),('1668438662158835714','0','1667436790484566018','女','1',2,'sex','2','1','1','1','1','1','admin','2023-06-13 10:02:30','admin','2023-06-13 10:03:32'),('1668438753632411649','0','1667436134579306497','是','0',1,'whether','1','1','1','1','1','1','admin','2023-06-13 10:02:52','',NULL),('1668438845705773058','0','1667436134579306497','否','1',2,'whether','1','1','1','1','1','1','admin','2023-06-13 10:03:14','',NULL),('1668604213654315009','0','1667436790484566018','未知','2',3,'sex','1','1','1','1','1','1','admin','2023-06-13 21:00:20','',NULL);
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_type` (
  `id` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '字典类型表ID',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 DEFAULT '1' COMMENT '是否停用（0是 1否）',
  `remark` text CHARACTER SET utf8mb4 COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 DEFAULT '1' COMMENT '删除标志（0代表删除 1代表存在）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES ('1667436134579306497','是否','whether','1','是否状态','1','admin','2023-06-10 15:38:49','',NULL),('1667436790484566018','性别','sex','1','性别','1','admin','2023-06-10 15:41:25','admin','2023-06-10 15:41:35');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_files`
--

DROP TABLE IF EXISTS `sys_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_files` (
  `id` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT 'ID',
  `file_name_before` text CHARACTER SET utf8mb4 COMMENT '上传前文件名称',
  `file_name_after` text CHARACTER SET utf8mb4 COMMENT '上传后文件名称',
  `file_size` varchar(50) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '文件大小',
  `upload_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '上传者',
  `del_flag` char(1) CHARACTER SET utf8mb4 DEFAULT '1' COMMENT '删除标志（0代表删除 1代表存在）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文件上传记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_files`
--

LOCK TABLES `sys_files` WRITE;
/*!40000 ALTER TABLE `sys_files` DISABLE KEYS */;
INSERT INTO `sys_files` VALUES ('1668084718983237633','微信图片_20230508153714.jpg','20230612103603-12c64c9f-ca16-493e-aff5-be3dad4c76ac.jpg','32999','','1','admin','2023-06-12 10:36:03','',NULL),('1668087615028514817','微信图片_20230508153714.jpg','20230612104733-14eac28a-04b4-4eda-af0c-2d9639e237dd.jpg','32999','','1','admin','2023-06-12 10:47:34','',NULL),('1668087884785176577','微信图片_20230508153714.jpg','20230612104837-fe6b605e-65c1-4e89-9813-fa2462df5330.jpg','32999','','1','admin','2023-06-12 10:48:38','',NULL),('1668089565182742530','微信图片_20230508153714.jpg','20230612105517-10657c6e-eb84-47a7-ad51-d20ceeb1e9ab.jpg','32999','','1','admin','2023-06-12 10:55:19','',NULL),('1668193515395375105','微信图片_20230508153714.jpg','20230612174822-a2905462-48ab-4f4e-9667-591e71f0d2c2.jpg','32999','','1','admin','2023-06-12 17:48:22','',NULL);
/*!40000 ALTER TABLE `sys_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `id` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '菜单ID',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `path` varchar(200) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '路由地址',
  `name` varchar(50) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '路由 name (对应页面组件 name, 可用作 KeepAlive 缓存标识 && 按钮权限筛选)',
  `redirect` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '重定向地址',
  `component` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '组件路径',
  `icon` varchar(100) CHARACTER SET utf8mb4 DEFAULT '#' COMMENT '菜单图标',
  `title` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '菜单名称',
  `active_menu` varchar(200) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '当前路由为详情页时，需要高亮的菜单',
  `is_link` char(1) CHARACTER SET utf8mb4 DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_hide` char(1) CHARACTER SET utf8mb4 DEFAULT '1' COMMENT '是否隐藏（0是 1否）',
  `is_full` char(1) CHARACTER SET utf8mb4 DEFAULT '1' COMMENT '是否全屏显示（0是 1否）',
  `is_affix` char(1) CHARACTER SET utf8mb4 DEFAULT '1' COMMENT '是否固定页（0是 1否）',
  `is_keep_alive` char(1) CHARACTER SET utf8mb4 DEFAULT '1' COMMENT '是否缓存（0是 1否）',
  `order_num` int(11) DEFAULT '0' COMMENT '显示顺序',
  `menu_type` char(1) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '菜单类型（0目录 1菜单 2按钮）',
  `status` char(1) CHARACTER SET utf8mb4 DEFAULT '1' COMMENT '是否停用（0是 1否）',
  `perms` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '权限标识',
  `query` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '路由参数',
  `remark` varchar(500) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 DEFAULT '1' COMMENT '删除标志（0代表删除 1代表存在）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES ('1',0,'/home/index','home',NULL,'/home/index','HomeFilled','首页','','1','1','1','0','1',1,'1','1',NULL,NULL,'','1','admin','2023-06-09 20:52:29','admin','2023-06-13 21:32:11'),('1667422148022546434',2,'/system/dictManage','dict',NULL,'/system/dictManage/dictList','Reading','字典管理',NULL,'1','1','1','1','1',2,'1','1',NULL,NULL,'','1','admin','2023-06-10 14:43:14','admin','2023-06-13 22:03:20'),('1668556011188789249',1667422148022546434,'/system/dictDataManage','dictName',NULL,'/system/dictManage/dictDataList','List','字典数据','/system/dictManage','1','0','1','1','1',3,'1','1',NULL,NULL,'','1','admin','2023-06-13 17:48:48','admin','2023-06-13 22:44:12'),('1668607595978809345',0,'https://www.baidu.com','link','','','Lollipop','测试外链','','0','1','1','1','1',3,'1','1',NULL,NULL,'','1','admin','2023-06-13 21:13:47','admin','2023-06-13 22:38:57'),('1668796580490149890',0,'baidu.com','','','','Basketball','测试百度','','0','1','1','1','1',0,'','1',NULL,'','','0','admin','2023-06-14 09:44:44','',NULL),('1668796977929814017',0,'https://element-plus.org/zh-CN/','','','','Avatar','饿了么UI','','1','1','1','1','1',4,'0','1','','','','1','admin','2023-06-14 09:46:19','admin','2023-06-14 13:39:29'),('2',0,'/system','system','/system/menuMange',NULL,'Tools','系统管理','','1','1','1','1','1',2,'0','1',NULL,NULL,'','1','admin','2023-06-09 20:52:29','admin','2023-06-13 22:02:33'),('3',2,'/system/menuMange','menuMange',NULL,'/system/menuMange/menuList','Menu','菜单管理','','1','1','1','1','1',1,'1','1',NULL,NULL,'','1','admin','2023-06-09 20:52:29','admin','2023-06-13 21:09:05');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_post` (
  `id` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '岗位名称',
  `post_sort` int(11) NOT NULL COMMENT '显示顺序',
  `remark` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb4 NOT NULL DEFAULT '1' COMMENT '是否停用（0是 1否）',
  `del_flag` char(1) CHARACTER SET utf8mb4 DEFAULT '1' COMMENT '删除标志（0代表删除 1代表存在）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES ('1','ceo','董事长',1,'','0','0','admin','2023-05-25 03:10:50','',NULL),('2','se','项目经理',2,'','0','0','admin','2023-05-25 03:10:50','',NULL),('3','hr','人力资源',3,'','0','0','admin','2023-05-25 03:10:50','',NULL),('4','user','普通员工',4,'','0','0','admin','2023-05-25 03:10:50','',NULL);
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `id` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` char(1) CHARACTER SET utf8mb4 DEFAULT '1' COMMENT '菜单树选择项是否关联显示（0是 1否）',
  `dept_check_strictly` char(1) CHARACTER SET utf8mb4 DEFAULT '1' COMMENT '部门树选择项是否关联显示（0是 1否）',
  `remark` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb4 NOT NULL DEFAULT '1' COMMENT '是否停用（0是 1否）',
  `del_flag` char(1) CHARACTER SET utf8mb4 DEFAULT '1' COMMENT '删除标志（0代表删除 1代表存在）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_dept` (
  `id` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '角色部门关联表ID',
  `role_id` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '角色ID',
  `dept_id` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '部门ID',
  `del_flag` char(1) CHARACTER SET utf8mb4 DEFAULT '1' COMMENT '删除标志（0代表删除 1代表存在）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色和部门关联表';
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
  `id` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '角色菜单关联表ID',
  `role_id` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '角色ID',
  `menu_id` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '菜单ID',
  `del_flag` char(1) CHARACTER SET utf8mb4 DEFAULT '1' COMMENT '删除标志（0代表删除 1代表存在）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色和菜单关联表';
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
  `id` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '用户ID',
  `dept_id` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '头像地址',
  `password` varchar(200) CHARACTER SET utf8mb4 NOT NULL COMMENT '密码',
  `remark` varchar(500) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb4 DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 DEFAULT '1' COMMENT '删除标志（0代表删除 1代表存在）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES ('1',NULL,'admin','管理员','00','','','0','http://dummyimage.com/100x100','6186b6850150072ea3981c523e0180b34d8285172161fdd8e1e2d263dae3d3f91fe78873d4b698c0873d7657e7571ba97bfae48a8f10c07606355a9fb7087754',NULL,'0','',NULL,'1','',NULL,'',NULL);
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
  `del_flag` char(1) CHARACTER SET utf8mb4 DEFAULT '1' COMMENT '删除标志（0代表删除 1代表存在）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户与岗位关联表';
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
  `id` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '用户角色关联表ID',
  `user_id` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '用户ID',
  `role_id` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '角色ID',
  `del_flag` char(1) CHARACTER SET utf8mb4 DEFAULT '1' COMMENT '删除标志（0代表删除 1代表存在）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户和角色关联表';
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

-- Dump completed on 2023-06-14 18:10:26
