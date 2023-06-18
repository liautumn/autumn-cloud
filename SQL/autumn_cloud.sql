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
INSERT INTO `sys_dict_data` VALUES ('1668438545397800961','0','1667436790484566018','男','0',1,'sex','1','1','1','1','1','1','admin','2023-06-13 10:02:02','admin','2023-06-13 10:03:37'),('1668438662158835714','0','1667436790484566018','女','1',2,'sex','2','1','1','1','1','1','admin','2023-06-13 10:02:30','admin','2023-06-13 10:03:32'),('1668438753632411649','0','1667436134579306497','是','0',1,'whether','1','1','1','1','1','1','admin','2023-06-13 10:02:52','',NULL),('1668438845705773058','0','1667436134579306497','否','1',2,'whether','1','1','1','1','1','1','admin','2023-06-13 10:03:14','',NULL),('1668604213654315009','0','1667436790484566018','未知','2',3,'sex','1','1','1','1','1','1','admin','2023-06-13 21:00:20','',NULL),('1670251704228040706','0','1667436790484566018','1','1',1,'1','1','1','1','1','1','0','admin','2023-06-18 10:06:53','',NULL);
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
INSERT INTO `sys_files` VALUES ('1668084718983237633','微信图片_20230508153714.jpg','20230612103603-12c64c9f-ca16-493e-aff5-be3dad4c76ac.jpg','32999','','1','admin','2023-06-12 10:36:03','',NULL),('1668087615028514817','微信图片_20230508153714.jpg','20230612104733-14eac28a-04b4-4eda-af0c-2d9639e237dd.jpg','32999','','1','admin','2023-06-12 10:47:34','',NULL),('1668087884785176577','微信图片_20230508153714.jpg','20230612104837-fe6b605e-65c1-4e89-9813-fa2462df5330.jpg','32999','','1','admin','2023-06-12 10:48:38','',NULL),('1668089565182742530','微信图片_20230508153714.jpg','20230612105517-10657c6e-eb84-47a7-ad51-d20ceeb1e9ab.jpg','32999','','1','admin','2023-06-12 10:55:19','',NULL),('1668193515395375105','微信图片_20230508153714.jpg','20230612174822-a2905462-48ab-4f4e-9667-591e71f0d2c2.jpg','32999','','1','admin','2023-06-12 17:48:22','',NULL),('1669308637372538881','微信图片_20230319201222.jpg','20230615193927-a2ec142f-06de-438a-b329-e03218b08df0.jpg','58561','','1','admin','2023-06-15 19:39:28','',NULL),('1669309038633213953','11.png','20230615194103-dbe986e3-9ca3-4316-8110-5fb3ea9fa992.png','74994','','1','admin','2023-06-15 19:41:04','',NULL),('1669333665178722305','11.png','20230615211854-727b192a-7988-448c-b921-ec02bdd3904a.png','74994','','1','admin','2023-06-15 21:18:55','',NULL),('1669334040443101185','11.png','20230615212024-985abd54-cdda-42bb-92c9-35d7a5f582c8.png','74994','','1','admin','2023-06-15 21:20:25','',NULL),('1669334128859029506','微信图片_20230319201222.jpg','20230615212045-65a51ccf-5351-40c9-baae-9555f7616f68.jpg','58561','','1','admin','2023-06-15 21:20:46','',NULL),('1669334533915549697','11.png','20230615212222-6c0852bc-c84d-4bad-bb2b-ba0ad594abf5.png','74994','','1','admin','2023-06-15 21:22:22','',NULL),('1669334934794543106','11.png','20230615212357-1780b993-2a1d-47f4-97e6-18aec41cb8fd.png','74994','','1','admin','2023-06-15 21:23:58','',NULL),('1669335165925859330','11.png','20230615212452-f947bc39-b56e-4d3b-8821-dc29646464de.png','74994','','1','admin','2023-06-15 21:24:53','',NULL),('1669335592654348290','11.png','20230615212634-10f2e032-e9d1-4c38-93f8-a58861cd367c.png','74994','','1','admin','2023-06-15 21:26:35','',NULL),('1669343290036854785','11.png','20230615215709-e129e59a-ecdd-4167-b9ae-38c6ed813904.png','74994','','1','admin','2023-06-15 21:57:10','',NULL),('1669344627516514306','11.png','20230615220228-c0afe1cd-bcb9-4c39-b2e4-2c3655be0d24.png','74994','','1','admin','2023-06-15 22:02:29','',NULL),('1669345283262390273','微信图片_20230319201222.jpg','20230615220504-8cf1e226-a9e4-4b55-9d43-7f914e3aad28.jpg','58561','','1','admin','2023-06-15 22:05:05','',NULL),('1669346895259246593','微信图片_20230319201222.jpg','20230615221129-70bdc869-8fc9-4d09-a0fc-be898677bbf2.jpg','58561','','1','admin','2023-06-15 22:11:29','',NULL),('1669347065254387714','微信图片_20230319201222.jpg','20230615221209-022fdb0e-c3e9-488c-b758-190a8c1a01ca.jpg','58561','','1','admin','2023-06-15 22:12:10','',NULL),('1669349023138717697','11.png','20230615221956-1949ab59-29da-4eeb-aa0c-322fbdf61693.png','74994','','1','admin','2023-06-15 22:19:57','',NULL),('1669349261060612098','11.png','20230615222053-f790d8d3-a2a5-4f5c-9950-339361137c53.png','74994','','1','admin','2023-06-15 22:20:54','',NULL),('1669349474261278721','11.png','20230615222144-a32d590d-e998-417d-83ca-b61861ed6cfb.png','74994','','1','admin','2023-06-15 22:21:44','',NULL),('1669352833475158018','阿里巴巴代码规范(java).jpg','20230615223505-29275f0c-7ec3-44ad-937e-7730c27cf9eb.jpg','265434','','1','admin','2023-06-15 22:35:05','',NULL),('1669353099196899330','11.png','20230615223608-ffda8266-e12e-406f-af98-473d47bd0542.png','74994','','1','admin','2023-06-15 22:36:09','',NULL),('1669353435248730113','11.png','20230615223728-3b1675b9-4d88-488d-adbb-6b57ad1b8da1.png','74994','','1','admin','2023-06-15 22:37:29','',NULL),('1669353702270705665','微信图片_20230319201222.jpg','20230615223832-f1355448-51c4-4820-be52-4780dbf045d5.jpg','58561','','1','admin','2023-06-15 22:38:32','',NULL),('1669353926770827265','英特尔.jpeg','20230615223925-c12c51c6-fdb1-4bdb-a3a2-13c0da8a81a9.jpeg','503989','','1','admin','2023-06-15 22:39:26','',NULL),('1669354262818463746','微信图片_20230319201222.jpg','20230615224045-ccbcd251-5a4d-4143-be51-cbdbd9469e7b.jpg','58561','','1','admin','2023-06-15 22:40:46','',NULL),('1669355327215378433','阿里巴巴代码规范(java).jpg','20230615224459-dca81e64-83ee-4baf-b8ff-2876bbdf5f3b.jpg','265434','','1','admin','2023-06-15 22:45:00','',NULL),('1669355619138936834','阿里巴巴代码规范(java).jpg','20230615224609-27f8cdc0-b0a5-4f1d-99d8-259a86911827.jpg','265434','','1','admin','2023-06-15 22:46:09','',NULL),('1669689771524734978','微信图片_20230319201222.jpg','20230616205357-436fdfd9-85e2-4174-8fe4-c9730849093a.jpg','58561','','1','admin','2023-06-16 20:53:58','',NULL),('1669689813300002818','微信图片_20230319201222.jpg','20230616205407-642f202c-9bd0-4242-9989-4be3ebde467f.jpg','58561','','1','admin','2023-06-16 20:54:07','',NULL),('1669690043944779777','微信图片_20230319201222.jpg','20230616205502-c0ac2b1a-8db7-494c-9cc5-c44ae3027f82.jpg','58561','','1','admin','2023-06-16 20:55:02','',NULL),('1669690234391347201','微信图片_20230319201222.jpg','20230616205547-2966e615-b9bd-4188-a411-881adcf6e72d.jpg','58561','','1','admin','2023-06-16 20:55:48','',NULL),('1669690304616579074','11.png','20230616205604-016273cb-ff18-4e27-9a4a-94520ad5e6b2.png','74994','','1','admin','2023-06-16 20:56:05','',NULL),('1669692642479685633','11.png','20230616210521-8599a830-3201-4bb7-9253-a10101eb2dd7.png','74994','','1','admin','2023-06-16 21:05:22','',NULL),('1669692878711275522','11.png','20230616210618-6e00c297-6967-4b68-97b3-3cbb4f8d6762.png','74994','','1','admin','2023-06-16 21:06:18','',NULL),('1669694280439283713','11.png','20230616211152-16210ef9-228d-4f37-ad3c-cdae9a8a5661.png','74994','','1','admin','2023-06-16 21:11:53','',NULL),('1669694290983763970','微信图片_20230319201222.jpg','20230616211154-d50bf823-ad19-42a2-a67b-b04e386feacb.jpg','58561','','1','admin','2023-06-16 21:11:55','',NULL),('1669694302996250626','英特尔.jpeg','20230616211157-c71968f0-13de-4cb7-af0d-57b04eb0d8ba.jpeg','503989','','1','admin','2023-06-16 21:11:58','',NULL),('1669694334071848962','mmexport1665824551746.jpg','20230616211205-53e2f77a-11fe-4b84-8aee-7d8acd00e25d.jpg','587938','','1','admin','2023-06-16 21:12:05','',NULL),('1669694344532443138','阿里巴巴代码规范(java).jpg','20230616211207-0cffc2e5-253e-4ebb-a29c-1e9aa6b7932d.jpg','265434','','1','admin','2023-06-16 21:12:08','',NULL),('1669698469244551170','英特尔.jpeg','20230616212831-9e8aa038-86b5-4648-9ed2-97d7c659840e.jpeg','503989','','1','admin','2023-06-16 21:28:31','',NULL),('1669698501913985025','11.png','20230616212838-d57c7d24-9ed2-4389-aa2c-6073527a4c15.png','74994','','1','admin','2023-06-16 21:28:39','',NULL),('1669698708177272834','阿里巴巴代码规范(java).jpg','20230616212928-ebf757cc-30dd-47b6-a6a3-b33c03c316c1.jpg','265434','','1','admin','2023-06-16 21:29:28','',NULL),('1669698755736485890','阿里巴巴代码规范(java).jpg','20230616212939-2f7a0cff-797b-4b17-bc17-aec025bc0a29.jpg','265434','','1','admin','2023-06-16 21:29:40','',NULL),('1669698944345948162','英特尔.jpeg','20230616213024-3630c4a8-c3c0-4459-b24d-e393f75bffb2.jpeg','503989','','1','admin','2023-06-16 21:30:24','',NULL),('1669699337759080449','英特尔.jpeg','20230616213158-914613d0-6a4d-4480-aae5-3a1e4b9ac7fe.jpeg','503989','','1','admin','2023-06-16 21:31:58','',NULL),('1669699600913907714','英特尔.jpeg','20230616213300-94085b6c-dee0-4803-94aa-736d0837fdc6.jpeg','503989','','1','admin','2023-06-16 21:33:01','',NULL),('1669699666718343169','英特尔.jpeg','20230616213316-2c956118-c9a5-4887-aaea-aedc301505d1.jpeg','503989','','1','admin','2023-06-16 21:33:17','',NULL),('1669700071414153217','11.png','20230616213453-70c2e361-9b18-4030-be58-7a56c49c353b.png','74994','','1','admin','2023-06-16 21:34:53','',NULL),('1669701561033801730','阿里巴巴代码规范(java).jpg','20230616214048-8800b126-8a67-44a2-9ca2-8dcb759e1b39.jpg','265434','','1','admin','2023-06-16 21:40:48','',NULL),('1669702218939744258','英特尔.jpeg','20230616214325-0e5b1599-d592-49b3-aa8e-854ad8715a85.jpeg','503989','','1','admin','2023-06-16 21:43:25','',NULL),('1669702453338423297','mmexport1665824551746.jpg','20230616214420-66564b26-e0d2-4490-85a7-664482610c70.jpg','587938','','1','admin','2023-06-16 21:44:21','',NULL),('1669703241339092993','英特尔.jpeg','20230616214728-7175a566-2385-42ad-ba50-31565bf45a05.jpeg','503989','','1','admin','2023-06-16 21:47:29','',NULL),('1669703915686707201','英特尔.jpeg','20230616215009-b1ff2819-96b0-4096-909e-7f994d8f78c5.jpeg','503989','','1','admin','2023-06-16 21:50:10','',NULL),('1669705312008257538','阿里巴巴代码规范(java).jpg','20230616215542-2c351749-a084-4498-a094-7c762ff31494.jpg','265434','','1','admin','2023-06-16 21:55:43','',NULL),('1669890577137979393','微信图片_20230319201222.jpg','20230617101153-2f2f29da-4e9d-40ee-ae02-71a0d9c83b5a.jpg','58561','','1','admin','2023-06-17 10:11:53','',NULL),('1669893431068250114','微信图片_20230319201222.jpg','20230617102313-2acbd378-f25c-40b1-98e9-0debce0c1b39.jpg','58561','','1','admin','2023-06-17 10:23:14','',NULL),('1669893926998560770','微信图片_20230319201222.jpg','20230617102511-07798bd4-0458-4f88-a74d-022c1af0d95a.jpg','58561','','1','admin','2023-06-17 10:25:12','',NULL),('1669895585648660481','11.png','20230617103147-58003ac6-7771-4459-8309-fc843e336ed8.png','74994','admin','1','admin','2023-06-17 10:31:47','',NULL),('1669896188173012994','11.png','20230617103411-73334999-6420-43a0-bced-2274d473705f.png','74994','admin','1','admin','2023-06-17 10:34:11','',NULL),('1669897122777190402','微信图片_20230319201222.jpg','20230617103753-72b09a4b-343e-48ce-af3a-0957a61cc61b.jpg','58561','admin','1','admin','2023-06-17 10:37:54','',NULL),('1669902847075209218','微信图片_20230319201222.jpg','20230617110038-280c743b-89dd-4866-aad5-8ce8a8fdb1ae.jpg','58561','admin','1','admin','2023-06-17 11:00:39','',NULL),('1669903119356841986','微信图片_20230319201222.jpg','20230617110143-1038a385-317f-481c-ac12-3543e6d0e2df.jpg','58561','admin','1','admin','2023-06-17 11:01:44','',NULL),('1669910819163656194','11.png','20230617113219-b6c69de3-d416-43fc-814f-444145ff1c94.png','74994','admin','1','admin','2023-06-17 11:32:19','',NULL),('1669910983764922370','11.png','20230617113258-3d5c4c5a-80e5-4ef0-ac51-feb7deba1737.png','74994','admin','1','admin','2023-06-17 11:32:59','',NULL),('1669918249280917505','微信图片_20230319201222.jpg','20230617120150-b9e79278-0872-4b28-b68d-618b18f40ebb.jpg','58561','admin','1','admin','2023-06-17 12:01:51','',NULL),('1669919382774796289','11.png','20230617120621-ded84539-d2c1-412d-8b1e-f2a41f0756cd.png','74994','admin','1','admin','2023-06-17 12:06:21','',NULL),('1669919660097982466','微信图片_20230319201222.jpg','20230617120727-93898cf2-88d8-49fb-bc4e-7873a797abf9.jpg','58561','admin','1','admin','2023-06-17 12:07:27','',NULL),('1669925469318074370','11.png','20230617123032-3921232b-3a6d-48e8-9227-cb76097868d4.png','74994','admin','1','admin','2023-06-17 12:30:32','',NULL),('1669925872998862849','11.png','20230617123208-a7138085-f476-4e80-a97a-487f30eb9fbb.png','74994','admin','1','admin','2023-06-17 12:32:09','',NULL),('1669925930242723842','微信图片_20230319201222.jpg','20230617123222-158e2bd9-da9b-41ea-a6cd-9f79b1532c7f.jpg','58561','admin','1','admin','2023-06-17 12:32:22','',NULL),('1669926515629150209','11.png','20230617123441-136aedb7-e94e-4a4d-bbbe-0a6168c94099.png','74994','admin','1','admin','2023-06-17 12:34:42','',NULL),('1669926731312844801','微信图片_20230319201222.jpg','20230617123533-14738c60-7af9-42c0-bd9c-55591037dfd3.jpg','58561','admin','1','admin','2023-06-17 12:35:33','',NULL),('1669936278169505793','11.png','20230617131329-a714e83a-9176-4b86-b918-8d2b60171d79.png','74994','admin','1','admin','2023-06-17 13:13:29','',NULL),('1669940409231790081','微信图片_20230319201222.jpg','20230617132954-b4e475dd-9f2d-4848-a9ec-b5d0702974dc.jpg','58561','admin','1','admin','2023-06-17 13:29:54','',NULL),('1669940454370889729','微信图片_20230319201222.jpg','20230617133004-16209a97-6fca-4443-8aef-8ceaaa389239.jpg','58561','admin','1','admin','2023-06-17 13:30:05','',NULL),('1669940905979990018','11.png','20230617133152-ff024ddb-08b5-4861-ab28-829c450c11ba.png','74994','admin','1','admin','2023-06-17 13:31:53','',NULL),('1669944888073179138','11.png','20230617134741-7104274e-9c39-4b01-b367-032be4d0d06f.png','74994','admin','1','admin','2023-06-17 13:47:42','',NULL),('1669948900151447553','微信图片_20230319201222.jpg','20230617140338-a767c0cb-797e-4ad2-844a-c8d3fc537971.jpg','58561','admin','1','admin','2023-06-17 14:03:39','',NULL),('1669999230985752578','英特尔.jpeg','20230617172338-f452374e-dbb8-4203-82df-088bc6d8eb00.jpeg','503989','admin','1','admin','2023-06-17 17:23:38','',NULL),('1670000609255018497','微信图片_20230319201222.jpg','20230617172906-ee455610-7c3a-44d6-9083-b8a61edad4db.jpg','58561','admin','1','admin','2023-06-17 17:29:07','',NULL),('1670005186494779393','11.png','20230617174718-0e9ae8c7-1798-4ed8-9407-7d65712d717b.png','74994','admin','1','admin','2023-06-17 17:47:18','',NULL),('1670010766718455810','微信图片_20230319201222.jpg','20230617180928-a6386bc0-26ff-4eca-9217-24e630e1b5f9.jpg','58561','admin','1','admin','2023-06-17 18:09:29','',NULL),('1670019537507246081','阿里巴巴代码规范(java).jpg','20230617184419-7c74c3a7-a6a0-4212-aa73-af5d7a6deda4.jpg','265434','admin','1','admin','2023-06-17 18:44:20','',NULL),('1670038291658125314','微信图片_20230319201222.jpg','20230617195851-07e28110-968a-4f6b-9d52-25026e34be39.jpg','58561','admin','1','admin','2023-06-17 19:58:51','',NULL),('1670038548009791489','微信图片_20230319201222.jpg','20230617195952-460429c7-39f8-48aa-b530-1e83e6d271fe.jpg','58561','admin','1','admin','2023-06-17 19:59:52','',NULL),('1670047392119205889','11.png','20230617203500-0f75931d-db29-45d0-861d-1c09fd504545.png','74994','admin','1','admin','2023-06-17 20:35:01','',NULL),('1670049359683989506','微信图片_20230319201222.jpg','20230617204222-b069ce37-b3f2-4af5-b623-502cdebdd9f5.jpg','58561','admin','1','admin','2023-06-17 20:42:50','',NULL),('1670242541154459650','微信图片_20230319201222.jpg','20230618093027-9e3664e5-ac34-46ca-b154-a0debdb6d36f.jpg','58561','admin','1','admin','2023-06-18 09:30:28','',NULL),('1670265258385711105','微信图片_20230319201222.jpg','20230618110044-4abfd6d3-b455-4d85-aad7-e01d26f7ce7f.jpg','58561','admin','1','admin','2023-06-18 11:00:44','',NULL),('1670265334009012225','11.png','20230618110102-c9ad9648-a419-4701-8778-4fbe1f1e1ac0.png','74994','admin','1','admin','2023-06-18 11:01:02','',NULL),('1670265458969911298','-2d8e28d0ac34c6e8.jpg','20230618110132-d8dd3d14-8074-4c13-96af-fa521a9c605f.jpg','89251','admin','1','admin','2023-06-18 11:01:32','',NULL);
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
INSERT INTO `sys_menu` VALUES ('1',0,'/home/index','home',NULL,'/home/index','HomeFilled','首页','','1','1','1','0','1',1,'1','1',NULL,NULL,'1','1','admin','2023-06-09 20:52:29','admin','2023-06-18 10:37:29'),('1667422148022546434',2,'/system/dictManage','dict',NULL,'/system/dictManage/dictList','Reading','字典管理',NULL,'1','1','1','1','1',2,'1','1',NULL,NULL,'1','1','admin','2023-06-10 14:43:14','admin','2023-06-18 10:37:29'),('1668556011188789249',1667422148022546434,'/system/dictDataManage','dictName',NULL,'/system/dictManage/dictDataList','List','字典数据','/system/dictManage','1','0','1','1','1',3,'1','1',NULL,NULL,'1','1','admin','2023-06-13 17:48:48','admin','2023-06-18 10:37:29'),('1668607595978809345',0,'https://www.baidu.com','link','','','Lollipop','测试外链','','0','1','1','1','1',3,'1','1',NULL,NULL,'1','1','admin','2023-06-13 21:13:47','admin','2023-06-18 10:37:29'),('1668796580490149890',0,'baidu.com','','','','Basketball','测试百度','','0','1','1','1','1',0,'','1',NULL,NULL,'','0','admin','2023-06-14 09:44:44','',NULL),('1668796977929814017',0,'https://element-plus.org/zh-CN/','','','','Avatar','饿了么UI','','0','1','1','1','1',4,'0','1','',NULL,'1','0','admin','2023-06-14 09:46:19','admin','2023-06-14 21:59:28'),('1668972737736269826',0,'https://element-plus.org/zh-CN/','',NULL,NULL,'Avatar','aaa','','0','1','1','1','1',4,'0','1',NULL,NULL,'','0','admin','2023-06-14 21:24:43','',NULL),('1668973037280878593',0,'https://element-plus.org/zh-CN/','',NULL,NULL,'Avatar','aaa','','0','1','1','1','1',4,'0','1',NULL,NULL,'','0','admin','2023-06-14 21:25:55','',NULL),('1668980237684498434',0,'https://element-plus.org/zh-CN/','',NULL,NULL,'Avatar','测试导入','','0','1','1','1','1',4,'0','1',NULL,NULL,'1','0','admin','2023-06-14 21:54:31','admin','2023-06-14 21:59:28'),('1669306424675852290',0,'/assembly/uploadFile','','','/assembly/uploadFile/index','Upload','测试上传','','1','1','1','1','1',5,'1','1','','','','1','admin','2023-06-15 19:30:41','admin','2023-06-18 10:37:29'),('1670259407151198209',0,'/assembly/uploadFile','',NULL,'/assembly/uploadFile/index','Upload','1111','','1','1','1','1','1',5,'1','1',NULL,NULL,'','0','admin','2023-06-18 10:37:29','',NULL),('2',0,'/system','system','/system/menuMange',NULL,'Tools','系统管理','','1','1','1','1','1',2,'0','1',NULL,NULL,'1','1','admin','2023-06-09 20:52:29','admin','2023-06-18 10:37:29'),('3',2,'/system/menuMange','menuMange',NULL,'/system/menuMange/menuList','Menu','菜单管理','','1','1','1','1','1',1,'1','1',NULL,NULL,'1','1','admin','2023-06-09 20:52:29','admin','2023-06-18 10:37:29');
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
INSERT INTO `sys_user` VALUES ('1',NULL,'admin','ADMIN','00','1@qq.com','16638808906','0','1670265458969911298','6186b6850150072ea3981c523e0180b34d8285172161fdd8e1e2d263dae3d3f91fe78873d4b698c0873d7657e7571ba97bfae48a8f10c07606355a9fb7087754','111','0','',NULL,'1','',NULL,'admin','2023-06-17 11:01:47');
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

-- Dump completed on 2023-06-18 15:05:12
