/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : auth

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-07-07 16:45:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_app`
-- ----------------------------
DROP TABLE IF EXISTS `auth_app`;
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='应用';

-- ----------------------------
-- Records of auth_app
-- ----------------------------
INSERT INTO `auth_app` VALUES ('1', 'asset', '固定资产管理', '172.0.0.1', 'asset.jd.com', '固定资产管理系统1', '1', 'admin', '管理员', '2018-04-04 11:14:17');
INSERT INTO `auth_app` VALUES ('2', 'auth', '权限管理', '172.0.0.1', 'auth.jd.com', '统一权限管理', '1', 'admin', '管理员', '2018-04-13 10:15:34');

-- ----------------------------
-- Table structure for `auth_button`
-- ----------------------------
DROP TABLE IF EXISTS `auth_button`;
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

-- ----------------------------
-- Records of auth_button
-- ----------------------------
INSERT INTO `auth_button` VALUES ('1', 'btn-add', '新增', 'fa fa-plus-square-o', '6', '1', 'admin', '管理员', '2017-08-09 20:40:58');
INSERT INTO `auth_button` VALUES ('2', 'btn-edit', '修改', 'fa fa-pencil-square-o', '5', '1', 'admin', '管理员', '2017-08-09 20:40:58');
INSERT INTO `auth_button` VALUES ('3', 'btn-del', '删除', 'fa fa-trash-o', '4', '1', 'admin', '管理员', '2017-08-09 20:40:58');
INSERT INTO `auth_button` VALUES ('4', 'btn-refresh', '刷新', 'fa fa-refresh', '3', '1', 'admin', '管理员', '2017-08-09 20:40:58');
INSERT INTO `auth_button` VALUES ('5', 'btn-export', '导出', 'fa fa-upload', '1', '1', 'admin', '管理员', '2017-08-09 20:40:58');
INSERT INTO `auth_button` VALUES ('6', 'btn-import', '导入', 'fa fa-download', '2', '1', 'admin', '管理员', '2017-08-09 20:40:58');
INSERT INTO `auth_button` VALUES ('7', 'design', '设计', 'fa fa-sitemap', '1', '1', 'admin', '管理员', '2018-05-17 11:34:55');

-- ----------------------------
-- Table structure for `auth_company`
-- ----------------------------
DROP TABLE IF EXISTS `auth_company`;
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

-- ----------------------------
-- Records of auth_company
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_login_log`
-- ----------------------------
DROP TABLE IF EXISTS `auth_login_log`;
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

