-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bookshop
-- ------------------------------------------------------
-- Server version	5.5.53

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '发货地址',
  `phone` varchar(50) NOT NULL DEFAULT '' COMMENT '手机号',
  `zip` varchar(50) NOT NULL DEFAULT '' COMMENT '邮编',
  `isdefault` char(1) DEFAULT '0' COMMENT '是否默认',
  `userid` int(10) NOT NULL COMMENT '用户id 外键',
  `add_time` varchar(19) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `addr_fk1` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='发货地址表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `description` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bookcode` varchar(32) NOT NULL COMMENT '图书编号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '图书名称',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'BigDecimal',
  `auth` varchar(30) NOT NULL DEFAULT '' COMMENT '图书作者',
  `img` varchar(100) NOT NULL DEFAULT '' COMMENT '图片地址',
  `rebate` decimal(3,2) NOT NULL DEFAULT '0.00' COMMENT '商品返利',
  `stock` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `publisher` varchar(100) NOT NULL DEFAULT '' COMMENT '出版社',
  `publishdata` varchar(19) NOT NULL DEFAULT '' COMMENT '出版日期',
  `pages` int(10) unsigned DEFAULT '0' COMMENT '总页数',
  `size` int(10) unsigned DEFAULT '0' COMMENT '开本(16开)',
  `printtimes` int(10) unsigned DEFAULT '0' COMMENT '印刷次数)',
  `versions` int(10) unsigned DEFAULT '0' COMMENT '版本',
  `brief` text COMMENT '简介',
  `content` text COMMENT '目录',
  `onlinetime` varchar(19) DEFAULT NULL COMMENT '上线时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图书信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booktype`
--

DROP TABLE IF EXISTS `booktype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booktype` (
  `bookid` int(10) unsigned NOT NULL COMMENT '图书编号 外键',
  `typeid` int(10) unsigned NOT NULL COMMENT '图书编号 外键',
  PRIMARY KEY (`bookid`,`typeid`),
  KEY `btfk2` (`typeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图书-分类关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booktype`
--

LOCK TABLES `booktype` WRITE;
/*!40000 ALTER TABLE `booktype` DISABLE KEYS */;
/*!40000 ALTER TABLE `booktype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderid` int(10) NOT NULL DEFAULT '0' COMMENT '订单id 外键',
  `bookid` int(10) NOT NULL DEFAULT '0' COMMENT '图书id 外键',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总金额',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '购买时价格',
  PRIMARY KEY (`id`),
  KEY `order_detail_fk` (`orderid`),
  KEY `order_detail_fk2` (`bookid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL COMMENT '用户id 外键',
  `consignee` varchar(300) NOT NULL DEFAULT '' COMMENT '收货人',
  `pay_type` char(1) DEFAULT '0' COMMENT '付款方式',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总金额',
  `state` char(1) NOT NULL DEFAULT '0' COMMENT '订单状态(0:等待发货 1:已发货 2:交易完成 3:交易取消 4:商户已退货)',
  `order_date` varchar(19) DEFAULT NULL COMMENT '下单时间',
  PRIMARY KEY (`id`),
  KEY `orders_fk` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `description` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='图书分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,'文史',NULL),(2,'人文',NULL),(3,'科学',NULL);
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `phone` varchar(50) NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='前台用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2018-03-04 17:34:07
