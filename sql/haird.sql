/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50629
Source Host           : localhost:3306
Source Database       : haird

Target Server Type    : MYSQL
Target Server Version : 50629
File Encoding         : 65001

Date: 2019-05-19 15:30:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for custom
-- ----------------------------
DROP TABLE IF EXISTS `custom`;
CREATE TABLE `custom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customname` varchar(255) NOT NULL,
  `commission1` varchar(255) NOT NULL COMMENT '会员提成',
  `commission2` varchar(255) NOT NULL COMMENT '非会员提成',
  `wage` varchar(255) NOT NULL COMMENT '工资',
  `customtype` varchar(255) NOT NULL COMMENT '人员类型0(店长)1（发型师）2（助理）',
  `flag` int(11) NOT NULL DEFAULT '1' COMMENT '是有有效',
  PRIMARY KEY (`id`),
  KEY `pk_custom_customtype` (`customtype`),
  KEY `pk_custom_flag` (`flag`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for funds
-- ----------------------------
DROP TABLE IF EXISTS `funds`;
CREATE TABLE `funds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `des` varchar(255) NOT NULL COMMENT '描述',
  `paytype` int(11) NOT NULL COMMENT '支付方式',
  `consumetype` int(11) NOT NULL COMMENT '消费类型：0（充值），1（消费）',
  `amout` varchar(255) NOT NULL,
  `consdate` datetime NOT NULL,
  `recordid` int(11) DEFAULT NULL COMMENT '消费记录ID',
  PRIMARY KEY (`id`),
  KEY `px_funds_paytype` (`paytype`),
  KEY `px_funds_consumetype` (`consumetype`),
  KEY `pk_funds_recordid` (`recordid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `sex` int(11) NOT NULL,
  `customType` int(11) NOT NULL COMMENT '客户类型（新顾客；老顾客）',
  `referrer` varchar(255) DEFAULT NULL COMMENT '推荐人',
  `amout` varchar(255) NOT NULL,
  `signtime` datetime NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10052 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for paylog
-- ----------------------------
DROP TABLE IF EXISTS `paylog`;
CREATE TABLE `paylog` (
  `memberid` int(11) NOT NULL,
  `amout` varchar(255) NOT NULL,
  `paytype` varchar(255) NOT NULL COMMENT '现金（0），微信（1），支付宝（2），消费（-1）',
  `handlerman` int(11) DEFAULT NULL COMMENT '处理人',
  `paytime` datetime NOT NULL COMMENT '支付时间',
  `description` varchar(255) DEFAULT NULL,
  `balance` varchar(255) NOT NULL COMMENT '余额',
  `recordid` int(11) DEFAULT NULL COMMENT '消费id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contype` varchar(255) NOT NULL,
  `discount` varchar(255) NOT NULL,
  `memberid` int(11) DEFAULT NULL COMMENT '会员卡号',
  `paytype` varchar(255) NOT NULL,
  `hairstye` varchar(255) NOT NULL COMMENT '发型师',
  `assistant` varchar(255) NOT NULL,
  `haircommi` varchar(255) NOT NULL COMMENT '发型师提成',
  `assicommi` varchar(255) NOT NULL COMMENT '助理提成',
  `amout` varchar(255) NOT NULL COMMENT '消费金额',
  `contime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `memberid` int(11) NOT NULL COMMENT '会员卡号',
  `amout` varchar(255) NOT NULL COMMENT '推荐金额',
  `description` varchar(255) NOT NULL COMMENT '推荐信息',
  `time` datetime NOT NULL COMMENT '推荐时间',
  PRIMARY KEY (`memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for wage
-- ----------------------------
DROP TABLE IF EXISTS `wage`;
CREATE TABLE `wage` (
  `id` int(11) NOT NULL COMMENT '充值或消费id',
  `amout` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL COMMENT '工资描述',
  `time` datetime NOT NULL,
  `recordid` int(11) DEFAULT NULL COMMENT '消费记录ID',
  `wagetype` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