-- ----------------------------
-- Records of auth_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_menu`
-- ----------------------------
DROP TABLE IF EXISTS `auth_menu`;
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

-- ----------------------------
-- Records of auth_menu
-- ----------------------------
INSERT INTO `auth_menu` VALUES ('7', 'menu', '菜单管理', '1', '', 'AuthMenu', 'index', 'Auth/AuthMenu', '1', '1', 'resource', '0', '0', '0', 'auth', 'admin', '管理员', '2017-08-02 22:37:02');
INSERT INTO `auth_menu` VALUES ('8', 'menuCategory', '菜单类别', '1', '', 'AuthMenuCategory', 'index', 'Auth/AuthMenuCategory', '1', '1', 'resource', '0', '0', '0', 'auth', 'admin', '管理员', '2017-08-09 19:59:53');
INSERT INTO `auth_menu` VALUES ('9', 'button', '按钮管理', '1', '', 'AuthButton', 'index', 'Auth/AuthButton', '1', '1', 'resource', '0', '0', '0', 'auth', 'admin', '管理员', '2017-08-09 20:01:05');
INSERT INTO `auth_menu` VALUES ('10', 'menuButton', '菜单按钮', '1', '', 'AuthMenuButton', 'index', 'Auth/AuthMenuButton', '1', '1', 'auth', '0', '0', '0', 'auth', 'admin', '管理员', '2017-08-09 20:02:00');
INSERT INTO `auth_menu` VALUES ('11', 'roleMenuButton', '按钮权限', '1', '', 'AuthRoleMenuButton', 'index', 'Auth/AuthRoleMenuButton', '1', '1', 'auth', '0', '0', '0', 'auth', 'admin', '管理员', '2017-08-09 20:02:45');
INSERT INTO `auth_menu` VALUES ('12', 'user', '用户管理', '1', '', 'AuthUser', 'index', 'Auth/AuthUser', '10', '1', 'system', '1', '1', '0', 'auth', 'admin', '管理员', '2017-08-09 20:03:11');
INSERT INTO `auth_menu` VALUES ('14', 'role', '角色管理', '1', '', 'AuthRole', 'index', 'Auth/AuthRole', '0', '1', 'system', '0', '0', '0', 'auth', 'admin', '管理员', '2017-08-09 20:18:42');
INSERT INTO `auth_menu` VALUES ('15', 'changePwd', '更改密码', '1', '', 'AuthUser', 'ChangePwd', 'Auth/AuthUser', '0', '1', 'base', '0', '0', '0', 'auth', 'admin', '管理员', '2017-09-21 22:11:07');
INSERT INTO `auth_menu` VALUES ('16', 'organization', '部门管理', '1', '', 'AuthOrganization', 'index', 'Auth/AuthOrganization', '0', '1', 'base', '0', '0', '0', 'auth', 'admin', '管理员', '2017-10-18 23:02:34');
INSERT INTO `auth_menu` VALUES ('17', 'app', '应用管理', '1', '', 'AuthApp', 'index', 'Auth/AuthApp', '1', '1', 'system', '0', '0', '0', 'auth', 'admin', '管理员', '2018-04-04 10:56:44');
INSERT INTO `auth_menu` VALUES ('18', 'token', '应用公钥', '1', '', 'AuthToken', 'index', 'Auth/AuthToken', '1', '1', 'system', '0', '0', '0', 'auth', 'admin', '管理员', '2018-04-04 11:40:34');
INSERT INTO `auth_menu` VALUES ('19', 'sysDataType', '字典类别', '1', '', 'AuthSysDataType', 'index', 'Auth/AuthSysDataType', '1', '1', 'base', '0', '0', '0', 'auth', 'admin', '管理员', '2018-04-09 08:22:22');
INSERT INTO `auth_menu` VALUES ('20', 'sysData', '数据字典', '1', '', 'AuthSysData', 'index', 'Auth/AuthSysData', '1', '1', 'base', '0', '0', '0', 'auth', 'admin', '管理员', '2018-04-09 08:38:11');
INSERT INTO `auth_menu` VALUES ('22', 'menuMethod', '菜单方法', '1', '', 'AuthMenuMethod', 'index', 'Auth/AuthMenuMethod', '1', '1', 'resource', '0', '0', '0', 'auth', 'admin', '管理员', '2018-04-11 08:41:41');
INSERT INTO `auth_menu` VALUES ('23', 'roleMenuMethod', '方法权限', '1', '', 'AuthRoleMenuMethod', 'index', 'Auth/AuthRoleMenuMethod', '1', '1', 'auth', '0', '0', '0', 'auth', 'admin', '管理员', '2018-04-12 08:56:16');
INSERT INTO `auth_menu` VALUES ('24', 'menuColumn', '字段管理', '1', '', 'AuthMenuColumn', 'index', 'Auth/AuthMenuColumn', '1', '1', 'resource', '0', '0', '0', 'auth', 'admin', '管理员', '2018-04-18 10:00:07');
INSERT INTO `auth_menu` VALUES ('25', 'company', '公司管理', '1', '', 'AuthCompany', 'index', 'Auth/AuthCompany', '1', '1', 'base', '0', '0', '0', 'auth', 'admin', '管理员', '2018-04-18 10:13:52');
INSERT INTO `auth_menu` VALUES ('26', 'roleMenuColumn', '字段权限', '1', '', 'AuthRoleMenuColumn', 'index', 'Auth/AuthRoleMenuColumn', '1', '1', 'auth', '0', '0', '0', 'auth', 'admin', '管理员', '2018-04-19 09:02:41');
INSERT INTO `auth_menu` VALUES ('28', 'process', '流程管理', '1', '', 'FlowProcess', 'index', 'Flow/FlowProcess', '1', '1', 'flow', '0', '0', '0', 'auth', 'admin', '管理员', '2018-05-17 10:34:06');
INSERT INTO `auth_menu` VALUES ('29', 'flowDesign', '流程编辑', '1', '', 'FlowDesign', 'index', 'Flow/FlowDesign', '1', '0', 'flow', '0', '0', '0', 'auth', 'admin', '管理员', '2018-05-18 16:37:00');
INSERT INTO `auth_menu` VALUES ('30', 'roleMenuRule', '数据权限', '1', '', 'AuthRoleMenuRule', 'index', 'Auth/AuthRoleMenuRule', '1', '1', 'auth', '0', '0', '0', 'auth', 'admin', '管理员', '2018-06-05 19:24:09');

-- ----------------------------
-- Table structure for `auth_menu_button`
-- ----------------------------
DROP TABLE IF EXISTS `auth_menu_button`;
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

-- ----------------------------
-- Records of auth_menu_button
-- ----------------------------
INSERT INTO `auth_menu_button` VALUES ('200', 'user', 'btn-add', 'auth', 'admin', '管理员', '2018-04-09 08:38:23');
INSERT INTO `auth_menu_button` VALUES ('201', 'user', 'btn-edit', 'auth', 'admin', '管理员', '2018-04-09 08:38:23');
INSERT INTO `auth_menu_button` VALUES ('202', 'user', 'btn-del', 'auth', 'admin', '管理员', '2018-04-09 08:38:23');
INSERT INTO `auth_menu_button` VALUES ('203', 'user', 'btn-refresh', 'auth', 'admin', '管理员', '2018-04-09 08:38:23');
INSERT INTO `auth_menu_button` VALUES ('204', 'user', 'btn-import', 'auth', 'admin', '管理员', '2018-04-09 08:38:23');
INSERT INTO `auth_menu_button` VALUES ('205', 'user', 'btn-export', 'auth', 'admin', '管理员', '2018-04-09 08:38:23');
INSERT INTO `auth_menu_button` VALUES ('206', 'organization', 'btn-add', 'auth', 'admin', '管理员', '2018-04-09 08:38:23');
INSERT INTO `auth_menu_button` VALUES ('207', 'organization', 'btn-edit', 'auth', 'admin', '管理员', '2018-04-09 08:38:23');
INSERT INTO `auth_menu_button` VALUES ('208', 'organization', 'btn-del', 'auth', 'admin', '管理员', '2018-04-09 08:38:23');
INSERT INTO `auth_menu_button` VALUES ('209', 'organization', 'btn-refresh', 'auth', 'admin', '管理员', '2018-04-09 08:38:23');
INSERT INTO `auth_menu_button` VALUES ('210', 'sysDataType', 'btn-add', 'auth', 'admin', '管理员', '2018-04-09 08:38:23');
INSERT INTO `auth_menu_button` VALUES ('211', 'sysDataType', 'btn-edit', 'auth', 'admin', '管理员', '2018-04-09 08:38:23');
INSERT INTO `auth_menu_button` VALUES ('212', 'sysDataType', 'btn-del', 'auth', 'admin', '管理员', '2018-04-09 08:38:23');
INSERT INTO `auth_menu_button` VALUES ('213', 'sysDataType', 'btn-refresh', 'auth', 'admin', '管理员', '2018-04-09 08:38:23');
INSERT INTO `auth_menu_button` VALUES ('214', 'sysData', 'btn-add', 'auth', 'admin', '管理员', '2018-04-09 08:38:23');
INSERT INTO `auth_menu_button` VALUES ('215', 'sysData', 'btn-edit', 'auth', 'admin', '管理员', '2018-04-09 08:38:23');
INSERT INTO `auth_menu_button` VALUES ('216', 'sysData', 'btn-del', 'auth', 'admin', '管理员', '2018-04-09 08:38:23');
INSERT INTO `auth_menu_button` VALUES ('217', 'sysData', 'btn-refresh', 'auth', 'admin', '管理员', '2018-04-09 08:38:23');
INSERT INTO `auth_menu_button` VALUES ('266', 'role', 'btn-add', '', '', '', '2018-04-18 19:37:59');
INSERT INTO `auth_menu_button` VALUES ('267', 'role', 'btn-edit', '', '', '', '2018-04-18 19:37:59');
INSERT INTO `auth_menu_button` VALUES ('268', 'role', 'btn-del', '', '', '', '2018-04-18 19:37:59');
INSERT INTO `auth_menu_button` VALUES ('269', 'role', 'btn-refresh', '', '', '', '2018-04-18 19:37:59');
INSERT INTO `auth_menu_button` VALUES ('270', 'app', 'btn-add', '', '', '', '2018-04-18 19:37:59');
INSERT INTO `auth_menu_button` VALUES ('271', 'app', 'btn-edit', '', '', '', '2018-04-18 19:37:59');
INSERT INTO `auth_menu_button` VALUES ('272', 'app', 'btn-del', '', '', '', '2018-04-18 19:37:59');
INSERT INTO `auth_menu_button` VALUES ('273', 'app', 'btn-refresh', '', '', '', '2018-04-18 19:37:59');
INSERT INTO `auth_menu_button` VALUES ('274', 'token', 'btn-add', '', '', '', '2018-04-18 19:37:59');
INSERT INTO `auth_menu_button` VALUES ('275', 'token', 'btn-edit', '', '', '', '2018-04-18 19:37:59');
INSERT INTO `auth_menu_button` VALUES ('276', 'token', 'btn-del', '', '', '', '2018-04-18 19:37:59');
INSERT INTO `auth_menu_button` VALUES ('277', 'token', 'btn-refresh', '', '', '', '2018-04-18 19:37:59');
INSERT INTO `auth_menu_button` VALUES ('278', 'menu', 'btn-add', '', '', '', '2018-05-16 16:50:17');
INSERT INTO `auth_menu_button` VALUES ('279', 'menu', 'btn-edit', '', '', '', '2018-05-16 16:50:17');
INSERT INTO `auth_menu_button` VALUES ('280', 'menu', 'btn-del', '', '', '', '2018-05-16 16:50:17');
INSERT INTO `auth_menu_button` VALUES ('281', 'menu', 'btn-refresh', '', '', '', '2018-05-16 16:50:17');
INSERT INTO `auth_menu_button` VALUES ('282', 'menuCategory', 'btn-add', '', '', '', '2018-05-16 16:50:17');
INSERT INTO `auth_menu_button` VALUES ('283', 'menuCategory', 'btn-edit', '', '', '', '2018-05-16 16:50:17');
INSERT INTO `auth_menu_button` VALUES ('284', 'menuCategory', 'btn-del', '', '', '', '2018-05-16 16:50:17');
INSERT INTO `auth_menu_button` VALUES ('285', 'menuCategory', 'btn-refresh', '', '', '', '2018-05-16 16:50:17');
INSERT INTO `auth_menu_button` VALUES ('286', 'button', 'btn-add', '', '', '', '2018-05-16 16:50:17');
INSERT INTO `auth_menu_button` VALUES ('287', 'button', 'btn-edit', '', '', '', '2018-05-16 16:50:17');
INSERT INTO `auth_menu_button` VALUES ('288', 'button', 'btn-del', '', '', '', '2018-05-16 16:50:17');
INSERT INTO `auth_menu_button` VALUES ('289', 'button', 'btn-refresh', '', '', '', '2018-05-16 16:50:17');
INSERT INTO `auth_menu_button` VALUES ('290', 'mehtod', 'btn-add', '', '', '', '2018-05-16 16:50:17');
INSERT INTO `auth_menu_button` VALUES ('291', 'mehtod', 'btn-edit', '', '', '', '2018-05-16 16:50:17');
INSERT INTO `auth_menu_button` VALUES ('292', 'mehtod', 'btn-del', '', '', '', '2018-05-16 16:50:17');
INSERT INTO `auth_menu_button` VALUES ('293', 'mehtod', 'btn-refresh', '', '', '', '2018-05-16 16:50:17');
INSERT INTO `auth_menu_button` VALUES ('294', 'menuMethod', 'btn-add', '', '', '', '2018-05-16 16:50:17');
INSERT INTO `auth_menu_button` VALUES ('295', 'menuMethod', 'btn-edit', '', '', '', '2018-05-16 16:50:17');
INSERT INTO `auth_menu_button` VALUES ('296', 'menuMethod', 'btn-del', '', '', '', '2018-05-16 16:50:17');
INSERT INTO `auth_menu_button` VALUES ('297', 'menuMethod', 'btn-refresh', '', '', '', '2018-05-16 16:50:17');
INSERT INTO `auth_menu_button` VALUES ('298', 'menuColumn', 'btn-add', '', '', '', '2018-05-16 16:50:17');
INSERT INTO `auth_menu_button` VALUES ('299', 'menuColumn', 'btn-edit', '', '', '', '2018-05-16 16:50:17');
INSERT INTO `auth_menu_button` VALUES ('300', 'menuColumn', 'btn-del', '', '', '', '2018-05-16 16:50:17');
INSERT INTO `auth_menu_button` VALUES ('301', 'menuColumn', 'btn-refresh', '', '', '', '2018-05-16 16:50:17');
INSERT INTO `auth_menu_button` VALUES ('306', 'process', 'btn-add', '', '', '', '2018-05-17 11:35:18');
INSERT INTO `auth_menu_button` VALUES ('307', 'process', 'btn-edit', '', '', '', '2018-05-17 11:35:18');
INSERT INTO `auth_menu_button` VALUES ('308', 'process', 'btn-del', '', '', '', '2018-05-17 11:35:18');
INSERT INTO `auth_menu_button` VALUES ('309', 'process', 'btn-refresh', '', '', '', '2018-05-17 11:35:18');
INSERT INTO `auth_menu_button` VALUES ('310', 'process', 'design', '', '', '', '2018-05-17 11:35:18');
INSERT INTO `auth_menu_button` VALUES ('324', 'roleMenuRule', 'btn-add', '', '', '', '2018-06-06 09:32:12');
INSERT INTO `auth_menu_button` VALUES ('325', 'roleMenuRule', 'btn-edit', '', '', '', '2018-06-06 09:32:12');
INSERT INTO `auth_menu_button` VALUES ('326', 'roleMenuRule', 'btn-del', '', '', '', '2018-06-06 09:32:12');
INSERT INTO `auth_menu_button` VALUES ('327', 'roleMenuRule', 'btn-refresh', '', '', '', '2018-06-06 09:32:12');

-- ----------------------------
-- Table structure for `auth_menu_category`
-- ----------------------------
DROP TABLE IF EXISTS `auth_menu_category`;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='菜单按钮';

-- ----------------------------
-- Records of auth_menu_category
-- ----------------------------
INSERT INTO `auth_menu_category` VALUES ('5', 'system', '系统管理', 'fa fa-cogs', '1', '1', 'auth', 'admin', '管理员', '2017-08-09 20:27:37');
INSERT INTO `auth_menu_category` VALUES ('6', 'base', '基础设置', 'fa fa-cog', '2', '1', 'auth', 'admin', '管理员', '2017-08-09 23:07:14');
INSERT INTO `auth_menu_category` VALUES ('7', 'auth', '权限管理', 'fa fa-key', '1', '1', 'auth', 'admin', '管理员', '2018-04-12 08:58:10');
INSERT INTO `auth_menu_category` VALUES ('8', 'resource', '资源管理', 'fa fa-database', '1', '1', 'auth', 'admin', '管理员', '2018-04-18 10:05:55');
INSERT INTO `auth_menu_category` VALUES ('9', 'flow', '流程管理', 'fa fa-usb', '5', '1', 'auth', 'admin', '管理员', '2018-05-16 18:04:04');

-- ----------------------------
-- Table structure for `auth_menu_column`
-- ----------------------------
DROP TABLE IF EXISTS `auth_menu_column`;
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
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='菜单列';

-- ----------------------------
-- Records of auth_menu_column
-- ----------------------------
INSERT INTO `auth_menu_column` VALUES ('1', 'code', '编号', 'menu', '15', '菜单编号', '1', '1', 'auth', 'admin', '管理员', '2018-04-19 20:09:02');
INSERT INTO `auth_menu_column` VALUES ('2', 'name', '名称', 'menu', '14', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-19 20:10:30');
INSERT INTO `auth_menu_column` VALUES ('3', 'status', '状态', 'menu', '10', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-19 20:11:37');
INSERT INTO `auth_menu_column` VALUES ('4', 'controller', '控制器', 'menu', '13', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-19 20:11:59');
INSERT INTO `auth_menu_column` VALUES ('5', 'default_action', '默认方法', 'menu', '12', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-19 20:12:34');
INSERT INTO `auth_menu_column` VALUES ('6', 'url', '链接地址', 'menu', '11', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-19 20:13:20');
INSERT INTO `auth_menu_column` VALUES ('7', 'sort', '排序', 'menu', '9', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-19 20:13:46');
INSERT INTO `auth_menu_column` VALUES ('8', 'opt_user_name', '操作人', 'menu', '8', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-19 20:14:05');
INSERT INTO `auth_menu_column` VALUES ('9', 'opt_time', '操作时间', 'menu', '7', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-19 20:14:29');
INSERT INTO `auth_menu_column` VALUES ('10', 'code', '编号', 'menuCategory', '20', '编号', '1', '1', 'auth', 'admin', '管理员', '2018-04-23 09:25:34');
INSERT INTO `auth_menu_column` VALUES ('11', 'name', '名称', 'menuCategory', '19', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-23 09:27:12');
INSERT INTO `auth_menu_column` VALUES ('12', 'icon', '图标', 'menuCategory', '18', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-23 09:28:10');
INSERT INTO `auth_menu_column` VALUES ('13', 'sort', '排序顺序', 'menuCategory', '17', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-23 09:28:31');
INSERT INTO `auth_menu_column` VALUES ('14', 'status', '状态', 'menuCategory', '16', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-23 09:28:48');
INSERT INTO `auth_menu_column` VALUES ('15', 'opt_user_name', '更新人', 'menuCategory', '15', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-23 09:29:19');
INSERT INTO `auth_menu_column` VALUES ('16', 'opt_time', '更新时间', 'menuCategory', '14', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-23 09:29:38');
INSERT INTO `auth_menu_column` VALUES ('17', 'code', '编号', 'mehtod', '20', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-23 11:22:47');
INSERT INTO `auth_menu_column` VALUES ('18', 'name', '名称', 'mehtod', '19', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-23 11:23:07');
INSERT INTO `auth_menu_column` VALUES ('19', 'status', '状态', 'mehtod', '18', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-23 11:23:50');
INSERT INTO `auth_menu_column` VALUES ('20', 'remark', '备注', 'mehtod', '17', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-23 11:24:04');
INSERT INTO `auth_menu_column` VALUES ('21', 'opt_user_name', '更新人', 'mehtod', '16', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-23 11:24:38');
INSERT INTO `auth_menu_column` VALUES ('22', 'opt_time', '更新时间', 'mehtod', '15', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-23 11:24:58');
INSERT INTO `auth_menu_column` VALUES ('23', 'code', '编号', 'button', '20', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-24 09:37:26');
INSERT INTO `auth_menu_column` VALUES ('24', 'name', '名称', 'button', '19', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-24 09:37:40');
INSERT INTO `auth_menu_column` VALUES ('25', 'icon', '图标', 'button', '18', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-24 09:44:19');
INSERT INTO `auth_menu_column` VALUES ('26', 'sort', '排序', 'button', '17', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-24 09:44:43');
INSERT INTO `auth_menu_column` VALUES ('27', 'status', '状态', 'button', '16', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-24 09:44:58');
INSERT INTO `auth_menu_column` VALUES ('28', 'opt_user_name', '操作人', 'button', '15', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-24 09:45:15');
INSERT INTO `auth_menu_column` VALUES ('29', 'opt_time', '操作时间', 'button', '14', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-24 09:45:35');
INSERT INTO `auth_menu_column` VALUES ('30', 'menuName', '所属菜单', 'menuColumn', '20', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-26 09:33:58');
INSERT INTO `auth_menu_column` VALUES ('31', 'code', '编号', 'menuColumn', '19', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-26 09:34:14');
INSERT INTO `auth_menu_column` VALUES ('32', 'name', '名称', 'menuColumn', '18', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-26 09:34:26');
INSERT INTO `auth_menu_column` VALUES ('33', 'sort', '排序', 'menuColumn', '17', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-26 09:34:50');
INSERT INTO `auth_menu_column` VALUES ('34', 'remark', '备注', 'menuColumn', '16', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-26 09:35:12');
INSERT INTO `auth_menu_column` VALUES ('35', 'opt_user_name', '更新人', 'menuColumn', '15', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-26 09:35:38');
INSERT INTO `auth_menu_column` VALUES ('36', 'opt_time', '更新时间', 'menuColumn', '14', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-26 09:36:03');
INSERT INTO `auth_menu_column` VALUES ('37', 'code', '编号', 'role', '10', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-26 09:39:40');
INSERT INTO `auth_menu_column` VALUES ('38', 'name', '名称', 'role', '9', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-26 09:39:51');
INSERT INTO `auth_menu_column` VALUES ('39', 'status', '状态', 'role', '8', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-26 09:40:15');
INSERT INTO `auth_menu_column` VALUES ('40', 'remark', '备注', 'role', '7', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-26 09:40:31');
INSERT INTO `auth_menu_column` VALUES ('41', 'opt_user_name', '更新人', 'role', '6', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-26 09:40:55');
INSERT INTO `auth_menu_column` VALUES ('42', 'opt_time', '更新时间', 'role', '5', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-26 09:41:10');
INSERT INTO `auth_menu_column` VALUES ('43', 'code', '编号', 'app', '20', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-26 09:45:32');
INSERT INTO `auth_menu_column` VALUES ('44', 'name', '名称', 'app', '19', '', '1', '1', 'auth', 'admin', '管理员', '2018-04-26 09:45:45');
INSERT INTO `auth_menu_column` VALUES ('45', 'category_name', '所属类别', 'menu', '16', '', '1', '1', 'auth', 'admin', '管理员', '2018-05-02 18:56:39');
INSERT INTO `auth_menu_column` VALUES ('46', 'in_org_rule', '部门权限', 'menu', '9', '是否参与部门权限', '1', '1', 'auth', 'admin', '管理员', '2018-05-02 19:02:55');
INSERT INTO `auth_menu_column` VALUES ('47', 'org', '所属部门', 'user', '30', 'qweue', '1', '1', 'auth', 'admin', '管理员', '2018-05-02 19:26:15');
INSERT INTO `auth_menu_column` VALUES ('48', 'code', '编号', 'user', '29', '', '1', '1', 'auth', 'admin', '管理员', '2018-05-02 19:26:35');
INSERT INTO `auth_menu_column` VALUES ('49', 'name', '名称', 'user', '28', '', '1', '1', 'auth', 'admin', '管理员', '2018-05-02 19:26:47');
INSERT INTO `auth_menu_column` VALUES ('50', 'sex', '性别', 'user', '27', '', '1', '1', 'auth', 'admin', '管理员', '2018-05-02 19:27:19');
INSERT INTO `auth_menu_column` VALUES ('51', 'email', '邮箱', 'user', '26', '', '1', '1', 'auth', 'admin', '管理员', '2018-05-02 19:27:41');
INSERT INTO `auth_menu_column` VALUES ('52', 'phone', '手机', 'user', '25', '', '1', '1', 'auth', 'admin', '管理员', '2018-05-02 19:27:55');
INSERT INTO `auth_menu_column` VALUES ('53', 'birthday', '出生日期', 'user', '24', '', '1', '1', 'auth', 'admin', '管理员', '2018-05-02 19:28:30');
INSERT INTO `auth_menu_column` VALUES ('54', 'last_login_time', '最后登录时间', 'user', '23', '', '1', '1', 'auth', 'admin', '管理员', '2018-05-02 19:28:50');
INSERT INTO `auth_menu_column` VALUES ('55', 'create_time', '注册时间', 'user', '22', '', '1', '1', 'auth', 'admin', '管理员', '2018-05-02 19:29:07');
INSERT INTO `auth_menu_column` VALUES ('56', 'last_login_ip', '最后登录ip', 'user', '21', '', '1', '1', 'auth', 'admin', '管理员', '2018-05-02 19:29:52');
INSERT INTO `auth_menu_column` VALUES ('57', 'login_count', '登录次数', 'user', '20', '', '1', '1', 'auth', 'admin', '管理员', '2018-05-02 19:30:14');
INSERT INTO `auth_menu_column` VALUES ('58', 'status', '状态', 'user', '19', '', '1', '1', 'auth', 'admin', '管理员', '2018-05-02 19:31:50');
INSERT INTO `auth_menu_column` VALUES ('59', 'opt_user_name', '操作人', 'user', '18', '', '1', '1', 'auth', 'admin', '管理员', '2018-05-02 19:32:40');
INSERT INTO `auth_menu_column` VALUES ('60', 'opt_time', '操纵时间', 'user', '17', '', '1', '1', 'auth', 'admin', '管理员', '2018-05-02 19:33:30');
INSERT INTO `auth_menu_column` VALUES ('61', 'menu_code', '菜单编号', 'menuMethod', '20', '', '1', '1', 'auth', 'admin', '管理员', '2018-05-16 16:39:14');
INSERT INTO `auth_menu_column` VALUES ('62', 'code', '方法编号', 'menuMethod', '19', '', '1', '1', 'auth', 'admin', '管理员', '2018-05-16 16:39:56');
INSERT INTO `auth_menu_column` VALUES ('63', 'name', '方法名称', 'menuMethod', '18', '', '1', '1', 'auth', 'admin', '管理员', '2018-05-16 16:40:10');
INSERT INTO `auth_menu_column` VALUES ('64', 'opt_user_name', '更新人', 'menuMethod', '15', '', '1', '1', 'auth', 'admin', '管理员', '2018-05-16 16:40:44');
INSERT INTO `auth_menu_column` VALUES ('65', 'opt_time', '更新时间', 'menuMethod', '14', '', '1', '1', 'auth', 'admin', '管理员', '2018-05-16 16:40:58');
INSERT INTO `auth_menu_column` VALUES ('66', 'status', '状态', 'menuMethod', '16', '', '1', '1', 'auth', 'admin', '管理员', '2018-05-16 17:09:51');
INSERT INTO `auth_menu_column` VALUES ('67', 'code', '编号', 'process', '20', '', '1', '1', 'auth', 'admin', '管理员', '2018-05-17 11:07:17');
INSERT INTO `auth_menu_column` VALUES ('68', 'name', '名称', 'process', '19', '', '1', '1', 'auth', 'admin', '管理员', '2018-05-17 11:07:29');
INSERT INTO `auth_menu_column` VALUES ('69', 'status', '状态', 'process', '18', '', '1', '1', 'auth', 'admin', '管理员', '2018-05-17 11:09:34');
INSERT INTO `auth_menu_column` VALUES ('70', 'draft', '草稿', 'process', '17', '是否是草稿', '1', '1', 'auth', 'admin', '管理员', '2018-05-17 11:16:02');
INSERT INTO `auth_menu_column` VALUES ('71', 'count', '申请数量', 'process', '16', '', '1', '1', 'auth', 'admin', '管理员', '2018-05-17 11:17:26');
INSERT INTO `auth_menu_column` VALUES ('72', 'opt_user_name', '操作人', 'process', '14', '', '1', '1', 'auth', 'admin', '管理员', '2018-05-17 11:18:06');
INSERT INTO `auth_menu_column` VALUES ('73', 'opt_time', '操作时间', 'process', '13', '', '1', '1', 'auth', 'admin', '管理员', '2018-05-17 11:18:24');
INSERT INTO `auth_menu_column` VALUES ('74', 'sort', '排序', 'process', '15', '', '1', '1', 'auth', 'admin', '管理员', '2018-05-17 11:22:26');
INSERT INTO `auth_menu_column` VALUES ('75', 'show_in_menu', '是否显示', 'menu', '9', '', '1', '1', 'auth', 'admin', '管理员', '2018-05-18 17:15:41');
INSERT INTO `auth_menu_column` VALUES ('76', 'in_row_rule', '行权限', 'menu', '9', '是否参与数据行权限', '1', '1', 'auth', 'admin', '管理员', '2018-05-28 16:02:17');

-- ----------------------------
-- Table structure for `auth_menu_method`
-- ----------------------------
DROP TABLE IF EXISTS `auth_menu_method`;
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
) ENGINE=MyISAM AUTO_INCREMENT=244 DEFAULT CHARSET=utf8 COMMENT='菜单，方法表';

-- ----------------------------
-- Records of auth_menu_method
-- ----------------------------
INSERT INTO `auth_menu_method` VALUES ('204', 'menuColumn', 'addView', '新增视图', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('107', 'token', 'index', '入口', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('106', 'token', 'addView', '新增视图', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('105', 'token', 'editView', '编辑视图', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('104', 'token', 'ajax_save', '保存方法', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('103', 'app', 'index', '入口', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('102', 'app', 'addView', '新增视图', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('101', 'app', 'editView', '编辑视图', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('99', 'role', 'index', '入口', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('98', 'role', 'addView', '新增视图', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('96', 'role', 'ajax_save', '保存方法', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('97', 'role', 'editView', '编辑视图', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('203', 'menuColumn', 'editView', '编辑视图', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('227', 'roleMenuColumn', 'index', '入口', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('226', 'roleMenuColumn', 'ajax_save', '保存方法', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('198', 'mehtod', 'editView', '编辑视图', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('199', 'mehtod', 'addView', '新增视图', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('200', 'mehtod', 'index', '入口', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('189', 'menuCategory', 'ajax_save', '保存方法', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('190', 'menuCategory', 'editView', '编辑视图', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('191', 'menuCategory', 'addView', '新增视图', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('192', 'menuCategory', 'index', '入口', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('193', 'button', 'ajax_save', '保存方法', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('194', 'button', 'editView', '编辑视图', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('195', 'button', 'addView', '新增视图', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('196', 'button', 'index', '入口', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('197', 'mehtod', 'ajax_save', '保存方法', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('225', 'roleMenuMethod', 'index', '入口', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('224', 'roleMenuMethod', 'ajax_save', '保存方法', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('148', 'sysData', 'editView', '编辑视图', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('149', 'sysData', 'addView', '新增视图', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('147', 'sysData', 'ajax_save', '保存方法', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('144', 'sysDataType', 'editView', '编辑视图', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('145', 'sysDataType', 'addView', '新增视图', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('146', 'sysDataType', 'index', '入口', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('141', 'organization', 'addView', '新增视图', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('142', 'organization', 'index', '入口', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('143', 'sysDataType', 'ajax_save', '保存方法', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('138', 'changePwd', 'index', '入口', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('139', 'organization', 'ajax_save', '保存方法', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('140', 'organization', 'editView', '编辑视图', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('100', 'app', 'ajax_save', '保存方法', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('202', 'menuColumn', 'ajax_save', '保存方法', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('201', 'menuColumn', 'ajax_get_menu', '获取菜单', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('222', 'menuMethod', 'ajax_save', '保存方法', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('223', 'menuMethod', 'index', '入口', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('150', 'sysData', 'index', '入口', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('137', 'changePwd', 'ajax_save', '保存方法', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('136', 'user', 'index', '入口', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('135', 'user', 'addView', '新增视图', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('134', 'user', 'editView', '编辑视图', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('133', 'user', 'ajax_save', '保存方法', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('151', 'company', 'ajax_save', '保存方法', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('152', 'company', 'editView', '编辑视图', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('153', 'company', 'addView', '新增视图', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('154', 'company', 'index', '入口', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('188', 'menu', 'index', '入口', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('187', 'menu', 'addView', '新增视图', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('186', 'menu', 'editView', '编辑视图', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('185', 'menu', 'ajax_save', '保存方法', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('221', 'roleMenuButton', 'index', '入口', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('205', 'menuColumn', 'index', '入口', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('220', 'roleMenuButton', 'ajax_save', '保存方法', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('219', 'menuButton', 'index', '入口', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('218', 'menuButton', 'ajax_save', '保存方法', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('228', 'roleMenuOrgRule', 'ajax_save', '保存方法', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('229', 'roleMenuOrgRule', 'index', '入口', '1', 'auth', 'admin', '管理员', '2018-05-16 17:49:46');
INSERT INTO `auth_menu_method` VALUES ('230', 'process', 'index', '首页', '1', 'auth', 'admin', '管理员', '2018-05-17 10:40:47');
INSERT INTO `auth_menu_method` VALUES ('231', 'process', 'addView', '新增视图', '1', 'auth', 'admin', '管理员', '2018-05-17 14:07:54');
INSERT INTO `auth_menu_method` VALUES ('232', 'process', 'editView', '编辑视图', '1', 'auth', 'admin', '管理员', '2018-05-17 14:08:16');
INSERT INTO `auth_menu_method` VALUES ('233', 'process', 'ajax_save', '保存方法', '1', 'auth', 'admin', '管理员', '2018-05-17 14:08:38');
INSERT INTO `auth_menu_method` VALUES ('234', 'menuMethod', 'ajax_get_menu', '获取菜单', '1', 'auth', 'admin', '管理员', '2018-05-18 16:42:51');
INSERT INTO `auth_menu_method` VALUES ('235', 'menuMethod', 'addView', '新增视图', '1', 'auth', 'admin', '管理员', '2018-05-18 16:43:34');
INSERT INTO `auth_menu_method` VALUES ('236', 'menuMethod', 'editView', '修改视图', '1', 'auth', 'admin', '管理员', '2018-05-18 16:43:51');
INSERT INTO `auth_menu_method` VALUES ('237', 'flowDesign', 'index', '入口', '1', 'auth', 'admin', '管理员', '2018-05-18 16:45:08');
INSERT INTO `auth_menu_method` VALUES ('238', 'menu', 'del', '删除', '1', 'auth', 'admin', '管理员', '2018-05-18 23:21:34');
INSERT INTO `auth_menu_method` VALUES ('239', 'flowDesign', 'ajax_save', '保存', '1', 'auth', 'admin', '管理员', '2018-05-18 23:22:34');
INSERT INTO `auth_menu_method` VALUES ('240', 'roleMenuRule', 'index', '首页', '1', 'auth', 'admin', '管理员', '2018-06-06 08:55:13');
INSERT INTO `auth_menu_method` VALUES ('241', 'roleMenuRule', 'addView', '新增视图', '1', 'auth', 'admin', '管理员', '2018-06-06 08:55:41');
INSERT INTO `auth_menu_method` VALUES ('242', 'roleMenuRule', 'editView', '编辑视图', '1', 'auth', 'admin', '管理员', '2018-06-06 08:55:59');
INSERT INTO `auth_menu_method` VALUES ('243', 'roleMenuRule', 'ajax_save', '保存方法', '1', 'auth', 'admin', '管理员', '2018-06-06 08:56:16');

-- ----------------------------
-- Table structure for `auth_organization`
-- ----------------------------
DROP TABLE IF EXISTS `auth_organization`;
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

-- ----------------------------
-- Records of auth_organization
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_role`
-- ----------------------------
DROP TABLE IF EXISTS `auth_role`;
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

