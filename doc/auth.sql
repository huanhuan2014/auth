-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: auth
-- ------------------------------------------------------
-- Server version	5.1.73

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
-- Table structure for table `auth_app`
--

DROP TABLE IF EXISTS `auth_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '应用编号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '应用名称',
  `ip` varchar(20) NOT NULL DEFAULT '' COMMENT '应用ip',
  `url` varchar(300) NOT NULL DEFAULT '' COMMENT '应用地址',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '说明，备注',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否弃用，1正常，0弃用',
  `opt_user` varchar(50) NOT NULL DEFAULT '',
  `opt_user_name` varchar(50) NOT NULL DEFAULT '',
  `opt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_code` (`code`),
  KEY `idx_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_app`
--

LOCK TABLES `auth_app` WRITE;
/*!40000 ALTER TABLE `auth_app` DISABLE KEYS */;
INSERT INTO `auth_app` VALUES (1,'asset','固定资产管理','172.0.0.1','asset.jd.com','固定资产管理系统1',1,'admin','管理员','2018-04-04 03:14:17'),(2,'auth','权限管理','172.0.0.1','auth.jd.com','统一权限管理',1,'admin','管理员','2018-04-13 02:15:34'),(3,'cms','内容管理','172.0.0.1','cms.feiyu.com','内容管理系统初步设计',1,'admin','管理员','2018-07-18 14:16:29');
/*!40000 ALTER TABLE `auth_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_button`
--

DROP TABLE IF EXISTS `auth_button`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_button` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL DEFAULT '' COMMENT '按钮编号',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '按钮名称',
  `icon` varchar(30) NOT NULL DEFAULT '' COMMENT '按钮图标',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序顺序',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态，0停用，1正常',
  `opt_user` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人编号',
  `opt_user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `opt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `idx_code` (`code`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='按钮';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_button`
--

LOCK TABLES `auth_button` WRITE;
/*!40000 ALTER TABLE `auth_button` DISABLE KEYS */;
INSERT INTO `auth_button` VALUES (1,'btn-add','新增','fa fa-plus-square-o',6,1,'admin','管理员','2017-08-09 12:40:58'),(2,'btn-edit','修改','fa fa-pencil-square-o',5,1,'admin','管理员','2017-08-09 12:40:58'),(3,'btn-del','删除','fa fa-trash-o',4,1,'admin','管理员','2017-08-09 12:40:58'),(4,'btn-refresh','刷新','fa fa-refresh',3,1,'admin','管理员','2017-08-09 12:40:58'),(5,'btn-export','导出','fa fa-upload',1,1,'admin','管理员','2017-08-09 12:40:58'),(6,'btn-import','导入','fa fa-download',2,1,'admin','管理员','2017-08-09 12:40:58'),(7,'design','设计','fa fa-sitemap',1,1,'admin','管理员','2018-05-17 03:34:55');
/*!40000 ALTER TABLE `auth_button` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_company`
--

DROP TABLE IF EXISTS `auth_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL DEFAULT '' COMMENT '企业编号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '公司名称',
  `id_code` varchar(30) NOT NULL DEFAULT '' COMMENT '企业登记号码',
  `id_photo1` varchar(300) NOT NULL DEFAULT '' COMMENT '证件号码照片1',
  `id_photo2` varchar(300) NOT NULL DEFAULT '' COMMENT '证件号码照片2',
  `id_photo3` varchar(300) NOT NULL COMMENT '证件号码地址3',
  `id_photo4` varchar(300) NOT NULL DEFAULT '' COMMENT '证件号码图片4',
  `id_photo5` varchar(300) NOT NULL DEFAULT '' COMMENT '证件照片5',
  `address` varchar(500) NOT NULL DEFAULT '' COMMENT '公司地址',
  `zip_code` varchar(10) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `telephone` varchar(20) NOT NULL DEFAULT '' COMMENT '电话号码，座机',
  `mobile_phone` varchar(20) NOT NULL DEFAULT '' COMMENT '移动电话号码',
  `email` varchar(200) NOT NULL DEFAULT '' COMMENT '电子邮件',
  `QQ` varchar(20) NOT NULL DEFAULT '' COMMENT '公司联系QQ号码',
  `weixin` varchar(50) NOT NULL DEFAULT '' COMMENT '公司微信号码',
  `web_url` varchar(200) NOT NULL DEFAULT '' COMMENT '企业网址',
  `corporation` varchar(50) NOT NULL DEFAULT '' COMMENT '公司法人',
  `industry` tinyint(4) NOT NULL DEFAULT '0' COMMENT ' 所属行业行业',
  `registered_capital` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '注册资金',
  `app_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属应用编号',
  `opt_user` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人',
  `opt_user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `opt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  PRIMARY KEY (`id`),
  KEY `idx_code` (`code`),
  KEY `idx_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_company`
--

LOCK TABLES `auth_company` WRITE;
/*!40000 ALTER TABLE `auth_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_login_log`
--

DROP TABLE IF EXISTS `auth_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_code` varchar(20) NOT NULL DEFAULT '' COMMENT '登陆人比编号',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '登陆人名称',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT '登陆人ip',
  `app_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属应用编号',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_code` (`user_code`),
  KEY `idx_user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_login_log`
--

LOCK TABLES `auth_login_log` WRITE;
/*!40000 ALTER TABLE `auth_login_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_menu`
--

DROP TABLE IF EXISTS `auth_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL DEFAULT '' COMMENT '菜单编号',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态0为停用，1为启用',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `controller` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器',
  `default_action` varchar(30) NOT NULL DEFAULT '' COMMENT '默认加载方法',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '首次链接地址',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序顺序',
  `show_in_menu` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否在用户菜单中显示',
  `category_code` varchar(30) NOT NULL DEFAULT '' COMMENT '按钮类别编号',
  `in_org_rule` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否参与部门权限设置0不参与，1参与',
  `in_row_rule` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否参与行权限0参与，1不参与',
  `in_column_auth` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否参与列权限权限，1参与，0不参与',
  `app_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属应用编号',
  `opt_user` varchar(30) NOT NULL DEFAULT '' COMMENT '操作人编号',
  `opt_user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `opt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `idx_code` (`code`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='菜单 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_menu`
--

LOCK TABLES `auth_menu` WRITE;
/*!40000 ALTER TABLE `auth_menu` DISABLE KEYS */;
INSERT INTO `auth_menu` VALUES (7,'menu','菜单管理',1,'','AuthMenu','index','Auth/AuthMenu',1,1,'resource',0,0,0,'auth','admin','管理员','2017-08-02 14:37:02'),(8,'menuCategory','菜单类别',1,'','AuthMenuCategory','index','Auth/AuthMenuCategory',1,1,'resource',0,0,0,'auth','admin','管理员','2017-08-09 11:59:53'),(9,'button','按钮管理',1,'','AuthButton','index','Auth/AuthButton',1,1,'resource',0,0,0,'auth','admin','管理员','2017-08-09 12:01:05'),(10,'menuButton','菜单按钮',1,'','AuthMenuButton','index','Auth/AuthMenuButton',1,1,'auth',0,0,0,'auth','admin','管理员','2017-08-09 12:02:00'),(11,'roleMenuButton','按钮权限',1,'','AuthRoleMenuButton','index','Auth/AuthRoleMenuButton',1,1,'auth',0,0,0,'auth','admin','管理员','2017-08-09 12:02:45'),(12,'user','用户管理',1,'','AuthUser','index','Auth/AuthUser',10,1,'system',1,1,0,'auth','admin','管理员','2017-08-09 12:03:11'),(14,'role','角色管理',1,'','AuthRole','index','Auth/AuthRole',0,1,'system',0,0,0,'auth','admin','管理员','2017-08-09 12:18:42'),(15,'changePwd','更改密码',1,'','AuthUser','ChangePwd','Auth/AuthUser',0,1,'base',0,0,0,'auth','admin','管理员','2017-09-21 14:11:07'),(16,'organization','部门管理',1,'','AuthOrganization','index','Auth/AuthOrganization',0,1,'base',0,0,0,'auth','admin','管理员','2017-10-18 15:02:34'),(17,'app','应用管理',1,'','AuthApp','index','Auth/AuthApp',1,1,'system',0,0,0,'auth','admin','管理员','2018-04-04 02:56:44'),(18,'token','应用公钥',1,'','AuthToken','index','Auth/AuthToken',1,1,'system',0,0,0,'auth','admin','管理员','2018-04-04 03:40:34'),(19,'sysDataType','字典类别',1,'','AuthSysDataType','index','Auth/AuthSysDataType',1,1,'base',0,0,0,'auth','admin','管理员','2018-04-09 00:22:22'),(20,'sysData','数据字典',1,'','AuthSysData','index','Auth/AuthSysData',1,1,'base',0,0,0,'auth','admin','管理员','2018-04-09 00:38:11'),(22,'menuMethod','菜单方法',1,'','AuthMenuMethod','index','Auth/AuthMenuMethod',1,1,'resource',0,0,0,'auth','admin','管理员','2018-04-11 00:41:41'),(23,'roleMenuMethod','方法权限',1,'','AuthRoleMenuMethod','index','Auth/AuthRoleMenuMethod',1,1,'auth',0,0,0,'auth','admin','管理员','2018-04-12 00:56:16'),(24,'menuColumn','字段管理',1,'','AuthMenuColumn','index','Auth/AuthMenuColumn',1,1,'resource',0,0,0,'auth','admin','管理员','2018-04-18 02:00:07'),(25,'company','公司管理',1,'','AuthCompany','index','Auth/AuthCompany',1,1,'base',0,0,0,'auth','admin','管理员','2018-04-18 02:13:52'),(26,'roleMenuColumn','字段权限',1,'','AuthRoleMenuColumn','index','Auth/AuthRoleMenuColumn',1,1,'auth',0,0,0,'auth','admin','管理员','2018-04-19 01:02:41'),(28,'process','流程管理',1,'','FlowProcess','index','Flow/FlowProcess',1,1,'flow',0,0,0,'auth','admin','管理员','2018-05-17 02:34:06'),(29,'flowDesign','流程编辑',1,'','FlowDesign','index','Flow/FlowDesign',1,0,'flow',0,0,0,'auth','admin','管理员','2018-05-18 08:37:00'),(30,'roleMenuRule','数据权限',1,'','AuthRoleMenuRule','index','Auth/AuthRoleMenuRule',1,1,'auth',0,0,0,'auth','admin','管理员','2018-06-05 11:24:09');
/*!40000 ALTER TABLE `auth_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_menu_button`
--

DROP TABLE IF EXISTS `auth_menu_button`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_menu_button` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_code` varchar(20) NOT NULL DEFAULT '' COMMENT '菜单编号',
  `button_code` varchar(20) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `app_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属应用编号',
  `opt_user` varchar(20) NOT NULL DEFAULT '' COMMENT '操作人编号',
  `opt_user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `opt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `idx_menu_code` (`menu_code`),
  KEY `idx_button_code` (`button_code`)
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8 COMMENT='菜单按钮';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_menu_button`
--

LOCK TABLES `auth_menu_button` WRITE;
/*!40000 ALTER TABLE `auth_menu_button` DISABLE KEYS */;
INSERT INTO `auth_menu_button` VALUES (200,'user','btn-add','auth','admin','管理员','2018-04-09 00:38:23'),(201,'user','btn-edit','auth','admin','管理员','2018-04-09 00:38:23'),(202,'user','btn-del','auth','admin','管理员','2018-04-09 00:38:23'),(203,'user','btn-refresh','auth','admin','管理员','2018-04-09 00:38:23'),(204,'user','btn-import','auth','admin','管理员','2018-04-09 00:38:23'),(205,'user','btn-export','auth','admin','管理员','2018-04-09 00:38:23'),(206,'organization','btn-add','auth','admin','管理员','2018-04-09 00:38:23'),(207,'organization','btn-edit','auth','admin','管理员','2018-04-09 00:38:23'),(208,'organization','btn-del','auth','admin','管理员','2018-04-09 00:38:23'),(209,'organization','btn-refresh','auth','admin','管理员','2018-04-09 00:38:23'),(210,'sysDataType','btn-add','auth','admin','管理员','2018-04-09 00:38:23'),(211,'sysDataType','btn-edit','auth','admin','管理员','2018-04-09 00:38:23'),(212,'sysDataType','btn-del','auth','admin','管理员','2018-04-09 00:38:23'),(213,'sysDataType','btn-refresh','auth','admin','管理员','2018-04-09 00:38:23'),(214,'sysData','btn-add','auth','admin','管理员','2018-04-09 00:38:23'),(215,'sysData','btn-edit','auth','admin','管理员','2018-04-09 00:38:23'),(216,'sysData','btn-del','auth','admin','管理员','2018-04-09 00:38:23'),(217,'sysData','btn-refresh','auth','admin','管理员','2018-04-09 00:38:23'),(266,'role','btn-add','','','','2018-04-18 11:37:59'),(267,'role','btn-edit','','','','2018-04-18 11:37:59'),(268,'role','btn-del','','','','2018-04-18 11:37:59'),(269,'role','btn-refresh','','','','2018-04-18 11:37:59'),(270,'app','btn-add','','','','2018-04-18 11:37:59'),(271,'app','btn-edit','','','','2018-04-18 11:37:59'),(272,'app','btn-del','','','','2018-04-18 11:37:59'),(273,'app','btn-refresh','','','','2018-04-18 11:37:59'),(274,'token','btn-add','','','','2018-04-18 11:37:59'),(275,'token','btn-edit','','','','2018-04-18 11:37:59'),(276,'token','btn-del','','','','2018-04-18 11:37:59'),(277,'token','btn-refresh','','','','2018-04-18 11:37:59'),(278,'menu','btn-add','','','','2018-05-16 08:50:17'),(279,'menu','btn-edit','','','','2018-05-16 08:50:17'),(280,'menu','btn-del','','','','2018-05-16 08:50:17'),(281,'menu','btn-refresh','','','','2018-05-16 08:50:17'),(282,'menuCategory','btn-add','','','','2018-05-16 08:50:17'),(283,'menuCategory','btn-edit','','','','2018-05-16 08:50:17'),(284,'menuCategory','btn-del','','','','2018-05-16 08:50:17'),(285,'menuCategory','btn-refresh','','','','2018-05-16 08:50:17'),(286,'button','btn-add','','','','2018-05-16 08:50:17'),(287,'button','btn-edit','','','','2018-05-16 08:50:17'),(288,'button','btn-del','','','','2018-05-16 08:50:17'),(289,'button','btn-refresh','','','','2018-05-16 08:50:17'),(290,'mehtod','btn-add','','','','2018-05-16 08:50:17'),(291,'mehtod','btn-edit','','','','2018-05-16 08:50:17'),(292,'mehtod','btn-del','','','','2018-05-16 08:50:17'),(293,'mehtod','btn-refresh','','','','2018-05-16 08:50:17'),(294,'menuMethod','btn-add','','','','2018-05-16 08:50:17'),(295,'menuMethod','btn-edit','','','','2018-05-16 08:50:17'),(296,'menuMethod','btn-del','','','','2018-05-16 08:50:17'),(297,'menuMethod','btn-refresh','','','','2018-05-16 08:50:17'),(298,'menuColumn','btn-add','','','','2018-05-16 08:50:17'),(299,'menuColumn','btn-edit','','','','2018-05-16 08:50:17'),(300,'menuColumn','btn-del','','','','2018-05-16 08:50:17'),(301,'menuColumn','btn-refresh','','','','2018-05-16 08:50:17'),(306,'process','btn-add','','','','2018-05-17 03:35:18'),(307,'process','btn-edit','','','','2018-05-17 03:35:18'),(308,'process','btn-del','','','','2018-05-17 03:35:18'),(309,'process','btn-refresh','','','','2018-05-17 03:35:18'),(310,'process','design','','','','2018-05-17 03:35:18'),(324,'roleMenuRule','btn-add','','','','2018-06-06 01:32:12'),(325,'roleMenuRule','btn-edit','','','','2018-06-06 01:32:12'),(326,'roleMenuRule','btn-del','','','','2018-06-06 01:32:12'),(327,'roleMenuRule','btn-refresh','','','','2018-06-06 01:32:12');
/*!40000 ALTER TABLE `auth_menu_button` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_menu_category`
--

DROP TABLE IF EXISTS `auth_menu_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_menu_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单类别编号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单类别名称',
  `icon` varchar(30) NOT NULL DEFAULT '' COMMENT '类别图表',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序顺序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1为启用，0为停用',
  `app_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属应用编号',
  `opt_user` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人',
  `opt_user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `opt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `idx_code` (`code`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='菜单按钮';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_menu_category`
--

LOCK TABLES `auth_menu_category` WRITE;
/*!40000 ALTER TABLE `auth_menu_category` DISABLE KEYS */;
INSERT INTO `auth_menu_category` VALUES (5,'system','系统管理','fa fa-cogs',1,1,'auth','admin','管理员','2017-08-09 12:27:37'),(6,'base','基础设置','fa fa-cog',2,1,'auth','admin','管理员','2017-08-09 15:07:14'),(7,'auth','权限管理','fa fa-key',1,1,'auth','admin','管理员','2018-04-12 00:58:10'),(8,'resource','资源管理','fa fa-database',1,1,'auth','admin','管理员','2018-04-18 02:05:55'),(9,'flow','流程管理','fa fa-usb',5,1,'auth','admin','管理员','2018-05-16 10:04:04'),(10,'000','0000','icon',0,1,'asset','admin','管理员','2019-04-13 06:08:47');
/*!40000 ALTER TABLE `auth_menu_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_menu_column`
--

DROP TABLE IF EXISTS `auth_menu_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_menu_column` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '列编号，如 org_code',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '列名称',
  `menu_code` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单编号',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序，越大越靠前',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '备注字段',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否停用，0停用',
  `is_show` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否在前端显示，1显示，0不显示，不显示的列不参与列权限设置',
  `app_code` varchar(50) NOT NULL DEFAULT '' COMMENT '应用id',
  `opt_user` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人编号',
  `opt_user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `opt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='菜单列';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_menu_column`
--

LOCK TABLES `auth_menu_column` WRITE;
/*!40000 ALTER TABLE `auth_menu_column` DISABLE KEYS */;
INSERT INTO `auth_menu_column` VALUES (1,'code','编号','menu',15,'菜单编号',1,1,'auth','admin','管理员','2018-04-19 12:09:02'),(2,'name','名称','menu',14,'',1,1,'auth','admin','管理员','2018-04-19 12:10:30'),(3,'status','状态','menu',10,'',1,1,'auth','admin','管理员','2018-04-19 12:11:37'),(4,'controller','控制器','menu',13,'',1,1,'auth','admin','管理员','2018-04-19 12:11:59'),(5,'default_action','默认方法','menu',12,'',1,1,'auth','admin','管理员','2018-04-19 12:12:34'),(6,'url','链接地址','menu',11,'',1,1,'auth','admin','管理员','2018-04-19 12:13:20'),(7,'sort','排序','menu',9,'',1,1,'auth','admin','管理员','2018-04-19 12:13:46'),(8,'opt_user_name','操作人','menu',8,'',1,1,'auth','admin','管理员','2018-04-19 12:14:05'),(9,'opt_time','操作时间','menu',7,'',1,1,'auth','admin','管理员','2018-04-19 12:14:29'),(10,'code','编号','menuCategory',20,'编号',1,1,'auth','admin','管理员','2018-04-23 01:25:34'),(11,'name','名称','menuCategory',19,'',1,1,'auth','admin','管理员','2018-04-23 01:27:12'),(12,'icon','图标','menuCategory',18,'',1,1,'auth','admin','管理员','2018-04-23 01:28:10'),(13,'sort','排序顺序','menuCategory',17,'',1,1,'auth','admin','管理员','2018-04-23 01:28:31'),(14,'status','状态','menuCategory',16,'',1,1,'auth','admin','管理员','2018-04-23 01:28:48'),(15,'opt_user_name','更新人','menuCategory',15,'',1,1,'auth','admin','管理员','2018-04-23 01:29:19'),(16,'opt_time','更新时间','menuCategory',14,'',1,1,'auth','admin','管理员','2018-04-23 01:29:38'),(17,'code','编号','mehtod',20,'',1,1,'auth','admin','管理员','2018-04-23 03:22:47'),(18,'name','名称','mehtod',19,'',1,1,'auth','admin','管理员','2018-04-23 03:23:07'),(19,'status','状态','mehtod',18,'',1,1,'auth','admin','管理员','2018-04-23 03:23:50'),(20,'remark','备注','mehtod',17,'',1,1,'auth','admin','管理员','2018-04-23 03:24:04'),(21,'opt_user_name','更新人','mehtod',16,'',1,1,'auth','admin','管理员','2018-04-23 03:24:38'),(22,'opt_time','更新时间','mehtod',15,'',1,1,'auth','admin','管理员','2018-04-23 03:24:58'),(23,'code','编号','button',20,'',1,1,'auth','admin','管理员','2018-04-24 01:37:26'),(24,'name','名称','button',19,'',1,1,'auth','admin','管理员','2018-04-24 01:37:40'),(25,'icon','图标','button',18,'',1,1,'auth','admin','管理员','2018-04-24 01:44:19'),(26,'sort','排序','button',17,'',1,1,'auth','admin','管理员','2018-04-24 01:44:43'),(27,'status','状态','button',16,'',1,1,'auth','admin','管理员','2018-04-24 01:44:58'),(28,'opt_user_name','操作人','button',15,'',1,1,'auth','admin','管理员','2018-04-24 01:45:15'),(29,'opt_time','操作时间','button',14,'',1,1,'auth','admin','管理员','2018-04-24 01:45:35'),(30,'menuName','所属菜单','menuColumn',20,'',1,1,'auth','admin','管理员','2018-04-26 01:33:58'),(31,'code','编号','menuColumn',19,'',1,1,'auth','admin','管理员','2018-04-26 01:34:14'),(32,'name','名称','menuColumn',18,'',1,1,'auth','admin','管理员','2018-04-26 01:34:26'),(33,'sort','排序','menuColumn',17,'',1,1,'auth','admin','管理员','2018-04-26 01:34:50'),(34,'remark','备注','menuColumn',16,'',1,1,'auth','admin','管理员','2018-04-26 01:35:12'),(35,'opt_user_name','更新人','menuColumn',15,'',1,1,'auth','admin','管理员','2018-04-26 01:35:38'),(36,'opt_time','更新时间','menuColumn',14,'',1,1,'auth','admin','管理员','2018-04-26 01:36:03'),(37,'code','编号','role',10,'',1,1,'auth','admin','管理员','2018-04-26 01:39:40'),(38,'name','名称','role',9,'',1,1,'auth','admin','管理员','2018-04-26 01:39:51'),(39,'status','状态','role',8,'',1,1,'auth','admin','管理员','2018-04-26 01:40:15'),(40,'remark','备注','role',7,'',1,1,'auth','admin','管理员','2018-04-26 01:40:31'),(41,'opt_user_name','更新人','role',6,'',1,1,'auth','admin','管理员','2018-04-26 01:40:55'),(42,'opt_time','更新时间','role',5,'',1,1,'auth','admin','管理员','2018-04-26 01:41:10'),(43,'code','编号','app',20,'',1,1,'auth','admin','管理员','2018-04-26 01:45:32'),(44,'name','名称','app',19,'',1,1,'auth','admin','管理员','2018-04-26 01:45:45'),(45,'category_name','所属类别','menu',16,'',1,1,'auth','admin','管理员','2018-05-02 10:56:39'),(46,'in_org_rule','部门权限','menu',9,'是否参与部门权限',1,1,'auth','admin','管理员','2018-05-02 11:02:55'),(47,'org','所属部门','user',30,'qweue',1,1,'auth','admin','管理员','2018-05-02 11:26:15'),(48,'code','编号','user',29,'',1,1,'auth','admin','管理员','2018-05-02 11:26:35'),(49,'name','名称','user',28,'',1,1,'auth','admin','管理员','2018-05-02 11:26:47'),(50,'sex','性别','user',27,'',1,1,'auth','admin','管理员','2018-05-02 11:27:19'),(51,'email','邮箱','user',26,'',1,1,'auth','admin','管理员','2018-05-02 11:27:41'),(52,'phone','手机','user',25,'',1,1,'auth','admin','管理员','2018-05-02 11:27:55'),(53,'birthday','出生日期','user',24,'',1,1,'auth','admin','管理员','2018-05-02 11:28:30'),(54,'last_login_time','最后登录时间','user',23,'',1,1,'auth','admin','管理员','2018-05-02 11:28:50'),(55,'create_time','注册时间','user',22,'',1,1,'auth','admin','管理员','2018-05-02 11:29:07'),(56,'last_login_ip','最后登录ip','user',21,'',1,1,'auth','admin','管理员','2018-05-02 11:29:52'),(57,'login_count','登录次数','user',20,'',1,1,'auth','admin','管理员','2018-05-02 11:30:14'),(58,'status','状态','user',19,'',1,1,'auth','admin','管理员','2018-05-02 11:31:50'),(59,'opt_user_name','操作人','user',18,'',1,1,'auth','admin','管理员','2018-05-02 11:32:40'),(60,'opt_time','操纵时间','user',17,'',1,1,'auth','admin','管理员','2018-05-02 11:33:30'),(61,'menu_code','菜单编号','menuMethod',20,'',1,1,'auth','admin','管理员','2018-05-16 08:39:14'),(62,'code','方法编号','menuMethod',19,'',1,1,'auth','admin','管理员','2018-05-16 08:39:56'),(63,'name','方法名称','menuMethod',18,'',1,1,'auth','admin','管理员','2018-05-16 08:40:10'),(64,'opt_user_name','更新人','menuMethod',15,'',1,1,'auth','admin','管理员','2018-05-16 08:40:44'),(65,'opt_time','更新时间','menuMethod',14,'',1,1,'auth','admin','管理员','2018-05-16 08:40:58'),(66,'status','状态','menuMethod',16,'',1,1,'auth','admin','管理员','2018-05-16 09:09:51'),(67,'code','编号','process',20,'',1,1,'auth','admin','管理员','2018-05-17 03:07:17'),(68,'name','名称','process',19,'',1,1,'auth','admin','管理员','2018-05-17 03:07:29'),(69,'status','状态','process',18,'',1,1,'auth','admin','管理员','2018-05-17 03:09:34'),(70,'draft','草稿','process',17,'是否是草稿',1,1,'auth','admin','管理员','2018-05-17 03:16:02'),(71,'count','申请数量','process',16,'',1,1,'auth','admin','管理员','2018-05-17 03:17:26'),(72,'opt_user_name','操作人','process',14,'',1,1,'auth','admin','管理员','2018-05-17 03:18:06'),(73,'opt_time','操作时间','process',13,'',1,1,'auth','admin','管理员','2018-05-17 03:18:24'),(74,'sort','排序','process',15,'',1,1,'auth','admin','管理员','2018-05-17 03:22:26'),(75,'show_in_menu','是否显示','menu',9,'',1,1,'auth','admin','管理员','2018-05-18 09:15:41'),(76,'in_row_rule','行权限','menu',9,'是否参与数据行权限',1,1,'auth','admin','管理员','2018-05-28 08:02:17'),(77,'ip','ip地址','app',18,'',1,1,'auth','admin','管理员','2018-07-18 14:00:23'),(78,'url','地址','app',17,'',1,1,'auth','admin','管理员','2018-07-18 14:00:45'),(79,'status','状态','app',16,'',1,1,'auth','admin','管理员','2018-07-18 14:01:12'),(80,'remark','备注','app',15,'',1,1,'auth','admin','管理员','2018-07-18 14:01:47');
/*!40000 ALTER TABLE `auth_menu_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_menu_method`
--

DROP TABLE IF EXISTS `auth_menu_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_menu_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_code` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单编号',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '方法编号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '方法名称',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否启用，1启用2停用',
  `app_code` varchar(50) NOT NULL,
  `opt_user` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人编号',
  `opt_user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名称',
  `opt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=247 DEFAULT CHARSET=utf8 COMMENT='菜单，方法表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_menu_method`
--

LOCK TABLES `auth_menu_method` WRITE;
/*!40000 ALTER TABLE `auth_menu_method` DISABLE KEYS */;
INSERT INTO `auth_menu_method` VALUES (204,'menuColumn','addView','新增视图',1,'auth','admin','管理员','2018-05-16 09:49:46'),(107,'token','index','入口',1,'auth','admin','管理员','2018-05-16 09:49:46'),(106,'token','addView','新增视图',1,'auth','admin','管理员','2018-05-16 09:49:46'),(105,'token','editView','编辑视图',1,'auth','admin','管理员','2018-05-16 09:49:46'),(104,'token','ajax_save','保存方法',1,'auth','admin','管理员','2018-05-16 09:49:46'),(103,'app','index','入口',1,'auth','admin','管理员','2018-05-16 09:49:46'),(102,'app','addView','新增视图',1,'auth','admin','管理员','2018-05-16 09:49:46'),(101,'app','editView','编辑视图',1,'auth','admin','管理员','2018-05-16 09:49:46'),(99,'role','index','入口',1,'auth','admin','管理员','2018-05-16 09:49:46'),(98,'role','addView','新增视图',1,'auth','admin','管理员','2018-05-16 09:49:46'),(96,'role','ajax_save','保存方法',1,'auth','admin','管理员','2018-05-16 09:49:46'),(97,'role','editView','编辑视图',1,'auth','admin','管理员','2018-05-16 09:49:46'),(203,'menuColumn','editView','编辑视图',1,'auth','admin','管理员','2018-05-16 09:49:46'),(227,'roleMenuColumn','index','入口',1,'auth','admin','管理员','2018-05-16 09:49:46'),(226,'roleMenuColumn','ajax_save','保存方法',1,'auth','admin','管理员','2018-05-16 09:49:46'),(198,'mehtod','editView','编辑视图',1,'auth','admin','管理员','2018-05-16 09:49:46'),(199,'mehtod','addView','新增视图',1,'auth','admin','管理员','2018-05-16 09:49:46'),(200,'mehtod','index','入口',1,'auth','admin','管理员','2018-05-16 09:49:46'),(189,'menuCategory','ajax_save','保存方法',1,'auth','admin','管理员','2018-05-16 09:49:46'),(190,'menuCategory','editView','编辑视图',1,'auth','admin','管理员','2018-05-16 09:49:46'),(191,'menuCategory','addView','新增视图',1,'auth','admin','管理员','2018-05-16 09:49:46'),(192,'menuCategory','index','入口',1,'auth','admin','管理员','2018-05-16 09:49:46'),(193,'button','ajax_save','保存方法',1,'auth','admin','管理员','2018-05-16 09:49:46'),(194,'button','editView','编辑视图',1,'auth','admin','管理员','2018-05-16 09:49:46'),(195,'button','addView','新增视图',1,'auth','admin','管理员','2018-05-16 09:49:46'),(196,'button','index','入口',1,'auth','admin','管理员','2018-05-16 09:49:46'),(197,'mehtod','ajax_save','保存方法',1,'auth','admin','管理员','2018-05-16 09:49:46'),(225,'roleMenuMethod','index','入口',1,'auth','admin','管理员','2018-05-16 09:49:46'),(224,'roleMenuMethod','ajax_save','保存方法',1,'auth','admin','管理员','2018-05-16 09:49:46'),(148,'sysData','editView','编辑视图',1,'auth','admin','管理员','2018-05-16 09:49:46'),(149,'sysData','addView','新增视图',1,'auth','admin','管理员','2018-05-16 09:49:46'),(147,'sysData','ajax_save','保存方法',1,'auth','admin','管理员','2018-05-16 09:49:46'),(144,'sysDataType','editView','编辑视图',1,'auth','admin','管理员','2018-05-16 09:49:46'),(145,'sysDataType','addView','新增视图',1,'auth','admin','管理员','2018-05-16 09:49:46'),(146,'sysDataType','index','入口',1,'auth','admin','管理员','2018-05-16 09:49:46'),(141,'organization','addView','新增视图',1,'auth','admin','管理员','2018-05-16 09:49:46'),(142,'organization','index','入口',1,'auth','admin','管理员','2018-05-16 09:49:46'),(143,'sysDataType','ajax_save','保存方法',1,'auth','admin','管理员','2018-05-16 09:49:46'),(138,'changePwd','index','入口',1,'auth','admin','管理员','2018-05-16 09:49:46'),(139,'organization','ajax_save','保存方法',1,'auth','admin','管理员','2018-05-16 09:49:46'),(140,'organization','editView','编辑视图',1,'auth','admin','管理员','2018-05-16 09:49:46'),(100,'app','ajax_save','保存方法',1,'auth','admin','管理员','2018-05-16 09:49:46'),(202,'menuColumn','ajax_save','保存方法',1,'auth','admin','管理员','2018-05-16 09:49:46'),(201,'menuColumn','ajax_get_menu','获取菜单',1,'auth','admin','管理员','2018-05-16 09:49:46'),(222,'menuMethod','ajax_save','保存方法',1,'auth','admin','管理员','2018-05-16 09:49:46'),(223,'menuMethod','index','入口',1,'auth','admin','管理员','2018-05-16 09:49:46'),(150,'sysData','index','入口',1,'auth','admin','管理员','2018-05-16 09:49:46'),(137,'changePwd','ajax_save','保存方法',1,'auth','admin','管理员','2018-05-16 09:49:46'),(136,'user','index','入口',1,'auth','admin','管理员','2018-05-16 09:49:46'),(135,'user','addView','新增视图',1,'auth','admin','管理员','2018-05-16 09:49:46'),(134,'user','editView','编辑视图',1,'auth','admin','管理员','2018-05-16 09:49:46'),(133,'user','ajax_save','保存方法',1,'auth','admin','管理员','2018-05-16 09:49:46'),(151,'company','ajax_save','保存方法',1,'auth','admin','管理员','2018-05-16 09:49:46'),(152,'company','editView','编辑视图',1,'auth','admin','管理员','2018-05-16 09:49:46'),(153,'company','addView','新增视图',1,'auth','admin','管理员','2018-05-16 09:49:46'),(154,'company','index','入口',1,'auth','admin','管理员','2018-05-16 09:49:46'),(188,'menu','index','入口',1,'auth','admin','管理员','2018-05-16 09:49:46'),(187,'menu','addView','新增视图',1,'auth','admin','管理员','2018-05-16 09:49:46'),(186,'menu','editView','编辑视图',1,'auth','admin','管理员','2018-05-16 09:49:46'),(185,'menu','ajax_save','保存方法',1,'auth','admin','管理员','2018-05-16 09:49:46'),(221,'roleMenuButton','index','入口',1,'auth','admin','管理员','2018-05-16 09:49:46'),(205,'menuColumn','index','入口',1,'auth','admin','管理员','2018-05-16 09:49:46'),(220,'roleMenuButton','ajax_save','保存方法',1,'auth','admin','管理员','2018-05-16 09:49:46'),(219,'menuButton','index','入口',1,'auth','admin','管理员','2018-05-16 09:49:46'),(218,'menuButton','ajax_save','保存方法',1,'auth','admin','管理员','2018-05-16 09:49:46'),(228,'roleMenuOrgRule','ajax_save','保存方法',1,'auth','admin','管理员','2018-05-16 09:49:46'),(229,'roleMenuOrgRule','index','入口',1,'auth','admin','管理员','2018-05-16 09:49:46'),(230,'process','index','首页',1,'auth','admin','管理员','2018-05-17 02:40:47'),(231,'process','addView','新增视图',1,'auth','admin','管理员','2018-05-17 06:07:54'),(232,'process','editView','编辑视图',1,'auth','admin','管理员','2018-05-17 06:08:16'),(233,'process','ajax_save','保存方法',1,'auth','admin','管理员','2018-05-17 06:08:38'),(234,'menuMethod','ajax_get_menu','获取菜单',1,'auth','admin','管理员','2018-05-18 08:42:51'),(235,'menuMethod','addView','新增视图',1,'auth','admin','管理员','2018-05-18 08:43:34'),(236,'menuMethod','editView','修改视图',1,'auth','admin','管理员','2018-05-18 08:43:51'),(237,'flowDesign','index','入口',1,'auth','admin','管理员','2018-05-18 08:45:08'),(238,'menu','del','删除',1,'auth','admin','管理员','2018-05-18 15:21:34'),(239,'flowDesign','ajax_save','保存',1,'auth','admin','管理员','2018-05-18 15:22:34'),(240,'roleMenuRule','index','首页',1,'auth','admin','管理员','2018-06-06 00:55:13'),(241,'roleMenuRule','addView','新增视图',1,'auth','admin','管理员','2018-06-06 00:55:41'),(242,'roleMenuRule','editView','编辑视图',1,'auth','admin','管理员','2018-06-06 00:55:59'),(243,'roleMenuRule','ajax_save','保存方法',1,'auth','admin','管理员','2018-06-06 00:56:16'),(244,'user','ajax_org_search','设置部门',1,'auth','admin','管理员','2018-11-14 03:01:19'),(245,'user','ajax_role_search','设置角色',1,'auth','admin','管理员','2018-11-14 03:06:38'),(246,'user','&lt;script&gt;alert(xss)&lt;/script&gt;','ss',1,'auth','admin','管理员','2019-03-31 13:43:40');
/*!40000 ALTER TABLE `auth_menu_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_organization`
--

DROP TABLE IF EXISTS `auth_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL DEFAULT '' COMMENT '组织机构编号',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '组织机构名称',
  `parent_code` varchar(20) NOT NULL DEFAULT '' COMMENT '父级类别',
  `leader` varchar(20) NOT NULL DEFAULT '' COMMENT '部门负责人编号',
  `patch` varchar(500) NOT NULL DEFAULT '' COMMENT '路径，父级路径，逗号隔开',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序字段',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '是否停用标记，0为停用，1为正常，默认正常',
  `company_code` varchar(20) NOT NULL DEFAULT '' COMMENT '组织架构所属公司或机构，code',
  `app_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属应用编号',
  `opt_user` varchar(20) NOT NULL DEFAULT '' COMMENT '操作人编号',
  `opt_user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '操作名称',
  `opt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `idx_code` (`code`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_organization`
--

LOCK TABLES `auth_organization` WRITE;
/*!40000 ALTER TABLE `auth_organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_role`
--

DROP TABLE IF EXISTS `auth_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL DEFAULT '' COMMENT '角色编号',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0启用，1停用',
  `app_code` varchar(50) NOT NULL DEFAULT '' COMMENT '应用code',
  `company_code` varchar(50) NOT NULL DEFAULT '' COMMENT '公司编号',
  `opt_user` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人',
  `opt_user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `opt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `idx_code` (`code`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_role`
--

LOCK TABLES `auth_role` WRITE;
/*!40000 ALTER TABLE `auth_role` DISABLE KEYS */;
INSERT INTO `auth_role` VALUES (4,'admin','管理员','系统管理员5',1,'auth','001','admin','管理员','2018-04-13 02:27:02');
/*!40000 ALTER TABLE `auth_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_role_menu_button`
--

DROP TABLE IF EXISTS `auth_role_menu_button`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_role_menu_button` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(20) NOT NULL DEFAULT '' COMMENT '角色编号',
  `menu_code` varchar(20) NOT NULL DEFAULT '' COMMENT '菜单编号',
  `button_code` varchar(20) NOT NULL DEFAULT '' COMMENT '按钮编号',
  `app_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属应用编号',
  `company_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属公司编号',
  `opt_user` varchar(50) NOT NULL DEFAULT '',
  `opt_user_name` varchar(50) NOT NULL DEFAULT '',
  `opt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_role_code` (`role_code`),
  KEY `idx_menu_code` (`menu_code`),
  KEY `idx_button_code` (`button_code`)
) ENGINE=InnoDB AUTO_INCREMENT=621 DEFAULT CHARSET=utf8 COMMENT='角色菜单按钮';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_role_menu_button`
--

LOCK TABLES `auth_role_menu_button` WRITE;
/*!40000 ALTER TABLE `auth_role_menu_button` DISABLE KEYS */;
INSERT INTO `auth_role_menu_button` VALUES (499,'admin','organization','btn-add','auth','001','admin','管理员','2018-04-18 11:40:54'),(500,'admin','organization','btn-edit','auth','001','admin','管理员','2018-04-18 11:40:54'),(501,'admin','organization','btn-del','auth','001','admin','管理员','2018-04-18 11:40:54'),(502,'admin','organization','btn-refresh','auth','001','admin','管理员','2018-04-18 11:40:54'),(503,'admin','sysDataType','btn-add','auth','001','admin','管理员','2018-04-18 11:40:54'),(504,'admin','sysDataType','btn-edit','auth','001','admin','管理员','2018-04-18 11:40:54'),(505,'admin','sysDataType','btn-del','auth','001','admin','管理员','2018-04-18 11:40:54'),(506,'admin','sysDataType','btn-refresh','auth','001','admin','管理员','2018-04-18 11:40:54'),(507,'admin','sysData','btn-add','auth','001','admin','管理员','2018-04-18 11:40:54'),(508,'admin','sysData','btn-edit','auth','001','admin','管理员','2018-04-18 11:40:54'),(509,'admin','sysData','btn-del','auth','001','admin','管理员','2018-04-18 11:40:54'),(510,'admin','sysData','btn-refresh','auth','001','admin','管理员','2018-04-18 11:40:54'),(531,'admin','menu','btn-add','auth','001','admin','管理员','2018-05-16 08:50:29'),(532,'admin','menu','btn-edit','auth','001','admin','管理员','2018-05-16 08:50:29'),(533,'admin','menu','btn-del','auth','001','admin','管理员','2018-05-16 08:50:29'),(534,'admin','menu','btn-refresh','auth','001','admin','管理员','2018-05-16 08:50:29'),(535,'admin','menuCategory','btn-add','auth','001','admin','管理员','2018-05-16 08:50:29'),(536,'admin','menuCategory','btn-edit','auth','001','admin','管理员','2018-05-16 08:50:29'),(537,'admin','menuCategory','btn-del','auth','001','admin','管理员','2018-05-16 08:50:29'),(538,'admin','menuCategory','btn-refresh','auth','001','admin','管理员','2018-05-16 08:50:29'),(539,'admin','button','btn-add','auth','001','admin','管理员','2018-05-16 08:50:29'),(540,'admin','button','btn-edit','auth','001','admin','管理员','2018-05-16 08:50:29'),(541,'admin','button','btn-del','auth','001','admin','管理员','2018-05-16 08:50:29'),(542,'admin','button','btn-refresh','auth','001','admin','管理员','2018-05-16 08:50:29'),(543,'admin','mehtod','btn-add','auth','001','admin','管理员','2018-05-16 08:50:29'),(544,'admin','mehtod','btn-edit','auth','001','admin','管理员','2018-05-16 08:50:29'),(545,'admin','mehtod','btn-del','auth','001','admin','管理员','2018-05-16 08:50:29'),(546,'admin','mehtod','btn-refresh','auth','001','admin','管理员','2018-05-16 08:50:29'),(547,'admin','menuMethod','btn-add','auth','001','admin','管理员','2018-05-16 08:50:29'),(548,'admin','menuMethod','btn-edit','auth','001','admin','管理员','2018-05-16 08:50:29'),(549,'admin','menuMethod','btn-del','auth','001','admin','管理员','2018-05-16 08:50:29'),(550,'admin','menuMethod','btn-refresh','auth','001','admin','管理员','2018-05-16 08:50:29'),(551,'admin','menuColumn','btn-add','auth','001','admin','管理员','2018-05-16 08:50:29'),(552,'admin','menuColumn','btn-edit','auth','001','admin','管理员','2018-05-16 08:50:29'),(553,'admin','menuColumn','btn-del','auth','001','admin','管理员','2018-05-16 08:50:29'),(554,'admin','menuColumn','btn-refresh','auth','001','admin','管理员','2018-05-16 08:50:29'),(559,'admin','process','btn-add','auth','001','admin','管理员','2018-05-17 03:35:29'),(560,'admin','process','btn-edit','auth','001','admin','管理员','2018-05-17 03:35:29'),(561,'admin','process','btn-del','auth','001','admin','管理员','2018-05-17 03:35:29'),(562,'admin','process','btn-refresh','auth','001','admin','管理员','2018-05-17 03:35:29'),(563,'admin','process','design','auth','001','admin','管理员','2018-05-17 03:35:29'),(564,'admin','roleMenuRule','btn-add','auth','001','admin','管理员','2018-06-06 01:32:29'),(565,'admin','roleMenuRule','btn-edit','auth','001','admin','管理员','2018-06-06 01:32:29'),(566,'admin','roleMenuRule','btn-del','auth','001','admin','管理员','2018-06-06 01:32:29'),(567,'admin','roleMenuRule','btn-refresh','auth','001','admin','管理员','2018-06-06 01:32:29'),(603,'admin','user','btn-add','auth','001','admin','管理员','2019-04-13 02:28:32'),(604,'admin','user','btn-edit','auth','001','admin','管理员','2019-04-13 02:28:32'),(605,'admin','user','btn-del','auth','001','admin','管理员','2019-04-13 02:28:32'),(606,'admin','user','btn-refresh','auth','001','admin','管理员','2019-04-13 02:28:32'),(607,'admin','user','btn-import','auth','001','admin','管理员','2019-04-13 02:28:32'),(608,'admin','user','btn-export','auth','001','admin','管理员','2019-04-13 02:28:32'),(609,'admin','role','btn-add','auth','001','admin','管理员','2019-04-13 02:28:32'),(610,'admin','role','btn-edit','auth','001','admin','管理员','2019-04-13 02:28:32'),(611,'admin','role','btn-del','auth','001','admin','管理员','2019-04-13 02:28:32'),(612,'admin','role','btn-refresh','auth','001','admin','管理员','2019-04-13 02:28:32'),(613,'admin','app','btn-add','auth','001','admin','管理员','2019-04-13 02:28:32'),(614,'admin','app','btn-edit','auth','001','admin','管理员','2019-04-13 02:28:32'),(615,'admin','app','btn-del','auth','001','admin','管理员','2019-04-13 02:28:32'),(616,'admin','app','btn-refresh','auth','001','admin','管理员','2019-04-13 02:28:32'),(617,'admin','token','btn-add','auth','001','admin','管理员','2019-04-13 02:28:32'),(618,'admin','token','btn-edit','auth','001','admin','管理员','2019-04-13 02:28:32'),(619,'admin','token','btn-del','auth','001','admin','管理员','2019-04-13 02:28:32'),(620,'admin','token','btn-refresh','auth','001','admin','管理员','2019-04-13 02:28:32');
/*!40000 ALTER TABLE `auth_role_menu_button` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_role_menu_column`
--

DROP TABLE IF EXISTS `auth_role_menu_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_role_menu_column` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(50) NOT NULL DEFAULT '' COMMENT '角色编号',
  `menu_code` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单编号',
  `column_code` varchar(50) NOT NULL,
  `column_name` varchar(50) NOT NULL DEFAULT '' COMMENT '字段名称',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序字段，越大越靠前',
  `app_code` varchar(50) NOT NULL DEFAULT '' COMMENT '应用编号',
  `company_code` varchar(50) NOT NULL DEFAULT '' COMMENT '公司编号',
  `opt_user` varchar(50) NOT NULL DEFAULT '',
  `opt_user_name` varchar(50) NOT NULL,
  `opt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=645 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_role_menu_column`
--

LOCK TABLES `auth_role_menu_column` WRITE;
/*!40000 ALTER TABLE `auth_role_menu_column` DISABLE KEYS */;
INSERT INTO `auth_role_menu_column` VALUES (596,'admin','menuColumn','opt_time','更新时间',14,'auth','001','admin','管理员','2018-05-28 08:13:08'),(595,'admin','menuColumn','opt_user_name','更新人',15,'auth','001','admin','管理员','2018-05-28 08:13:08'),(594,'admin','menuColumn','remark','备注',16,'auth','001','admin','管理员','2018-05-28 08:13:08'),(593,'admin','menuColumn','sort','排序',17,'auth','001','admin','管理员','2018-05-28 08:13:08'),(592,'admin','menuColumn','name','名称',18,'auth','001','admin','管理员','2018-05-28 08:13:08'),(591,'admin','menuColumn','code','编号',19,'auth','001','admin','管理员','2018-05-28 08:13:08'),(589,'admin','menuMethod','status','状态',16,'auth','001','admin','管理员','2018-05-28 08:13:08'),(590,'admin','menuColumn','menuName','所属菜单',20,'auth','001','admin','管理员','2018-05-28 08:13:08'),(588,'admin','menuMethod','opt_time','更新时间',14,'auth','001','admin','管理员','2018-05-28 08:13:08'),(587,'admin','menuMethod','opt_user_name','更新人',15,'auth','001','admin','管理员','2018-05-28 08:13:08'),(586,'admin','menuMethod','name','方法名称',18,'auth','001','admin','管理员','2018-05-28 08:13:08'),(503,'admin','mehtod','opt_time','更新时间',15,'auth','001','admin','管理员','2018-05-18 09:16:00'),(502,'admin','mehtod','opt_user_name','更新人',16,'auth','001','admin','管理员','2018-05-18 09:16:00'),(500,'admin','mehtod','status','状态',18,'auth','001','admin','管理员','2018-05-18 09:16:00'),(501,'admin','mehtod','remark','备注',17,'auth','001','admin','管理员','2018-05-18 09:16:00'),(498,'admin','mehtod','code','编号',20,'auth','001','admin','管理员','2018-05-18 09:16:00'),(499,'admin','mehtod','name','名称',19,'auth','001','admin','管理员','2018-05-18 09:16:00'),(585,'admin','menuMethod','code','方法编号',19,'auth','001','admin','管理员','2018-05-28 08:13:08'),(581,'admin','button','status','状态',16,'auth','001','admin','管理员','2018-05-28 08:13:08'),(584,'admin','menuMethod','menu_code','菜单编号',20,'auth','001','admin','管理员','2018-05-28 08:13:08'),(583,'admin','button','opt_time','操作时间',14,'auth','001','admin','管理员','2018-05-28 08:13:08'),(582,'admin','button','opt_user_name','操作人',15,'auth','001','admin','管理员','2018-05-28 08:13:08'),(576,'admin','menuCategory','opt_time','更新时间',14,'auth','001','admin','管理员','2018-05-28 08:13:08'),(577,'admin','button','code','编号',20,'auth','001','admin','管理员','2018-05-28 08:13:08'),(578,'admin','button','name','名称',19,'auth','001','admin','管理员','2018-05-28 08:13:08'),(579,'admin','button','icon','图标',18,'auth','001','admin','管理员','2018-05-28 08:13:08'),(580,'admin','button','sort','排序',17,'auth','001','admin','管理员','2018-05-28 08:13:08'),(575,'admin','menuCategory','opt_user_name','更新人',15,'auth','001','admin','管理员','2018-05-28 08:13:08'),(574,'admin','menuCategory','status','状态',16,'auth','001','admin','管理员','2018-05-28 08:13:08'),(573,'admin','menuCategory','sort','排序顺序',17,'auth','001','admin','管理员','2018-05-28 08:13:08'),(572,'admin','menuCategory','icon','图标',18,'auth','001','admin','管理员','2018-05-28 08:13:08'),(571,'admin','menuCategory','name','名称',19,'auth','001','admin','管理员','2018-05-28 08:13:08'),(570,'admin','menuCategory','code','编号',20,'auth','001','admin','管理员','2018-05-28 08:13:08'),(639,'admin','app','code','编号',20,'auth','001','admin','管理员','2018-07-18 14:01:58'),(638,'admin','role','opt_time','更新时间',5,'auth','001','admin','管理员','2018-07-18 14:01:58'),(636,'admin','role','remark','备注',7,'auth','001','admin','管理员','2018-07-18 14:01:58'),(637,'admin','role','opt_user_name','更新人',6,'auth','001','admin','管理员','2018-07-18 14:01:58'),(635,'admin','role','status','状态',8,'auth','001','admin','管理员','2018-07-18 14:01:58'),(567,'admin','menu','in_org_rule','部门权限',9,'auth','001','admin','管理员','2018-05-28 08:13:08'),(568,'admin','menu','show_in_menu','是否显示',9,'auth','001','admin','管理员','2018-05-28 08:13:08'),(569,'admin','menu','in_row_rule','行权限',9,'auth','001','admin','管理员','2018-05-28 08:13:08'),(634,'admin','role','name','名称',9,'auth','001','admin','管理员','2018-07-18 14:01:58'),(632,'admin','user','opt_time','操纵时间',17,'auth','001','admin','管理员','2018-07-18 14:01:58'),(633,'admin','role','code','编号',10,'auth','001','admin','管理员','2018-07-18 14:01:58'),(631,'admin','user','opt_user_name','操作人',18,'auth','001','admin','管理员','2018-07-18 14:01:58'),(630,'admin','user','status','状态',19,'auth','001','admin','管理员','2018-07-18 14:01:58'),(629,'admin','user','login_count','登录次数',20,'auth','001','admin','管理员','2018-07-18 14:01:58'),(628,'admin','user','last_login_ip','最后登录ip',21,'auth','001','admin','管理员','2018-07-18 14:01:58'),(627,'admin','user','create_time','注册时间',22,'auth','001','admin','管理员','2018-07-18 14:01:58'),(626,'admin','user','last_login_time','最后登录时间',23,'auth','001','admin','管理员','2018-07-18 14:01:58'),(625,'admin','user','birthday','出生日期',24,'auth','001','admin','管理员','2018-07-18 14:01:58'),(565,'admin','menu','opt_time','操作时间',7,'auth','001','admin','管理员','2018-05-28 08:13:08'),(566,'admin','menu','category_name','所属类别',16,'auth','001','admin','管理员','2018-05-28 08:13:08'),(564,'admin','menu','opt_user_name','操作人',8,'auth','001','admin','管理员','2018-05-28 08:13:08'),(562,'admin','menu','url','链接地址',11,'auth','001','admin','管理员','2018-05-28 08:13:08'),(563,'admin','menu','sort','排序',9,'auth','001','admin','管理员','2018-05-28 08:13:08'),(561,'admin','menu','default_action','默认方法',12,'auth','001','admin','管理员','2018-05-28 08:13:08'),(560,'admin','menu','controller','控制器',13,'auth','001','admin','管理员','2018-05-28 08:13:08'),(559,'admin','menu','status','状态',10,'auth','001','admin','管理员','2018-05-28 08:13:08'),(469,'admin','process','opt_user_name','操作人',14,'auth','001','admin','管理员','2018-05-17 03:23:08'),(468,'admin','process','count','申请数量',16,'auth','001','admin','管理员','2018-05-17 03:23:08'),(467,'admin','process','draft','草稿',17,'auth','001','admin','管理员','2018-05-17 03:23:08'),(466,'admin','process','status','状态',18,'auth','001','admin','管理员','2018-05-17 03:23:08'),(465,'admin','process','name','名称',19,'auth','001','admin','管理员','2018-05-17 03:23:08'),(464,'admin','process','code','编号',20,'auth','001','admin','管理员','2018-05-17 03:23:08'),(470,'admin','process','opt_time','操作时间',13,'auth','001','admin','管理员','2018-05-17 03:23:08'),(471,'admin','process','sort','排序',15,'auth','001','admin','管理员','2018-05-17 03:23:08'),(558,'admin','menu','name','名称',14,'auth','001','admin','管理员','2018-05-28 08:13:08'),(557,'admin','menu','code','编号',15,'auth','001','admin','管理员','2018-05-28 08:13:08'),(624,'admin','user','phone','手机',25,'auth','001','admin','管理员','2018-07-18 14:01:58'),(623,'admin','user','email','邮箱',26,'auth','001','admin','管理员','2018-07-18 14:01:58'),(622,'admin','user','sex','性别',27,'auth','001','admin','管理员','2018-07-18 14:01:58'),(621,'admin','user','name','名称',28,'auth','001','admin','管理员','2018-07-18 14:01:58'),(620,'admin','user','code','编号',29,'auth','001','admin','管理员','2018-07-18 14:01:58'),(619,'admin','user','org','所属部门',30,'auth','001','admin','管理员','2018-07-18 14:01:58'),(640,'admin','app','name','名称',19,'auth','001','admin','管理员','2018-07-18 14:01:58'),(641,'admin','app','ip','ip地址',18,'auth','001','admin','管理员','2018-07-18 14:01:58'),(642,'admin','app','url','地址',17,'auth','001','admin','管理员','2018-07-18 14:01:58'),(643,'admin','app','status','状态',16,'auth','001','admin','管理员','2018-07-18 14:01:58'),(644,'admin','app','remark','备注',15,'auth','001','admin','管理员','2018-07-18 14:01:58');
/*!40000 ALTER TABLE `auth_role_menu_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_role_menu_method`
--

DROP TABLE IF EXISTS `auth_role_menu_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_role_menu_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(50) NOT NULL DEFAULT '' COMMENT '角色编号',
  `menu_code` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单编号',
  `method_code` varchar(50) NOT NULL DEFAULT '' COMMENT '方法编号',
  `method_name` varchar(50) NOT NULL DEFAULT '' COMMENT '方法名称',
  `app_code` varchar(50) NOT NULL DEFAULT '' COMMENT '应用编号',
  `company_code` varchar(50) NOT NULL DEFAULT '' COMMENT '公司编号',
  `opt_user` varchar(50) NOT NULL DEFAULT '' COMMENT '编辑用户编号',
  `opt_user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名称',
  `opt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `idx_role_code` (`role_code`),
  KEY `idx_menu_code` (`menu_code`),
  KEY `idx_menthd_code` (`method_code`),
  KEY `idx_app_code` (`app_code`),
  KEY `idx_company_code` (`company_code`)
) ENGINE=MyISAM AUTO_INCREMENT=489 DEFAULT CHARSET=utf8 COMMENT='角色菜单，action\r\n最终权限判断方法';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_role_menu_method`
--

LOCK TABLES `auth_role_menu_method` WRITE;
/*!40000 ALTER TABLE `auth_role_menu_method` DISABLE KEYS */;
INSERT INTO `auth_role_menu_method` VALUES (329,'admin','menuColumn','editView','','auth','001','admin','管理员','2018-05-18 15:21:45'),(488,'admin','token','ajax_save','','auth','001','admin','管理员','2018-11-14 03:10:40'),(487,'admin','token','editView','','auth','001','admin','管理员','2018-11-14 03:10:40'),(486,'admin','token','addView','','auth','001','admin','管理员','2018-11-14 03:10:40'),(484,'admin','app','ajax_save','','auth','001','admin','管理员','2018-11-14 03:10:40'),(330,'admin','menuColumn','ajax_save','','auth','001','admin','管理员','2018-05-18 15:21:45'),(485,'admin','token','index','','auth','001','admin','管理员','2018-11-14 03:10:40'),(483,'admin','app','editView','','auth','001','admin','管理员','2018-11-14 03:10:40'),(482,'admin','app','addView','','auth','001','admin','管理员','2018-11-14 03:10:40'),(328,'admin','menuColumn','addView','','auth','001','admin','管理员','2018-05-18 15:21:45'),(481,'admin','app','index','','auth','001','admin','管理员','2018-11-14 03:10:40'),(326,'admin','menuMethod','addView','','auth','001','admin','管理员','2018-05-18 15:21:45'),(327,'admin','menuMethod','editView','','auth','001','admin','管理员','2018-05-18 15:21:45'),(325,'admin','menuMethod','ajax_get_menu','','auth','001','admin','管理员','2018-05-18 15:21:45'),(324,'admin','menuMethod','index','','auth','001','admin','管理员','2018-05-18 15:21:45'),(232,'admin','sysData','index','','auth','001','admin','管理员','2018-04-20 07:23:39'),(230,'admin','sysData','addView','','auth','001','admin','管理员','2018-04-20 07:23:39'),(231,'admin','sysData','ajax_save','','auth','001','admin','管理员','2018-04-20 07:23:39'),(229,'admin','sysData','editView','','auth','001','admin','管理员','2018-04-20 07:23:39'),(228,'admin','sysDataType','ajax_save','','auth','001','admin','管理员','2018-04-20 07:23:39'),(227,'admin','sysDataType','index','','auth','001','admin','管理员','2018-04-20 07:23:39'),(226,'admin','sysDataType','addView','','auth','001','admin','管理员','2018-04-20 07:23:39'),(224,'admin','organization','editView','','auth','001','admin','管理员','2018-04-20 07:23:39'),(225,'admin','sysDataType','editView','','auth','001','admin','管理员','2018-04-20 07:23:39'),(223,'admin','organization','ajax_save','','auth','001','admin','管理员','2018-04-20 07:23:39'),(222,'admin','organization','index','','auth','001','admin','管理员','2018-04-20 07:23:39'),(221,'admin','organization','addView','','auth','001','admin','管理员','2018-04-20 07:23:39'),(364,'admin','roleMenuRule','addView','','auth','001','admin','管理员','2018-06-06 00:57:30'),(323,'admin','menuMethod','ajax_save','','auth','001','admin','管理员','2018-05-18 15:21:45'),(322,'admin','mehtod','ajax_save','','auth','001','admin','管理员','2018-05-18 15:21:45'),(321,'admin','mehtod','index','','auth','001','admin','管理员','2018-05-18 15:21:45'),(320,'admin','mehtod','addView','','auth','001','admin','管理员','2018-05-18 15:21:45'),(319,'admin','mehtod','editView','','auth','001','admin','管理员','2018-05-18 15:21:45'),(318,'admin','button','index','','auth','001','admin','管理员','2018-05-18 15:21:45'),(362,'admin','roleMenuOrgRule','index','','auth','001','admin','管理员','2018-06-06 00:57:30'),(363,'admin','roleMenuRule','index','','auth','001','admin','管理员','2018-06-06 00:57:30'),(317,'admin','button','addView','','auth','001','admin','管理员','2018-05-18 15:21:45'),(220,'admin','changePwd','ajax_save','','auth','001','admin','管理员','2018-04-20 07:23:39'),(219,'admin','changePwd','index','','auth','001','admin','管理员','2018-04-20 07:23:39'),(480,'admin','role','editView','','auth','001','admin','管理员','2018-11-14 03:10:40'),(477,'admin','role','index','','auth','001','admin','管理员','2018-11-14 03:10:40'),(316,'admin','button','editView','','auth','001','admin','管理员','2018-05-18 15:21:45'),(314,'admin','menuCategory','index','','auth','001','admin','管理员','2018-05-18 15:21:45'),(315,'admin','button','ajax_save','','auth','001','admin','管理员','2018-05-18 15:21:45'),(479,'admin','role','ajax_save','','auth','001','admin','管理员','2018-11-14 03:10:40'),(478,'admin','role','addView','','auth','001','admin','管理员','2018-11-14 03:10:40'),(313,'admin','menuCategory','addView','','auth','001','admin','管理员','2018-05-18 15:21:45'),(361,'admin','roleMenuOrgRule','ajax_save','','auth','001','admin','管理员','2018-06-06 00:57:30'),(233,'admin','company','ajax_save','','auth','001','admin','管理员','2018-04-20 07:23:39'),(234,'admin','company','editView','','auth','001','admin','管理员','2018-04-20 07:23:39'),(235,'admin','company','addView','','auth','001','admin','管理员','2018-04-20 07:23:39'),(236,'admin','company','index','','auth','001','admin','管理员','2018-04-20 07:23:39'),(312,'admin','menuCategory','editView','','auth','001','admin','管理员','2018-05-18 15:21:45'),(365,'admin','roleMenuRule','editView','','auth','001','admin','管理员','2018-06-06 00:57:30'),(360,'admin','roleMenuColumn','ajax_save','','auth','001','admin','管理员','2018-06-06 00:57:30'),(359,'admin','roleMenuColumn','index','','auth','001','admin','管理员','2018-06-06 00:57:30'),(358,'admin','roleMenuMethod','ajax_save','','auth','001','admin','管理员','2018-06-06 00:57:30'),(335,'admin','process','editView','','auth','001','admin','管理员','2018-05-18 15:22:48'),(336,'admin','process','ajax_save','','auth','001','admin','管理员','2018-05-18 15:22:48'),(334,'admin','process','addView','','auth','001','admin','管理员','2018-05-18 15:22:48'),(333,'admin','process','index','','auth','001','admin','管理员','2018-05-18 15:22:48'),(311,'admin','menuCategory','ajax_save','','auth','001','admin','管理员','2018-05-18 15:21:45'),(310,'admin','menu','del','','auth','001','admin','管理员','2018-05-18 15:21:45'),(309,'admin','menu','ajax_save','','auth','001','admin','管理员','2018-05-18 15:21:45'),(308,'admin','menu','editView','','auth','001','admin','管理员','2018-05-18 15:21:45'),(307,'admin','menu','addView','','auth','001','admin','管理员','2018-05-18 15:21:45'),(306,'admin','menu','index','','auth','001','admin','管理员','2018-05-18 15:21:45'),(337,'admin','flowDesign','index','','auth','001','admin','管理员','2018-05-18 15:22:48'),(331,'admin','menuColumn','ajax_get_menu','','auth','001','admin','管理员','2018-05-18 15:21:45'),(332,'admin','menuColumn','index','','auth','001','admin','管理员','2018-05-18 15:21:45'),(338,'admin','flowDesign','ajax_save','','auth','001','admin','管理员','2018-05-18 15:22:48'),(357,'admin','roleMenuMethod','index','','auth','001','admin','管理员','2018-06-06 00:57:30'),(356,'admin','roleMenuButton','ajax_save','','auth','001','admin','管理员','2018-06-06 00:57:30'),(355,'admin','roleMenuButton','index','','auth','001','admin','管理员','2018-06-06 00:57:30'),(354,'admin','menuButton','ajax_save','','auth','001','admin','管理员','2018-06-06 00:57:30'),(353,'admin','menuButton','index','','auth','001','admin','管理员','2018-06-06 00:57:30'),(366,'admin','roleMenuRule','ajax_save','','auth','001','admin','管理员','2018-06-06 00:57:30'),(475,'admin','user','ajax_org_search','','auth','001','admin','管理员','2018-11-14 03:10:40'),(476,'admin','user','ajax_role_search','','auth','001','admin','管理员','2018-11-14 03:10:40'),(474,'admin','user','ajax_save','','auth','001','admin','管理员','2018-11-14 03:10:40'),(473,'admin','user','editView','','auth','001','admin','管理员','2018-11-14 03:10:40'),(472,'admin','user','addView','','auth','001','admin','管理员','2018-11-14 03:10:40'),(471,'admin','user','index','','auth','001','admin','管理员','2018-11-14 03:10:40');
/*!40000 ALTER TABLE `auth_role_menu_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_role_menu_organization_rule`
--

DROP TABLE IF EXISTS `auth_role_menu_organization_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_role_menu_organization_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_code` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单编号',
  `role_code` varchar(50) NOT NULL DEFAULT '' COMMENT '角色编号',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '部门规则1只查看自己，2本部门，3子部门，4本部门及子部门，5所有部门，6自定义部门',
  `org_codes` varchar(500) NOT NULL DEFAULT '' COMMENT '当type为5（自定义）有效，多个部门用逗号隔开，不涉及到子部门',
  `app_code` varchar(50) NOT NULL DEFAULT '' COMMENT '应用编号',
  `company_code` varchar(50) NOT NULL DEFAULT '' COMMENT '公司编号',
  `opt_user` varchar(50) NOT NULL DEFAULT '' COMMENT '操作用户编号',
  `opt_user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '操作用户名称',
  `opt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `idx_role_code` (`role_code`),
  KEY `idx_menu_code` (`menu_code`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色，菜单，部门行数据规则';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_role_menu_organization_rule`
--

LOCK TABLES `auth_role_menu_organization_rule` WRITE;
/*!40000 ALTER TABLE `auth_role_menu_organization_rule` DISABLE KEYS */;
INSERT INTO `auth_role_menu_organization_rule` VALUES (4,'user','admin',1,'','auth','001','admin','管理员','2018-05-16 06:50:35');
/*!40000 ALTER TABLE `auth_role_menu_organization_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_role_menu_rule`
--

DROP TABLE IF EXISTS `auth_role_menu_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_role_menu_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(50) NOT NULL DEFAULT '' COMMENT '角色编号',
  `menu_code` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单编号',
  `column_code` varchar(50) NOT NULL DEFAULT '' COMMENT ' 字段编号，如money',
  `column_name` varchar(50) NOT NULL DEFAULT '' COMMENT '字段名称',
  `rule` varchar(50) NOT NULL DEFAULT '' COMMENT '规则，EQ,NEQ,GT,EGT,LT,ELT,LIKE,BETWEEN,NOT BETWEEN,IN,NOT IN，EXP',
  `value` varchar(50) NOT NULL DEFAULT '' COMMENT '规则值',
  `org_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '规则部门类型，1自己，2本部门，3子部门，4本部门及子部门，5所有部门，6自定义部门',
  `app_code` varchar(50) NOT NULL DEFAULT '' COMMENT '应用编号',
  `company_code` varchar(50) NOT NULL DEFAULT '' COMMENT '公司编号',
  `opt_user` varchar(50) NOT NULL DEFAULT '',
  `opt_user_name` varchar(50) NOT NULL DEFAULT '',
  `opt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色菜单规则，用于数据权限';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_role_menu_rule`
--

LOCK TABLES `auth_role_menu_rule` WRITE;
/*!40000 ALTER TABLE `auth_role_menu_rule` DISABLE KEYS */;
INSERT INTO `auth_role_menu_rule` VALUES (1,'admin','user','login_count','登录次数','GT','1',0,'auth','001','admin','管理员','2018-06-06 06:49:06'),(2,'admin','user','org_code','部门','IN','',4,'auth','001','admin','管理员','2018-06-06 07:27:04');
/*!40000 ALTER TABLE `auth_role_menu_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_sys_data`
--

DROP TABLE IF EXISTS `auth_sys_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_sys_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(10) NOT NULL DEFAULT '' COMMENT '所属类别',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '字典明细编号',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字典明细名称',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态，0停用，1启用',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '备注',
  `app_code` varchar(50) NOT NULL DEFAULT '' COMMENT '应用编号',
  `opt_user` varchar(30) NOT NULL DEFAULT '' COMMENT '操作人',
  `opt_user_name` varchar(50) NOT NULL DEFAULT '',
  `opt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `idx_type` (`type_code`),
  KEY `idx_code` (`code`),
  KEY `idx_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='数据字典内容';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_sys_data`
--

LOCK TABLES `auth_sys_data` WRITE;
/*!40000 ALTER TABLE `auth_sys_data` DISABLE KEYS */;
INSERT INTO `auth_sys_data` VALUES (3,'sex','nv','女',1,'','auth','admin','管理员','2018-05-02 10:43:34'),(2,'sex','nan','男',1,'男','auth','admin','管理员','2018-04-13 02:28:38');
/*!40000 ALTER TABLE `auth_sys_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_sys_data_type`
--

DROP TABLE IF EXISTS `auth_sys_data_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_sys_data_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '字典类别',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '类型名称',
  `parent_type` varchar(10) NOT NULL DEFAULT '' COMMENT '父级数据字典编号',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否弃用，0弃用',
  `app_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属应用编号',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '备注信息',
  `opt_user` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人编号',
  `opt_user_name` varchar(50) NOT NULL DEFAULT '',
  `opt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `idx_code` (`code`),
  KEY `idx_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统数据字典类别';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_sys_data_type`
--

LOCK TABLES `auth_sys_data_type` WRITE;
/*!40000 ALTER TABLE `auth_sys_data_type` DISABLE KEYS */;
INSERT INTO `auth_sys_data_type` VALUES (1,'sex','性别','',1,'auth','性别数据字典','admin','管理员','2018-04-13 02:28:49');
/*!40000 ALTER TABLE `auth_sys_data_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_token`
--

DROP TABLE IF EXISTS `auth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `token` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '' COMMENT 'token编号',
  `app_code` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '' COMMENT '应用编号',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT 'token说明',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否停用,1正常，0停用',
  `opt_user` varchar(50) NOT NULL DEFAULT '' COMMENT '更新人',
  `opt_user_name` varchar(50) NOT NULL DEFAULT '',
  `opt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_token` (`token`),
  KEY `idx_app` (`app_code`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='单点登录token';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_token`
--

LOCK TABLES `auth_token` WRITE;
/*!40000 ALTER TABLE `auth_token` DISABLE KEYS */;
INSERT INTO `auth_token` VALUES (1,'bdabf85ce34681451347ff5ef9fc5f0a','asset','测试5',1,'admin','管理员','2018-04-04 07:21:38');
/*!40000 ALTER TABLE `auth_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_token_status`
--

DROP TABLE IF EXISTS `auth_token_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_token_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket` varchar(200) CHARACTER SET latin1 NOT NULL DEFAULT '' COMMENT '登录凭证，公钥',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '保存时间戳,生成凭证的时间',
  `url` varchar(200) CHARACTER SET latin1 NOT NULL DEFAULT '' COMMENT '凭证回发地址，无html',
  `data` varchar(5000) CHARACTER SET latin1 NOT NULL DEFAULT '' COMMENT '登陆后保存的值，如user信息，',
  `app_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属应用编号',
  `opt_user` varchar(50) NOT NULL DEFAULT '',
  `opt_user_name` varchar(50) NOT NULL DEFAULT '',
  `opt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_ticket` (`ticket`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='当前登录状态';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_token_status`
--

LOCK TABLES `auth_token_status` WRITE;
/*!40000 ALTER TABLE `auth_token_status` DISABLE KEYS */;
INSERT INTO `auth_token_status` VALUES (19,'dd7bd6624bdc5d80e67412630b1e5ec0',1522724573,'asset.jd.com','{\"id\":\"7\",\"code\":\"admin2\",\"name\":\"\\u5f20\\u4e09\",\"email\":\"luogui@qq.com\",\"phone\":\"\",\"sex\":\"0\",\"birthday\":null,\"org\":[],\"role\":[]}','asset','admin','管理员','2018-04-13 02:30:25');
/*!40000 ALTER TABLE `auth_token_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL DEFAULT '' COMMENT '用户编号',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名称',
  `email` varchar(20) NOT NULL DEFAULT '' COMMENT '邮件',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '电话号码',
  `last_login_time` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0停用1启用',
  `last_login_ip` varchar(30) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `sex` int(11) NOT NULL DEFAULT '0' COMMENT '0保密，1男，2女',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '密码',
  `birthday` datetime DEFAULT NULL COMMENT '出生日期',
  `login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `app_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属app编号',
  `company_code` varchar(50) NOT NULL DEFAULT '' COMMENT '公司编号',
  `opt_user` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人',
  `opt_user_name` varchar(50) NOT NULL DEFAULT '',
  `opt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `idx_code` (`code`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='用户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (10,'admin','管理员','1726023036@qq.com','15996789030','2018-04-04 01:26:10','2018-04-04 09:26:15',1,'172.0.0.1',0,'e10adc3949ba59abbe56e057f20f883e','2018-04-04 09:26:38',5,'auth','001','admin','管理员','2018-04-13 02:17:09');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_organization`
--

DROP TABLE IF EXISTS `auth_user_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_code` varchar(20) NOT NULL DEFAULT '' COMMENT '用户编号',
  `organization_code` varchar(20) NOT NULL DEFAULT '' COMMENT '组织机构编号',
  `app_code` varchar(50) NOT NULL DEFAULT '' COMMENT '应用编号',
  `company_code` varchar(50) NOT NULL DEFAULT '' COMMENT '公司编号',
  `opt_user` varchar(50) NOT NULL DEFAULT '',
  `opt_user_name` varchar(50) NOT NULL DEFAULT '',
  `opt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_code` (`user_code`),
  KEY `idx_organization_code` (`organization_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组织机构';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_organization`
--

LOCK TABLES `auth_user_organization` WRITE;
/*!40000 ALTER TABLE `auth_user_organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_role`
--

DROP TABLE IF EXISTS `auth_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_code` varchar(20) NOT NULL DEFAULT '' COMMENT '用户编号',
  `role_code` varchar(20) NOT NULL DEFAULT '' COMMENT '角色编号',
  `app_code` varchar(50) NOT NULL DEFAULT '' COMMENT '应用编号',
  `company_code` varchar(50) NOT NULL DEFAULT '' COMMENT '公司编号',
  `opt_user` varchar(50) NOT NULL DEFAULT '' COMMENT '更新人',
  `opt_user_name` varchar(50) NOT NULL DEFAULT '',
  `opt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_code` (`user_code`),
  KEY `idx_role_code` (`role_code`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='用户角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_role`
--

LOCK TABLES `auth_user_role` WRITE;
/*!40000 ALTER TABLE `auth_user_role` DISABLE KEYS */;
INSERT INTO `auth_user_role` VALUES (11,'admin','admin','','','admin','管理员','2018-04-04 10:04:58');
/*!40000 ALTER TABLE `auth_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flow_history`
--

DROP TABLE IF EXISTS `flow_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='历史信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_history`
--

LOCK TABLES `flow_history` WRITE;
/*!40000 ALTER TABLE `flow_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `flow_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flow_instance`
--

DROP TABLE IF EXISTS `flow_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process_code` varchar(50) NOT NULL DEFAULT '' COMMENT '流程编号',
  `menu_code` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单编号',
  `menu_pk` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单唯一值（code，id等）',
  `column` varchar(50) NOT NULL DEFAULT '' COMMENT '参与条件流转的列,可不填写',
  `column_name` varchar(50) NOT NULL DEFAULT '' COMMENT '参与计算列的中文名称可不填写',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '列值可不填写',
  `user_code` varchar(50) NOT NULL DEFAULT '' COMMENT '当前申请人编号',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '当前申请人名称',
  `user_email` varchar(200) NOT NULL DEFAULT '' COMMENT '当前申请人邮箱',
  `user_phone` varchar(20) NOT NULL DEFAULT '' COMMENT '当前申请人电话号码',
  `set_code` varchar(50) NOT NULL DEFAULT '' COMMENT '申请单当前处理步骤编号',
  `start_time` datetime NOT NULL COMMENT '单据申请时间',
  `end_time` datetime DEFAULT NULL COMMENT '单据结束时间',
  `is_end` tinyint(4) NOT NULL DEFAULT '0' COMMENT '单据是否已经结单，1结单',
  `is_reject` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否驳回，1驳回',
  `app_code` varchar(50) NOT NULL DEFAULT '',
  `company_code` varchar(50) NOT NULL DEFAULT '',
  `opt_user` varchar(50) NOT NULL DEFAULT '',
  `opt_user_name` varchar(50) NOT NULL DEFAULT '',
  `opt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_process_code` (`process_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='流程实例';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_instance`
--

LOCK TABLES `flow_instance` WRITE;
/*!40000 ALTER TABLE `flow_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `flow_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flow_process`
--

DROP TABLE IF EXISTS `flow_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_process` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '流程编号',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '流程名称',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '该流程申请单数量',
  `draft` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是草稿，1是草稿，0正常',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序字段，越大越靠前',
  `design` text NOT NULL COMMENT '设计json',
  `remark` varchar(2000) DEFAULT '' COMMENT '备注',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否启用，1启用，0停用',
  `menu_code` varchar(50) NOT NULL DEFAULT '' COMMENT '业务菜单编号',
  `menu_pk` varchar(50) NOT NULL DEFAULT '' COMMENT '业务表唯一值，id或code',
  `app_code` varchar(50) NOT NULL DEFAULT '' COMMENT '应用编号',
  `company_code` varchar(50) NOT NULL DEFAULT '' COMMENT '公司编号',
  `opt_user` varchar(50) NOT NULL DEFAULT '' COMMENT '用户编号',
  `opt_user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名称',
  `opt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='流程定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_process`
--

LOCK TABLES `flow_process` WRITE;
/*!40000 ALTER TABLE `flow_process` DISABLE KEYS */;
INSERT INTO `flow_process` VALUES (1,'leave','请假流程',1,1,50,'{ &quot;class&quot;: &quot;go.GraphLinksModel&quot;,\n  &quot;linkFromPortIdProperty&quot;: &quot;fromPort&quot;,\n  &quot;linkToPortIdProperty&quot;: &quot;toPort&quot;,\n  &quot;nodeDataArray&quot;: [ \n{&quot;category&quot;:&quot;Start&quot;, &quot;text&quot;:&quot;开始&quot;, &quot;key&quot;:-1, &quot;loc&quot;:&quot;-255.5833282470703 -194.00000000000003&quot;},\n{&quot;text&quot;:&quot;经理审批&quot;, &quot;key&quot;:-2, &quot;loc&quot;:&quot;-256.00000000000006 -108.00000000000004&quot;},\n{&quot;text&quot;:&quot;大于1天&quot;, &quot;figure&quot;:&quot;Diamond&quot;, &quot;key&quot;:-3, &quot;loc&quot;:&quot;-254.99999999999966 -25.999999999999993&quot;},\n{&quot;text&quot;:&quot;总经理审批&quot;, &quot;key&quot;:-4, &quot;loc&quot;:&quot;-257.00000000000006 60.999999999999986&quot;},\n{&quot;category&quot;:&quot;End&quot;, &quot;text&quot;:&quot;结束&quot;, &quot;key&quot;:-5, &quot;loc&quot;:&quot;-254 211.0000000000003&quot;},\n{&quot;text&quot;:&quot;步骤&quot;, &quot;key&quot;:-6, &quot;loc&quot;:&quot;-256.3333282470705 144.00000000000014&quot;}\n ],\n  &quot;linkDataArray&quot;: [ \n{&quot;from&quot;:-1, &quot;to&quot;:-2, &quot;fromPort&quot;:&quot;B&quot;, &quot;toPort&quot;:&quot;T&quot;, &quot;points&quot;:[-255.5833282470703,-172.18217008058414,-255.5833282470703,-162.18217008058414,-255.5833282470703,-147.06608504029208,-256.00000000000006,-147.06608504029208,-256.00000000000006,-131.95000000000005,-256.00000000000006,-121.95000000000005]},\n{&quot;from&quot;:-2, &quot;to&quot;:-3, &quot;fromPort&quot;:&quot;B&quot;, &quot;toPort&quot;:&quot;T&quot;, &quot;points&quot;:[-256.00000000000006,-94.05000000000004,-256.00000000000006,-84.05000000000004,-256.00000000000006,-73.72500000000002,-254.99999999999994,-73.72500000000002,-254.99999999999994,-63.39999999999999,-254.99999999999994,-53.39999999999999]},\n{&quot;from&quot;:-3, &quot;to&quot;:-4, &quot;fromPort&quot;:&quot;B&quot;, &quot;toPort&quot;:&quot;T&quot;, &quot;visible&quot;:true, &quot;points&quot;:[-254.99999999999994,1.4000000000000128,-254.99999999999994,11.400000000000013,-254.99999999999994,24.224999999999998,-257.00000000000006,24.224999999999998,-257.00000000000006,37.04999999999998,-257.00000000000006,47.04999999999998], &quot;text&quot;:&quot;是&quot;},\n{&quot;from&quot;:-3, &quot;to&quot;:-5, &quot;fromPort&quot;:&quot;R&quot;, &quot;toPort&quot;:&quot;R&quot;, &quot;visible&quot;:true, &quot;points&quot;:[-192.49999999999966,-25.99999999999999,-182.49999999999966,-25.99999999999999,-182.49999999999966,211.00000000000028,-202.34108504029183,211.00000000000028,-222.182170080584,211.00000000000028,-232.182170080584,211.00000000000028], &quot;text&quot;:&quot;否&quot;},\n{&quot;from&quot;:-4, &quot;to&quot;:-6, &quot;fromPort&quot;:&quot;B&quot;, &quot;toPort&quot;:&quot;T&quot;, &quot;points&quot;:[-257.00000000000006,74.95000000000003,-257.00000000000006,84.95000000000003,-257.00000000000006,102.50000000000003,-256.3333282470703,102.50000000000003,-256.3333282470703,120.05000000000001,-256.3333282470703,130.05]},\n{&quot;from&quot;:-6, &quot;to&quot;:-5, &quot;fromPort&quot;:&quot;B&quot;, &quot;toPort&quot;:&quot;T&quot;, &quot;points&quot;:[-256.3333282470705,157.95000000000016,-256.3333282470705,167.95000000000016,-256.3333282470705,173.5660850402923,-253.9999999999999,173.5660850402923,-253.9999999999999,179.18217008058443,-253.9999999999999,189.18217008058443]}\n ]}','test',1,'','','auth','001','admin','管理员','2018-05-29 00:57:10');
/*!40000 ALTER TABLE `flow_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flow_step`
--

DROP TABLE IF EXISTS `flow_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_step` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process_code` varchar(50) NOT NULL DEFAULT '' COMMENT '流程定义编号',
  `step` int(11) NOT NULL DEFAULT '0' COMMENT '审批步骤，值越小越先审批',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '步骤节点类型，1串行，2并行（会签）',
  `node_key` varchar(2) NOT NULL DEFAULT '' COMMENT '流程设计节点key',
  `app_code` varchar(50) NOT NULL DEFAULT '' COMMENT '应用编号',
  `company_code` varchar(50) NOT NULL DEFAULT '' COMMENT '公司编号',
  `opt_user` varchar(50) NOT NULL DEFAULT '',
  `opt_user_name` varchar(50) NOT NULL DEFAULT '',
  `opt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='流程步骤';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_step`
--

LOCK TABLES `flow_step` WRITE;
/*!40000 ALTER TABLE `flow_step` DISABLE KEYS */;
/*!40000 ALTER TABLE `flow_step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flow_step_condition`
--

DROP TABLE IF EXISTS `flow_step_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_step_condition` (
  `id` int(11) NOT NULL,
  `column` varchar(50) NOT NULL DEFAULT '' COMMENT '产生条件的列',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '具体的条件，<,>,=,!=,in,not in,',
  `value` varchar(2000) NOT NULL DEFAULT '' COMMENT '比较的值',
  `app_code` varchar(50) NOT NULL DEFAULT '' COMMENT '应用code',
  `company_code` varchar(50) NOT NULL DEFAULT '' COMMENT '公司编号',
  `opt_user` varchar(50) NOT NULL DEFAULT '',
  `opt_user_name` varchar(50) NOT NULL,
  `opt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='节点流转条件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_step_condition`
--

LOCK TABLES `flow_step_condition` WRITE;
/*!40000 ALTER TABLE `flow_step_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `flow_step_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flow_step_detail`
--

DROP TABLE IF EXISTS `flow_step_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_step_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process_code` varchar(50) NOT NULL DEFAULT '' COMMENT '流程编号',
  `set_code` varchar(50) NOT NULL DEFAULT '' COMMENT '步骤编号',
  `user_code` varchar(50) NOT NULL DEFAULT '' COMMENT '用户编号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='步骤详情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_step_detail`
--

LOCK TABLES `flow_step_detail` WRITE;
/*!40000 ALTER TABLE `flow_step_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `flow_step_detail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-13 16:05:15
