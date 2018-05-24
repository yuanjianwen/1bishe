/*
Navicat MySQL Data Transfer

Source Server         : localhost_3323
Source Server Version : 50162
Source Host           : localhost:3323
Source Database       : db_wpes

Target Server Type    : MYSQL
Target Server Version : 50162
File Encoding         : 65001

Date: 2016-03-04 12:12:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `userId` int(11) NOT NULL,
  `userName` longtext,
  `userPw` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'a', 'a');

-- ----------------------------
-- Table structure for `t_catelog`
-- ----------------------------
DROP TABLE IF EXISTS `t_catelog`;
CREATE TABLE `t_catelog` (
  `catelog_id` int(11) NOT NULL,
  `catelog_name` varchar(50) DEFAULT NULL,
  `catelog_del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`catelog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_catelog
-- ----------------------------
INSERT INTO `t_catelog` VALUES ('1', '书籍图书', 'no');
INSERT INTO `t_catelog` VALUES ('2', '电子数码', 'no');
INSERT INTO `t_catelog` VALUES ('3', '交通工具', 'no');
INSERT INTO `t_catelog` VALUES ('4', '旅行物品', 'no');
INSERT INTO `t_catelog` VALUES ('5', '其他类别', 'no');

-- ----------------------------
-- Table structure for `t_goods`
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `goods_id` int(11) NOT NULL,
  `maijia_id` int(11) DEFAULT NULL,
  `goods_name` varchar(200) DEFAULT NULL,
  `goods_miaoshu` varchar(2000) DEFAULT NULL,
  `goods_pic` varchar(50) DEFAULT NULL,
  `goods_shichangjia` int(11) DEFAULT NULL,
  `goods_tejia` int(11) DEFAULT NULL,
  `goods_isnottejia` varchar(50) DEFAULT NULL,
  `goods_catelog_id` int(11) DEFAULT NULL,
  `shifoumaichu` varchar(255) DEFAULT NULL,
  `goods_Del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('3', '1', '红米3 全网通4G手机', '红米3 全网通4G手机,9成新', '/upload/1457063116341.jpg', '100', '100', 'no', '2', '否', 'no');
INSERT INTO `t_goods` VALUES ('4', '1', 'vivo X6D 金色4G', '<div id=\"detail_sku_main\" class=\"mod_detailInfo_proName\">\r\n<h1 id=\"productMainName\" class=\"mh\" title=\"vivo X6D 金色 32G 移动联通4G手机 双卡双待\">vivo X6D 金色 32G 移动联通4G手机 双卡双待</h1>\r\n<p class=\"subhead\"><span id=\"productSubName\" class=\"sh\" title=\"4GB 大运存，急速指纹，双引擎闪充，金属一体成型机身！\" jquery11130783319733652779=\"300\" style=\"display: inline\">4GB 大运存，急速指纹，双引擎闪充，金属一体成型机身！ <br />\r\n<br />\r\n8成新</span></p>\r\n</div>', '/upload/1457063166379.jpg', '100', '100', 'no', '2', '否', 'no');
INSERT INTO `t_goods` VALUES ('5', '1', 'SONY/索尼RX100M2 ', '<h1 id=\"productMainName\" class=\"mh\" title=\"SONY/索尼 DSC-RX100II 黑卡机皇 RX100M2 数码照相机 索尼RX100M2 RX100升级版黑色官方标配\">SONY/索尼 DSC-RX100II 黑卡机皇 RX100M2 数码照相机 索尼RX100M2 RX100升级版黑色官方标配</h1>\r\n8成新<br />', '/upload/1457063217654.jpg', '150', '150', 'no', '2', '否', 'no');
INSERT INTO `t_goods` VALUES ('6', '1', 'Java语言程序设计', 'Java语言程序设计（基础篇）（原书第10版）<br />\r\n8成新', '/upload/1457063271532.jpg', '6', '6', 'no', '1', '否', 'no');
INSERT INTO `t_goods` VALUES ('7', '1', 'Java入门123', 'Java入门123&mdash;&mdash;一个老鸟的Java学习心得（二维码版）<br />\r\n全新', '/upload/1457063318448.jpg', '10', '10', 'no', '1', '否', 'no');
INSERT INTO `t_goods` VALUES ('8', '1', 'Marmot 土拨鼠山地车', '<div id=\"detail_sku_main\" class=\"mod_detailInfo_proName\">\r\n<h1 id=\"productMainName\" class=\"mh\" title=\"Marmot 土拨鼠山地车自行车男女款禧玛诺变速27速油碟超轻铝合金山地自行车白灰红.S-M-L\">Marmot 土拨鼠山地车自行车男女款禧玛诺变速27速油碟超轻铝合金山地自行车白灰红.S-M-L</h1>\r\n<p class=\"subhead\">&nbsp;</p>\r\n</div>', '/upload/1457063370275.jpg', '100', '100', 'no', '3', '否', 'no');

-- ----------------------------
-- Table structure for `t_maijia`
-- ----------------------------
DROP TABLE IF EXISTS `t_maijia`;
CREATE TABLE `t_maijia` (
  `id` int(11) NOT NULL DEFAULT '0',
  `loginname` varchar(255) DEFAULT NULL,
  `loginpw` varchar(255) DEFAULT NULL,
  `xingming` varchar(500) DEFAULT NULL,
  `xingbie` varchar(500) DEFAULT NULL,
  `dianhua` varchar(255) DEFAULT NULL,
  `zhuzhi` varchar(255) DEFAULT NULL,
  `tai` varchar(255) DEFAULT NULL,
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_maijia
-- ----------------------------
INSERT INTO `t_maijia` VALUES ('1', 'zhaosi', '000000', '赵四', '男', '13666666666', '一号公寓1101', '已审核', 'no');

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `order_id` int(11) NOT NULL,
  `order_bianhao` varchar(200) DEFAULT NULL,
  `order_date` varchar(50) DEFAULT NULL,
  `order_songhuodizhi` varchar(50) DEFAULT NULL,
  `order_fukuangfangshi` varchar(50) DEFAULT NULL,
  `order_jine` int(11) DEFAULT NULL,
  `order_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for `t_orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `t_orderitem`;
CREATE TABLE `t_orderitem` (
  `orderItem_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_quantity` int(11) DEFAULT NULL,
  `zt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`orderItem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderitem
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `user_pw` varchar(50) DEFAULT NULL,
  `user_realname` varchar(50) DEFAULT NULL,
  `user_address` varchar(50) DEFAULT NULL,
  `user_tel` varchar(50) DEFAULT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'liusan', '000000', '刘三', '一号公寓1102', '13444444444', 'liusan@163.com', 'no');
INSERT INTO `t_user` VALUES ('2', 'liqian', '000000', '李强', '一号公寓1104', '13333333333', 'liqian@163.com', 'no');