-- ----------------------------
-- Records of auth_role
-- ----------------------------
INSERT INTO `auth_role` VALUES ('4', 'admin', '管理员', '系统管理员5', '1', 'auth', '001', 'admin', '管理员', '2018-04-13 10:27:02');

-- ----------------------------
-- Table structure for `auth_role_menu_button`
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_menu_button`;
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
) ENGINE=InnoDB AUTO_INCREMENT=568 DEFAULT CHARSET=utf8 COMMENT='角色菜单按钮';

-- ----------------------------
-- Records of auth_role_menu_button
-- ----------------------------
INSERT INTO `auth_role_menu_button` VALUES ('481', 'admin', 'role', 'btn-add', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:22');
INSERT INTO `auth_role_menu_button` VALUES ('482', 'admin', 'role', 'btn-edit', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:22');
INSERT INTO `auth_role_menu_button` VALUES ('483', 'admin', 'role', 'btn-del', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:22');
INSERT INTO `auth_role_menu_button` VALUES ('484', 'admin', 'role', 'btn-refresh', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:22');
INSERT INTO `auth_role_menu_button` VALUES ('485', 'admin', 'app', 'btn-add', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:22');
INSERT INTO `auth_role_menu_button` VALUES ('486', 'admin', 'app', 'btn-edit', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:22');
INSERT INTO `auth_role_menu_button` VALUES ('487', 'admin', 'app', 'btn-del', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:22');
INSERT INTO `auth_role_menu_button` VALUES ('488', 'admin', 'app', 'btn-refresh', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:22');
INSERT INTO `auth_role_menu_button` VALUES ('489', 'admin', 'token', 'btn-add', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:22');
INSERT INTO `auth_role_menu_button` VALUES ('490', 'admin', 'token', 'btn-edit', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:22');
INSERT INTO `auth_role_menu_button` VALUES ('491', 'admin', 'token', 'btn-del', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:22');
INSERT INTO `auth_role_menu_button` VALUES ('492', 'admin', 'token', 'btn-refresh', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:22');
INSERT INTO `auth_role_menu_button` VALUES ('493', 'admin', 'user', 'btn-add', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:54');
INSERT INTO `auth_role_menu_button` VALUES ('494', 'admin', 'user', 'btn-edit', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:54');
INSERT INTO `auth_role_menu_button` VALUES ('495', 'admin', 'user', 'btn-del', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:54');
INSERT INTO `auth_role_menu_button` VALUES ('496', 'admin', 'user', 'btn-refresh', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:54');
INSERT INTO `auth_role_menu_button` VALUES ('497', 'admin', 'user', 'btn-import', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:54');
INSERT INTO `auth_role_menu_button` VALUES ('498', 'admin', 'user', 'btn-export', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:54');
INSERT INTO `auth_role_menu_button` VALUES ('499', 'admin', 'organization', 'btn-add', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:54');
INSERT INTO `auth_role_menu_button` VALUES ('500', 'admin', 'organization', 'btn-edit', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:54');
INSERT INTO `auth_role_menu_button` VALUES ('501', 'admin', 'organization', 'btn-del', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:54');
INSERT INTO `auth_role_menu_button` VALUES ('502', 'admin', 'organization', 'btn-refresh', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:54');
INSERT INTO `auth_role_menu_button` VALUES ('503', 'admin', 'sysDataType', 'btn-add', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:54');
INSERT INTO `auth_role_menu_button` VALUES ('504', 'admin', 'sysDataType', 'btn-edit', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:54');
INSERT INTO `auth_role_menu_button` VALUES ('505', 'admin', 'sysDataType', 'btn-del', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:54');
INSERT INTO `auth_role_menu_button` VALUES ('506', 'admin', 'sysDataType', 'btn-refresh', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:54');
INSERT INTO `auth_role_menu_button` VALUES ('507', 'admin', 'sysData', 'btn-add', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:54');
INSERT INTO `auth_role_menu_button` VALUES ('508', 'admin', 'sysData', 'btn-edit', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:54');
INSERT INTO `auth_role_menu_button` VALUES ('509', 'admin', 'sysData', 'btn-del', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:54');
INSERT INTO `auth_role_menu_button` VALUES ('510', 'admin', 'sysData', 'btn-refresh', 'auth', '001', 'admin', '管理员', '2018-04-18 19:40:54');
INSERT INTO `auth_role_menu_button` VALUES ('531', 'admin', 'menu', 'btn-add', 'auth', '001', 'admin', '管理员', '2018-05-16 16:50:29');
INSERT INTO `auth_role_menu_button` VALUES ('532', 'admin', 'menu', 'btn-edit', 'auth', '001', 'admin', '管理员', '2018-05-16 16:50:29');
INSERT INTO `auth_role_menu_button` VALUES ('533', 'admin', 'menu', 'btn-del', 'auth', '001', 'admin', '管理员', '2018-05-16 16:50:29');
INSERT INTO `auth_role_menu_button` VALUES ('534', 'admin', 'menu', 'btn-refresh', 'auth', '001', 'admin', '管理员', '2018-05-16 16:50:29');
INSERT INTO `auth_role_menu_button` VALUES ('535', 'admin', 'menuCategory', 'btn-add', 'auth', '001', 'admin', '管理员', '2018-05-16 16:50:29');
INSERT INTO `auth_role_menu_button` VALUES ('536', 'admin', 'menuCategory', 'btn-edit', 'auth', '001', 'admin', '管理员', '2018-05-16 16:50:29');
INSERT INTO `auth_role_menu_button` VALUES ('537', 'admin', 'menuCategory', 'btn-del', 'auth', '001', 'admin', '管理员', '2018-05-16 16:50:29');
INSERT INTO `auth_role_menu_button` VALUES ('538', 'admin', 'menuCategory', 'btn-refresh', 'auth', '001', 'admin', '管理员', '2018-05-16 16:50:29');
INSERT INTO `auth_role_menu_button` VALUES ('539', 'admin', 'button', 'btn-add', 'auth', '001', 'admin', '管理员', '2018-05-16 16:50:29');
INSERT INTO `auth_role_menu_button` VALUES ('540', 'admin', 'button', 'btn-edit', 'auth', '001', 'admin', '管理员', '2018-05-16 16:50:29');
INSERT INTO `auth_role_menu_button` VALUES ('541', 'admin', 'button', 'btn-del', 'auth', '001', 'admin', '管理员', '2018-05-16 16:50:29');
INSERT INTO `auth_role_menu_button` VALUES ('542', 'admin', 'button', 'btn-refresh', 'auth', '001', 'admin', '管理员', '2018-05-16 16:50:29');
INSERT INTO `auth_role_menu_button` VALUES ('543', 'admin', 'mehtod', 'btn-add', 'auth', '001', 'admin', '管理员', '2018-05-16 16:50:29');
INSERT INTO `auth_role_menu_button` VALUES ('544', 'admin', 'mehtod', 'btn-edit', 'auth', '001', 'admin', '管理员', '2018-05-16 16:50:29');
INSERT INTO `auth_role_menu_button` VALUES ('545', 'admin', 'mehtod', 'btn-del', 'auth', '001', 'admin', '管理员', '2018-05-16 16:50:29');
INSERT INTO `auth_role_menu_button` VALUES ('546', 'admin', 'mehtod', 'btn-refresh', 'auth', '001', 'admin', '管理员', '2018-05-16 16:50:29');
INSERT INTO `auth_role_menu_button` VALUES ('547', 'admin', 'menuMethod', 'btn-add', 'auth', '001', 'admin', '管理员', '2018-05-16 16:50:29');
INSERT INTO `auth_role_menu_button` VALUES ('548', 'admin', 'menuMethod', 'btn-edit', 'auth', '001', 'admin', '管理员', '2018-05-16 16:50:29');
INSERT INTO `auth_role_menu_button` VALUES ('549', 'admin', 'menuMethod', 'btn-del', 'auth', '001', 'admin', '管理员', '2018-05-16 16:50:29');
INSERT INTO `auth_role_menu_button` VALUES ('550', 'admin', 'menuMethod', 'btn-refresh', 'auth', '001', 'admin', '管理员', '2018-05-16 16:50:29');
INSERT INTO `auth_role_menu_button` VALUES ('551', 'admin', 'menuColumn', 'btn-add', 'auth', '001', 'admin', '管理员', '2018-05-16 16:50:29');
INSERT INTO `auth_role_menu_button` VALUES ('552', 'admin', 'menuColumn', 'btn-edit', 'auth', '001', 'admin', '管理员', '2018-05-16 16:50:29');
INSERT INTO `auth_role_menu_button` VALUES ('553', 'admin', 'menuColumn', 'btn-del', 'auth', '001', 'admin', '管理员', '2018-05-16 16:50:29');
INSERT INTO `auth_role_menu_button` VALUES ('554', 'admin', 'menuColumn', 'btn-refresh', 'auth', '001', 'admin', '管理员', '2018-05-16 16:50:29');
INSERT INTO `auth_role_menu_button` VALUES ('559', 'admin', 'process', 'btn-add', 'auth', '001', 'admin', '管理员', '2018-05-17 11:35:29');
INSERT INTO `auth_role_menu_button` VALUES ('560', 'admin', 'process', 'btn-edit', 'auth', '001', 'admin', '管理员', '2018-05-17 11:35:29');
INSERT INTO `auth_role_menu_button` VALUES ('561', 'admin', 'process', 'btn-del', 'auth', '001', 'admin', '管理员', '2018-05-17 11:35:29');
INSERT INTO `auth_role_menu_button` VALUES ('562', 'admin', 'process', 'btn-refresh', 'auth', '001', 'admin', '管理员', '2018-05-17 11:35:29');
INSERT INTO `auth_role_menu_button` VALUES ('563', 'admin', 'process', 'design', 'auth', '001', 'admin', '管理员', '2018-05-17 11:35:29');
INSERT INTO `auth_role_menu_button` VALUES ('564', 'admin', 'roleMenuRule', 'btn-add', 'auth', '001', 'admin', '管理员', '2018-06-06 09:32:29');
INSERT INTO `auth_role_menu_button` VALUES ('565', 'admin', 'roleMenuRule', 'btn-edit', 'auth', '001', 'admin', '管理员', '2018-06-06 09:32:29');
INSERT INTO `auth_role_menu_button` VALUES ('566', 'admin', 'roleMenuRule', 'btn-del', 'auth', '001', 'admin', '管理员', '2018-06-06 09:32:29');
INSERT INTO `auth_role_menu_button` VALUES ('567', 'admin', 'roleMenuRule', 'btn-refresh', 'auth', '001', 'admin', '管理员', '2018-06-06 09:32:29');

-- ----------------------------
-- Table structure for `auth_role_menu_column`
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_menu_column`;
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
) ENGINE=MyISAM AUTO_INCREMENT=597 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_role_menu_column
-- ----------------------------
INSERT INTO `auth_role_menu_column` VALUES ('596', 'admin', 'menuColumn', 'opt_time', '更新时间', '14', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('595', 'admin', 'menuColumn', 'opt_user_name', '更新人', '15', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('594', 'admin', 'menuColumn', 'remark', '备注', '16', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('593', 'admin', 'menuColumn', 'sort', '排序', '17', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('592', 'admin', 'menuColumn', 'name', '名称', '18', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('591', 'admin', 'menuColumn', 'code', '编号', '19', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('589', 'admin', 'menuMethod', 'status', '状态', '16', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('590', 'admin', 'menuColumn', 'menuName', '所属菜单', '20', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('588', 'admin', 'menuMethod', 'opt_time', '更新时间', '14', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('587', 'admin', 'menuMethod', 'opt_user_name', '更新人', '15', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('586', 'admin', 'menuMethod', 'name', '方法名称', '18', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('503', 'admin', 'mehtod', 'opt_time', '更新时间', '15', 'auth', '001', 'admin', '管理员', '2018-05-18 17:16:00');
INSERT INTO `auth_role_menu_column` VALUES ('502', 'admin', 'mehtod', 'opt_user_name', '更新人', '16', 'auth', '001', 'admin', '管理员', '2018-05-18 17:16:00');
INSERT INTO `auth_role_menu_column` VALUES ('500', 'admin', 'mehtod', 'status', '状态', '18', 'auth', '001', 'admin', '管理员', '2018-05-18 17:16:00');
INSERT INTO `auth_role_menu_column` VALUES ('501', 'admin', 'mehtod', 'remark', '备注', '17', 'auth', '001', 'admin', '管理员', '2018-05-18 17:16:00');
INSERT INTO `auth_role_menu_column` VALUES ('498', 'admin', 'mehtod', 'code', '编号', '20', 'auth', '001', 'admin', '管理员', '2018-05-18 17:16:00');
INSERT INTO `auth_role_menu_column` VALUES ('499', 'admin', 'mehtod', 'name', '名称', '19', 'auth', '001', 'admin', '管理员', '2018-05-18 17:16:00');
INSERT INTO `auth_role_menu_column` VALUES ('585', 'admin', 'menuMethod', 'code', '方法编号', '19', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('581', 'admin', 'button', 'status', '状态', '16', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('584', 'admin', 'menuMethod', 'menu_code', '菜单编号', '20', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('583', 'admin', 'button', 'opt_time', '操作时间', '14', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('582', 'admin', 'button', 'opt_user_name', '操作人', '15', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('576', 'admin', 'menuCategory', 'opt_time', '更新时间', '14', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('577', 'admin', 'button', 'code', '编号', '20', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('578', 'admin', 'button', 'name', '名称', '19', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('579', 'admin', 'button', 'icon', '图标', '18', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('580', 'admin', 'button', 'sort', '排序', '17', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('575', 'admin', 'menuCategory', 'opt_user_name', '更新人', '15', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('574', 'admin', 'menuCategory', 'status', '状态', '16', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('573', 'admin', 'menuCategory', 'sort', '排序顺序', '17', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('572', 'admin', 'menuCategory', 'icon', '图标', '18', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('571', 'admin', 'menuCategory', 'name', '名称', '19', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('570', 'admin', 'menuCategory', 'code', '编号', '20', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('311', 'admin', 'user', 'phone', '手机', '25', 'auth', '001', 'admin', '管理员', '2018-05-16 16:41:42');
INSERT INTO `auth_role_menu_column` VALUES ('310', 'admin', 'user', 'email', '邮箱', '26', 'auth', '001', 'admin', '管理员', '2018-05-16 16:41:42');
INSERT INTO `auth_role_menu_column` VALUES ('309', 'admin', 'user', 'sex', '性别', '27', 'auth', '001', 'admin', '管理员', '2018-05-16 16:41:42');
INSERT INTO `auth_role_menu_column` VALUES ('308', 'admin', 'user', 'name', '名称', '28', 'auth', '001', 'admin', '管理员', '2018-05-16 16:41:42');
INSERT INTO `auth_role_menu_column` VALUES ('307', 'admin', 'user', 'code', '编号', '29', 'auth', '001', 'admin', '管理员', '2018-05-16 16:41:42');
INSERT INTO `auth_role_menu_column` VALUES ('306', 'admin', 'user', 'org', '所属部门', '30', 'auth', '001', 'admin', '管理员', '2018-05-16 16:41:42');
INSERT INTO `auth_role_menu_column` VALUES ('567', 'admin', 'menu', 'in_org_rule', '部门权限', '9', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('568', 'admin', 'menu', 'show_in_menu', '是否显示', '9', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('569', 'admin', 'menu', 'in_row_rule', '行权限', '9', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('312', 'admin', 'user', 'birthday', '出生日期', '24', 'auth', '001', 'admin', '管理员', '2018-05-16 16:41:42');
INSERT INTO `auth_role_menu_column` VALUES ('313', 'admin', 'user', 'last_login_time', '最后登录时间', '23', 'auth', '001', 'admin', '管理员', '2018-05-16 16:41:42');
INSERT INTO `auth_role_menu_column` VALUES ('314', 'admin', 'user', 'create_time', '注册时间', '22', 'auth', '001', 'admin', '管理员', '2018-05-16 16:41:42');
INSERT INTO `auth_role_menu_column` VALUES ('315', 'admin', 'user', 'last_login_ip', '最后登录ip', '21', 'auth', '001', 'admin', '管理员', '2018-05-16 16:41:42');
INSERT INTO `auth_role_menu_column` VALUES ('316', 'admin', 'user', 'login_count', '登录次数', '20', 'auth', '001', 'admin', '管理员', '2018-05-16 16:41:42');
INSERT INTO `auth_role_menu_column` VALUES ('317', 'admin', 'user', 'status', '状态', '19', 'auth', '001', 'admin', '管理员', '2018-05-16 16:41:42');
INSERT INTO `auth_role_menu_column` VALUES ('318', 'admin', 'user', 'opt_user_name', '操作人', '18', 'auth', '001', 'admin', '管理员', '2018-05-16 16:41:42');
INSERT INTO `auth_role_menu_column` VALUES ('319', 'admin', 'user', 'opt_time', '操纵时间', '17', 'auth', '001', 'admin', '管理员', '2018-05-16 16:41:42');
INSERT INTO `auth_role_menu_column` VALUES ('320', 'admin', 'role', 'code', '编号', '10', 'auth', '001', 'admin', '管理员', '2018-05-16 16:41:42');
INSERT INTO `auth_role_menu_column` VALUES ('321', 'admin', 'role', 'name', '名称', '9', 'auth', '001', 'admin', '管理员', '2018-05-16 16:41:42');
INSERT INTO `auth_role_menu_column` VALUES ('322', 'admin', 'role', 'status', '状态', '8', 'auth', '001', 'admin', '管理员', '2018-05-16 16:41:42');
INSERT INTO `auth_role_menu_column` VALUES ('323', 'admin', 'role', 'remark', '备注', '7', 'auth', '001', 'admin', '管理员', '2018-05-16 16:41:42');
INSERT INTO `auth_role_menu_column` VALUES ('324', 'admin', 'role', 'opt_user_name', '更新人', '6', 'auth', '001', 'admin', '管理员', '2018-05-16 16:41:42');
INSERT INTO `auth_role_menu_column` VALUES ('325', 'admin', 'role', 'opt_time', '更新时间', '5', 'auth', '001', 'admin', '管理员', '2018-05-16 16:41:42');
INSERT INTO `auth_role_menu_column` VALUES ('565', 'admin', 'menu', 'opt_time', '操作时间', '7', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('566', 'admin', 'menu', 'category_name', '所属类别', '16', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('564', 'admin', 'menu', 'opt_user_name', '操作人', '8', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('562', 'admin', 'menu', 'url', '链接地址', '11', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('563', 'admin', 'menu', 'sort', '排序', '9', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('561', 'admin', 'menu', 'default_action', '默认方法', '12', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('560', 'admin', 'menu', 'controller', '控制器', '13', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('559', 'admin', 'menu', 'status', '状态', '10', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('469', 'admin', 'process', 'opt_user_name', '操作人', '14', 'auth', '001', 'admin', '管理员', '2018-05-17 11:23:08');
INSERT INTO `auth_role_menu_column` VALUES ('468', 'admin', 'process', 'count', '申请数量', '16', 'auth', '001', 'admin', '管理员', '2018-05-17 11:23:08');
INSERT INTO `auth_role_menu_column` VALUES ('467', 'admin', 'process', 'draft', '草稿', '17', 'auth', '001', 'admin', '管理员', '2018-05-17 11:23:08');
INSERT INTO `auth_role_menu_column` VALUES ('466', 'admin', 'process', 'status', '状态', '18', 'auth', '001', 'admin', '管理员', '2018-05-17 11:23:08');
INSERT INTO `auth_role_menu_column` VALUES ('465', 'admin', 'process', 'name', '名称', '19', 'auth', '001', 'admin', '管理员', '2018-05-17 11:23:08');
INSERT INTO `auth_role_menu_column` VALUES ('464', 'admin', 'process', 'code', '编号', '20', 'auth', '001', 'admin', '管理员', '2018-05-17 11:23:08');
INSERT INTO `auth_role_menu_column` VALUES ('470', 'admin', 'process', 'opt_time', '操作时间', '13', 'auth', '001', 'admin', '管理员', '2018-05-17 11:23:08');
INSERT INTO `auth_role_menu_column` VALUES ('471', 'admin', 'process', 'sort', '排序', '15', 'auth', '001', 'admin', '管理员', '2018-05-17 11:23:08');
INSERT INTO `auth_role_menu_column` VALUES ('558', 'admin', 'menu', 'name', '名称', '14', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');
INSERT INTO `auth_role_menu_column` VALUES ('557', 'admin', 'menu', 'code', '编号', '15', 'auth', '001', 'admin', '管理员', '2018-05-28 16:13:08');

-- ----------------------------
-- Table structure for `auth_role_menu_method`
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_menu_method`;
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
) ENGINE=MyISAM AUTO_INCREMENT=367 DEFAULT CHARSET=utf8 COMMENT='角色菜单，action\r\n最终权限判断方法';

-- ----------------------------
-- Records of auth_role_menu_method
-- ----------------------------
INSERT INTO `auth_role_menu_method` VALUES ('329', 'admin', 'menuColumn', 'editView', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:21:45');
INSERT INTO `auth_role_menu_method` VALUES ('203', 'admin', 'token', 'editView', '', 'auth', '001', 'admin', '管理员', '2018-04-18 19:38:13');
INSERT INTO `auth_role_menu_method` VALUES ('200', 'admin', 'app', 'ajax_save', '', 'auth', '001', 'admin', '管理员', '2018-04-18 19:38:13');
INSERT INTO `auth_role_menu_method` VALUES ('198', 'admin', 'app', 'addView', '', 'auth', '001', 'admin', '管理员', '2018-04-18 19:38:13');
INSERT INTO `auth_role_menu_method` VALUES ('193', 'admin', 'role', 'index', '', 'auth', '001', 'admin', '管理员', '2018-04-18 19:38:13');
INSERT INTO `auth_role_menu_method` VALUES ('199', 'admin', 'app', 'editView', '', 'auth', '001', 'admin', '管理员', '2018-04-18 19:38:13');
INSERT INTO `auth_role_menu_method` VALUES ('330', 'admin', 'menuColumn', 'ajax_save', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:21:45');
INSERT INTO `auth_role_menu_method` VALUES ('202', 'admin', 'token', 'addView', '', 'auth', '001', 'admin', '管理员', '2018-04-18 19:38:13');
INSERT INTO `auth_role_menu_method` VALUES ('197', 'admin', 'app', 'index', '', 'auth', '001', 'admin', '管理员', '2018-04-18 19:38:13');
INSERT INTO `auth_role_menu_method` VALUES ('196', 'admin', 'role', 'editView', '', 'auth', '001', 'admin', '管理员', '2018-04-18 19:38:13');
INSERT INTO `auth_role_menu_method` VALUES ('195', 'admin', 'role', 'ajax_save', '', 'auth', '001', 'admin', '管理员', '2018-04-18 19:38:13');
INSERT INTO `auth_role_menu_method` VALUES ('328', 'admin', 'menuColumn', 'addView', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:21:45');
INSERT INTO `auth_role_menu_method` VALUES ('194', 'admin', 'role', 'addView', '', 'auth', '001', 'admin', '管理员', '2018-04-18 19:38:13');
INSERT INTO `auth_role_menu_method` VALUES ('326', 'admin', 'menuMethod', 'addView', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:21:45');
INSERT INTO `auth_role_menu_method` VALUES ('327', 'admin', 'menuMethod', 'editView', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:21:45');
INSERT INTO `auth_role_menu_method` VALUES ('325', 'admin', 'menuMethod', 'ajax_get_menu', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:21:45');
INSERT INTO `auth_role_menu_method` VALUES ('324', 'admin', 'menuMethod', 'index', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:21:45');
INSERT INTO `auth_role_menu_method` VALUES ('232', 'admin', 'sysData', 'index', '', 'auth', '001', 'admin', '管理员', '2018-04-20 15:23:39');
INSERT INTO `auth_role_menu_method` VALUES ('230', 'admin', 'sysData', 'addView', '', 'auth', '001', 'admin', '管理员', '2018-04-20 15:23:39');
INSERT INTO `auth_role_menu_method` VALUES ('231', 'admin', 'sysData', 'ajax_save', '', 'auth', '001', 'admin', '管理员', '2018-04-20 15:23:39');
INSERT INTO `auth_role_menu_method` VALUES ('229', 'admin', 'sysData', 'editView', '', 'auth', '001', 'admin', '管理员', '2018-04-20 15:23:39');
INSERT INTO `auth_role_menu_method` VALUES ('228', 'admin', 'sysDataType', 'ajax_save', '', 'auth', '001', 'admin', '管理员', '2018-04-20 15:23:39');
INSERT INTO `auth_role_menu_method` VALUES ('227', 'admin', 'sysDataType', 'index', '', 'auth', '001', 'admin', '管理员', '2018-04-20 15:23:39');
INSERT INTO `auth_role_menu_method` VALUES ('226', 'admin', 'sysDataType', 'addView', '', 'auth', '001', 'admin', '管理员', '2018-04-20 15:23:39');
INSERT INTO `auth_role_menu_method` VALUES ('224', 'admin', 'organization', 'editView', '', 'auth', '001', 'admin', '管理员', '2018-04-20 15:23:39');
INSERT INTO `auth_role_menu_method` VALUES ('225', 'admin', 'sysDataType', 'editView', '', 'auth', '001', 'admin', '管理员', '2018-04-20 15:23:39');
INSERT INTO `auth_role_menu_method` VALUES ('223', 'admin', 'organization', 'ajax_save', '', 'auth', '001', 'admin', '管理员', '2018-04-20 15:23:39');
INSERT INTO `auth_role_menu_method` VALUES ('222', 'admin', 'organization', 'index', '', 'auth', '001', 'admin', '管理员', '2018-04-20 15:23:39');
INSERT INTO `auth_role_menu_method` VALUES ('221', 'admin', 'organization', 'addView', '', 'auth', '001', 'admin', '管理员', '2018-04-20 15:23:39');
INSERT INTO `auth_role_menu_method` VALUES ('364', 'admin', 'roleMenuRule', 'addView', '', 'auth', '001', 'admin', '管理员', '2018-06-06 08:57:30');
INSERT INTO `auth_role_menu_method` VALUES ('323', 'admin', 'menuMethod', 'ajax_save', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:21:45');
INSERT INTO `auth_role_menu_method` VALUES ('322', 'admin', 'mehtod', 'ajax_save', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:21:45');
INSERT INTO `auth_role_menu_method` VALUES ('321', 'admin', 'mehtod', 'index', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:21:45');
INSERT INTO `auth_role_menu_method` VALUES ('320', 'admin', 'mehtod', 'addView', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:21:45');
INSERT INTO `auth_role_menu_method` VALUES ('319', 'admin', 'mehtod', 'editView', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:21:45');
INSERT INTO `auth_role_menu_method` VALUES ('318', 'admin', 'button', 'index', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:21:45');
INSERT INTO `auth_role_menu_method` VALUES ('362', 'admin', 'roleMenuOrgRule', 'index', '', 'auth', '001', 'admin', '管理员', '2018-06-06 08:57:30');
INSERT INTO `auth_role_menu_method` VALUES ('363', 'admin', 'roleMenuRule', 'index', '', 'auth', '001', 'admin', '管理员', '2018-06-06 08:57:30');
INSERT INTO `auth_role_menu_method` VALUES ('317', 'admin', 'button', 'addView', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:21:45');
INSERT INTO `auth_role_menu_method` VALUES ('220', 'admin', 'changePwd', 'ajax_save', '', 'auth', '001', 'admin', '管理员', '2018-04-20 15:23:39');
INSERT INTO `auth_role_menu_method` VALUES ('219', 'admin', 'changePwd', 'index', '', 'auth', '001', 'admin', '管理员', '2018-04-20 15:23:39');
INSERT INTO `auth_role_menu_method` VALUES ('218', 'admin', 'user', 'ajax_save', '', 'auth', '001', 'admin', '管理员', '2018-04-20 15:23:39');
INSERT INTO `auth_role_menu_method` VALUES ('217', 'admin', 'user', 'editView', '', 'auth', '001', 'admin', '管理员', '2018-04-20 15:23:39');
INSERT INTO `auth_role_menu_method` VALUES ('216', 'admin', 'user', 'addView', '', 'auth', '001', 'admin', '管理员', '2018-04-20 15:23:39');
INSERT INTO `auth_role_menu_method` VALUES ('215', 'admin', 'user', 'index', '', 'auth', '001', 'admin', '管理员', '2018-04-20 15:23:39');
INSERT INTO `auth_role_menu_method` VALUES ('316', 'admin', 'button', 'editView', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:21:45');
INSERT INTO `auth_role_menu_method` VALUES ('314', 'admin', 'menuCategory', 'index', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:21:45');
INSERT INTO `auth_role_menu_method` VALUES ('315', 'admin', 'button', 'ajax_save', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:21:45');
INSERT INTO `auth_role_menu_method` VALUES ('204', 'admin', 'token', 'ajax_save', '', 'auth', '001', 'admin', '管理员', '2018-04-18 19:38:13');
INSERT INTO `auth_role_menu_method` VALUES ('201', 'admin', 'token', 'index', '', 'auth', '001', 'admin', '管理员', '2018-04-18 19:38:13');
INSERT INTO `auth_role_menu_method` VALUES ('313', 'admin', 'menuCategory', 'addView', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:21:45');
INSERT INTO `auth_role_menu_method` VALUES ('361', 'admin', 'roleMenuOrgRule', 'ajax_save', '', 'auth', '001', 'admin', '管理员', '2018-06-06 08:57:30');
INSERT INTO `auth_role_menu_method` VALUES ('233', 'admin', 'company', 'ajax_save', '', 'auth', '001', 'admin', '管理员', '2018-04-20 15:23:39');
INSERT INTO `auth_role_menu_method` VALUES ('234', 'admin', 'company', 'editView', '', 'auth', '001', 'admin', '管理员', '2018-04-20 15:23:39');
INSERT INTO `auth_role_menu_method` VALUES ('235', 'admin', 'company', 'addView', '', 'auth', '001', 'admin', '管理员', '2018-04-20 15:23:39');
INSERT INTO `auth_role_menu_method` VALUES ('236', 'admin', 'company', 'index', '', 'auth', '001', 'admin', '管理员', '2018-04-20 15:23:39');
INSERT INTO `auth_role_menu_method` VALUES ('312', 'admin', 'menuCategory', 'editView', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:21:45');
INSERT INTO `auth_role_menu_method` VALUES ('365', 'admin', 'roleMenuRule', 'editView', '', 'auth', '001', 'admin', '管理员', '2018-06-06 08:57:30');
INSERT INTO `auth_role_menu_method` VALUES ('360', 'admin', 'roleMenuColumn', 'ajax_save', '', 'auth', '001', 'admin', '管理员', '2018-06-06 08:57:30');
INSERT INTO `auth_role_menu_method` VALUES ('359', 'admin', 'roleMenuColumn', 'index', '', 'auth', '001', 'admin', '管理员', '2018-06-06 08:57:30');
INSERT INTO `auth_role_menu_method` VALUES ('358', 'admin', 'roleMenuMethod', 'ajax_save', '', 'auth', '001', 'admin', '管理员', '2018-06-06 08:57:30');
INSERT INTO `auth_role_menu_method` VALUES ('335', 'admin', 'process', 'editView', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:22:48');
INSERT INTO `auth_role_menu_method` VALUES ('336', 'admin', 'process', 'ajax_save', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:22:48');
INSERT INTO `auth_role_menu_method` VALUES ('334', 'admin', 'process', 'addView', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:22:48');
INSERT INTO `auth_role_menu_method` VALUES ('333', 'admin', 'process', 'index', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:22:48');
INSERT INTO `auth_role_menu_method` VALUES ('311', 'admin', 'menuCategory', 'ajax_save', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:21:45');
INSERT INTO `auth_role_menu_method` VALUES ('310', 'admin', 'menu', 'del', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:21:45');
INSERT INTO `auth_role_menu_method` VALUES ('309', 'admin', 'menu', 'ajax_save', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:21:45');
INSERT INTO `auth_role_menu_method` VALUES ('308', 'admin', 'menu', 'editView', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:21:45');
INSERT INTO `auth_role_menu_method` VALUES ('307', 'admin', 'menu', 'addView', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:21:45');
INSERT INTO `auth_role_menu_method` VALUES ('306', 'admin', 'menu', 'index', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:21:45');
INSERT INTO `auth_role_menu_method` VALUES ('337', 'admin', 'flowDesign', 'index', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:22:48');
INSERT INTO `auth_role_menu_method` VALUES ('331', 'admin', 'menuColumn', 'ajax_get_menu', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:21:45');
INSERT INTO `auth_role_menu_method` VALUES ('332', 'admin', 'menuColumn', 'index', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:21:45');
INSERT INTO `auth_role_menu_method` VALUES ('338', 'admin', 'flowDesign', 'ajax_save', '', 'auth', '001', 'admin', '管理员', '2018-05-18 23:22:48');
INSERT INTO `auth_role_menu_method` VALUES ('357', 'admin', 'roleMenuMethod', 'index', '', 'auth', '001', 'admin', '管理员', '2018-06-06 08:57:30');
INSERT INTO `auth_role_menu_method` VALUES ('356', 'admin', 'roleMenuButton', 'ajax_save', '', 'auth', '001', 'admin', '管理员', '2018-06-06 08:57:30');
INSERT INTO `auth_role_menu_method` VALUES ('355', 'admin', 'roleMenuButton', 'index', '', 'auth', '001', 'admin', '管理员', '2018-06-06 08:57:30');
INSERT INTO `auth_role_menu_method` VALUES ('354', 'admin', 'menuButton', 'ajax_save', '', 'auth', '001', 'admin', '管理员', '2018-06-06 08:57:30');
INSERT INTO `auth_role_menu_method` VALUES ('353', 'admin', 'menuButton', 'index', '', 'auth', '001', 'admin', '管理员', '2018-06-06 08:57:30');
INSERT INTO `auth_role_menu_method` VALUES ('366', 'admin', 'roleMenuRule', 'ajax_save', '', 'auth', '001', 'admin', '管理员', '2018-06-06 08:57:30');

-- ----------------------------
-- Table structure for `auth_role_menu_organization_rule`
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_menu_organization_rule`;
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

-- ----------------------------
-- Records of auth_role_menu_organization_rule
-- ----------------------------
INSERT INTO `auth_role_menu_organization_rule` VALUES ('4', 'user', 'admin', '1', '', 'auth', '001', 'admin', '管理员', '2018-05-16 14:50:35');

-- ----------------------------
-- Table structure for `auth_role_menu_rule`
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_menu_rule`;
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

-- ----------------------------
-- Records of auth_role_menu_rule
-- ----------------------------
INSERT INTO `auth_role_menu_rule` VALUES ('1', 'admin', 'user', 'login_count', '登录次数', 'GT', '1', '0', 'auth', '001', 'admin', '管理员', '2018-06-06 14:49:06');
INSERT INTO `auth_role_menu_rule` VALUES ('2', 'admin', 'user', 'org_code', '部门', 'IN', '', '4', 'auth', '001', 'admin', '管理员', '2018-06-06 15:27:04');

-- ----------------------------
-- Table structure for `auth_sys_data`
-- ----------------------------
DROP TABLE IF EXISTS `auth_sys_data`;
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

-- ----------------------------
-- Records of auth_sys_data
-- ----------------------------
INSERT INTO `auth_sys_data` VALUES ('3', 'sex', 'nv', '女', '1', '', 'auth', 'admin', '管理员', '2018-05-02 18:43:34');
INSERT INTO `auth_sys_data` VALUES ('2', 'sex', 'nan', '男', '1', '男', 'auth', 'admin', '管理员', '2018-04-13 10:28:38');

-- ----------------------------
-- Table structure for `auth_sys_data_type`
-- ----------------------------
DROP TABLE IF EXISTS `auth_sys_data_type`;
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

-- ----------------------------
-- Records of auth_sys_data_type
-- ----------------------------
INSERT INTO `auth_sys_data_type` VALUES ('1', 'sex', '性别', '', '1', 'auth', '性别数据字典', 'admin', '管理员', '2018-04-13 10:28:49');

-- ----------------------------
-- Table structure for `auth_token`
-- ----------------------------
DROP TABLE IF EXISTS `auth_token`;
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

-- ----------------------------
-- Records of auth_token
-- ----------------------------
INSERT INTO `auth_token` VALUES ('1', 'bdabf85ce34681451347ff5ef9fc5f0a', 'asset', '测试5', '1', 'admin', '管理员', '2018-04-04 15:21:38');

-- ----------------------------
-- Table structure for `auth_token_status`
-- ----------------------------
DROP TABLE IF EXISTS `auth_token_status`;
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

-- ----------------------------
-- Records of auth_token_status
-- ----------------------------
INSERT INTO `auth_token_status` VALUES ('19', 'dd7bd6624bdc5d80e67412630b1e5ec0', '1522724573', 'asset.jd.com', '{\"id\":\"7\",\"code\":\"admin2\",\"name\":\"\\u5f20\\u4e09\",\"email\":\"luogui@qq.com\",\"phone\":\"\",\"sex\":\"0\",\"birthday\":null,\"org\":[],\"role\":[]}', 'asset', 'admin', '管理员', '2018-04-13 10:30:25');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
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

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('10', 'admin', '管理员', '1726023036@qq.com', '15996789030', '2018-04-04 09:26:10', '2018-04-04 09:26:15', '1', '172.0.0.1', '0', 'e10adc3949ba59abbe56e057f20f883e', '2018-04-04 09:26:38', '5', 'auth', '001', 'admin', '管理员', '2018-04-13 10:17:09');

-- ----------------------------
-- Table structure for `auth_user_organization`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_organization`;
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

-- ----------------------------
-- Records of auth_user_organization
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_role`;
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

-- ----------------------------
-- Records of auth_user_role
-- ----------------------------
INSERT INTO `auth_user_role` VALUES ('11', 'admin', 'admin', '', '', 'admin', '管理员', '2018-04-04 18:04:58');

-- ----------------------------
-- Table structure for `flow_history`
-- ----------------------------
DROP TABLE IF EXISTS `flow_history`;
CREATE TABLE `flow_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='历史信息表';

-- ----------------------------
-- Records of flow_history
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_instance`
-- ----------------------------
DROP TABLE IF EXISTS `flow_instance`;
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

-- ----------------------------
-- Records of flow_instance
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_process`
-- ----------------------------
DROP TABLE IF EXISTS `flow_process`;
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

-- ----------------------------
-- Records of flow_process
-- ----------------------------
INSERT INTO `flow_process` VALUES ('1', 'leave', '请假流程', '1', '1', '50', '{ &quot;class&quot;: &quot;go.GraphLinksModel&quot;,\n  &quot;linkFromPortIdProperty&quot;: &quot;fromPort&quot;,\n  &quot;linkToPortIdProperty&quot;: &quot;toPort&quot;,\n  &quot;nodeDataArray&quot;: [ \n{&quot;category&quot;:&quot;Start&quot;, &quot;text&quot;:&quot;开始&quot;, &quot;key&quot;:-1, &quot;loc&quot;:&quot;-255.5833282470703 -194.00000000000003&quot;},\n{&quot;text&quot;:&quot;经理审批&quot;, &quot;key&quot;:-2, &quot;loc&quot;:&quot;-256.00000000000006 -108.00000000000004&quot;},\n{&quot;text&quot;:&quot;大于1天&quot;, &quot;figure&quot;:&quot;Diamond&quot;, &quot;key&quot;:-3, &quot;loc&quot;:&quot;-254.99999999999966 -25.999999999999993&quot;},\n{&quot;text&quot;:&quot;总经理审批&quot;, &quot;key&quot;:-4, &quot;loc&quot;:&quot;-257.00000000000006 60.999999999999986&quot;},\n{&quot;category&quot;:&quot;End&quot;, &quot;text&quot;:&quot;结束&quot;, &quot;key&quot;:-5, &quot;loc&quot;:&quot;-254 211.0000000000003&quot;},\n{&quot;text&quot;:&quot;步骤&quot;, &quot;key&quot;:-6, &quot;loc&quot;:&quot;-256.3333282470705 144.00000000000014&quot;}\n ],\n  &quot;linkDataArray&quot;: [ \n{&quot;from&quot;:-1, &quot;to&quot;:-2, &quot;fromPort&quot;:&quot;B&quot;, &quot;toPort&quot;:&quot;T&quot;, &quot;points&quot;:[-255.5833282470703,-172.18217008058414,-255.5833282470703,-162.18217008058414,-255.5833282470703,-147.06608504029208,-256.00000000000006,-147.06608504029208,-256.00000000000006,-131.95000000000005,-256.00000000000006,-121.95000000000005]},\n{&quot;from&quot;:-2, &quot;to&quot;:-3, &quot;fromPort&quot;:&quot;B&quot;, &quot;toPort&quot;:&quot;T&quot;, &quot;points&quot;:[-256.00000000000006,-94.05000000000004,-256.00000000000006,-84.05000000000004,-256.00000000000006,-73.72500000000002,-254.99999999999994,-73.72500000000002,-254.99999999999994,-63.39999999999999,-254.99999999999994,-53.39999999999999]},\n{&quot;from&quot;:-3, &quot;to&quot;:-4, &quot;fromPort&quot;:&quot;B&quot;, &quot;toPort&quot;:&quot;T&quot;, &quot;visible&quot;:true, &quot;points&quot;:[-254.99999999999994,1.4000000000000128,-254.99999999999994,11.400000000000013,-254.99999999999994,24.224999999999998,-257.00000000000006,24.224999999999998,-257.00000000000006,37.04999999999998,-257.00000000000006,47.04999999999998], &quot;text&quot;:&quot;是&quot;},\n{&quot;from&quot;:-3, &quot;to&quot;:-5, &quot;fromPort&quot;:&quot;R&quot;, &quot;toPort&quot;:&quot;R&quot;, &quot;visible&quot;:true, &quot;points&quot;:[-192.49999999999966,-25.99999999999999,-182.49999999999966,-25.99999999999999,-182.49999999999966,211.00000000000028,-202.34108504029183,211.00000000000028,-222.182170080584,211.00000000000028,-232.182170080584,211.00000000000028], &quot;text&quot;:&quot;否&quot;},\n{&quot;from&quot;:-4, &quot;to&quot;:-6, &quot;fromPort&quot;:&quot;B&quot;, &quot;toPort&quot;:&quot;T&quot;, &quot;points&quot;:[-257.00000000000006,74.95000000000003,-257.00000000000006,84.95000000000003,-257.00000000000006,102.50000000000003,-256.3333282470703,102.50000000000003,-256.3333282470703,120.05000000000001,-256.3333282470703,130.05]},\n{&quot;from&quot;:-6, &quot;to&quot;:-5, &quot;fromPort&quot;:&quot;B&quot;, &quot;toPort&quot;:&quot;T&quot;, &quot;points&quot;:[-256.3333282470705,157.95000000000016,-256.3333282470705,167.95000000000016,-256.3333282470705,173.5660850402923,-253.9999999999999,173.5660850402923,-253.9999999999999,179.18217008058443,-253.9999999999999,189.18217008058443]}\n ]}', 'test', '1', '', '', 'auth', '001', 'admin', '管理员', '2018-05-29 08:57:10');

-- ----------------------------
-- Table structure for `flow_step`
-- ----------------------------
DROP TABLE IF EXISTS `flow_step`;
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

-- ----------------------------
-- Records of flow_step
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_step_condition`
-- ----------------------------
DROP TABLE IF EXISTS `flow_step_condition`;
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

-- ----------------------------
-- Records of flow_step_condition
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_step_detail`
-- ----------------------------
DROP TABLE IF EXISTS `flow_step_detail`;
CREATE TABLE `flow_step_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process_code` varchar(50) NOT NULL DEFAULT '' COMMENT '流程编号',
  `set_code` varchar(50) NOT NULL DEFAULT '' COMMENT '步骤编号',
  `user_code` varchar(50) NOT NULL DEFAULT '' COMMENT '用户编号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='步骤详情';

-- ----------------------------
-- Records of flow_step_detail
-- ----------------------------
