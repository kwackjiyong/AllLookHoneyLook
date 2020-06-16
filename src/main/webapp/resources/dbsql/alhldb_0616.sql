CREATE DATABASE  IF NOT EXISTS `alhl` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `alhl`;
-- MariaDB dump 10.17  Distrib 10.4.8-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: alhl
-- ------------------------------------------------------
-- Server version	10.4.8-MariaDB

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
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `postId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `contents` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `viewcnt` int(11) DEFAULT NULL,
  `serviceId` int(11) DEFAULT NULL,
  `creatTime` datetime DEFAULT NULL,
  PRIMARY KEY (`postId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `queId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `queTitle` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `queContents` mediumtext COLLATE utf8_bin DEFAULT NULL,
  `queTime` datetime DEFAULT NULL,
  `queAnswer` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`queId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='문의내역 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchlog`
--

DROP TABLE IF EXISTS `searchlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchlog` (
  `srchId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `srchWord` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `srchTime` datetime DEFAULT NULL,
  PRIMARY KEY (`srchId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `serviceid`
--

DROP TABLE IF EXISTS `serviceid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serviceid` (
  `sId` int(11) DEFAULT NULL,
  `sContents` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop` (
  `shopId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `productNum` int(11) DEFAULT NULL,
  `checkOutTime` datetime DEFAULT NULL,
  PRIMARY KEY (`shopId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userdata`
--

DROP TABLE IF EXISTS `userdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userdata` (
  `userId` varchar(12) COLLATE utf8_bin NOT NULL,
  `userName` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `userPassword` mediumtext COLLATE utf8_bin DEFAULT NULL,
  `userBirth` date DEFAULT NULL,
  `creatTime` datetime DEFAULT NULL,
  `userGender` tinyint(2) DEFAULT NULL,
  `userEmail` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `userEmailHash` mediumtext COLLATE utf8_bin DEFAULT NULL,
  `userEmailCertified` tinyint(2) DEFAULT NULL,
  `userAuthority` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-16 19:56:23
