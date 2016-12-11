-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: calendar
-- ------------------------------------------------------
-- Server version	5.6.26-enterprise-commercial-advanced-log

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `gender` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` char(15) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `block` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'admin','123',1,'Admin','admin@gmail.com','0123456789',NULL,1,1,2),(2,'thanhan','123',0,'Thanh An Nguyen','kieuquanh94@gmail.com','01657768971',NULL,0,0,0),(3,'khoadang','123',0,'tran dang khoa','tdangkhoa.itute@gmail.com','0962228269',NULL,0,0,0),(4,'tranthien','123',0,'Tran Thien','tranquocthien.spkt@gmail.com','01658890216',NULL,0,0,0),(5,'tanhien','123',0,'Tan hien','ozilboyshort@gmail.com','01697977737',NULL,0,0,0);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `allDay` int(11) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `description` text,
  `id_acc` int(11) NOT NULL,
  `notify` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `background_color` varchar(45) DEFAULT NULL,
  `dow` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (11,'Tap Gym','2016-12-26 17:00:00','2016-12-26 23:10:00',0,'detail-event.jsp?id=','Tap Gym tai Nguyen Kiem',2,1,'Vo Van Ngan, Thu Duc','#01579B',''),(13,'Hop Nhom','2016-12-10 16:04:00','2016-12-10 17:50:00',1,'detail-event.jsp?id=','Hop nhom lam bai tap lap trinh web',2,1,'Quan Coc, Han Thuyen','#D50000',''),(14,'Lam Do An TLCN','2016-12-10 16:08:00','2016-12-10 23:50:00',1,'detail-event.jsp?id=','Tai Nha',2,1,'My Home','#D50000',''),(15,'Di Quan 10','2016-12-10 16:32:00','2016-12-10 22:50:00',1,'detail-event.jsp?id=','Thay Pin Laptop',2,1,'Ly Thuong Kiet, Quan 10.','#D50000',''),(16,'Mua Ve Xe','2016-12-10 16:34:00','2016-12-10 23:50:00',1,'detail-event.jsp?id=','Mua ve xe ve que tet am lich',2,1,'Ben Xe Mien Dong','#01579B',''),(17,'Lam Tieu Luan','2016-12-10 16:36:00','2016-12-10 17:55:00',1,'detail-event.jsp?id=','Lam Tieu Luan Chuyen Nganh',2,1,'Quan Coc','#01579B',''),(18,'Lam Bai Tap Nhom','2016-12-10 00:00:00','2016-12-18 00:00:00',1,'detail-event.jsp?id=','Lam bai tap nhom mon CNPM sang thu 2',2,1,'Quan Coc','#00C853',''),(19,'Test project Web Quan Ly Lich','2016-12-29 00:00:00','2016-12-31 00:00:00',1,'detail-event.jsp?id=','Kiem tra lan cuoi website quan ly lich',2,1,'Quan Coc','#D50000',''),(20,'Deploy len Hosting','2016-12-10 18:48:00','2016-12-10 18:48:00',0,'detail-event.jsp?id=','Trien khai website len hosting',2,1,'Quan Coc','#00C853','');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-11 16:27:17
