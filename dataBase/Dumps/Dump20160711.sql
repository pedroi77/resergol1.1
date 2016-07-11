-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: resergol
-- ------------------------------------------------------
-- Server version	5.6.26

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
-- Table structure for table `administradores`
--

DROP TABLE IF EXISTS `administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administradores` (
  `Usuario` varchar(25) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Contrasenia` blob NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Usuario` (`Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
INSERT INTO `administradores` VALUES ('ADMIN',1,'454545');
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendario`
--

DROP TABLE IF EXISTS `calendario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendario` (
  `fecha` datetime NOT NULL,
  `idDia` int(11) NOT NULL,
  PRIMARY KEY (`fecha`),
  KEY `idx_dias` (`idDia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendario`
--

LOCK TABLES `calendario` WRITE;
/*!40000 ALTER TABLE `calendario` DISABLE KEYS */;
INSERT INTO `calendario` VALUES ('2016-06-06 00:00:00',1),('2016-06-13 00:00:00',1),('2016-06-20 00:00:00',1),('2016-06-27 00:00:00',1),('2016-07-04 00:00:00',1),('2016-07-11 00:00:00',1),('2016-07-18 00:00:00',1),('2016-07-25 00:00:00',1),('2016-08-01 00:00:00',1),('2016-08-08 00:00:00',1),('2016-08-15 00:00:00',1),('2016-08-22 00:00:00',1),('2016-08-29 00:00:00',1),('2016-09-05 00:00:00',1),('2016-09-12 00:00:00',1),('2016-09-19 00:00:00',1),('2016-09-26 00:00:00',1),('2016-10-03 00:00:00',1),('2016-10-10 00:00:00',1),('2016-10-17 00:00:00',1),('2016-10-24 00:00:00',1),('2016-10-31 00:00:00',1),('2016-11-07 00:00:00',1),('2016-11-14 00:00:00',1),('2016-11-21 00:00:00',1),('2016-11-28 00:00:00',1),('2016-12-05 00:00:00',1),('2016-12-12 00:00:00',1),('2016-12-19 00:00:00',1),('2016-12-26 00:00:00',1),('2017-01-02 00:00:00',1),('2017-01-09 00:00:00',1),('2017-01-16 00:00:00',1),('2017-01-23 00:00:00',1),('2017-01-30 00:00:00',1),('2017-02-06 00:00:00',1),('2017-02-13 00:00:00',1),('2017-02-20 00:00:00',1),('2017-02-27 00:00:00',1),('2017-03-06 00:00:00',1),('2017-03-13 00:00:00',1),('2017-03-20 00:00:00',1),('2017-03-27 00:00:00',1),('2017-04-03 00:00:00',1),('2017-04-10 00:00:00',1),('2017-04-17 00:00:00',1),('2017-04-24 00:00:00',1),('2017-05-01 00:00:00',1),('2017-05-08 00:00:00',1),('2017-05-15 00:00:00',1),('2017-05-22 00:00:00',1),('2017-05-29 00:00:00',1),('2017-06-05 00:00:00',1),('2017-06-12 00:00:00',1),('2017-06-19 00:00:00',1),('2017-06-26 00:00:00',1),('2017-07-03 00:00:00',1),('2017-07-10 00:00:00',1),('2017-07-17 00:00:00',1),('2017-07-24 00:00:00',1),('2017-07-31 00:00:00',1),('2017-08-07 00:00:00',1),('2017-08-14 00:00:00',1),('2017-08-21 00:00:00',1),('2017-08-28 00:00:00',1),('2017-09-04 00:00:00',1),('2017-09-11 00:00:00',1),('2017-09-18 00:00:00',1),('2017-09-25 00:00:00',1),('2017-10-02 00:00:00',1),('2017-10-09 00:00:00',1),('2017-10-16 00:00:00',1),('2017-10-23 00:00:00',1),('2017-10-30 00:00:00',1),('2017-11-06 00:00:00',1),('2017-11-13 00:00:00',1),('2017-11-20 00:00:00',1),('2017-11-27 00:00:00',1),('2017-12-04 00:00:00',1),('2017-12-11 00:00:00',1),('2017-12-18 00:00:00',1),('2017-12-25 00:00:00',1),('2018-01-01 00:00:00',1),('2016-06-07 00:00:00',2),('2016-06-14 00:00:00',2),('2016-06-21 00:00:00',2),('2016-06-28 00:00:00',2),('2016-07-05 00:00:00',2),('2016-07-12 00:00:00',2),('2016-07-19 00:00:00',2),('2016-07-26 00:00:00',2),('2016-08-02 00:00:00',2),('2016-08-09 00:00:00',2),('2016-08-16 00:00:00',2),('2016-08-23 00:00:00',2),('2016-08-30 00:00:00',2),('2016-09-06 00:00:00',2),('2016-09-13 00:00:00',2),('2016-09-20 00:00:00',2),('2016-09-27 00:00:00',2),('2016-10-04 00:00:00',2),('2016-10-11 00:00:00',2),('2016-10-18 00:00:00',2),('2016-10-25 00:00:00',2),('2016-11-01 00:00:00',2),('2016-11-08 00:00:00',2),('2016-11-15 00:00:00',2),('2016-11-22 00:00:00',2),('2016-11-29 00:00:00',2),('2016-12-06 00:00:00',2),('2016-12-13 00:00:00',2),('2016-12-20 00:00:00',2),('2016-12-27 00:00:00',2),('2017-01-03 00:00:00',2),('2017-01-10 00:00:00',2),('2017-01-17 00:00:00',2),('2017-01-24 00:00:00',2),('2017-01-31 00:00:00',2),('2017-02-07 00:00:00',2),('2017-02-14 00:00:00',2),('2017-02-21 00:00:00',2),('2017-02-28 00:00:00',2),('2017-03-07 00:00:00',2),('2017-03-14 00:00:00',2),('2017-03-21 00:00:00',2),('2017-03-28 00:00:00',2),('2017-04-04 00:00:00',2),('2017-04-11 00:00:00',2),('2017-04-18 00:00:00',2),('2017-04-25 00:00:00',2),('2017-05-02 00:00:00',2),('2017-05-09 00:00:00',2),('2017-05-16 00:00:00',2),('2017-05-23 00:00:00',2),('2017-05-30 00:00:00',2),('2017-06-06 00:00:00',2),('2017-06-13 00:00:00',2),('2017-06-20 00:00:00',2),('2017-06-27 00:00:00',2),('2017-07-04 00:00:00',2),('2017-07-11 00:00:00',2),('2017-07-18 00:00:00',2),('2017-07-25 00:00:00',2),('2017-08-01 00:00:00',2),('2017-08-08 00:00:00',2),('2017-08-15 00:00:00',2),('2017-08-22 00:00:00',2),('2017-08-29 00:00:00',2),('2017-09-05 00:00:00',2),('2017-09-12 00:00:00',2),('2017-09-19 00:00:00',2),('2017-09-26 00:00:00',2),('2017-10-03 00:00:00',2),('2017-10-10 00:00:00',2),('2017-10-17 00:00:00',2),('2017-10-24 00:00:00',2),('2017-10-31 00:00:00',2),('2017-11-07 00:00:00',2),('2017-11-14 00:00:00',2),('2017-11-21 00:00:00',2),('2017-11-28 00:00:00',2),('2017-12-05 00:00:00',2),('2017-12-12 00:00:00',2),('2017-12-19 00:00:00',2),('2017-12-26 00:00:00',2),('2016-06-01 00:00:00',3),('2016-06-08 00:00:00',3),('2016-06-15 00:00:00',3),('2016-06-22 00:00:00',3),('2016-06-29 00:00:00',3),('2016-07-06 00:00:00',3),('2016-07-13 00:00:00',3),('2016-07-20 00:00:00',3),('2016-07-27 00:00:00',3),('2016-08-03 00:00:00',3),('2016-08-10 00:00:00',3),('2016-08-17 00:00:00',3),('2016-08-24 00:00:00',3),('2016-08-31 00:00:00',3),('2016-09-07 00:00:00',3),('2016-09-14 00:00:00',3),('2016-09-21 00:00:00',3),('2016-09-28 00:00:00',3),('2016-10-05 00:00:00',3),('2016-10-12 00:00:00',3),('2016-10-19 00:00:00',3),('2016-10-26 00:00:00',3),('2016-11-02 00:00:00',3),('2016-11-09 00:00:00',3),('2016-11-16 00:00:00',3),('2016-11-23 00:00:00',3),('2016-11-30 00:00:00',3),('2016-12-07 00:00:00',3),('2016-12-14 00:00:00',3),('2016-12-21 00:00:00',3),('2016-12-28 00:00:00',3),('2017-01-04 00:00:00',3),('2017-01-11 00:00:00',3),('2017-01-18 00:00:00',3),('2017-01-25 00:00:00',3),('2017-02-01 00:00:00',3),('2017-02-08 00:00:00',3),('2017-02-15 00:00:00',3),('2017-02-22 00:00:00',3),('2017-03-01 00:00:00',3),('2017-03-08 00:00:00',3),('2017-03-15 00:00:00',3),('2017-03-22 00:00:00',3),('2017-03-29 00:00:00',3),('2017-04-05 00:00:00',3),('2017-04-12 00:00:00',3),('2017-04-19 00:00:00',3),('2017-04-26 00:00:00',3),('2017-05-03 00:00:00',3),('2017-05-10 00:00:00',3),('2017-05-17 00:00:00',3),('2017-05-24 00:00:00',3),('2017-05-31 00:00:00',3),('2017-06-07 00:00:00',3),('2017-06-14 00:00:00',3),('2017-06-21 00:00:00',3),('2017-06-28 00:00:00',3),('2017-07-05 00:00:00',3),('2017-07-12 00:00:00',3),('2017-07-19 00:00:00',3),('2017-07-26 00:00:00',3),('2017-08-02 00:00:00',3),('2017-08-09 00:00:00',3),('2017-08-16 00:00:00',3),('2017-08-23 00:00:00',3),('2017-08-30 00:00:00',3),('2017-09-06 00:00:00',3),('2017-09-13 00:00:00',3),('2017-09-20 00:00:00',3),('2017-09-27 00:00:00',3),('2017-10-04 00:00:00',3),('2017-10-11 00:00:00',3),('2017-10-18 00:00:00',3),('2017-10-25 00:00:00',3),('2017-11-01 00:00:00',3),('2017-11-08 00:00:00',3),('2017-11-15 00:00:00',3),('2017-11-22 00:00:00',3),('2017-11-29 00:00:00',3),('2017-12-06 00:00:00',3),('2017-12-13 00:00:00',3),('2017-12-20 00:00:00',3),('2017-12-27 00:00:00',3),('2016-06-02 00:00:00',4),('2016-06-09 00:00:00',4),('2016-06-16 00:00:00',4),('2016-06-23 00:00:00',4),('2016-06-30 00:00:00',4),('2016-07-07 00:00:00',4),('2016-07-14 00:00:00',4),('2016-07-21 00:00:00',4),('2016-07-28 00:00:00',4),('2016-08-04 00:00:00',4),('2016-08-11 00:00:00',4),('2016-08-18 00:00:00',4),('2016-08-25 00:00:00',4),('2016-09-01 00:00:00',4),('2016-09-08 00:00:00',4),('2016-09-15 00:00:00',4),('2016-09-22 00:00:00',4),('2016-09-29 00:00:00',4),('2016-10-06 00:00:00',4),('2016-10-13 00:00:00',4),('2016-10-20 00:00:00',4),('2016-10-27 00:00:00',4),('2016-11-03 00:00:00',4),('2016-11-10 00:00:00',4),('2016-11-17 00:00:00',4),('2016-11-24 00:00:00',4),('2016-12-01 00:00:00',4),('2016-12-08 00:00:00',4),('2016-12-15 00:00:00',4),('2016-12-22 00:00:00',4),('2016-12-29 00:00:00',4),('2017-01-05 00:00:00',4),('2017-01-12 00:00:00',4),('2017-01-19 00:00:00',4),('2017-01-26 00:00:00',4),('2017-02-02 00:00:00',4),('2017-02-09 00:00:00',4),('2017-02-16 00:00:00',4),('2017-02-23 00:00:00',4),('2017-03-02 00:00:00',4),('2017-03-09 00:00:00',4),('2017-03-16 00:00:00',4),('2017-03-23 00:00:00',4),('2017-03-30 00:00:00',4),('2017-04-06 00:00:00',4),('2017-04-13 00:00:00',4),('2017-04-20 00:00:00',4),('2017-04-27 00:00:00',4),('2017-05-04 00:00:00',4),('2017-05-11 00:00:00',4),('2017-05-18 00:00:00',4),('2017-05-25 00:00:00',4),('2017-06-01 00:00:00',4),('2017-06-08 00:00:00',4),('2017-06-15 00:00:00',4),('2017-06-22 00:00:00',4),('2017-06-29 00:00:00',4),('2017-07-06 00:00:00',4),('2017-07-13 00:00:00',4),('2017-07-20 00:00:00',4),('2017-07-27 00:00:00',4),('2017-08-03 00:00:00',4),('2017-08-10 00:00:00',4),('2017-08-17 00:00:00',4),('2017-08-24 00:00:00',4),('2017-08-31 00:00:00',4),('2017-09-07 00:00:00',4),('2017-09-14 00:00:00',4),('2017-09-21 00:00:00',4),('2017-09-28 00:00:00',4),('2017-10-05 00:00:00',4),('2017-10-12 00:00:00',4),('2017-10-19 00:00:00',4),('2017-10-26 00:00:00',4),('2017-11-02 00:00:00',4),('2017-11-09 00:00:00',4),('2017-11-16 00:00:00',4),('2017-11-23 00:00:00',4),('2017-11-30 00:00:00',4),('2017-12-07 00:00:00',4),('2017-12-14 00:00:00',4),('2017-12-21 00:00:00',4),('2017-12-28 00:00:00',4),('2016-06-03 00:00:00',5),('2016-06-10 00:00:00',5),('2016-06-17 00:00:00',5),('2016-06-24 00:00:00',5),('2016-07-01 00:00:00',5),('2016-07-08 00:00:00',5),('2016-07-15 00:00:00',5),('2016-07-22 00:00:00',5),('2016-07-29 00:00:00',5),('2016-08-05 00:00:00',5),('2016-08-12 00:00:00',5),('2016-08-19 00:00:00',5),('2016-08-26 00:00:00',5),('2016-09-02 00:00:00',5),('2016-09-09 00:00:00',5),('2016-09-16 00:00:00',5),('2016-09-23 00:00:00',5),('2016-09-30 00:00:00',5),('2016-10-07 00:00:00',5),('2016-10-14 00:00:00',5),('2016-10-21 00:00:00',5),('2016-10-28 00:00:00',5),('2016-11-04 00:00:00',5),('2016-11-11 00:00:00',5),('2016-11-18 00:00:00',5),('2016-11-25 00:00:00',5),('2016-12-02 00:00:00',5),('2016-12-09 00:00:00',5),('2016-12-16 00:00:00',5),('2016-12-23 00:00:00',5),('2016-12-30 00:00:00',5),('2017-01-06 00:00:00',5),('2017-01-13 00:00:00',5),('2017-01-20 00:00:00',5),('2017-01-27 00:00:00',5),('2017-02-03 00:00:00',5),('2017-02-10 00:00:00',5),('2017-02-17 00:00:00',5),('2017-02-24 00:00:00',5),('2017-03-03 00:00:00',5),('2017-03-10 00:00:00',5),('2017-03-17 00:00:00',5),('2017-03-24 00:00:00',5),('2017-03-31 00:00:00',5),('2017-04-07 00:00:00',5),('2017-04-14 00:00:00',5),('2017-04-21 00:00:00',5),('2017-04-28 00:00:00',5),('2017-05-05 00:00:00',5),('2017-05-12 00:00:00',5),('2017-05-19 00:00:00',5),('2017-05-26 00:00:00',5),('2017-06-02 00:00:00',5),('2017-06-09 00:00:00',5),('2017-06-16 00:00:00',5),('2017-06-23 00:00:00',5),('2017-06-30 00:00:00',5),('2017-07-07 00:00:00',5),('2017-07-14 00:00:00',5),('2017-07-21 00:00:00',5),('2017-07-28 00:00:00',5),('2017-08-04 00:00:00',5),('2017-08-11 00:00:00',5),('2017-08-18 00:00:00',5),('2017-08-25 00:00:00',5),('2017-09-01 00:00:00',5),('2017-09-08 00:00:00',5),('2017-09-15 00:00:00',5),('2017-09-22 00:00:00',5),('2017-09-29 00:00:00',5),('2017-10-06 00:00:00',5),('2017-10-13 00:00:00',5),('2017-10-20 00:00:00',5),('2017-10-27 00:00:00',5),('2017-11-03 00:00:00',5),('2017-11-10 00:00:00',5),('2017-11-17 00:00:00',5),('2017-11-24 00:00:00',5),('2017-12-01 00:00:00',5),('2017-12-08 00:00:00',5),('2017-12-15 00:00:00',5),('2017-12-22 00:00:00',5),('2017-12-29 00:00:00',5),('2016-06-04 00:00:00',6),('2016-06-11 00:00:00',6),('2016-06-18 00:00:00',6),('2016-06-25 00:00:00',6),('2016-07-02 00:00:00',6),('2016-07-09 00:00:00',6),('2016-07-16 00:00:00',6),('2016-07-23 00:00:00',6),('2016-07-30 00:00:00',6),('2016-08-06 00:00:00',6),('2016-08-13 00:00:00',6),('2016-08-20 00:00:00',6),('2016-08-27 00:00:00',6),('2016-09-03 00:00:00',6),('2016-09-10 00:00:00',6),('2016-09-17 00:00:00',6),('2016-09-24 00:00:00',6),('2016-10-01 00:00:00',6),('2016-10-08 00:00:00',6),('2016-10-15 00:00:00',6),('2016-10-22 00:00:00',6),('2016-10-29 00:00:00',6),('2016-11-05 00:00:00',6),('2016-11-12 00:00:00',6),('2016-11-19 00:00:00',6),('2016-11-26 00:00:00',6),('2016-12-03 00:00:00',6),('2016-12-10 00:00:00',6),('2016-12-17 00:00:00',6),('2016-12-24 00:00:00',6),('2016-12-31 00:00:00',6),('2017-01-07 00:00:00',6),('2017-01-14 00:00:00',6),('2017-01-21 00:00:00',6),('2017-01-28 00:00:00',6),('2017-02-04 00:00:00',6),('2017-02-11 00:00:00',6),('2017-02-18 00:00:00',6),('2017-02-25 00:00:00',6),('2017-03-04 00:00:00',6),('2017-03-11 00:00:00',6),('2017-03-18 00:00:00',6),('2017-03-25 00:00:00',6),('2017-04-01 00:00:00',6),('2017-04-08 00:00:00',6),('2017-04-15 00:00:00',6),('2017-04-22 00:00:00',6),('2017-04-29 00:00:00',6),('2017-05-06 00:00:00',6),('2017-05-13 00:00:00',6),('2017-05-20 00:00:00',6),('2017-05-27 00:00:00',6),('2017-06-03 00:00:00',6),('2017-06-10 00:00:00',6),('2017-06-17 00:00:00',6),('2017-06-24 00:00:00',6),('2017-07-01 00:00:00',6),('2017-07-08 00:00:00',6),('2017-07-15 00:00:00',6),('2017-07-22 00:00:00',6),('2017-07-29 00:00:00',6),('2017-08-05 00:00:00',6),('2017-08-12 00:00:00',6),('2017-08-19 00:00:00',6),('2017-08-26 00:00:00',6),('2017-09-02 00:00:00',6),('2017-09-09 00:00:00',6),('2017-09-16 00:00:00',6),('2017-09-23 00:00:00',6),('2017-09-30 00:00:00',6),('2017-10-07 00:00:00',6),('2017-10-14 00:00:00',6),('2017-10-21 00:00:00',6),('2017-10-28 00:00:00',6),('2017-11-04 00:00:00',6),('2017-11-11 00:00:00',6),('2017-11-18 00:00:00',6),('2017-11-25 00:00:00',6),('2017-12-02 00:00:00',6),('2017-12-09 00:00:00',6),('2017-12-16 00:00:00',6),('2017-12-23 00:00:00',6),('2017-12-30 00:00:00',6),('2016-06-05 00:00:00',7),('2016-06-12 00:00:00',7),('2016-06-19 00:00:00',7),('2016-06-26 00:00:00',7),('2016-07-03 00:00:00',7),('2016-07-10 00:00:00',7),('2016-07-17 00:00:00',7),('2016-07-24 00:00:00',7),('2016-07-31 00:00:00',7),('2016-08-07 00:00:00',7),('2016-08-14 00:00:00',7),('2016-08-21 00:00:00',7),('2016-08-28 00:00:00',7),('2016-09-04 00:00:00',7),('2016-09-11 00:00:00',7),('2016-09-18 00:00:00',7),('2016-09-25 00:00:00',7),('2016-10-02 00:00:00',7),('2016-10-09 00:00:00',7),('2016-10-16 00:00:00',7),('2016-10-23 00:00:00',7),('2016-10-30 00:00:00',7),('2016-11-06 00:00:00',7),('2016-11-13 00:00:00',7),('2016-11-20 00:00:00',7),('2016-11-27 00:00:00',7),('2016-12-04 00:00:00',7),('2016-12-11 00:00:00',7),('2016-12-18 00:00:00',7),('2016-12-25 00:00:00',7),('2017-01-01 00:00:00',7),('2017-01-08 00:00:00',7),('2017-01-15 00:00:00',7),('2017-01-22 00:00:00',7),('2017-01-29 00:00:00',7),('2017-02-05 00:00:00',7),('2017-02-12 00:00:00',7),('2017-02-19 00:00:00',7),('2017-02-26 00:00:00',7),('2017-03-05 00:00:00',7),('2017-03-12 00:00:00',7),('2017-03-19 00:00:00',7),('2017-03-26 00:00:00',7),('2017-04-02 00:00:00',7),('2017-04-09 00:00:00',7),('2017-04-16 00:00:00',7),('2017-04-23 00:00:00',7),('2017-04-30 00:00:00',7),('2017-05-07 00:00:00',7),('2017-05-14 00:00:00',7),('2017-05-21 00:00:00',7),('2017-05-28 00:00:00',7),('2017-06-04 00:00:00',7),('2017-06-11 00:00:00',7),('2017-06-18 00:00:00',7),('2017-06-25 00:00:00',7),('2017-07-02 00:00:00',7),('2017-07-09 00:00:00',7),('2017-07-16 00:00:00',7),('2017-07-23 00:00:00',7),('2017-07-30 00:00:00',7),('2017-08-06 00:00:00',7),('2017-08-13 00:00:00',7),('2017-08-20 00:00:00',7),('2017-08-27 00:00:00',7),('2017-09-03 00:00:00',7),('2017-09-10 00:00:00',7),('2017-09-17 00:00:00',7),('2017-09-24 00:00:00',7),('2017-10-01 00:00:00',7),('2017-10-08 00:00:00',7),('2017-10-15 00:00:00',7),('2017-10-22 00:00:00',7),('2017-10-29 00:00:00',7),('2017-11-05 00:00:00',7),('2017-11-12 00:00:00',7),('2017-11-19 00:00:00',7),('2017-11-26 00:00:00',7),('2017-12-03 00:00:00',7),('2017-12-10 00:00:00',7),('2017-12-17 00:00:00',7),('2017-12-24 00:00:00',7),('2017-12-31 00:00:00',7);
/*!40000 ALTER TABLE `calendario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canchas`
--

DROP TABLE IF EXISTS `canchas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canchas` (
  `IdComplejo` int(11) NOT NULL,
  `IdCancha` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `CantJugadores` int(11) NOT NULL,
  `IdSuperficie` int(11) NOT NULL,
  `Techada` tinyint(1) NOT NULL,
  `Luz` tinyint(1) NOT NULL,
  `Precio` decimal(6,2) NOT NULL,
  `IdEstado` int(11) NOT NULL,
  PRIMARY KEY (`IdComplejo`,`IdCancha`),
  KEY `Canchas_Estados_fk` (`IdEstado`),
  CONSTRAINT `Canchas_Estados_fk` FOREIGN KEY (`IdEstado`) REFERENCES `canchasestados` (`IdEstado`),
  CONSTRAINT `Canchas_complejo_fk` FOREIGN KEY (`IdComplejo`) REFERENCES `complejos` (`IdComplejo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canchas`
--

LOCK TABLES `canchas` WRITE;
/*!40000 ALTER TABLE `canchas` DISABLE KEYS */;
INSERT INTO `canchas` VALUES (1,1,'Maracana',5,1,1,1,200.00,1),(1,2,'Monumental',11,2,0,1,300.00,1),(1,4,'Fortin',7,3,1,1,200.00,1),(1,5,'Fortaleza',11,4,1,0,200.00,1),(1,6,'Olimpia1',5,3,1,1,400.00,2),(2,3,'Cancha N° 3',6,2,1,1,600.00,1),(2,6,'Cancha N° 1',5,5,0,1,500.00,1),(2,7,'Cancha N° 2',5,5,0,1,500.00,1),(3,8,'Cancha 1',5,5,0,1,550.00,1),(4,9,'Delantera',5,3,1,1,450.00,1),(4,10,'Trasera',5,3,1,1,450.00,1),(5,11,'Gallardon',5,1,0,1,400.00,1),(5,12,'Lencho Sola',6,5,1,1,650.00,1),(6,13,'Cancha 1 (5j)',5,5,0,1,540.00,1),(6,14,'Cancha 2 (5j)',5,5,0,1,600.00,1),(6,15,'Cancha 3 (7j)',7,5,0,1,750.00,1),(6,16,'Cancha 4 (7j)',7,5,0,1,750.00,1),(6,17,'Cancha 5 (11j)',11,4,0,1,1300.00,1),(6,18,'',0,0,0,0,0.00,1),(6,19,'',0,0,0,0,0.00,1),(6,20,'',0,0,0,0,0.00,1),(6,21,'Fumancillo',10,3,1,1,500.00,1),(6,22,'Fumancillo',8,1,0,0,500.00,1),(6,23,'Fumancillo',6,1,0,0,500.00,1);
/*!40000 ALTER TABLE `canchas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canchascomentarios`
--

DROP TABLE IF EXISTS `canchascomentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canchascomentarios` (
  `IdComentario` int(11) NOT NULL AUTO_INCREMENT,
  `IdComplejo` int(11) NOT NULL,
  `IdCancha` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `Comentario` varchar(300) NOT NULL,
  `Fecha` datetime NOT NULL,
  PRIMARY KEY (`IdComentario`),
  KEY `CanchasComentarios_Canchas_fk` (`IdComplejo`,`IdCancha`),
  KEY `CanchasComentarios_Clientes_fk` (`IdCliente`),
  CONSTRAINT `CanchasComentarios_Canchas_fk` FOREIGN KEY (`IdComplejo`, `IdCancha`) REFERENCES `canchas` (`IdComplejo`, `IdCancha`),
  CONSTRAINT `CanchasComentarios_Clientes_fk` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canchascomentarios`
--

LOCK TABLES `canchascomentarios` WRITE;
/*!40000 ALTER TABLE `canchascomentarios` DISABLE KEYS */;
INSERT INTO `canchascomentarios` VALUES (17,5,12,2,'probando a comentarrrrrrrrr','2016-07-02 01:41:32'),(18,5,12,2,'joyaaaaaaaaaaaaa','2016-07-02 01:41:36'),(19,5,12,33,'a ver','2016-07-02 01:42:49'),(20,3,8,2,'comentario de prueba','2016-07-02 13:32:37'),(21,3,8,33,'.....','2016-07-02 15:25:51'),(22,3,8,2,'a','2016-07-02 15:32:12'),(23,3,8,2,'asdasdsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsdsadsadsadsadsadsadsadsadsad','2016-07-02 16:13:07'),(24,3,8,2,'comentario de pruebaaaaaa','2016-07-02 16:36:15'),(25,3,8,2,'wenaaaa','2016-07-03 13:53:11'),(26,5,12,2,'aaa','2016-07-08 13:06:46');
/*!40000 ALTER TABLE `canchascomentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canchasestados`
--

DROP TABLE IF EXISTS `canchasestados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canchasestados` (
  `IdEstado` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(30) NOT NULL,
  PRIMARY KEY (`IdEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canchasestados`
--

LOCK TABLES `canchasestados` WRITE;
/*!40000 ALTER TABLE `canchasestados` DISABLE KEYS */;
INSERT INTO `canchasestados` VALUES (1,'Activo'),(2,'Baja');
/*!40000 ALTER TABLE `canchasestados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canchasimagenes`
--

DROP TABLE IF EXISTS `canchasimagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canchasimagenes` (
  `IdComplejo` int(11) NOT NULL,
  `IdCancha` int(11) NOT NULL,
  `url` varchar(150) NOT NULL,
  `fechaAlta` datetime NOT NULL,
  PRIMARY KEY (`IdComplejo`,`IdCancha`,`url`),
  CONSTRAINT `Imagenes_Canchas_fk` FOREIGN KEY (`IdComplejo`, `IdCancha`) REFERENCES `canchas` (`IdComplejo`, `IdCancha`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canchasimagenes`
--

LOCK TABLES `canchasimagenes` WRITE;
/*!40000 ALTER TABLE `canchasimagenes` DISABLE KEYS */;
INSERT INTO `canchasimagenes` VALUES (1,1,'chilena_2016710_22348.jpg','2016-07-10 17:03:48'),(1,1,'descarga (1)_2016710_22341.jpg','2016-07-10 17:03:41'),(1,2,'chilena_2016710_201429.jpg','2016-07-10 15:14:29'),(1,2,'descarga_2016710_201434.jpg','2016-07-10 15:14:34'),(3,8,'chilena_2016710_204231.jpg','2016-07-10 15:42:31'),(3,8,'descarga (1)_2016710_204239.jpg','2016-07-10 15:42:39');
/*!40000 ALTER TABLE `canchasimagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canchaspuntuacion`
--

DROP TABLE IF EXISTS `canchaspuntuacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canchaspuntuacion` (
  `IdPuntuacion` int(11) NOT NULL AUTO_INCREMENT,
  `IdComplejo` int(11) NOT NULL,
  `IdCancha` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `Puntaje` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  PRIMARY KEY (`IdPuntuacion`),
  KEY `CanchassPuntuacion_Canchas_fk` (`IdComplejo`,`IdCancha`),
  KEY `CanchasPuntuacion_Clientes_fk` (`IdCliente`),
  CONSTRAINT `CanchasPuntuacion_Clientes_fk` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`),
  CONSTRAINT `CanchassPuntuacion_Canchas_fk` FOREIGN KEY (`IdComplejo`, `IdCancha`) REFERENCES `canchas` (`IdComplejo`, `IdCancha`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canchaspuntuacion`
--

LOCK TABLES `canchaspuntuacion` WRITE;
/*!40000 ALTER TABLE `canchaspuntuacion` DISABLE KEYS */;
INSERT INTO `canchaspuntuacion` VALUES (1,5,12,11,4,'2016-05-26 00:00:00'),(2,5,12,20,2,'2016-05-26 00:00:00'),(3,5,12,21,5,'2016-05-26 00:00:00'),(4,3,8,14,5,'2016-05-26 00:00:00'),(5,5,11,14,1,'2016-05-26 00:00:00'),(6,3,8,7,2,'2016-05-28 00:00:00'),(7,5,11,7,2,'2016-05-28 00:00:00'),(8,6,16,2,2,'2016-07-02 00:26:51'),(9,5,12,2,2,'2016-07-08 13:06:50'),(10,6,16,33,4,'2016-07-02 00:26:05'),(11,2,6,2,2,'2016-07-02 00:31:42'),(12,3,8,2,3,'2016-07-03 13:53:30'),(13,3,8,33,5,'2016-07-02 15:25:37');
/*!40000 ALTER TABLE `canchaspuntuacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `IdCliente` int(11) NOT NULL AUTO_INCREMENT,
  `IdPersona` int(11) NOT NULL,
  `Usuario` varchar(25) NOT NULL,
  `Contrasenia` tinyblob NOT NULL,
  `IdEstado` int(11) NOT NULL,
  `FechaAlta` date NOT NULL,
  `FechaBaja` date DEFAULT NULL,
  PRIMARY KEY (`IdCliente`),
  UNIQUE KEY `Usuario` (`Usuario`),
  KEY `cliente_persona_fk` (`IdPersona`),
  KEY `cliente_estado_fk` (`IdEstado`),
  CONSTRAINT `cliente_estado_fk` FOREIGN KEY (`IdEstado`) REFERENCES `clientesestados` (`IdEstado`),
  CONSTRAINT `cliente_persona_fk` FOREIGN KEY (`IdPersona`) REFERENCES `personas` (`IdPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (2,2,'cliente','cliente',1,'2016-05-02',NULL),(3,3,'aaa','asdasd',1,'2016-05-02',NULL),(5,5,'ccccc','asdasdddd',1,'2016-05-02',NULL),(6,6,'asdsadsa','sadsadsa',1,'2016-05-02',NULL),(7,7,'asdsa','',1,'2016-05-02',NULL),(11,11,'lean095','asdasd',1,'2016-05-02',NULL),(12,12,'asdasd','asdasdasd',1,'2016-05-03',NULL),(13,13,'enriquecito','atpatp',1,'2016-05-03',NULL),(14,14,'leocab','atpatp',1,'2016-05-04',NULL),(15,15,'pipa6','nn',1,'2016-05-04',NULL),(16,16,'banfield','banfield',1,'2016-05-04',NULL),(17,18,'tevez','tevez',1,'2016-05-06',NULL),(18,19,'pruebita','pruebita',1,'2016-05-07',NULL),(19,20,'lk','asd',1,'2016-05-08',NULL),(20,21,'cliented','asdasd',1,'2016-05-10',NULL),(21,22,'ivan','atpatp',1,'2016-05-10',NULL),(22,23,'maty123','123456',1,'2016-05-10',NULL),(23,24,'asdasdas','asdasd',1,'2016-05-10',NULL),(24,25,'asdsasadsad','asdasd',1,'2016-05-10',NULL),(25,26,'aaaaaa','asdasd',1,'2016-05-10',NULL),(26,27,'sadas','asdasd',1,'2016-05-10',NULL),(27,28,'asdasd3','asdasd',1,'2016-05-10',NULL),(28,29,'asdas','asdasd',1,'2016-05-10',NULL),(29,30,'asdsaddd','asdasd',1,'2016-05-10',NULL),(30,31,'pruebaaa','123456',1,'2016-05-10',NULL),(31,38,'juan','123456',1,'2016-06-05',NULL),(32,39,'TORNEO','torneos',1,'2016-06-08',NULL),(33,40,'ivanj','123456',1,'2016-07-02',NULL);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientesestados`
--

DROP TABLE IF EXISTS `clientesestados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientesestados` (
  `IdEstado` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(30) NOT NULL,
  PRIMARY KEY (`IdEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientesestados`
--

LOCK TABLES `clientesestados` WRITE;
/*!40000 ALTER TABLE `clientesestados` DISABLE KEYS */;
INSERT INTO `clientesestados` VALUES (1,'Activo'),(2,'Inactivo'),(3,'Activo'),(4,'Inactivo');
/*!40000 ALTER TABLE `clientesestados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientespagos`
--

DROP TABLE IF EXISTS `clientespagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientespagos` (
  `IdCliente` int(11) NOT NULL,
  `NroTarjeta` varchar(16) NOT NULL,
  `Mes` int(2) DEFAULT NULL,
  `Anio` int(2) DEFAULT NULL,
  `Codigo` blob,
  PRIMARY KEY (`IdCliente`),
  CONSTRAINT `pagos_cliente_fk` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientespagos`
--

LOCK TABLES `clientespagos` WRITE;
/*!40000 ALTER TABLE `clientespagos` DISABLE KEYS */;
INSERT INTO `clientespagos` VALUES (2,'4517690067067385',11,18,'232');
/*!40000 ALTER TABLE `clientespagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complejos`
--

DROP TABLE IF EXISTS `complejos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complejos` (
  `IdComplejo` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  `Estacionamiento` tinyint(1) NOT NULL,
  `Buffet` tinyint(1) NOT NULL,
  `Duchas` tinyint(1) NOT NULL,
  `Parrillas` tinyint(1) NOT NULL,
  `WiFi` tinyint(1) NOT NULL,
  `HoraCobroLuz` time NOT NULL,
  `PorcentajeSeña` int(11) NOT NULL,
  `HorasCancelacion` int(11) NOT NULL,
  `TiempoReserva` time DEFAULT NULL,
  `Email` varchar(60) NOT NULL,
  `IdEstado` int(11) NOT NULL,
  `IdDuenio` int(11) NOT NULL,
  `PorcentajeLuz` int(11) NOT NULL,
  `nroCelular` int(11) DEFAULT NULL,
  `nroTelefono` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdComplejo`),
  KEY `complejos_estados_fk` (`IdEstado`),
  CONSTRAINT `complejos_estados_fk` FOREIGN KEY (`IdEstado`) REFERENCES `complejosestados` (`IdEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complejos`
--

LOCK TABLES `complejos` WRITE;
/*!40000 ALTER TABLE `complejos` DISABLE KEYS */;
INSERT INTO `complejos` VALUES (1,'Open Gallo','primer complejo',1,1,1,1,1,'00:00:00',50,24,'00:00:05','open@gmail.com',1,1,0,1532325691,42596320),(2,'Todo Fútbol','Las mejores canchas de lomas de zamora, veni a disfrutar del fútbol!',0,1,1,1,1,'18:00:00',50,24,'00:00:05','todofutbol@hotmail.com',1,4,20,NULL,NULL),(3,'Oasis','Viví el fútbol en Banfield en Oasis!',1,1,0,0,0,'18:00:00',40,24,'00:00:05','oasis_banfield@hotmail.com',1,5,0,NULL,NULL),(4,'Maracaná','Puro fútbol en escalada!',0,1,1,0,0,'17:00:00',35,48,'00:00:05','maracana@yahoo.com.ar',1,6,20,NULL,NULL),(5,'Los Lagartos','Excelente para jugar con amigos, vení a Los Lagartos!',0,1,1,0,1,'18:00:00',20,36,'00:00:05','loslagartosfutbol@yahoo.com.ar',1,7,15,NULL,42450020),(6,'Las Heras','Fútbol Las Heras, tierra de cracks!',1,1,1,1,0,'18:00:00',0,48,'00:00:05','flasheras5@hotmail.com',1,8,18,1130986632,42025633);
/*!40000 ALTER TABLE `complejos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complejoscomentarios`
--

DROP TABLE IF EXISTS `complejoscomentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complejoscomentarios` (
  `IdComentario` int(11) NOT NULL AUTO_INCREMENT,
  `IdComplejo` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `Comentario` varchar(300) NOT NULL,
  `Fecha` datetime NOT NULL,
  PRIMARY KEY (`IdComentario`),
  KEY `ComplejosComentarios_Complejo_fk` (`IdComplejo`),
  KEY `ComplejosComentarios_Clientes_fk` (`IdCliente`),
  CONSTRAINT `ComplejosComentarios_Clientes_fk` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`),
  CONSTRAINT `ComplejosComentarios_Complejo_fk` FOREIGN KEY (`IdComplejo`) REFERENCES `complejos` (`IdComplejo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complejoscomentarios`
--

LOCK TABLES `complejoscomentarios` WRITE;
/*!40000 ALTER TABLE `complejoscomentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `complejoscomentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complejosdias`
--

DROP TABLE IF EXISTS `complejosdias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complejosdias` (
  `IdComplejo` int(11) NOT NULL,
  `IdDiaDesde` int(11) NOT NULL,
  `IdDiaHasta` int(11) NOT NULL,
  `HoraDesde` time NOT NULL,
  `HoraHasta` time NOT NULL,
  PRIMARY KEY (`IdComplejo`,`IdDiaDesde`,`IdDiaHasta`),
  KEY `DiaDesde_Dias_fk` (`IdDiaDesde`),
  KEY `DiaHasta_Dias_fk` (`IdDiaHasta`),
  CONSTRAINT `DiaDesde_Dias_fk` FOREIGN KEY (`IdDiaDesde`) REFERENCES `dias` (`IdDia`),
  CONSTRAINT `DiaHasta_Dias_fk` FOREIGN KEY (`IdDiaHasta`) REFERENCES `dias` (`IdDia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complejosdias`
--

LOCK TABLES `complejosdias` WRITE;
/*!40000 ALTER TABLE `complejosdias` DISABLE KEYS */;
INSERT INTO `complejosdias` VALUES (1,1,4,'10:00:00','22:00:00'),(1,6,7,'17:00:00','22:00:00'),(2,1,5,'12:00:00','22:00:00'),(2,6,7,'13:00:00','23:00:00'),(3,1,4,'14:00:00','23:00:00'),(3,5,7,'12:00:00','23:30:00'),(4,2,5,'15:00:00','22:00:00'),(4,6,7,'14:00:00','23:00:00'),(5,2,7,'14:00:00','23:00:00'),(6,1,4,'10:00:00','19:00:00'),(6,5,7,'11:00:00','22:00:00');
/*!40000 ALTER TABLE `complejosdias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complejosdireccion`
--

DROP TABLE IF EXISTS `complejosdireccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complejosdireccion` (
  `IdComplejo` int(11) NOT NULL,
  `Calle` varchar(40) NOT NULL,
  `Altura` int(11) NOT NULL,
  `IdLocalidad` int(11) NOT NULL,
  `IdProvincia` int(11) NOT NULL,
  `X` int(11) NOT NULL,
  `Y` int(11) NOT NULL,
  PRIMARY KEY (`IdComplejo`),
  KEY `Direccion_ProvLoc_fk` (`IdProvincia`,`IdLocalidad`),
  CONSTRAINT `Direccion_ProvLoc_fk` FOREIGN KEY (`IdProvincia`, `IdLocalidad`) REFERENCES `localidades` (`IdProvincia`, `IdLocalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complejosdireccion`
--

LOCK TABLES `complejosdireccion` WRITE;
/*!40000 ALTER TABLE `complejosdireccion` DISABLE KEYS */;
INSERT INTO `complejosdireccion` VALUES (1,'Mitre',750,0,2,1,1),(2,'Laprida',948,361,1,1,1),(3,'Larroque',756,55,1,1,1),(4,'Av H Yrigoyen',6637,339,1,1,1),(5,'Monteagudo',1317,55,1,1,1),(6,'Las Heras',646,55,1,1,1);
/*!40000 ALTER TABLE `complejosdireccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complejosestados`
--

DROP TABLE IF EXISTS `complejosestados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complejosestados` (
  `IdEstado` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(30) NOT NULL,
  PRIMARY KEY (`IdEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complejosestados`
--

LOCK TABLES `complejosestados` WRITE;
/*!40000 ALTER TABLE `complejosestados` DISABLE KEYS */;
INSERT INTO `complejosestados` VALUES (1,'Activo'),(2,'Baja');
/*!40000 ALTER TABLE `complejosestados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complejosimagenes`
--

DROP TABLE IF EXISTS `complejosimagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complejosimagenes` (
  `IdComplejo` int(11) NOT NULL,
  `url` varchar(150) NOT NULL,
  `fechaAlta` datetime NOT NULL,
  PRIMARY KEY (`IdComplejo`,`url`),
  CONSTRAINT `Imagenes_Complejos_fk` FOREIGN KEY (`IdComplejo`) REFERENCES `complejos` (`IdComplejo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complejosimagenes`
--

LOCK TABLES `complejosimagenes` WRITE;
/*!40000 ALTER TABLE `complejosimagenes` DISABLE KEYS */;
INSERT INTO `complejosimagenes` VALUES (3,'cancha11134322222221_2016710_172056.jpg','2016-07-10 12:20:56');
/*!40000 ALTER TABLE `complejosimagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complejospagos`
--

DROP TABLE IF EXISTS `complejospagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complejospagos` (
  `IdComplejo` int(11) NOT NULL,
  `CBU` varchar(22) NOT NULL,
  `NroCuenta` varchar(18) NOT NULL,
  PRIMARY KEY (`IdComplejo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complejospagos`
--

LOCK TABLES `complejospagos` WRITE;
/*!40000 ALTER TABLE `complejospagos` DISABLE KEYS */;
INSERT INTO `complejospagos` VALUES (6,'24412','555122');
/*!40000 ALTER TABLE `complejospagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complejospuntuacion`
--

DROP TABLE IF EXISTS `complejospuntuacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complejospuntuacion` (
  `IdPuntuacion` int(11) NOT NULL AUTO_INCREMENT,
  `IdComplejo` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `Puntaje` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  PRIMARY KEY (`IdPuntuacion`),
  KEY `ComplejosPuntuacion_Complejo_fk` (`IdComplejo`),
  KEY `ComplejosPuntuacion_Clientes_fk` (`IdCliente`),
  CONSTRAINT `ComplejosPuntuacion_Clientes_fk` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`),
  CONSTRAINT `ComplejosPuntuacion_Complejo_fk` FOREIGN KEY (`IdComplejo`) REFERENCES `complejos` (`IdComplejo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complejospuntuacion`
--

LOCK TABLES `complejospuntuacion` WRITE;
/*!40000 ALTER TABLE `complejospuntuacion` DISABLE KEYS */;
INSERT INTO `complejospuntuacion` VALUES (1,3,2,5,'2016-07-10 12:20:17');
/*!40000 ALTER TABLE `complejospuntuacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complejostelefonos`
--

DROP TABLE IF EXISTS `complejostelefonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complejostelefonos` (
  `IdComplejo` int(11) NOT NULL,
  `IdTelef` int(11) NOT NULL,
  `NroTelef` varchar(15) NOT NULL,
  PRIMARY KEY (`IdComplejo`,`IdTelef`),
  CONSTRAINT `Telefono_Complejo_fk` FOREIGN KEY (`IdComplejo`) REFERENCES `complejos` (`IdComplejo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complejostelefonos`
--

LOCK TABLES `complejostelefonos` WRITE;
/*!40000 ALTER TABLE `complejostelefonos` DISABLE KEYS */;
/*!40000 ALTER TABLE `complejostelefonos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devoluciones`
--

DROP TABLE IF EXISTS `devoluciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devoluciones` (
  `IdDevolucion` int(11) NOT NULL AUTO_INCREMENT,
  `IdDuenio` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `Monto` double(6,2) NOT NULL,
  PRIMARY KEY (`IdDevolucion`),
  KEY `Devoluciones_Duenio_fk` (`IdDuenio`),
  KEY `Devoluciones_Cliente_fk` (`IdCliente`),
  CONSTRAINT `Devoluciones_Cliente_fk` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`),
  CONSTRAINT `Devoluciones_Duenio_fk` FOREIGN KEY (`IdDuenio`) REFERENCES `duenios` (`IdDuenio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devoluciones`
--

LOCK TABLES `devoluciones` WRITE;
/*!40000 ALTER TABLE `devoluciones` DISABLE KEYS */;
INSERT INTO `devoluciones` VALUES (1,5,2,550.00);
/*!40000 ALTER TABLE `devoluciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dias`
--

DROP TABLE IF EXISTS `dias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dias` (
  `IdDia` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(10) NOT NULL,
  `idDiaEquivalente` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdDia`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dias`
--

LOCK TABLES `dias` WRITE;
/*!40000 ALTER TABLE `dias` DISABLE KEYS */;
INSERT INTO `dias` VALUES (1,'Lunes',2),(2,'Martes',3),(3,'Miercoles',4),(4,'Jueves',5),(5,'Viernes',6),(6,'Sabado',7),(7,'Domingo',1);
/*!40000 ALTER TABLE `dias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docestados`
--

DROP TABLE IF EXISTS `docestados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docestados` (
  `IdEstado` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IdEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docestados`
--

LOCK TABLES `docestados` WRITE;
/*!40000 ALTER TABLE `docestados` DISABLE KEYS */;
INSERT INTO `docestados` VALUES (1,'Activo'),(2,'Inactivo'),(3,'Activo'),(4,'Inactivo');
/*!40000 ALTER TABLE `docestados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duenios`
--

DROP TABLE IF EXISTS `duenios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duenios` (
  `IdDuenio` int(11) NOT NULL AUTO_INCREMENT,
  `IdPersona` int(11) NOT NULL,
  `Usuario` varchar(25) NOT NULL,
  `Contrasenia` blob NOT NULL,
  `IdEstado` int(11) NOT NULL,
  `FechaAlta` date NOT NULL,
  `FechaBaja` date DEFAULT NULL,
  PRIMARY KEY (`IdDuenio`),
  UNIQUE KEY `Usuario` (`Usuario`),
  KEY `IdPersona` (`IdPersona`),
  KEY `IdEstado` (`IdEstado`),
  CONSTRAINT `duenios_ibfk_1` FOREIGN KEY (`IdPersona`) REFERENCES `personas` (`IdPersona`),
  CONSTRAINT `duenios_ibfk_2` FOREIGN KEY (`IdEstado`) REFERENCES `dueniosestados` (`IdEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duenios`
--

LOCK TABLES `duenios` WRITE;
/*!40000 ALTER TABLE `duenios` DISABLE KEYS */;
INSERT INTO `duenios` VALUES (1,2,'duenio','duenio',2,'0000-00-00',NULL),(3,32,'unopendiente','123456',2,'2016-05-14',NULL),(4,33,'Todofutbol','todofutbol',2,'2016-05-21',NULL),(5,34,'oasisfutbol','oasisfutbol',2,'2016-05-21',NULL),(6,35,'Maracana','maracana',2,'2016-05-21',NULL),(7,36,'loslagartos','loslagartos',2,'2016-05-21',NULL),(8,37,'lasheras','lasheras',3,'2016-05-21',NULL);
/*!40000 ALTER TABLE `duenios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dueniosestados`
--

DROP TABLE IF EXISTS `dueniosestados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dueniosestados` (
  `IdEstado` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(30) NOT NULL,
  PRIMARY KEY (`IdEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dueniosestados`
--

LOCK TABLES `dueniosestados` WRITE;
/*!40000 ALTER TABLE `dueniosestados` DISABLE KEYS */;
INSERT INTO `dueniosestados` VALUES (1,'Pendiente'),(2,'Aceptado'),(3,'Activo'),(4,'Inactivo'),(5,'Pendiente'),(6,'Aceptado'),(7,'Activo'),(8,'Inactivo');
/*!40000 ALTER TABLE `dueniosestados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dueniospendientes`
--

DROP TABLE IF EXISTS `dueniospendientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dueniospendientes` (
  `IdDuenio` int(11) NOT NULL,
  `nombreComplejo` varchar(60) NOT NULL,
  `NroTelef` varchar(15) NOT NULL,
  `Calle` varchar(40) NOT NULL,
  `Altura` int(11) NOT NULL,
  `IdLocalidad` int(11) NOT NULL,
  `IdProvincia` int(11) NOT NULL,
  PRIMARY KEY (`IdDuenio`),
  KEY `Duenio_ProvLoc_fk` (`IdProvincia`,`IdLocalidad`),
  CONSTRAINT `Duenio_ProvLoc_fk` FOREIGN KEY (`IdProvincia`, `IdLocalidad`) REFERENCES `localidades` (`IdProvincia`, `IdLocalidad`),
  CONSTRAINT `Duenio_fk` FOREIGN KEY (`IdDuenio`) REFERENCES `duenios` (`IdDuenio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dueniospendientes`
--

LOCK TABLES `dueniospendientes` WRITE;
/*!40000 ALTER TABLE `dueniospendientes` DISABLE KEYS */;
INSERT INTO `dueniospendientes` VALUES (4,'Todo Fútbol','42455520','Laprida',948,361,1),(5,'Oasis','42025074','Larroque',756,55,1),(6,'Maracaná','42485236','Av H Yrigoyen',6637,339,1),(7,'Los Lagartos','42020253','Monteagudo',1317,55,1),(8,'Complejo Las Heras','42021232','Las Heras',646,55,1);
/*!40000 ALTER TABLE `dueniospendientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipos` (
  `IdEquipo` int(11) NOT NULL AUTO_INCREMENT,
  `IdCliente` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `imagen` blob,
  PRIMARY KEY (`IdEquipo`),
  KEY `Equipo_Cliente_fk` (`IdCliente`),
  CONSTRAINT `Equipo_Cliente_fk` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES (0,5,'',NULL),(1,2,'independiente',NULL),(2,5,'fluminense',NULL),(3,5,'river',NULL),(4,6,'racing',NULL),(5,7,'boca',NULL),(6,11,'San lorenzo',NULL),(7,12,'Banfield',NULL),(8,13,'arsenal',NULL),(9,14,'central',NULL),(10,15,'newlls',NULL),(11,16,'colon',NULL),(12,17,'talleres',NULL),(13,18,'instituto',NULL),(14,19,'lanus',NULL),(15,20,'godoy cruz',NULL),(16,21,'estudiantes',NULL),(17,22,'gimnasia',NULL),(18,23,'almagro',NULL),(19,24,'allboys',NULL),(20,25,'los andes',NULL),(21,26,'olimpo',NULL),(22,27,'aldosivi',NULL),(23,28,'defensa',NULL),(24,29,'chacarita',NULL),(25,30,'chicago',NULL),(26,31,'velez',NULL),(27,5,'berazategui',NULL),(28,5,'union',NULL),(29,5,'onceClub',NULL),(30,5,'belgrano',NULL),(31,5,'cruzero',NULL),(32,5,'santos',NULL);
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equiposestados`
--

DROP TABLE IF EXISTS `equiposestados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equiposestados` (
  `IdEstado` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(30) NOT NULL,
  PRIMARY KEY (`IdEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equiposestados`
--

LOCK TABLES `equiposestados` WRITE;
/*!40000 ALTER TABLE `equiposestados` DISABLE KEYS */;
/*!40000 ALTER TABLE `equiposestados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fixture`
--

DROP TABLE IF EXISTS `fixture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fixture` (
  `IdTorneo` int(11) NOT NULL,
  `IdFecha` int(11) NOT NULL,
  `IdReserva` int(11) NOT NULL,
  `IdEquipo1` int(11) NOT NULL,
  `IdEquipo2` int(11) NOT NULL,
  `Gol1` int(11) NOT NULL,
  `Gol2` int(11) NOT NULL,
  `jugado` int(11) DEFAULT NULL,
  `idreserva1` int(11) DEFAULT NULL,
  `idreserva2` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdTorneo`,`IdFecha`,`IdReserva`),
  KEY `Fixture_Equipo1_fk` (`IdEquipo1`),
  KEY `Fixture_Equipo2_fk` (`IdEquipo2`),
  CONSTRAINT `Fixture_Equipo1_fk` FOREIGN KEY (`IdEquipo1`) REFERENCES `equipos` (`IdEquipo`),
  CONSTRAINT `Fixture_Equipo2_fk` FOREIGN KEY (`IdEquipo2`) REFERENCES `equipos` (`IdEquipo`),
  CONSTRAINT `Fixture_Torneo_fk` FOREIGN KEY (`IdTorneo`) REFERENCES `torneos` (`IdTorneo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fixture`
--

LOCK TABLES `fixture` WRITE;
/*!40000 ALTER TABLE `fixture` DISABLE KEYS */;
INSERT INTO `fixture` VALUES (12,1,650,9,24,0,0,1,NULL,NULL),(12,1,651,10,23,0,0,1,NULL,NULL),(12,1,652,11,22,0,0,1,NULL,NULL),(12,1,653,12,21,0,0,1,NULL,NULL),(12,1,654,0,0,0,0,1,NULL,NULL),(12,1,655,0,0,0,0,1,NULL,NULL),(12,1,656,0,0,0,0,1,NULL,NULL),(12,1,657,0,0,0,0,1,NULL,NULL),(12,1,658,0,0,0,0,1,NULL,NULL),(12,1,659,0,0,0,0,1,NULL,NULL),(12,1,660,16,17,0,0,1,NULL,NULL),(12,1,661,15,18,0,0,1,NULL,NULL),(12,1,662,14,19,0,0,1,NULL,NULL),(12,1,663,13,20,0,0,1,NULL,NULL),(12,1,664,1,2,0,0,1,NULL,NULL),(12,1,665,0,0,0,0,1,NULL,NULL),(12,2,667,0,0,0,0,NULL,650,651),(12,2,668,0,0,0,0,NULL,652,653),(12,2,669,0,0,0,0,NULL,654,655),(12,2,670,0,0,0,0,NULL,656,657),(12,2,671,0,0,0,0,NULL,658,659),(12,2,672,0,0,0,0,NULL,660,661),(12,2,673,0,0,0,0,NULL,662,663),(12,2,674,0,0,0,0,NULL,664,665),(12,3,675,0,0,0,0,NULL,667,668),(12,3,676,0,0,0,0,NULL,669,670),(12,3,677,0,0,0,0,NULL,671,672),(12,3,678,0,0,0,0,NULL,673,674),(12,4,679,0,0,0,0,NULL,675,676),(12,4,680,0,0,0,0,NULL,677,678),(12,5,681,0,0,0,0,NULL,679,680),(12,650,650,9,24,0,0,NULL,NULL,NULL),(12,651,651,10,23,0,0,NULL,NULL,NULL),(12,652,652,11,22,0,0,NULL,NULL,NULL),(12,653,653,12,21,0,0,NULL,NULL,NULL),(12,654,654,0,0,0,0,NULL,NULL,NULL),(12,655,655,0,0,0,0,NULL,NULL,NULL),(12,656,656,0,0,0,0,NULL,NULL,NULL),(12,657,657,0,0,0,0,NULL,NULL,NULL),(12,658,658,0,0,0,0,NULL,NULL,NULL),(12,659,659,0,0,0,0,NULL,NULL,NULL),(12,660,660,16,17,0,0,NULL,NULL,NULL),(12,661,661,15,18,0,0,NULL,NULL,NULL),(12,662,662,14,19,0,0,NULL,NULL,NULL),(12,663,663,13,20,0,0,NULL,NULL,NULL),(12,665,665,0,0,0,0,NULL,NULL,NULL),(12,666,666,0,0,0,0,NULL,NULL,NULL),(13,1,1401,1,2,1,2,1,NULL,NULL),(13,1,1402,3,4,0,0,1,NULL,NULL),(13,1,1403,5,6,1,3,1,NULL,NULL),(13,1,1404,7,8,1,0,1,NULL,NULL),(13,2,1405,1,3,0,0,NULL,NULL,NULL),(13,2,1406,2,4,0,0,NULL,NULL,NULL),(13,2,1407,5,7,0,0,NULL,NULL,NULL),(13,2,1408,6,8,0,0,NULL,NULL,NULL),(13,3,1409,1,4,0,0,NULL,NULL,NULL),(13,3,1410,2,3,0,0,NULL,NULL,NULL),(13,3,1411,5,8,0,0,NULL,NULL,NULL),(13,3,1412,6,7,0,0,NULL,NULL,NULL),(13,4,1413,0,0,0,0,NULL,NULL,NULL),(13,4,1414,0,0,0,0,NULL,NULL,NULL),(13,4,1415,0,0,0,0,NULL,NULL,NULL),(13,4,1416,0,0,0,0,NULL,NULL,NULL),(13,5,1417,0,0,0,0,NULL,NULL,NULL),(13,5,1418,0,0,0,0,NULL,NULL,NULL),(13,5,1419,0,0,0,0,NULL,NULL,NULL),(13,5,1420,0,0,0,0,NULL,NULL,NULL),(13,6,1421,0,0,0,0,NULL,NULL,NULL),(13,6,1422,0,0,0,0,NULL,NULL,NULL),(13,6,1423,0,0,0,0,NULL,NULL,NULL),(13,6,1424,0,0,0,0,NULL,NULL,NULL),(13,7,1425,0,0,0,0,NULL,NULL,NULL),(13,7,1426,0,0,0,0,NULL,NULL,NULL),(13,7,1427,0,0,0,0,NULL,NULL,NULL),(13,7,1428,0,0,0,0,NULL,NULL,NULL),(13,8,1429,0,0,0,0,NULL,NULL,NULL),(13,8,1430,0,0,0,0,NULL,NULL,NULL),(13,8,1431,0,0,0,0,NULL,NULL,NULL),(13,8,1432,0,0,0,0,NULL,NULL,NULL),(13,9,1433,0,0,0,0,NULL,NULL,NULL),(13,9,1434,0,0,0,0,NULL,NULL,NULL),(13,9,1435,0,0,0,0,NULL,NULL,NULL),(13,9,1436,0,0,0,0,NULL,NULL,NULL),(13,10,1437,0,0,0,0,NULL,NULL,NULL),(13,10,1438,0,0,0,0,NULL,NULL,NULL),(13,10,1439,0,0,0,0,NULL,NULL,NULL),(13,10,1440,0,0,0,0,NULL,NULL,NULL),(13,11,1441,0,0,0,0,NULL,NULL,NULL),(13,11,1442,0,0,0,0,NULL,NULL,NULL),(13,11,1443,0,0,0,0,NULL,NULL,NULL),(13,11,1444,0,0,0,0,NULL,NULL,NULL),(13,12,1445,0,0,0,0,NULL,NULL,NULL),(13,12,1446,0,0,0,0,NULL,NULL,NULL),(13,12,1447,0,0,0,0,NULL,NULL,NULL),(13,12,1448,0,0,0,0,NULL,NULL,NULL),(13,13,1449,0,0,0,0,NULL,NULL,NULL),(13,13,1450,0,0,0,0,NULL,NULL,NULL),(13,13,1451,0,0,0,0,NULL,NULL,NULL),(13,13,1452,0,0,0,0,NULL,NULL,NULL),(13,14,1453,0,0,0,0,NULL,NULL,NULL),(13,14,1454,0,0,0,0,NULL,NULL,NULL),(13,14,1455,0,0,0,0,NULL,NULL,NULL),(13,14,1456,0,0,0,0,NULL,NULL,NULL),(16,2,1716,1,2,2,1,1,NULL,NULL),(16,2,1717,2,15,0,0,1,NULL,NULL),(16,2,1718,3,14,0,0,1,NULL,NULL),(16,2,1719,4,13,0,0,1,NULL,NULL),(16,2,1720,5,12,0,0,1,NULL,NULL),(16,2,1721,6,11,0,0,1,NULL,NULL),(16,2,1722,7,10,0,0,1,NULL,NULL),(16,2,1723,8,9,0,0,1,NULL,NULL),(16,3,1724,1,0,0,0,NULL,1716,1717),(16,3,1725,0,0,0,0,NULL,1718,1719),(16,3,1726,0,0,0,0,NULL,1720,1721),(16,3,1727,0,0,0,0,NULL,1722,1723),(16,4,1728,0,0,0,0,NULL,1724,1725),(16,4,1729,0,0,0,0,NULL,1726,1727),(16,5,1730,0,0,0,0,NULL,1728,1729),(17,4,1867,0,0,0,0,1,NULL,NULL),(17,4,1868,0,0,0,0,1,NULL,NULL),(17,5,1869,0,0,0,0,NULL,1867,1868),(19,0,1897,1,2,2,1,1,NULL,NULL),(19,0,1898,1,3,2,0,1,NULL,NULL),(19,0,1899,1,4,2,0,1,NULL,NULL),(19,0,1900,1,5,2,0,1,NULL,NULL),(19,0,1901,1,6,0,2,1,NULL,NULL),(19,0,1902,2,3,0,0,1,NULL,NULL),(19,0,1903,2,4,0,0,1,NULL,NULL),(19,0,1904,2,5,1,1,1,NULL,NULL),(19,4,1905,1,2,0,0,1,1897,1898),(19,4,1906,3,4,2,1,1,1899,1900),(19,4,1907,4,3,2,4,1,1901,1902),(19,4,1908,2,1,0,0,1,1903,1904),(19,5,1909,0,3,0,0,NULL,1905,1906),(19,5,1910,3,0,0,0,NULL,1907,1908),(20,1,1991,2,6,0,0,1,NULL,NULL),(20,1,1992,3,4,2,0,1,NULL,NULL),(20,1,1993,3,5,2,0,1,NULL,NULL),(20,2,1994,3,6,0,0,NULL,NULL,NULL),(20,2,1995,4,5,0,0,NULL,NULL,NULL),(20,2,1996,4,6,0,0,NULL,NULL,NULL),(20,3,1997,5,6,0,0,NULL,NULL,NULL),(20,3,1998,0,0,0,0,NULL,NULL,NULL),(20,3,1999,0,0,0,0,NULL,NULL,NULL),(20,4,2000,0,0,0,0,NULL,NULL,NULL),(20,4,2001,0,0,0,0,NULL,NULL,NULL),(20,4,2002,0,0,0,0,NULL,NULL,NULL),(20,5,2003,0,0,0,0,NULL,NULL,NULL),(20,5,2004,0,0,0,0,NULL,NULL,NULL),(20,5,2005,0,0,0,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `fixture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horas`
--

DROP TABLE IF EXISTS `horas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horas` (
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horas`
--

LOCK TABLES `horas` WRITE;
/*!40000 ALTER TABLE `horas` DISABLE KEYS */;
INSERT INTO `horas` VALUES ('00:00:00'),('01:00:00'),('02:00:00'),('03:00:00'),('04:00:00'),('05:00:00'),('06:00:00'),('07:00:00'),('08:00:00'),('09:00:00'),('10:00:00'),('11:00:00'),('12:00:00'),('13:00:00'),('14:00:00'),('15:00:00'),('16:00:00'),('17:00:00'),('18:00:00'),('19:00:00'),('20:00:00'),('21:00:00'),('22:00:00'),('23:00:00');
/*!40000 ALTER TABLE `horas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagenes`
--

DROP TABLE IF EXISTS `imagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagenes` (
  `imagen` mediumblob NOT NULL,
  `tipo_imagen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenes`
--

LOCK TABLES `imagenes` WRITE;
/*!40000 ALTER TABLE `imagenes` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listanegra`
--

DROP TABLE IF EXISTS `listanegra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listanegra` (
  `IdComplejo` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `FechaIngreso` date NOT NULL,
  PRIMARY KEY (`IdComplejo`,`IdCliente`),
  KEY `ListaNegra_Cliente_fk` (`IdCliente`),
  CONSTRAINT `ListaNegra_Cliente_fk` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`),
  CONSTRAINT `ListaNegra_complejo_fk` FOREIGN KEY (`IdComplejo`) REFERENCES `complejos` (`IdComplejo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listanegra`
--

LOCK TABLES `listanegra` WRITE;
/*!40000 ALTER TABLE `listanegra` DISABLE KEYS */;
/*!40000 ALTER TABLE `listanegra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidades`
--

DROP TABLE IF EXISTS `localidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localidades` (
  `IdProvincia` int(11) NOT NULL,
  `IdLocalidad` int(11) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `CP` int(11) NOT NULL,
  PRIMARY KEY (`IdProvincia`,`IdLocalidad`),
  CONSTRAINT `Localidades_Provincias_fk` FOREIGN KEY (`IdProvincia`) REFERENCES `provincias` (`IdProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidades`
--

LOCK TABLES `localidades` WRITE;
/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
INSERT INTO `localidades` VALUES (1,1,'ABASTO',1903),(1,2,'ACEVEDO',2717),(1,3,'MARIANO ACOSTA',1723),(1,4,'ACASSUSO',1641),(1,5,'ADROGUE',1846),(1,6,'J B ALBERDI (BS. AS.)',6034),(1,7,'ALBERTI',6634),(1,8,'LEANDRO N ALEM (BS. AS.)',6032),(1,9,'MARIANO H ALFONZO',2718),(1,10,'ALGARROBO',8136),(1,11,'VALENTIN ALSINA',1822),(1,12,'GRAL ALVARADO',7607),(1,13,'FRANCISCO ALVAREZ',1746),(1,14,'GRAL ALVEAR (BS. AS.)',7263),(1,15,'AMEGHINO',6064),(1,16,'ALDEA ROMANA',8105),(1,17,'APARICIO',8158),(1,18,'CARMEN DE ARECO',6725),(1,19,'GRAL ARENALES',6005),(1,20,'ARENAZA',6075),(1,21,'ARRECIFES',2740),(1,22,'ARRIBEÑOS',6007),(1,23,'ARROYO CORTO (BS. AS.)',8172),(1,24,'ARROYO DULCE',2743),(1,25,'ARROYO LUNA',2754),(1,26,'HILARIO ASCASUBI',8142),(1,27,'ASCENSION',6003),(1,28,'AVELLANEDA (BS.AS.)',1870),(1,29,'AYACUCHO',7150),(1,30,'AZCUENAGA',6721),(1,31,'AZOPARDO',8181),(1,32,'AZUL',7300),(1,33,'AGUSTINA',6001),(1,34,'ANCON',6451),(1,35,'ATUCHA',2808),(1,36,'ALVAREZ DE TOLEDO',7267),(1,37,'ARBOLEDAS',6557),(1,38,'ADOLFO ALSINA',6430),(1,39,'ARROYO DE LA CRUZ',2813),(1,40,'ADOLFO SORDEAUX',1612),(1,41,'ALTAMIRANO',1986),(1,42,'ALSINA',2938),(1,43,'AGUSTIN FERRARI',1723),(1,44,'ACHUPALLAS',6627),(1,45,'BARRIO ALMAFUERTE',8000),(1,46,'JUAN ATUCHA',7245),(1,47,'BANCALARI',1617),(1,48,'BLANCA GRANDE',6561),(1,49,'BAHIA BLANCA',8000),(1,50,'BENITEZ',6632),(1,51,'BAIGORRITA',6013),(1,52,'BAJO HONDO',8115),(1,53,'BALCARCE',7620),(1,54,'BANDERALO',6244),(1,55,'BANFIELD',1828),(1,56,'BARADERO',2942),(1,57,'BAYAUCA',6078),(1,58,'BECCAR',1643),(1,59,'GRAL BELGRANO',7223),(1,60,'BELLA VISTA (BS. AS.)',1661),(1,61,'BERAZATEGUI',1884),(1,62,'BERISSO',1923),(1,63,'BERNAL',1876),(1,64,'BERUTTI',6424),(1,65,'BLAQUIER',6065),(1,66,'BOLIVAR',6550),(1,67,'BONIFACIO',6439),(1,68,'BORDENAVE',8187),(1,69,'BOULOGNE',1609),(1,70,'BRAGADO',6640),(1,71,'CNEL BRANDSEN',1980),(1,72,'EMILIO V BUNGE',6241),(1,73,'MAYOR BURATOVICH',8146),(1,74,'BURZACO',1852),(1,75,'ALDO BONZI',1770),(1,76,'BERDIER',2743),(1,77,'BERRAONDO',8124),(1,78,'MARIANO BENITEZ',2701),(1,79,'ING BUDGE',1773),(1,80,'BASE N P BELGRANO',8109),(1,81,'ALTE BROWN',1846),(1,82,'BARKER',7005),(1,83,'BOSQUES',1889),(1,84,'BARTOLOME BAVIO',1911),(1,85,'ARROYO VENADO',6437),(1,86,'BENAVIDEZ',1621),(1,87,'COLONIA SERE',6459),(1,88,'CURA MALAL',7548),(1,89,'ANTONIO CARBONI',7243),(1,90,'JOSE B CASAS',8506),(1,91,'CABILDO',8118),(1,92,'CACHARI',7214),(1,93,'RAFAEL CALZADA',1847),(1,94,'CAMPANA',2804),(1,95,'CAÑADA SECA (BS. AS.)',6105),(1,96,'CAÑUELAS',1814),(1,97,'CAPILLA DEL SEÑOR',2812),(1,98,'CARABELAS',2703),(1,99,'CARAPACHAY',1605),(1,100,'CARHUE',6430),(1,101,'CARLOS CASARES',6530),(1,102,'CASBAS',6417),(1,103,'ISIDRO CASANOVA',1765),(1,104,'MICAELA CASCALLARES',7507),(1,105,'CASCADA',7547),(1,106,'CASEROS (BS. AS.)',1678),(1,107,'CASTELAR',1712),(1,108,'CASTELLI',7114),(1,109,'CASTILLA',6616),(1,110,'CITY BELL',1896),(1,111,'CIUDADELA',1702),(1,112,'COBO',7612),(1,113,'COLON (BS. AS.)',2720),(1,114,'CONESA',2907),(1,115,'COPETONAS',7511),(1,116,'MARTIN CORONADO',1682),(1,117,'CUCULLU',6723),(1,118,'CHACABUCO',6740),(1,119,'CHAPADMALAL',7605),(1,120,'CNEL CHARLONE',6223),(1,121,'CHASCOMUS',7130),(1,122,'CHASICO',8117),(1,123,'CHILAVERT',1653),(1,124,'CHILLAR',7311),(1,125,'CHIVILCOY',6620),(1,126,'CLAYPOLE',1849),(1,127,'CARAZA',1822),(1,128,'CHICLANA',6476),(1,129,'RAFAEL CASTILLO',1755),(1,130,'CRISTIANO MUERTO',7503),(1,131,'GRAL DANIEL CERRI',8105),(1,132,'CASEY',6417),(1,133,'VICENTE CASARES',1808),(1,134,'CARUPA',1638),(1,135,'CARDENAL CAGLIERO',8506),(1,136,'GRAL CONESA (BS. AS.)',7101),(1,137,'CLAROMECO',7505),(1,138,'CAMET',7612),(1,139,'CLARAZ',7005),(1,140,'CAZON',7265),(1,141,'DEL CARRIL',7265),(1,142,'DAIREAUX',6555),(1,143,'DARREGUEIRA',8183),(1,144,'DE LA GARMA',7515),(1,145,'N DE LA RIESTRA',6663),(1,146,'DEL VALLE',6509),(1,147,'DEL VISO',1669),(1,148,'DENNEHY',6516),(1,149,'PTE DERQUI',1635),(1,150,'DIECISIETE DE AGOSTO',8129),(1,151,'DOCE DE OCTUBRE',6501),(1,152,'DOCK SUD',1871),(1,153,'DOLORES',7100),(1,154,'DON BOSCO (BS. AS.)',1876),(1,155,'DON TORCUATO',1611),(1,156,'CNEL DORREGO (BS. AS.)',8150),(1,157,'DUDIGNAC',6505),(1,158,'DUFAUR',8164),(1,159,'D ORBIGNY',7541),(1,160,'DOYLE',2935),(1,161,'DUGGAM',2764),(1,162,'DOMSELAAR',1984),(1,163,'DUHAU',6405),(1,164,'DE LA CANAL',7013),(1,165,'DIQUE LUJAN',1623),(1,166,'ANDANT',6555),(1,167,'BAHIA SAN BLAS',8506),(1,168,'PARADA EL PATO',1891),(1,169,'MANUEL J COBO',7116),(1,170,'EL JABALI',6531),(1,171,'EL PALENQUE',1667),(1,172,'ELDIA',6241),(1,173,'EL TEJAR',6515),(1,174,'EL TALAR DE PACHECO',1618),(1,175,'EL ARBOLITO',2721),(1,176,'EL DIVISORIO',7531),(1,177,'EL DORADO',6031),(1,178,'EL PALOMAR',1684),(1,179,'EL SOCORRO',2715),(1,180,'EL TRIUNFO',6073),(1,181,'ENSENADA',1925),(1,182,'ERIZE',8181),(1,183,'R E DE SAN MARTIN',1826),(1,184,'BELEN DE ESCOBAR',1625),(1,185,'ESPARTILLAR',8171),(1,186,'ESPIGAS',6561),(1,187,'FULTON',7007),(1,188,'ESTELA',8127),(1,189,'ESTOMBA',8118),(1,190,'EZEIZA',1804),(1,191,'EZPELETA',1882),(1,192,'EREZCANO',2903),(1,193,'EL PARAISO',2916),(1,194,'EL PENSAMIENTO',7531),(1,195,'EL TRIGO',7207),(1,196,'ENERGIA',7641),(1,197,'ERNESTINA',6665),(1,198,'ELVIRA',7243),(1,199,'CROTTO',7307),(1,200,'CALVO',8154),(1,201,'BARRIO E ECHEVERRIA',1802),(1,202,'ESPORA',6721),(1,203,'LOPEZ CAMELO',1617),(1,204,'EL JAGUEL',1842),(1,205,'FARO',8150),(1,206,'FATRALO',6430),(1,207,'M. FERNANDEZ',6645),(1,208,'J N FERNANDEZ',7011),(1,209,'FERRE',6003),(1,210,'FLORIDA',1602),(1,211,'FORTIN TIBURCIO',6001),(1,212,'FRENCH',6516),(1,213,'FATIMA',1633),(1,214,'FIORITO',1822),(1,215,'FONTEZUELA',2700),(1,216,'FORTIN OLAVARRIA',6403),(1,217,'EMPALME LOBOS',7249),(1,218,'MANUEL ALBERTI',1667),(1,219,'AGUAS VERDES',7112),(1,220,'MALVINAS ARGENTINAS BA',1846),(1,221,'BALNEARIO RETA',7511),(1,222,'EL PERDIDO',8156),(1,228,'GAHAN',2745),(1,229,'GARIN',1619),(1,230,'GARRE',6411),(1,231,'ESTEBAN A GASCON',8185),(1,232,'GRAND BOURG',1615),(1,233,'GERLI',1870),(1,234,'GERMANIA',6053),(1,235,'GLEW',1856),(1,236,'MANUEL B GONNET',1897),(1,237,'GONZALEZ CATAN',1759),(1,238,'GONZALES CHAVES',7513),(1,239,'GONZALEZ MORENO',6239),(1,240,'GOYENA',8175),(1,241,'CNEL GRANADA',6062),(1,242,'GUAMINI',6435),(1,243,'GRAL SARMIENTO',1663),(1,244,'GUERRICO',2717),(1,245,'LUIS GUILLON',1838),(1,246,'J A GUISASOLA',8156),(1,247,'GUERNICA',1862),(1,248,'GOWLAND',6608),(1,249,'GORCHS',7226),(1,250,'J M GUTIERREZ',1890),(1,251,'GOROSTIAGA',6632),(1,252,'GUANACO',6476),(1,253,'GRAL GUIDO',7118),(1,254,'GOLDNEY',6614),(1,255,'GRAL MANSILLA',1911),(1,256,'GIRONDO',6451),(1,257,'CIUDAD EVITA',1778),(1,258,'GDOR CASTRO',2946),(1,259,'GRUMBEIN',8101),(1,260,'JOAQUIN GORINA',1896),(1,263,'HAEDO',1706),(1,264,'HENDERSON',6465),(1,265,'G HERNANDEZ',1900),(1,266,'HINOJO',7318),(1,267,'HUANGUELEN',7545),(1,268,'HURLINGHAM',1686),(1,269,'GUILLERMO HUDSON',1885),(1,271,'HUETEL',6511),(1,272,'HERRERA VEGAS',6467),(1,273,'HEREFORD',6233),(1,274,'MAURICIO HIRSCH',6531),(1,285,'MARIA IGNACIA',7003),(1,286,'INES INDART',2747),(1,287,'JOSE INGENIEROS',1778),(1,288,'IRALA',6013),(1,289,'ISLAS',6667),(1,290,'ITUZAINGO (BS. AS.)',1714),(1,291,'IRIARTE',6042),(1,292,'INDIO RICO',7501),(1,293,'JUAN F IBARRA',6551),(1,294,'IRENE',7507),(1,295,'ING MONETA',2935),(1,296,'ING THOMPSON',6337),(1,297,'ING J ALLAN',1891),(1,307,'JAUREGUI',6706),(1,308,'JEPPENER',1986),(1,309,'TOMAS JOFRE',6601),(1,310,'JUAREZ',7020),(1,311,'JUNIN (BS. AS.)',6000),(1,312,'JUAN B JUSTO',1602),(1,313,'JOSE FERRARI',1905),(1,319,'LA LUCILA DEL MAR',7113),(1,320,'ALEJANDRO KORN',1864),(1,321,'KM 172',2935),(1,322,'LA BARRANCOSA',7260),(1,323,'LOS HORNOS (BS. AS.)',1900),(1,324,'LA LIMPIA',6645),(1,325,'LA MANUELA',6439),(1,326,'LA EMILIA',2901),(1,327,'LA NEGRA',7005),(1,328,'LA LARGA',6555),(1,329,'LA COLINA',7408),(1,330,'LA CHOZA',1737),(1,331,'LA DULCE',7637),(1,332,'LAFERRERE',1757),(1,333,'LAGUNA ALSINA',6439),(1,334,'LA INVENCIBLE',2745),(1,335,'LA LUCILA (BS. AS.)',1636),(1,336,'LA LUISA (BS. AS.)',2752),(1,337,'GRAL LAMADRID',7406),(1,338,'LA NIÑA',6513),(1,339,'LANUS',1824),(1,340,'LAPLACETTE',6013),(1,341,'LA PLATA',1900),(1,342,'LAPRIDA (BS. AS.)',7414),(1,343,'LARTIGAU',7531),(1,344,'LA SALADA (BS. AS.)',1774),(1,345,'LAS ARMAS',7172),(1,346,'LAS FLORES (BS. AS.)',7200),(1,347,'GRAL LAS HERAS',1741),(1,348,'LAS MARTINETAS',7406),(1,349,'LAS TOSCAS (BS. AS.)',6453),(1,350,'LLAVALLOL',1836),(1,351,'LA VIOLETA',2751),(1,352,'LEZAMA',7116),(1,353,'LIBANO',7407),(1,354,'LIBERTAD',1716),(1,355,'LIMA',2806),(1,356,'LINCOLN',6070),(1,357,'LOBERIA',7635),(1,358,'LOBOS',7240),(1,359,'LOMA NEGRA',7403),(1,360,'LOMAS DEL MIRADOR',1752),(1,361,'LOMAS DE ZAMORA',1832),(1,362,'LONGCHAMPS',1854),(1,363,'VICENTE LOPEZ',1638),(1,364,'LOS CARDALES',2814),(1,365,'LOS POLVORINES',1613),(1,366,'LOMAS DE MARILO',1663),(1,367,'LUJAN (BS. AS.)',6700),(1,368,'PEDRO LURO',8148),(1,369,'LAS PARVAS',6022),(1,370,'VILLA LOMA HERMOSA',1657),(1,371,'LOPEZ LECUBE',8117),(1,372,'LA LONJA',1669),(1,373,'LA REJA',1744),(1,374,'LOMA VERDE',1981),(1,375,'GRAL LAVALLE (BS. AS.)',7103),(1,376,'LAS TONINAS',7106),(1,377,'LEUBUCO',6338),(1,378,'LAGO EPECUEN',6431),(1,379,'LOS INDIOS',2709),(1,380,'LICENCIADO MATIENZO',7007),(1,381,'LABARDEN',7161),(1,382,'LOS ANGELES',2743),(1,383,'LAS MALVINAS',1748),(1,384,'MANZANARES',1629),(1,385,'GRAL MADARIAGA',7163),(1,386,'FRANCISCO MADERO',6472),(1,387,'MAGDALENA',1913),(1,388,'MAIPU (BS. AS.)',7160),(1,389,'MAR DE AJO',7109),(1,390,'MAR DEL PLATA',7600),(1,391,'MARI LAUQUEN',6400),(1,392,'JOSE MARMOL',1846),(1,393,'MARTINEZ',1640),(1,394,'MARTINEZ DE HOZ',6533),(1,395,'MIRANDA',7201),(1,396,'MECHONGUE',7605),(1,397,'MEDANOS',8132),(1,398,'MERCEDES (BS. AS.)',6600),(1,399,'MERLO (BS. AS.)',1722),(1,400,'MIRAMAR (BS. AS.)',7607),(1,401,'MOCTEZUMA',6531),(1,402,'MOLL',6627),(1,403,'CNEL MOM',6628),(1,404,'MONES CAZON',6469),(1,405,'MONTE',7220),(1,406,'MONTE CHINGOLO',1825),(1,407,'MONTE GRANDE',1842),(1,408,'MOQUEHUA',6605),(1,409,'MOREA',6507),(1,410,'MORENO',1744),(1,411,'MORON',1708),(1,412,'MORSE',6013),(1,413,'MUNRO',1605),(1,414,'MUÑIZ',1663),(1,415,'MALAVER',1653),(1,416,'ING MASCHWITZ',1623),(1,417,'MOSCONI',6505),(1,418,'BLNRIO MONTE HERMOSO',8153),(1,419,'MERLO GOMEZ',1714),(1,420,'MENDEVILLE',1708),(1,421,'MAGDALA',6451),(1,422,'MATHEU',1627),(1,423,'BLNRIO MAR CHIQUITA',7609),(1,424,'MAR DEL TUYU',7108),(1,425,'MIGUELETE',1650),(1,426,'MAXIMO PAZ (BS. AS.)',1812),(1,427,'MARIA LUCILA',6467),(1,428,'MAQ F SAVIO',1619),(1,429,'MIRA PAMPA',6403),(1,430,'NORDELTA',1670),(1,431,'CARLOS MARIA NAON',6515),(1,432,'NAPALEOFU',7007),(1,433,'NAVARRO',6605),(1,434,'NECOCHEA',7630),(1,435,'NUEVE DE JULIO (BS. AS.)',6500),(1,436,'ING PABLO NOGUES',1613),(1,437,'NUEVA PLATA',6451),(1,438,'9 DE ABRIL',1839),(1,439,'CADRET',6535),(1,440,'CERRO SOTUYO',7403),(1,441,'CONDARCO',6233),(1,442,'CURARU',6451),(1,443,'CORAZZI',6405),(1,444,'COLONIA LAPIN',8185),(1,445,'CARLOS BEGUERIE',7247),(1,446,'CAMPO DE MAYO',1659),(1,447,'CANNING',1804),(1,448,'CASALINS',7225),(1,449,'COSTA AZUL',7112),(1,450,'CORTINES',6712),(1,451,'OCHANDIO',7521),(1,452,'RAFAEL OBLIGADO',6001),(1,453,'GRAL O BRIEN',6646),(1,454,'MANUEL OCAMPO',2713),(1,455,'O HIGGINS',6748),(1,456,'OLASCOAGA',6652),(1,457,'OLAVARRIA',7400),(1,458,'OLIDEN',1981),(1,459,'OLIVOS',1636),(1,460,'ORDOQUI',6537),(1,461,'ORENSE',7503),(1,462,'ORIENTE',7509),(1,463,'TTE ORIGONE',8144),(1,464,'CTE NICANOR OTAMENDI',7603),(1,465,'LISANDRO OLMOS',1901),(1,466,'ORTIZ BASUALDO',2703),(1,467,'OSTENDE',7167),(1,468,'OPEN DOOR',6708),(1,469,'OLIVERA',6608),(1,474,'ALEJANDRO PETION',1808),(1,475,'PEHUEN-CO',8109),(1,476,'PORVENIR',6063),(1,477,'PARQUE LELOIR',1713),(1,478,'PUEBLO SAN JOSE',7541),(1,479,'PASCO (BS. AS.)',1834),(1,480,'PONTAUT',7535),(1,481,'GRAL PACHECO',1617),(1,482,'JUAN JOSE PASO',6474),(1,483,'PASO DEL REY',1742),(1,484,'PASTEUR',6077),(1,485,'CARMEN DE PATAGONES',8504),(1,486,'PATRICIOS',6503),(1,488,'JOSE C PAZ',1665),(1,489,'MARCOS PAZ (BS. AS.)',1727),(1,490,'PEDERNALES',6665),(1,491,'PEHUAJO',6450),(1,492,'PELICURA',8117),(1,493,'PELLEGRINI',6346),(1,494,'ROQUE PEREZ',7245),(1,495,'PEREZ MILLAN',2933),(1,496,'PERGAMINO',2700),(1,497,'PIEDRITAS',6241),(1,498,'PIGUE',8170),(1,499,'PILA',7116),(1,500,'PILAR (BS. AS.)',1629),(1,501,'PIROVANO',6551),(1,502,'PINAMAR',7167),(1,503,'GRAL PINTO',6050),(1,504,'PINZON',2703),(1,505,'PIÑEYRO',1870),(1,506,'GRAL PIRAN',7172),(1,507,'PLATANOS',1885),(1,508,'PABLO PODESTA',1657),(1,509,'POLVADERAS',7267),(1,510,'IRINEO PORTELA',2943),(1,511,'CNEL PRINGLES',7530),(1,512,'PUAN',8180),(1,513,'PUNTA ALTA',8109),(1,514,'CDRO PY',6641),(1,515,'PONTEVEDRA',1761),(1,516,'POURTALE',7400),(1,517,'PASMAN',7547),(1,518,'JUAN A PRADERE',8142),(1,519,'PLA',6634),(1,520,'PALEMON HUERGO',6628),(1,521,'PICHINCHA',6051),(1,522,'PARDO',7212),(1,523,'PUERTO ROSALES',8111),(1,524,'PASO PIEDRAS',8000),(1,525,'PARADA ROBLES',6703),(1,526,'PUNTA LARA',1931),(1,527,'PIPINAS',1921),(1,528,'PUNTA INDIO',1917),(1,530,'QUERANDIES',7400),(1,531,'QUENUMA',6335),(1,532,'QUEQUEN',7631),(1,533,'QUILMES',1878),(1,534,'QUIROGA',6533),(1,535,'QUIRNO COSTA',6018),(1,536,'QUIÑIHUAL',7533),(1,547,'RANCHOS GRAL PAZ',1987),(1,548,'RAMOS OTERO',7621),(1,549,'RANELAGH',1886),(1,550,'R SANTAMARINA',7641),(1,551,'RAMOS MEJIA',1704),(1,552,'RANCAGUA',2701),(1,553,'RAUCH',7203),(1,554,'RAWSON (BS. AS.)',6734),(1,555,'RECALDE',6559),(1,556,'RIVADAVIA E AMERICA',6237),(1,557,'RIVAS',6600),(1,558,'RIVERA',6441),(1,559,'ROBERTS',6075),(1,560,'AGUSTIN ROCA',6001),(1,561,'ROCHA',7404),(1,562,'GRAL RODRIGUEZ',1748),(1,563,'ROJAS',2705),(1,564,'GRAL ROJO',2905),(1,565,'MELCHOR ROMERO',1903),(1,566,'ROOSEVELT',6403),(1,567,'RIVADEO',8127),(1,568,'GRAL RONDEAU',8124),(1,569,'RINGUELET',1901),(1,570,'ROBERTO CANO',2703),(1,571,'RUIZ',6600),(1,572,'RIO TALA',2944),(1,576,'SAN CARLOS (BS. AS.)',1900),(1,577,'SOLIS (BS. AS.)',2764),(1,578,'SIERRA DE LOS PADRES',7601),(1,579,'SANTA CATALINA',1836),(1,580,'SAN JORGE (BS. AS.)',7404),(1,581,'SAN BERNARDO (BS. AS.)',6561),(1,582,'SAN MAYOL',7519),(1,583,'SAAVEDRA',8174),(1,584,'SAENZ PEÑA',1674),(1,585,'SALADILLO (BS. AS.)',7260),(1,586,'SALAZAR',6471),(1,587,'SALDUNGARAY',8166),(1,588,'SALTO',2741),(1,589,'SALLIQUELO',6339),(1,590,'SAN SEBASTIAN',6623),(1,591,'SAN ANDRES (BS. AS.)',1651),(1,592,'SAN ANDRES DE GILES',6720),(1,593,'SAN ANTONIO DE ARECO',2760),(1,594,'SAN ANTONIO DE PADUA',1718),(1,595,'SAN BERNARDO (MAR DEL PLATA)',7111),(1,596,'SAN CAYETANO',7521),(1,597,'SAN CLEMENTE DE TUYU',7105),(1,598,'SAN ENRIQUE',6661),(1,599,'SAN FERNANDO (BS. AS.)',1646),(1,600,'SAN FCO DE BELLOQ',7505),(1,601,'SAN FRANCISCO SOLANO',1881),(1,602,'SAN GERMAN',8124),(1,603,'SAN ISIDRO (BS. AS.)',1642),(1,604,'SAN JOSE (BS. AS.)',7635),(1,605,'SAN JUSTO (BS. AS.)',1754),(1,606,'SAN MANUEL',7007),(1,607,'SAN MARTIN (BS. AS.)',1650),(1,608,'SAN MIGUEL (BS. AS.)',1663),(1,609,'SAN NICOLAS',2900),(1,610,'SAN PEDRO (BS. AS.)',2930),(1,611,'SAN ROMAN',8154),(1,612,'SANTA COLOMA',2761),(1,613,'SANTA ELEODORA',6241),(1,614,'SANTA LUCIA (BS. AS.)',2935),(1,615,'SANTA REGINA',6105),(1,616,'SANTA TERESITA',7107),(1,617,'SANTOS LUGARES',1676),(1,618,'SAN VICENTE (BS. AS.)',1865),(1,619,'SARANDI',1872),(1,620,'CAPITAN SARMIENTO',2752),(1,621,'SIERRA DE LA VENTANA',8168),(1,622,'SIERRAS BAYAS',7403),(1,623,'SMITH',6531),(1,624,'FELIPE SOLA',8129),(1,625,'STROEDER',8508),(1,626,'CNEL SUAREZ',7540),(1,627,'TRISTAN SUAREZ',1806),(1,628,'JOSE LEON SUAREZ',1655),(1,629,'SUIPACHA',6612),(1,630,'SAN MIGUEL ARCANGEL',8185),(1,631,'CARLOS SALAS',6453),(1,632,'SAN EMILIO',6017),(1,633,'SIERRA CHICA',7401),(1,634,'SANTOS UNZUE',6507),(1,635,'SALVADOR MARIA',7241),(1,636,'GUIDO SPANO',2707),(1,637,'SOURIGUES',1878),(1,638,'SUNDBLAD',6401),(1,639,'SARASA',2721),(1,640,'SEVIGNE',7101),(1,641,'CARLOS SPEGAZZINI',1812),(1,642,'CNEL SEGUI',6628),(1,643,'SATURNO',6417),(1,644,'SAN AGUSTIN (BS. AS.)',7623),(1,645,'ARTURO SEGUI',1895),(1,646,'TABLADA',1766),(1,648,'TANDIL',7000),(1,649,'TAPALQUE',7303),(1,650,'TAPIALES',1770),(1,651,'TEDIN URIBURU',7021),(1,652,'CARLOS TEJEDOR',6455),(1,653,'TEMPERLEY',1834),(1,654,'TIGRE',1648),(1,655,'TIMOTE',6457),(1,656,'TOLOSA',1900),(1,657,'TORNQUIST',8160),(1,658,'TORRES',6703),(1,659,'TORTUGUITAS',1667),(1,660,'TREINTA DE AGOSTO',6405),(1,661,'TRENQUE LAUQUEN',6400),(1,662,'TRES ALGARROBOS',6231),(1,663,'TRES ARROYOS',7500),(1,664,'TRES SARGENTOS',6727),(1,665,'TRES LOMAS',6409),(1,666,'EL TROPEZON',1888),(1,667,'VILLA TURDERA',1834),(1,668,'TRES PICOS',8162),(1,669,'TRUJUI',1664),(1,670,'TRONGE',6407),(1,671,'TODD',2754),(1,672,'TAMANGUEYU',7633),(1,673,'TRES LAGUNAS (BS. AS.)',6443),(1,683,'GDOR UDAONDO',7221),(1,684,'UDAQUIOLA',7151),(1,685,'URDAMPILLETA',6553),(1,686,'GDOR UGARTE',6621),(1,688,'URQUIZA (BS. AS.)',2718),(1,689,'UNION FERROVIARIA',1804),(1,690,'URIBELARREA',1815),(1,698,'VIRREY DEL PINO',1763),(1,699,'VILLA FLANDRIA',6706),(1,700,'VILLA GENERAL ARIAS',8101),(1,701,'VILLA GRAL SAVIO',2901),(1,702,'VALDES',6667),(1,703,'VERONICA',1917),(1,704,'VERGARA',7135),(1,705,'FLORENCIO VARELA',1888),(1,706,'VEDIA',6030),(1,707,'25 DE MAYO (BS. AS.)',6660),(1,708,'VIEYTES',1915),(1,709,'LOS TOLDOS EX G VIAM',6015),(1,710,'VICTORIA (BS. AS.)',1644),(1,711,'CNEL VIDAL',7174),(1,712,'VILLA ADELINA',1607),(1,713,'VILLA BALLESTER',1653),(1,714,'VILLA BONICH',1650),(1,715,'VILLA BOSCH',1682),(1,717,'VILLA CELINA',1772),(1,718,'VILLA DOMINICO',1874),(1,719,'VILLA ELISA (BS. AS.)',1894),(1,720,'VILLA FLORIDA',1878),(1,721,'VILLA INSUPERABLE',1752),(1,722,'VILLA LA FLORIDA',1881),(1,723,'VILLA GESELL',7165),(1,724,'VILLA HIDALGO',1655),(1,725,'VILLA INDUSTRIALES',1824),(1,726,'VILLA IRIS',8126),(1,727,'VILLA LIBERTAD',1650),(1,728,'VILLALONGA',8512),(1,729,'VILLA LYNCH',1672),(1,730,'VILLA MADERO',1768),(1,731,'VILLA MAIPU',1650),(1,732,'VILLA MARTELLI',1603),(1,733,'VILLA MAZA',6343),(1,734,'VILLA CHACABUCO',1650),(1,735,'VILLA RAMALLO',2914),(1,736,'VILLA ROSA',1631),(1,737,'VILLA SABOYA',6101),(1,738,'VILLA SARMIENTO (BS. AS.)',1706),(1,739,'VILLA SCASSO',1759),(1,740,'VILLA TESEI',1688),(1,741,'GRAL VILLEGAS',6230),(1,742,'VIÑA',2754),(1,743,'VIRREYES',1646),(1,744,'VILLA CACIQUE',7005),(1,745,'VILLA FURST',1708),(1,746,'VILLA DIAMANTE',1822),(1,747,'VILLA ESPAÑA',1884),(1,748,'VILLA DE MAYO',1613),(1,749,'VILLA ARIZA',1708),(1,750,'VILLA CONSTRUCTORA',1708),(1,751,'VILLA ZAGALA',1651),(1,752,'VILLA BILLINGHURST',1650),(1,753,'VILLA LEON',1714),(1,754,'VIVORATA',7612),(1,755,'VILLA LUZURIAGA',1754),(1,756,'VILLA PREC M CRUZ',6703),(1,757,'VILLA LIA',2761),(1,758,'VILLA SAUZE',6235),(1,759,'VILLANUEVA',7225),(1,760,'WARNES',6646),(1,761,'ING WHITE',8103),(1,762,'WILDE',1875),(1,763,'WILLIAMS MORRIS',1686),(1,764,'VILLA RAFFO',1674),(1,765,'VILLA TRANSRADIO',1776),(1,766,'VILLA GIAMBRUNO',1886),(1,767,'VOLTA',6064),(1,768,'YUTUYACO',6443),(1,769,'YERBAS',7303),(1,770,'YRAIZOZ',7605),(1,779,'ZARATE',2800),(1,780,'ZAVALIA',6018),(1,781,'ZAPIOLA',7249),(1,782,'ZELAYA',1627),(1,783,'ZENON VIDELA DORNA',7226),(1,784,'ZENTENA',7545),(1,785,'ZUBIAURRE',8151),(1,790,'BARRIO BATAN',7601),(1,791,'BELLOCQ',6535),(1,798,'PUERTO',7600),(1,799,'CLUB DE C LA MARTONA',1808),(1,9050,'COOP OBRERA',8000),(1,9051,'ORMAS',8103),(1,9053,'CTRO LA PLATA',1900),(1,10099,'LA GRANJA (BS AS)',1901),(2,0,'CAPITAL FEDERAL',0),(2,9999,'SAAVEDRA (CAP. FED.)',0),(2,10018,'NUÑEZ (CAP. FED.)',0),(2,10039,'AGRONOMÍA',0),(2,10040,'ALMAGRO',0),(2,10041,'BALVANERA',0),(2,10042,'BARRACAS',0),(2,10043,'BELGRANO',0),(2,10044,'BOEDO',0),(2,10045,'CABALLITO',0),(2,10046,'COGHLAN',0),(2,10047,'COLEGIALES',0),(2,10048,'CONSTITUCIÓN',0),(2,10049,'CHACARITA',0),(2,10050,'FLORES',0),(2,10051,'FLORESTA',0),(2,10052,'LA BOCA',0),(2,10053,'LA PATERNAL',0),(2,10054,'LINIERS',0),(2,10055,'MATADEROS',0),(2,10056,'MONTSERRAT',0),(2,10057,'MONTE CASTRO',0),(2,10058,'NUEVA POMPEYA',0),(2,10059,'PALERMO',0),(2,10060,'PARQUE AVELLANEDA',0),(2,10061,'PARQUE CHACABUCO',0),(2,10062,'PARQUE CHAS',0),(2,10063,'PARQUE PATRICIOS',0),(2,10064,'PUERTO MADERO',0),(2,10065,'RECOLETA',0),(2,10066,'RETIRO',0),(2,10067,'SAN CRISTÓBAL',0),(2,10068,'SAN NICOLÁS',0),(2,10069,'SAN TELMO',0),(2,10070,'VELEZ SARSFIELD',0),(2,10071,'VERSALLES',0),(2,10072,'VILLA CRESPO',0),(2,10073,'VILLA DEL PARQUE',0),(2,10074,'VILLA DEVOTO',0),(2,10075,'VILLA GRAL MITRE',0),(2,10076,'VILLA LUGANO',0),(2,10077,'VILLA LURO',0),(2,10078,'VILLA ORTÚZAR',0),(2,10079,'VILLA PUEYRREDON',0),(2,10080,'VILLA REAL',0),(2,10081,'VILLA RIACHUELO',0),(2,10082,'VILLA SANTA RITA',0),(2,10083,'VILLA SOLDATI',0),(2,10084,'VILLA URQUIZA',0),(3,800,'ANDALGALA',4740),(3,809,'BELEN',4750),(3,812,'CAPAYAN',4726),(3,813,'SAN F V DE CATAMARCA',4700),(3,814,'CHUMBICHA',4728),(3,815,'ESQUIU',5261),(3,816,'EL PORTEZUELO',4750),(3,817,'EL PUESTO',5341),(3,818,'FRAY MAMERTO ESQUIU',4709),(3,819,'LA MERCED (CATAMARCA)',4718),(3,820,'LA PUERTA(CATAMARCA)',4711),(3,821,'LA PUERTA DE S. JOSE',4751),(3,822,'LA CIENAGA',5341),(3,823,'MUTQUIN',5317),(3,827,'S ANTONIO DE PACLIN',4719),(3,828,'POMAN',5315),(3,832,'FIAMBALA',5345),(3,839,'QUIROS',5266),(3,843,'RECREO (CATAMARCA)',5260),(3,846,'LONDRES',4753),(3,847,'LOS ALTOS',4723),(3,851,'SAN ANTONIO (CATAMARCA)',4707),(3,852,'SAN ISIDRO (CATAMARCA)',4707),(3,853,'SANTA MARIA (CATAMARCA)',4139),(3,854,'SAN JOSE DTO ESQUIU',4709),(3,855,'SAUJIL',5321),(3,856,'SALADO',5331),(3,857,'SANTA ROSA (CATAMARCA)',4707),(3,858,'SUMALAO',4705),(3,865,'TAPSO',4234),(3,866,'TINOGASTA',5340),(3,870,'TRES PUENTES',4707),(3,879,'VALLE VIEJO',4707),(3,880,'VILLA DOLORES (CATAMARCA)',4707),(4,900,'ACHIRAS',5833),(4,901,'ADELIA MARIA',5843),(4,902,'AGUA DE ORO',5107),(4,903,'ALCIRA EST GIGENA',5813),(4,904,'CAMILO ALDAO',2585),(4,905,'ALEJANDRO',2686),(4,906,'ALICIA',5949),(4,907,'ALMAFUERTE (CBA.)',5854),(4,908,'ALTA GRACIA',5186),(4,909,'ALTO ALEGRE',5121),(4,910,'ALTOS DE CHIPION',2417),(4,911,'ARGUELLO',5147),(4,912,'ARIAS',2624),(4,913,'ARROYITO',2434),(4,914,'ARROYO ALGODON',5909),(4,915,'ARROYO CABRAL',5917),(4,916,'ASSUNTA',2617),(4,917,'ALPA CORRAL',5801),(4,918,'AUSONIA',5901),(4,919,'ALTO VERDE (CBA.)',5205),(4,920,'AMBUL',5299),(4,921,'ATOS PAMPA',5009),(4,922,'VILLA ANIZACATE',5189),(4,923,'ARROYO CORTO',5850),(4,924,'BALNEARIA',5141),(4,925,'BALLESTEROS SUD',2572),(4,926,'BELL VILLE',2550),(4,927,'BENGOLEA',5807),(4,928,'BERROTARAN',5817),(4,929,'BIALET MASSE',5158),(4,930,'BRINKMANN',2419),(4,931,'NICOLAS BRUZONE',6271),(4,932,'HIPOLITO BOUCHARD',6225),(4,933,'BULNES',5845),(4,934,'BARRIO COLON',5000),(4,935,'BARRIO SAN VICENTE',5006),(4,937,'BARRIO GRAL BELGRANO',5014),(4,938,'CAP GRAL O´HIGGINS',2645),(4,939,'CAPILLA DE SITON',5231),(4,940,'CANTERAS EL SAUCE',5107),(4,941,'CAPILLA DE REMEDIOS',5101),(4,942,'CALCHIN',5201),(4,943,'CANALS',2650),(4,944,'CAÑADA VERDE',6275),(4,945,'CAPILLA DEL MONTE',5184),(4,946,'CARNERILLO',5805),(4,947,'CARRILOBO',5915),(4,948,'CINTRA',2559),(4,949,'COLAZO',5965),(4,950,'COLONIA CAROYA',5223),(4,951,'COLONIA MARINA',2424),(4,952,'COLONIA  SAN BARTOLOME',2426),(4,953,'CORDOBA',5000),(4,954,'CNEL BAIGORRIA',5811),(4,955,'CNEL MOLDES (CBA.)',5847),(4,956,'CORRAL DE BUSTOS',2645),(4,957,'CORRALITO',5853),(4,958,'COSQUIN',5166),(4,959,'JAMES CRAIK',5984),(4,960,'CRUZ ALTA',2189),(4,961,'CRUZ DEL EJE',5280),(4,962,'RAMON J CARCANO',5900),(4,963,'CAVANAGH',2625),(4,964,'COLONIA TIROLESA',5101),(4,965,'CANTERAS DE QUILPO',5281),(4,966,'CAROLINA',5841),(4,967,'CAYUQUEO',5901),(4,968,'COSTA SACATE',5961),(4,969,'COLONIA VIGNAUD',2419),(4,970,'CHAJAN',5837),(4,971,'CHARRAS',5807),(4,972,'CHAZON',2675),(4,973,'CHILIBROSTE',2561),(4,974,'CHUCUL',5805),(4,975,'COMECHINGONES',5129),(4,976,'CNEL OLMEDO',5119),(4,977,'COLONIA VIDELA',5865),(4,978,'CASA GRANDE',5162),(4,979,'CERRO DE LAS ROSAS',5009),(4,980,'COLONIA ALMADA',5987),(4,981,'COLONIA BISMARCK',2651),(4,982,'COLONIA PROSPERIDAD',2423),(4,983,'DEAN FUNES',5200),(4,984,'DEL CAMPILLO',6271),(4,985,'DESPEÑADEROS',5121),(4,986,'DEVOTO',2424),(4,987,'DUMESNIL',5149),(4,988,'DIQUE LOS MOLINOS',5192),(4,989,'PARQUE SIQUIMAN',5158),(4,996,'EL ARAÑADO',5947),(4,997,'EL CANO',5231),(4,998,'ELENA',5815),(4,999,'EL FORTIN',5951),(4,1000,'EL TIO',2432),(4,1001,'W ESCALANTE',2655),(4,1002,'ETRURIA',2681),(4,1003,'EMBALSE RIO TERCERO',5856),(4,1004,'EST GRAL PAZ',5145),(4,1005,'EL MANZANO',5107),(4,1006,'ESPINILLO',5811),(4,1007,'EL QUEBRACHAL(CBA.)',5101),(4,1011,'FERREYRA',5123),(4,1012,'FREYRE',2413),(4,1013,'FUERZAS ECONOMICAS',5870),(4,1019,'GRAL FOTHERINGHAN',5933),(4,1020,'GRAL BALDISSERA',2583),(4,1021,'GRAL CABRERA',5809),(4,1022,'GRAL DEHEZA',5923),(4,1023,'GRAL LEVALLE',6132),(4,1024,'GRAL ROCA(CBA.)',2592),(4,1026,'GUATIMOZIN',2627),(4,1027,'GUIÑAZU',5145),(4,1036,'HERNANDO',5929),(4,1037,'HOLMBERG',5825),(4,1038,'HUERTA GRANDE',5174),(4,1039,'HUINCA RENANCO',6270),(4,1040,'HUANCHILLA',6121),(4,1049,'IDIAZABAL',2557),(4,1050,'INRIVILLE',2587),(4,1051,'ISLA VERDE',2661),(4,1052,'ITALO',6271),(4,1053,'ISCHILIN',5201),(4,1054,'BARRIO IPONA',5000),(4,1059,'LUCA',5917),(4,1061,'JESUS MARIA (CBA.)',5220),(4,1062,'JOVITA',6127),(4,1063,'MARCOS JUAREZ',2580),(4,1064,'JUSTINIANO POSSE',2553),(4,1065,'JOSE DE LA QUINTANA',5189),(4,1066,'JUAREZ CELMAN',5145),(4,1067,'LA SERRANITA',5189),(4,1068,'LA PAMPA',5117),(4,1069,'LAGUNA DEL MONTE',6101),(4,1070,'LA CRUZ (CBA.)',5859),(4,1071,'LOS MOLINOS (CBA.)',5189),(4,1072,'LABOULAYE',6120),(4,1073,'LABORDE',2657),(4,1074,'LA CALERA',5151),(4,1075,'LA CARLOTA',2670),(4,1076,'LA CAUTIVA',6142),(4,1077,'LA CESIRA',6101),(4,1078,'LA CUMBRE',5801),(4,1079,'LA FALDA',5172),(4,1080,'LA FRANCIA',2426),(4,1081,'LAGUNA LARGA',5974),(4,1082,'LA LAGUNA',5284),(4,1083,'LA PAQUITA',2417),(4,1084,'LA PAZ (CBA.)',5220),(4,1085,'LA PARA',5137),(4,1086,'LAS ACEQUIAS',5848),(4,1087,'LAS ARRIAS',5231),(4,1088,'LAS HIGUERAS',5805),(4,1089,'LAS JUNTURAS',5965),(4,1090,'LAS PEÑAS',5817),(4,1091,'LAS PERDICES',5921),(4,1092,'S M LASPIUR',5943),(4,1093,'LAS VARAS',5941),(4,1094,'LAS VARILLAS',5940),(4,1095,'LAS VERTIENTES',5827),(4,1096,'COLONIA LA TORDILLA',2435),(4,1097,'ALEJO LEDESMA',2662),(4,1098,'LEONES',2594),(4,1099,'LOS BOULEVARES',5147),(4,1100,'LOS CISNES',2684),(4,1101,'LOS COCOS',5181),(4,1102,'LOS CONDORES',5823),(4,1103,'LOS SURGENTES',2581),(4,1104,'LOS ZORROS',5901),(4,1105,'LUQUE',5967),(4,1106,'LUXARDO',2411),(4,1107,'LOS CERRILLOS',5871),(4,1108,'LA PLAYOSA',5911),(4,1109,'LA PUERTA (CBA.)',5137),(4,1110,'LOZADA',5101),(4,1111,'LA GRANJA',5115),(4,1112,'LAS FLORES (CBA.)',5249),(4,1113,'LOS REYUNOS (CBA.)',5925),(4,1114,'MALAGUEÑO',5101),(4,1115,'MANFREDI',5988),(4,1116,'MARULL',5139),(4,1117,'MATORRALES',5965),(4,1118,'MATTALDI',6271),(4,1119,'MELO',6123),(4,1120,'MINA CLAVERO',5889),(4,1121,'MIRAMAR (CBA.)',5143),(4,1122,'MONTE BUEY',2589),(4,1123,'MONTE CRISTO',5125),(4,1124,'MONTE MAIZ',2659),(4,1125,'MONTE RALO',5119),(4,1126,'MORTEROS',2421),(4,1127,'MORRISON',2568),(4,1128,'MOLINARI',5166),(4,1129,'LUCIO V MANSILLA',5216),(4,1130,'MALVINAS ARGENTINAS',5125),(4,1131,'MENDIOLAZA',5107),(4,1132,'MONTE DE LOS GAUCHOS',5839),(4,1133,'LAS MOJARRAS',5909),(4,1134,'NOETINGER',2563),(4,1135,'NONO',5887),(4,1144,'OBISPO TREJO',5225),(4,1145,'OLAETA',5807),(4,1146,'OLIVA',5980),(4,1147,'ONCATIVO',5986),(4,1148,'ORDOÑEZ',2555),(4,1149,'ONAGOITY',6227),(4,1154,'PASO VIEJO',5284),(4,1155,'BARRIO PUEYRREDON',5012),(4,1156,'BARRIO P GUAYAQUIL',5012),(4,1157,'PAMPAYASTA SUD',5931),(4,1158,'PASCANAS',2679),(4,1159,'PASCO (CBA.)',5925),(4,1160,'PASO DEL TIGRE',5000),(4,1161,'COLONIA  SILVIO PELLICO',5907),(4,1162,'PILAR (CBA.)',5972),(4,1163,'PORTEÑA',2415),(4,1164,'POZO DEL MOLLE',5913),(4,1165,'PIQUILLIN',5125),(4,1166,'PUEBLO ITALIANO',2651),(4,1167,'PINCEN',6271),(4,1168,'PICHANAS',5284),(4,1175,'QUEBRACHO HERRADO',2423),(4,1176,'QUILINO',5214),(4,1178,'RAYO CORTADO',5246),(4,1181,'SAN JOSE (CBA.)',5871),(4,1182,'RIVERA INDARTE',5149),(4,1183,'RAFAEL GARCIA',5119),(4,1184,'RINCON',5961),(4,1185,'REDUCCION',5803),(4,1186,'RIO CEBALLOS',5111),(4,1187,'RIO CUARTO',5800),(4,1188,'RIO DE LOS SAUCES',5821),(4,1189,'RIO PRIMERO',5127),(4,1190,'RIO SEGUNDO',5960),(4,1191,'RIO TERCERO',5850),(4,1192,'RODEO VIEJO',5801),(4,1193,'ROSALES',6128),(4,1194,'SINSACATE',5220),(4,1195,'SAN PEDRO (CBA.)',5871),(4,1196,'SALSACATE',5295),(4,1197,'SAN LORENZO (CBA.)',5221),(4,1198,'SAN IGNACIO (CBA.)',5199),(4,1199,'SALADILLO (CBA.)',2587),(4,1200,'SAN MARCOS SIERRA',5282),(4,1201,'SAN MARCOS SUD',2566),(4,1202,'SACANTA',5945),(4,1203,'SAIRA',2525),(4,1204,'SALSIPUEDES',5113),(4,1205,'SAMPACHO',5829),(4,1206,'SAN AGUSTIN (CBA.)',5191),(4,1207,'SAN AMBROSIO',5848),(4,1208,'SAN BASILIO',5841),(4,1209,'SAN ESTEBAN',5182),(4,1210,'SAN FERNANDO (CBA.)',5000),(4,1211,'SAN FRANCISCO (CBA.)',2400),(4,1212,'SAN PEDRO NORTE',5205),(4,1213,'SANTA EUFEMIA',2671),(4,1214,'STA MARIA DE PUNILLA',5164),(4,1215,'S ROSA RIO PRIMERO',5133),(4,1216,'SEEBER',2419),(4,1217,'SERRANO',6125),(4,1218,'SERREZUELA',5270),(4,1219,'SIMBOLAR (CBA.)',5242),(4,1220,'SALDAN',5149),(4,1221,'SUCO',5837),(4,1222,'STA R DE CALAMUCHITA',5196),(4,1223,'SANABRIA',5901),(4,1224,'SAN ANTONIO DE LITIN',2559),(4,1225,'SAN JAVIER (CBA.)',5875),(4,1226,'SAN FCO DEL CHAÑAR',5209),(4,1227,'S J DE LA DORMIDA',5244),(4,1228,'SAN CARLOS (CBA.)',5212),(4,1229,'SAN VICENTE (CBA.)',5871),(4,1230,'TANCACHA',5933),(4,1231,'SANTIAGO TEMPLE',5125),(4,1232,'TICINO',5925),(4,1233,'TOSQUITA',6141),(4,1234,'TRANSITO',2436),(4,1235,'TANTI',5155),(4,1236,'TIO PUJIO',5936),(4,1237,'TOLEDO',5123),(4,1238,'TALA CA&ADA',5297),(4,1243,'UCACHA',2677),(4,1244,'UNQUILLO',5109),(4,1246,'VILLA LA BOLSA',5189),(4,1247,'VILLA DE LAS ROSAS',5885),(4,1248,'ZONA 1',5000),(4,1249,'ZONA 2',5000),(4,1250,'ZONA 3',5008),(4,1251,'ZONA 4',5009),(4,1252,'ZONA 5',5000),(4,1253,'VALLE HERMOSO',5168),(4,1254,'DALMACIO VELEZ',5919),(4,1255,'VIAMONTE',2671),(4,1256,'VICUÑA MACKENNA',6140),(4,1257,'VILLA ALLENDE',5105),(4,1258,'VILLA ASCASUBI',5935),(4,1259,'VILLA BUSTOS (CBA.)',5164),(4,1260,'VILLA CARLOS PAZ',5152),(4,1261,'VILLA CONC DEL TIO',2433),(4,1262,'VILLA CURA BROCHERO',5891),(4,1263,'VILLA DEL ROSARIO-CB',5963),(4,1264,'VILLA DE SOTO',5284),(4,1265,'VILLA DOLORES (CBA.)',5870),(4,1266,'VILLA FONTANA (CBA.)',5137),(4,1267,'VILLA GRAL BELGRANO',5194),(4,1268,'VILLA GRAL MITRE',5236),(4,1269,'VILLA GIARDINO',5176),(4,1270,'VILLA HUIDOBRO',6275),(4,1271,'VILLA MARIA',5900),(4,1272,'VILLA NUEVA (CBA.)',5903),(4,1273,'VILLA VALERIA',6273),(4,1274,'VILLA TULUMBA',5203),(4,1275,'V D M DEL RIO SECO',5248),(4,1276,'VIALE (CBA.)',5000),(4,1277,'VILLA SARMIENTO (CBA.)',6273),(4,1278,'VILLA DEL DIQUE',5862),(4,1279,'VILLA SANTA ISABEL',5857),(4,1280,'VILLA INDEPENDENCIA',5153),(4,1281,'VILLA DEL TOTORAL',5236),(4,1282,'VILLA ROSSI',6128),(4,1283,'VILLA RUMIPAL',5864),(4,1284,'VILLA ESQUIU',5101),(4,1285,'VILLA ICHO CRUZ',5153),(4,1286,'WASHINGTON',6144),(4,1287,'ZONA 6',5000),(4,1288,'ZONA 7',5000),(4,1289,'ZONA 8',5000),(4,1290,'ZONA 9',5000),(4,1291,'ZONA 10',5000),(4,1292,'ZONA 11',5006),(4,1293,'ZONA 12',5000),(4,1294,'YOCSINA',5101),(4,1295,'ANA ZUMARAN',5905),(4,1296,'ZONA 13',5000),(4,1297,'ZONA 14',5000),(4,1298,'ZONA 15',5000),(4,1299,'RIO SECO (CBA.)',5284),(4,3340,'FRONTERA',2438),(4,9052,'ASOC VIAJ COMERCIO',5000),(4,9996,'ZONA 16',5000),(4,9997,'ZONA 21',5000),(4,10100,'VILLA YACANTO DE CALAMUCHITA ',5197),(5,1300,'ALVEAR (CTES.)',3344),(5,1307,'BELLA VISTA (CTES.)',3432),(5,1308,'BERON DE ASTRADA',3481),(5,1313,'COLONIA LIBERTAD',3224),(5,1314,'COLONIA LIEBIG S',3358),(5,1315,'EMILIO R CONI',3465),(5,1316,'CORRIENTES',3400),(5,1317,'CURUZU CUATIA',3460),(5,1318,'COLONIA PORVENIR',3451),(5,1319,'CONCEPCION (CTES.)',3423),(5,1322,'CHAVARRIA',3474),(5,1324,'EMPEDRADO',3418),(5,1325,'ESQUINA',3196),(5,1331,'GDOR ING V VIRASORO',3342),(5,1332,'GDOR MARTINEZ',3445),(5,1333,'GOYA',3450),(5,1334,'GRAL PAZ',3407),(5,1335,'GUAVIRAVI',3232),(5,1336,'GUAYQUIRARO',3194),(5,1337,'GARRUCHOS',3351),(5,1340,'ITA IBATE',3480),(5,1341,'ITATI',3414),(5,1342,'ITUZAINGO (CTES.)',3302),(5,1343,'ISABEL VICTORIA',3453),(5,1348,'LA CRUZ (CTES.)',3346),(5,1349,'LORETO (CTES.)',3483),(5,1350,'LAVALLE (CTES.)',3443),(5,1355,'MANUEL F MANTILLA',3446),(5,1356,'MARUCHAS',3451),(5,1357,'MBURUCUYA',3427),(5,1358,'MERCEDES (CTES.)',3470),(5,1359,'MONTE CASEROS',3220),(5,1360,'MOCORETA',3226),(5,1362,'NUEVE DE JULIO (CTES.)',3445),(5,1366,'PASO DE LOS LIBRES',3230),(5,1367,'PERUGORRIA',3461),(5,1368,'JUAN PUJOL',3222),(5,1369,'PASO DE LA PATRIA',3409),(5,1371,'RAMADA PASO',3412),(5,1372,'RIACHUELO',3416),(5,1374,'SAN COSME',3412),(5,1375,'SALADAS (CTES.)',3420),(5,1376,'SAN LORENZO (CTES.)',3416),(5,1377,'SAN LUIS DEL PALMAR',3403),(5,1378,'SAN MIGUEL (CTES.)',3485),(5,1379,'SAN ROQUE (CTES.)',3448),(5,1380,'SANTA LUCIA (CTES.)',3440),(5,1381,'SANTO TOME (CTES.)',3340),(5,1382,'SAUCE',3463),(5,1383,'SOLARI',3476),(5,1384,'SANTA ROSA (CTES)',3421),(5,1385,'SANTA ANA (CTES.)',3401),(5,1386,'SAN CARLOS (CTES.)',3306),(5,1389,'YAPEYU',3231),(5,1390,'FELIPE YOFRE',3472),(5,1399,'YACYRETA',3302),(6,1400,'AVIA TERAI',3706),(6,1410,'BASAIL',3516),(6,1411,'BARRANQUERAS',3503),(6,1412,'MARGARITA BELEN',3505),(6,1423,'CAMPO LARGO',3716),(6,1424,'JUAN JOSE CASTELLI',3705),(6,1425,'COLONIA ELISA',3515),(6,1426,'COLONIAS UNIDAS',3500),(6,1427,'CNEL DU GRATY',3541),(6,1428,'CORZUELA',3718),(6,1429,'COTE LAI',3513),(6,1430,'CONC DEL BERMEJO',3708),(6,1431,'COLONIA BARANDA',3505),(6,1432,'CAPITAN SOLARI',3515),(6,1433,'COLONIA  ABORIGEN CHACO',3531),(6,1434,'COLONIA BENITEZ',3514),(6,1438,'CHARADAI',3513),(6,1439,'CHARATA',3730),(6,1446,'EL ZAPALLAR',3509),(6,1450,'FONTANA',3514),(6,1455,'GANCEDO',3734),(6,1461,'GRAL PINEDO',3732),(6,1462,'GRAL J DE S MARTIN',3509),(6,1463,'GRAL VEDIA',3522),(6,1474,'HERMOSO CAMPO',3733),(6,1485,'LA CLOTILDE',3701),(6,1486,'LA ESCONDIDA',3514),(6,1487,'LAGUNA LIMPIA',3515),(6,1488,'LA LEONESA',3518),(6,1489,'LAS BREÑAS',3722),(6,1490,'LAS GARCITAS',3515),(6,1491,'LAS PALMAS',3518),(6,1492,'LA TIGRA',3701),(6,1493,'LA VERDE',3514),(6,1494,'LA TAMBORA',3534),(6,1504,'MACHAGAY',3534),(6,1505,'MAKALLE',3514),(6,1506,'MARIA DE ORO',3730),(6,1507,'MESON DE FIERRO',3731),(6,1511,'NUEVA POMPEYA',3634),(6,1515,'NAPENAY',3706),(6,1516,'PAMPA DEL INDIO',3531),(6,1517,'PAMPA DEL INFIERNO',3708),(6,1518,'PAMPA LANDRIEL',3731),(6,1519,'PTE DE LA PLAZA',3536),(6,1520,'PRCIA R SAENZ PE~A',3700),(6,1521,'PRCIA ROCA',3511),(6,1522,'PUERTO BERMEJO',3524),(6,1523,'PUERTO TIROL',3505),(6,1524,'PAMPA GRANDE',3701),(6,1525,'PUERTO ANTEQUERA',3505),(6,1526,'PUERTO VILELAS',3503),(6,1534,'QUITILIPI',3530),(6,1545,'RESISTENCIA',3500),(6,1556,'SAN BERNARDO (CHACO)',3701),(6,1557,'SANTA SYLVINA',3541),(6,1558,'SAMUHU',3543),(6,1569,'TRES ISLETAS',3703),(6,1570,'TACO POZO',3714),(6,1580,'VILLA ANGELA',3540),(6,1581,'VILLA BERTHET',3545),(6,1582,'VILLA BARBERAN',3500),(7,1600,'FLORENTINO AMEGHINO',9113),(7,1601,'ALTO RIO SENGUER',9033),(7,1602,'ALTO RIO MAYO',9037),(7,1604,'ASTRA',9001),(7,1605,'RADA TILLY',9001),(7,1606,'BEGHIN',9000),(7,1608,'CAMARONES',9111),(7,1609,'SARMIENTO (CHUBUT)',9020),(7,1610,'COMODORO RIVADAVIA',9000),(7,1611,'CALETA CORDOVA',9003),(7,1612,'CORCOVADO',9201),(7,1613,'CUSHAMEN',9211),(7,1615,'CHOLILA',9217),(7,1621,'DIADEMA ARGENTINA',9009),(7,1622,'DOLAVON',9107),(7,1624,'DON BOSCO',9000),(7,1627,'EL HOYO (CHUBUT)',9211),(7,1628,'EL MAITEN',9210),(7,1630,'EPUYEN',9211),(7,1631,'ESCALANTE',9009),(7,1632,'ESQUEL',9200),(7,1638,'FACUNDO',9031),(7,1639,'FUTALEUFU',9200),(7,1642,'GAN GAN',9121),(7,1643,'GAIMAN',9105),(7,1644,'GARAYALDE',9007),(7,1645,'GRAL MOSCONI',9000),(7,1647,'GDOR COSTA',9223),(7,1651,'JOSE DE SAN MARTIN',9220),(7,1652,'KM 5',9001),(7,1653,'LA LOMA',9000),(7,1654,'LAPRIDA',9001),(7,1655,'LAGO PUELO',8431),(7,1656,'LELEQUE',9213),(7,1657,'NAMUNCURA',9000),(7,1658,'NEWBERY',9000),(7,1661,'PALAZZO',9000),(7,1662,'PASO DE INDIOS',9207),(7,1663,'PICO SALAMANCA',9000),(7,1664,'PLAYA UNION',9103),(7,1665,'PUERTO MADRYN',9120),(7,1666,'PTE ORTIZ(CHUBUT)',9000),(7,1667,'PUEYRREDON',9000),(7,1668,'PUERTO PIRAMIDES',9121),(7,1676,'RAWSON (CHUBUT)',9103),(7,1677,'RIO MAYO',9030),(7,1686,'TELSEN',9121),(7,1687,'TECKA',9201),(7,1688,'TRELEW',9100),(7,1689,'TREVELIN',9203),(7,1693,'VEINTIOCHO DE JULIO',9107),(8,1700,'ALCARAZ',3142),(8,1701,'ARANGUREN',3162),(8,1703,'ALDEA MARIA LUISA',3114),(8,1704,'ALDEA SAN ANTONIO',2826),(8,1705,'ALDEA PROTESTANTE',3101),(8,1706,'ALDEA BRASILERA',3101),(8,1707,'ARROYO BARU',3269),(8,1708,'ALDEA SANTA MARIA',3123),(8,1709,'ARROYO URQUIZA',3280),(8,1710,'BASAVILBASO',3170),(8,1711,'BOVRIL',3142),(8,1712,'BAJADA GRANDE',3100),(8,1713,'BETBEDER',3156),(8,1718,'CEIBAS',2823),(8,1719,'CALABACILLAS',3203),(8,1720,'CAMPS',3164),(8,1721,'CASEROS (ENTRE RIOS)',3262),(8,1722,'CERRITO',3122),(8,1723,'COLON (ENTRE RIOS)',3280),(8,1724,'COLONIA HOKER',3265),(8,1725,'COLONIA NUEVA',3281),(8,1726,'COLONIA  SAN CIPRIANO',3263),(8,1727,'CONC DEL URUGUAY',3260),(8,1728,'CONCORDIA',3200),(8,1729,'CRESPO',3116),(8,1730,'CRUCESITAS 8',3177),(8,1731,'CRUCESITAS 7',3109),(8,1732,'COLONIA AVIGDOR',3142),(8,1733,'COLONIA  SAN BONIFACIO',3212),(8,1734,'COLONIA ADELA',3201),(8,1735,'COLONIA SAN ERNESTO',3254),(8,1736,'CONSCRIPTO BERNARDI',3188),(8,1739,'CHAJARI',3228),(8,1747,'AYUI',3204),(8,1748,'DIAMANTE',3105),(8,1755,'EL BRILLANTE',3283),(8,1756,'ECHAGUE',2845),(8,1757,'EL CIMARRON',3188),(8,1759,'PUIGGARI',3103),(8,1760,'SOLA',3176),(8,1761,'HERRERA (ENTRE RIOS)',3272),(8,1762,'EL PINGO',3132),(8,1763,'SOSA',3133),(8,1764,'ENRIQUE CARBO',2852),(8,1765,'OSVALDO MAGNASCO',3212),(8,1766,'EL REDOMON',3212),(8,1768,'FEDERACION',3206),(8,1769,'FEDERAL',3180),(8,1776,'GRAL ALVEAR (ENTRE RIOS)',3101),(8,1777,'GRAL CAMPOS',3216),(8,1778,'GRAL GALARZA',2843),(8,1779,'MACIA',3177),(8,1780,'GDOR MANSILLA',2845),(8,1782,'LUCAS GONZALEZ',3158),(8,1783,'GUALEGUAY',2840),(8,1784,'GUALEGUAYCHU',2820),(8,1785,'GILBERT',2828),(8,1792,'HASENKAMP',3134),(8,1793,'HOLT',2846),(8,1799,'IRAZUSTA',2852),(8,1800,'IBICUY',2846),(8,1801,'ISLAS DEL IBICUY',2823),(8,1802,'ING MIGUEL SAJAROFF',3246),(8,1803,'ISLAS LECHIGUANAS',2846),(8,1804,'JUBILEO',3254),(8,1806,'LA PICADA',3118),(8,1807,'LA CLARITA',3269),(8,1808,'LA CRIOLLA (ENTRE RIOS)',3212),(8,1809,'LAS MOSCAS',3244),(8,1810,'LA PAZ (ENTRE RIOS)',3190),(8,1811,'LARROQUE',2854),(8,1812,'LOS CHARRUAS',3212),(8,1813,'LIBAROS',3244),(8,1814,'LEGUIZAMON',3285),(8,1815,'LIEBIG',3281),(8,1816,'LAZO',2841),(8,1817,'LOS CONQUISTADORES',3183),(8,1820,'NOGOYA',3150),(8,1821,'NUEVA ESCOCIA',3201),(8,1824,'ORO VERDE',3100),(8,1827,'PUEBLO CAZES',3269),(8,1828,'PARANA',3100),(8,1829,'PIEDRAS BLANCAS',3129),(8,1830,'PUEBLO BRUGO',3125),(8,1831,'PRONUNCIAMIENTO',3263),(8,1832,'PERDICES',2823),(8,1833,'PRIMERO DE MAYO',3263),(8,1834,'PASO DE LA LAGUNA',3241),(8,1835,'RAICES',3177),(8,1837,'ROCAMORA',3172),(8,1838,'ROSARIO DEL TALA',3174),(8,1845,'SAN BENITO',3107),(8,1846,'SAN GUSTAVO',3191),(8,1847,'SAN JAIME',3185),(8,1848,'SAN JOSE (ENTRE RIOS)',3283),(8,1849,'S JOSE DE FELICIANO',3187),(8,1850,'SAN SALVADOR',3218),(8,1851,'SANTA ELENA',3192),(8,1852,'SAUCE DE LUNA',3144),(8,1853,'SANTA ANITA',3248),(8,1854,'SAN JUSTO (ENTRE RIOS)',3262),(8,1855,'SAUCE PINTO',3107),(8,1856,'STROBEL',3101),(8,1857,'TABOSSI',3111),(8,1858,'TRES BOCAS',3155),(8,1859,'UBAJAY',3287),(8,1860,'URDINARRAIN',2826),(8,1861,'URQUIZA (ENTRE RIOS)',3248),(8,1862,'TEZANOS PINTO',3114),(8,1867,'VALLE MARIA',3101),(8,1868,'VICTORIA (ENTRE RIOS)',3153),(8,1869,'VILLA CLARA',3252),(8,1870,'VILLA DEL ROSARIO-ER',3229),(8,1871,'VILLA DOMINGUEZ',3246),(8,1872,'COLONIA ELIA',3261),(8,1873,'VILLA ELISA (ENTRE RIOS)',3265),(8,1874,'VILLAGUAY',3240),(8,1875,'VILLA HERNANDARIAS',3127),(8,1876,'VILLA MARIA GRANDE',3133),(8,1877,'GRAL RAMIREZ',3164),(8,1878,'SEGUI',3117),(8,1879,'VIALE (ENTRE RIOS)',3109),(8,1880,'HERNANDEZ',3156),(8,1881,'VILLA MANTERO',3272),(8,1882,'VILLA L G SAN MARTIN',3103),(8,1883,'COLONIA N MONTEVIDEO',2828),(8,1884,'VILLA ZORRAQUIN',3201),(8,1885,'VILLA FONTANA (ENTRE RIOS)',3114),(8,1886,'VILLA URQUIZA',3113),(8,1887,'VILLA PARANACITO',2823),(8,1893,'YUQUERI',3214),(8,10101,'VILLA SAN MARCIAL',3248),(8,10102,'COLONIA AVELLANEDA',3107),(8,10103,'ALDEA JACOBI',3116),(8,10105,'COLONIA BERTOZZI',3137),(8,10106,'ESTAFETA EL SOLAR',3137),(8,10107,'COLONIA VAZQUEZ',3267),(8,10108,'ALDEA SPATZENKUTTER',3101),(8,10109,'PUEBLO BELGRANO',2821),(8,10110,'COLONIA LA LLAVE',3158),(9,1900,'AG ARGENTINO ALEGRE',3608),(9,1906,'BOUVIER',3610),(9,1909,'CLORINDA',3610),(9,1910,'COLONIA VILLAFAÑE',3600),(9,1911,'COLONIA PASTORIL',3601),(9,1912,'CTE FONTANA',3620),(9,1920,'ESTANISLAO DEL CAMPO',3626),(9,1930,'EL COLORADO',3603),(9,1931,'EL ESPINILLO',3615),(9,1941,'FORMOSA',3600),(9,1944,'GRAN GUARDIA',3604),(9,1945,'GRAL MANUEL BELGRANO',3615),(9,1951,'IBARRETA',3624),(9,1952,'ING JUAREZ',3636),(9,1960,'LAGUNA NAICH NECK',3611),(9,1961,'LAGUNA BLANCA',3613),(9,1962,'LAS LOMITAS',3630),(9,1963,'LAGUNA YEMA',3634),(9,1967,'MISION F TAGAAGLE',3606),(9,1972,'PIRANE',3606),(9,1973,'POZO DEL TIGRE',3628),(9,1975,'PUERTO PILCOMAYO',3611),(9,1976,'PUERTO VELAZ',3526),(9,1977,'PUERTO DALMACIA',3600),(9,1978,'PALO SANTO',3608),(9,1984,'RIACHO HE HE',3611),(9,1988,'SAN FCO DEL LAISHI',3601),(9,1991,'TRES LAGUNAS (FORMOSA)',3611),(9,1995,'VILLA DOS TRECE',3603),(10,2000,'ABRA PAMPA',4640),(10,2001,'AGUA CALIENTE',4641),(10,2005,'CALILEGUA',4514),(10,2006,'CAIMANCITO',4516),(10,2008,'CHALICAN',4504),(10,2016,'LEON',4616),(10,2023,'EL AGUILAR',4634),(10,2024,'EL CARMEN',4608),(10,2025,'EL PIQUETE',4501),(10,2026,'EST PERICO',4608),(10,2034,'FRAILE PINTADO',4506),(10,2041,'HUACALERA',4626),(10,2042,'HUMAHUACA',4630),(10,2044,'ITURBE',4632),(10,2059,'LA MENDIETA',4522),(10,2060,'LA QUIACA',4650),(10,2061,'LEDESMA',4512),(10,2062,'LIBERTADOR S MARTIN',4512),(10,2063,'LOS ALISOS',4600),(10,2064,'LOZANO',4616),(10,2067,'MAIMARA',4622),(10,2069,'MINA PIRQUITAS',4643),(10,2070,'MONTE RICO',4608),(10,2075,'OROSMAYO',4643),(10,2076,'PALMA SOLA',4501),(10,2077,'PAMPA BLANCA',4606),(10,2078,'PALPALA',4612),(10,2079,'PERICO DEL CARMEN',4603),(10,2080,'PURMAMARCA',4618),(10,2084,'REYES',4600),(10,2085,'RIO BLANCO',4601),(10,2087,'SAN PEDRITO DPTO CAP',4600),(10,2088,'SAN PEDRO DE JUJUY',4500),(10,2089,'SAN SALVADOR DE JUJUY',4600),(10,2090,'SAN ANTONIO (JUJUY)',4503),(10,2091,'SANTO DOMINGO (JUJUY)',4608),(10,2092,'SANTA CLARA',4501),(10,2094,'TILCARA',4624),(10,2097,'VILLA GORRITI',4600),(10,2098,'VOLCAN',4616),(10,2099,'YUTO',4518),(11,2100,'ABRAMO',8212),(11,2101,'ALPACHIRI',6309),(11,2102,'ALTA ITALIA',6207),(11,2103,'TOMAS M DE ANCHORENA',6301),(11,2104,'ANGUIL',6326),(11,2105,'ARATA',6385),(11,2106,'JACINTO ARAUZ',8208),(11,2107,'ATALIVA ROCA',6301),(11,2108,'AGUSTONI',6361),(11,2109,'ARBOL SOLO',6323),(11,2116,'BERNASCONI',8204),(11,2125,'CARRO QUEMADO',6319),(11,2126,'CALEUFU',6387),(11,2127,'MIGUEL CANE',6331),(11,2128,'EDUARDO CASTEX',6380),(11,2129,'CATRILO',6330),(11,2130,'CEBALLOS',6221),(11,2131,'COLONIA BARON',6315),(11,2132,'COLONIA SANTA MARIA',8214),(11,2133,'CONHELLO',6381),(11,2134,'CNEL HILARIO LAGOS',6228),(11,2135,'CASA DE PIEDRA',6300),(11,2140,'CHACHARRAMENDI',8201),(11,2144,'DOBLAS',6305),(11,2145,'DORILA',6365),(11,2154,'EMBAJADOR MARTINI',6203),(11,2163,'GRAL MANUEL CAMPOS',6309),(11,2164,'GRAL ACHA',8200),(11,2165,'GRAL PICO',6360),(11,2166,'G.SAN MARTIN (LA PAMPA)',8206),(11,2167,'GUATRACHE',6311),(11,2172,'HUCAL',8212),(11,2177,'ING LUIGGI',6205),(11,2178,'INTENDENTE ALVEAR',6221),(11,2184,'LIMAY MAHUIDA',8201),(11,2185,'LA GLORIA',6348),(11,2186,'LA ADELA',8138),(11,2187,'LA MARUJA',6385),(11,2188,'BERNARDO LARROUDE',6220),(11,2189,'LONQUIMAY',6352),(11,2190,'LUAN TORO',6380),(11,2191,'MARIANO MIRO',6228),(11,2199,'MAISONNAVE',6212),(11,2200,'MACACHIN',6307),(11,2201,'MAURICIO MAYER',6315),(11,2202,'MONTE NIEVAS',6383),(11,2203,'METILEO',6360),(11,2204,'EMILIO MITRE',6323),(11,2212,'PARERA',6213),(11,2213,'PICHI HUINCA',6385),(11,2214,'PUELCHES',8201),(11,2215,'PERU',8212),(11,2216,'PUELEN',8201),(11,2222,'QUEHUE',6325),(11,2223,'QUEMU QUEMU',6333),(11,2224,'QUETQUEN',6360),(11,2234,'RANCUL',6214),(11,2235,'REALICO',6200),(11,2236,'MIGUEL RIGLOS',6301),(11,2237,'ROLON',6305),(11,2247,'SANTA ROSA (LA PAMPA)',6300),(11,2248,'SANTA ISABEL (LA PAMPA)',6323),(11,2249,'SPELUZZI',6365),(11,2257,'TELEN',6321),(11,2258,'TOAY',6303),(11,2259,'TRENEL',6369),(11,2260,'TREBOLARES',6361),(11,2269,'URIBURU',6354),(11,2278,'ADOLFO VAN PRAET',6212),(11,2279,'VERTIZ',6365),(11,2280,'VICTORICA',6319),(11,2281,'VILLA MIRASOL',6315),(11,2282,'COLONIA 25 DE MAYO',8307),(11,2291,'WINIFREDA',6313),(12,2300,'AIMOGASTA',5310),(12,2301,'ANILLACO',5301),(12,2309,'CATUNA',5275),(12,2310,'COCHANGASTA',5300),(12,2311,'CAMPANAS',5361),(12,2312,'CHEPES',5470),(12,2313,'CHAMICAL',5380),(12,2314,'CHILECITO',5360),(12,2315,'CHEPES VIEJO',5470),(12,2316,'CHUQUIS',5301),(12,2320,'EST MAZAN',5313),(12,2321,'FAMATINA',5365),(12,2325,'GDOR GORDILLO',5380),(12,2335,'LA RIOJA',5300),(12,2336,'LOS MOLINOS (LA RIOJA)',5301),(12,2356,'MILAGRO',5274),(12,2367,'NONOGASTA',5372),(12,2373,'OLTA',5383),(12,2378,'PATQUIA',5386),(12,2379,'PINCHAS',5301),(12,2381,'SALICAS',5327),(12,2382,'SCHAQUI',5329),(12,2385,'TALVA',5381),(12,2386,'ULAPES',5473),(12,2387,'RIVADAVIA (LA RIOJA)',5355),(12,2388,'VILLA BUSTOS (LA RIOJA)',5301),(12,2389,'VILLA MAZAN',5313),(12,2390,'VILLA UNION',5350),(12,2391,'VINCHINA',5357),(12,2395,'TALAMUYUNA',5304),(13,2400,'ALGARROBAL',5541),(13,2401,'ALTO VERDE (MENDOZA)',5582),(13,2402,'RODOLFO ISELIN',5603),(13,2403,'BERMEJO',5523),(13,2404,'BOWEN',5634),(13,2405,'BARRANCAS (MENDOZA)',5517),(13,2406,'EUGENIO BUSTOS',5569),(13,2407,'BUEN ORDEN',5570),(13,2408,'BUENA NUEVA',5223),(13,2409,'CUADRO BOMBAL',5607),(13,2410,'CUADRO BENEGAS',5603),(13,2411,'CENTRO',5500),(13,2412,'CARRODILLA',5505),(13,2413,'CARRIZAL DE ABAJO',5509),(13,2414,'COSTA DE ARAUJO',5535),(13,2415,'COQUIMBITO',5513),(13,2416,'COLONIA ALVEAR OESTE',5632),(13,2417,'CUADRO NACIONAL',5607),(13,2418,'CHACRAS DE CORIA',5505),(13,2419,'CHAPANAY',5589),(13,2420,'COLONIA LAS ROSAS',5565),(13,2421,'CARMENSA',5621),(13,2422,'COLONIA  TRES DE MAYO',5543),(13,2423,'CAÑADA SECA (MENDOZA)',5603),(13,2424,'CNEL DORREGO (MENDOZA)',5519),(13,2425,'EL SAUCE',5533),(13,2426,'MAYOR DRUMMOND',5507),(13,2427,'EL NIHUIL',5605),(13,2428,'EL PLUMERILLO',5541),(13,2429,'FRAY L.BELTRAN (MENDOZA)',5531),(13,2430,'GRAL ALVEAR (MENDOZA)',5620),(13,2431,'GRAL GUTIERREZ',5511),(13,2432,'GODOY CRUZ',5501),(13,2433,'ING GIAGNONI',5582),(13,2434,'GDOR BENEGAS',5544),(13,2435,'GOUDGE',5603),(13,2436,'EL CERRITO',5600),(13,2437,'JESUS NAZARENO',5523),(13,2438,'JUNIN (MENDOZA)',5573),(13,2439,'CAPITAN MONTOYA',5601),(13,2440,'JAIME PRATS',5623),(13,2441,'LAS MALVINAS-MZA',5605),(13,2442,'LAS COMPUERTAS',5549),(13,2443,'LA DORMIDA',5592),(13,2444,'LA CONSULTA',5567),(13,2445,'LA PAZ (MENDOZA)',5590),(13,2446,'LAS CATITAS',5594),(13,2447,'LAS HERAS (MENDOZA)',5539),(13,2448,'LAVALLE (MENDOZA)',5533),(13,2449,'LUJAN DE CUYO',5507),(13,2450,'LUZURIAGA',5513),(13,2451,'LOS CORRALITOS',5527),(13,2452,'LOS ARBOLES',5575),(13,2453,'LOS REYUNOS (MENDOZA)',5615),(13,2454,'LUNLUNTA',5517),(13,2455,'LAS PAREDES',5601),(13,2456,'MAIPU (MENDOZA)',5515),(13,2457,'MALARGUE',5613),(13,2458,'MEDRANO',5585),(13,2459,'MENDOZA',5500),(13,2460,'MONTE CASEROS (MENDOZA)',5571),(13,2461,'COLONIA LOPEZ',5623),(13,2462,'RAMA CAIDA',5603),(13,2463,'MONTE COMAN',5609),(13,2464,'NUEVA CALIFORNIA',5535),(13,2465,'PALMIRA',5584),(13,2466,'C PIAZZA',5500),(13,2467,'PAREDITAS',5569),(13,2468,'LA PUNTILLA',5505),(13,2469,'PERDRIEL',5509),(13,2470,'PANQUEUA',5539),(13,2471,'RIVADAVIA (MENDOZA)',5577),(13,2472,'RODEO DEL MEDIO',5529),(13,2473,'RODEO DE LA CRUZ',5525),(13,2474,'REAL DEL PADRE',5624),(13,2475,'RUSSELL',5517),(13,2476,'RODRIGUEZ PEÑA',5585),(13,2477,'SAN ROQUE (MENDOZA)',5587),(13,2478,'SALTO DE LAS ROSAS',5603),(13,2479,'S J DE GUAYMALLEN',5519),(13,2480,'GRAL SAN MARTIN (MENDOZA)',5570),(13,2481,'SAN RAFAEL',5600),(13,2482,'SAN CARLOS (MENDOZA)',5569),(13,2483,'SANTA ROSA (MENDOZA)',5596),(13,2484,'SAN FCO DEL MONTE',5503),(13,2485,'SAN JOSE',5519),(13,2486,'SAN PEDRO DE ATUEL',5621),(13,2487,'TUNUYAN',5560),(13,2488,'TUPUNGATO',5561),(13,2489,'TRES PORTE~AS',5589),(13,2490,'LA COLONIA (MENDOZA)',5572),(13,2491,'LA LLAVE',5603),(13,2492,'USPALLATA',5545),(13,2493,'UGARTECHE',5509),(13,2494,'VILLA ATUEL',5622),(13,2495,'VILLA NUEVA (MENDOZA)',5521),(13,2496,'VILLA 25 DE MAYO',5570),(13,2497,'VISTA FLORES',5565),(13,2498,'VILLA HIPODROMO',5547),(13,2499,'VISTALBA',5509),(14,2500,'LEANDRO N ALEM (MISIONES)',3315),(14,2501,'APOSTOLES',3350),(14,2502,'ALMAFUERTE (MISIONES)',3317),(14,2503,'ALBA POSSE',3363),(14,2504,'BONPLAND',3317),(14,2505,'BERNARDO DE IRIGOYEN',3366),(14,2506,'CAPIOVI',3332),(14,2507,'CAMPO GRANDE (MISIONES)',3362),(14,2508,'CAMPO VIERA',3362),(14,2509,'CANDELARIA (MISIONES)',3308),(14,2510,'CERRO AZUL',3313),(14,2511,'COLONIA WANDA',3376),(14,2512,'COLONIA YABEBIRY',3361),(14,2513,'CTE ANDRESITO',3370),(14,2514,'CORPUS',3327),(14,2517,'CONC DE LA SIERRA',3355),(14,2518,'COLONIA M. BELGRANO',3316),(14,2519,'CAMPO RAMON',3361),(14,2521,'SANTIAGO DE LINIERS',3381),(14,2522,'DOS DE MAYO',3364),(14,2527,'EL ALCAZAR',3384),(14,2528,'ELDORADO',3380),(14,2529,'EL SOBERBIO',3364),(14,2530,'FRACRAN',3364),(14,2532,'GDOR LOPEZ',3315),(14,2533,'GARUHAPE',3334),(14,2534,'GDOR ROCA',3324),(14,2535,'GUARANI',3361),(14,2536,'GRAL ALVEAR (MISIONES)',3361),(14,2537,'GARUPA',3304),(14,2538,'H.YRIGOYEN (MISIONES)',3328),(14,2540,'ITACARUARE',3353),(14,2543,'AZARA',3351),(14,2546,'JARDIN AMERICA',3328),(14,2548,'LOS HELECHOS',3361),(14,2550,'MARTIRES',3361),(14,2551,'MBOPICUA',3332),(14,2552,'MONTECARLO',3384),(14,2553,'MIGUEL LANUS',3304),(14,2554,'MOJON GRANDE',3315),(14,2558,'OBERA',3360),(14,2563,'PANAMBI',3361),(14,2564,'POSADAS',3300),(14,2565,'PUERTO ESPERANZA',3378),(14,2566,'PUERTO LEONI',3332),(14,2567,'PUERTO RICO',3334),(14,2568,'PUERTO IGUAZU',3370),(14,2569,'PUERTO MINERAL',3332),(14,2570,'PUERTO GISELA',3326),(14,2571,'PUERTO PIRAY',3381),(14,2572,'PUERTO LIBERTAD',3374),(14,2573,'PUERTO ESPAÑA',3326),(14,2574,'RUIZ DE MONTOYA',3334),(14,2577,'SAN FCO DE ASIS',3363),(14,2578,'SAN VICENTE (MISIONES)',3364),(14,2579,'SAN ANTONIO (MISIONES)',3366),(14,2580,'SAN IGNACIO (MISIONES)',3322),(14,2581,'SAN JAVIER (MISIONES)',3357),(14,2582,'SAN JOSE (MISIONES)',3306),(14,2583,'SAN PEDRO (MISIONES)',3364),(14,2584,'SANTA ANA (MISIONES)',3316),(14,2585,'SANTO PIPO',3326),(14,2587,'SANTA RITA',3363),(14,2588,'TOBUNAS',3364),(14,2592,'ARISTOBULO DEL VALLE',3364),(14,2594,'V SALTO ENCANTADO',3364),(14,2595,'25 DE MAYO (MISIONES)',3363),(14,2596,'VILLA SVEA',3361),(14,10104,'COLONIA DELICIA',3380),(15,2600,'ALUMINE',8345),(15,2601,'ANDACOLLO',8353),(15,2602,'ARROYITO CHALACO',8313),(15,2603,'ALICURA',8403),(15,2604,'ANELO',8305),(15,2605,'BAJADA QUILI DEL A M',8351),(15,2606,'BUTA RANQUIL',8353),(15,2611,'CENTENARIO',8309),(15,2612,'CUTRAL CO',8322),(15,2613,'COLONIA VALENTINA',8301),(15,2614,'COPAHUE',8349),(15,2623,'CHOS MALAL',8353),(15,2628,'VILLA EL CHOCON',8311),(15,2629,'EL HUECU',8349),(15,2630,'HUECHULAFQUEN',8371),(15,2634,'JUNIN DE LOS ANDES',8371),(15,2645,'LAS LAJAS',8347),(15,2651,'LOMA DE LA LATA',8300),(15,2652,'LONCOPUE',8349),(15,2655,'MARIANO MORENO',8351),(15,2656,'NEUQUEN',8300),(15,2665,'PICUN LEUFU',8313),(15,2666,'PIEDRA DEL AGUILA',8315),(15,2667,'PLAZA HUINCUL',8318),(15,2668,'PLOTTIER',8316),(15,2670,'PORTEZUELO GRANDE',8300),(15,2674,'RINCON DE LOS SAUCES',8319),(15,2679,'SAN M DE LOS ANDES',8370),(15,2680,'SAN PATRICIO CHAÑAR',8305),(15,2681,'SENILLOSA',8316),(15,2682,'SANTO TOMAS',8315),(15,2684,'TRAFUL',8403),(15,2686,'VILLA LA ANGOSTURA',8407),(15,2687,'VISTA ALEGRE',8309),(15,2690,'ZAPALA',8340),(15,2699,'P.I.A.P.',8313),(16,2700,'ALLEN',8328),(16,2704,'BARDA DEL MEDIO',8305),(16,2706,'LUIS BELTRAN',8361),(16,2710,'COMALLO',8416),(16,2711,'CAMPO GRANDE-R.NEGRO',8332),(16,2712,'CATRIEL',8307),(16,2713,'CINCO SALTOS',8303),(16,2714,'CIPOLLETTI',8324),(16,2715,'CERVANTES',8326),(16,2716,'CNEL JUAN J GOMEZ',8333),(16,2717,'COLONIA  JULIA Y ECHARREN',8138),(16,2718,'CNEL BELISLE',8364),(16,2719,'CHIMPAY',8364),(16,2720,'CHOELE CHOEL',8360),(16,2721,'CLTE CORDERO',8301),(16,2722,'CLTE MARTIN GUERRICO',8326),(16,2723,'CUBANEA',8501),(16,2724,'CHELFORO',8366),(16,2725,'CHICHINALES',8336),(16,2726,'EL BOLSON',8430),(16,2727,'DARWIN',8364),(16,2728,'DINA HUAPI',8402),(16,2732,'GRAL FERNANDEZ ORO',8324),(16,2738,'JUAN DE GARAY',8138),(16,2739,'GRAL CONESA (RIO NEGRO)',8503),(16,2740,'GRAL E GODOY',8336),(16,2741,'GRAL ROCA (RIO NEGRO)',8332),(16,2747,'ING HUERGO',8334),(16,2748,'ING JACOBACCI',8418),(16,2752,'LAMARQUE',8363),(16,2753,'LAS GRUTAS',8520),(16,2755,'LOS MENUCOS',8326),(16,2756,'LLAO LLAO',8409),(16,2760,'MAINQUE',8326),(16,2761,'MAQUINCHAO',8422),(16,2767,'PASO CORDOVA',8333),(16,2768,'PILCANIYEU',8412),(16,2769,'POMONA',8363),(16,2770,'PASO FLORES',8403),(16,2775,'RIO COLORADO (RIO NEGRO)',8138),(16,2781,'SAN ANTONIO OESTE',8520),(16,2782,'SAN C DE BARILOCHE',8400),(16,2783,'P A STEFANELLI',8332),(16,2784,'SIERRA GRANDE',8532),(16,2786,'SIERRA COLORADA',8534),(16,2789,'VALCHETA',8536),(16,2790,'VIEDMA',8500),(16,2792,'VILLA REGINA',8336),(16,2793,'VILLA MASCARDI',8401),(16,10019,'LAS GRUTAS (NO USAR)',8521),(17,2800,'AGUARAY',4566),(17,2801,'AGUAS BLANCAS',4531),(17,2802,'ANTILLA',4193),(17,2804,'AMPASCACHI',4421),(17,2805,'ANIMANA',4427),(17,2808,'LUIS BURELA',4449),(17,2814,'CABEZA DE BUEY',4434),(17,2815,'CAMPO ALEGRE',4423),(17,2816,'CAFAYATE',4447),(17,2817,'CAMPO QUIJANO',4407),(17,2818,'CERRILLOS',4403),(17,2819,'CNEL CORNEJO',4552),(17,2820,'CAMPO SANTO',4432),(17,2823,'COLONIA STA ROSA',4531),(17,2824,'CNEL MOLDES (SALTA)',4421),(17,2825,'EL ENCON',4407),(17,2826,'CHICOANA',4423),(17,2827,'EL TALA',4026),(17,2828,'EL GALPON',4444),(17,2829,'EST ALVARADO',4401),(17,2830,'EMBARCACION',4550),(17,2831,'EL BORDO',4432),(17,2832,'EL CARRIL',4421),(17,2833,'GRAL E MOSCONI',4562),(17,2834,'GRAL GUEMES',4430),(17,2835,'JOAQUIN V GONZALEZ',4448),(17,2838,'GUACHIPAS',4425),(17,2840,'LA CALDERA',6216),(17,2841,'LA MERCED (SALTA)',4421),(17,2842,'LA VIÑA',4425),(17,2843,'LIMACHE',4400),(17,2844,'LOS BLANCOS',4554),(17,2845,'LUMBRERAS',4434),(17,2846,'LAS LAJITAS',4449),(17,2847,'LA SILLETA',4407),(17,2848,'LA ISLA',4400),(17,2850,'LURACATAO',4419),(17,2851,'METAN',4440),(17,2852,'MORILLO',4554),(17,2853,'MOLINOS',4419),(17,2855,'NTRA SRA DE TALAVERA',4452),(17,2859,'PIQUETE CABADO',4449),(17,2860,'PICHANAL',4534),(17,2862,'SALVADOR MAZZA P',4568),(17,2865,'EL QUEBRACHAL',4452),(17,2866,'TABACAL',4533),(17,2870,'R DE LA FRONTERA',4190),(17,2871,'ROSARIO DE LERMA',4405),(17,2872,'RECAREDO',4563),(17,2873,'RIVADAVIA (SALTA)',4535),(17,2874,'CACHI',4417),(17,2879,'SALTA',4400),(17,2880,'ORAN',4530),(17,2881,'APOLINARIO SARAVIA',4449),(17,2882,'SAN CARLOS (SALTA)',4427),(17,2884,'SAN LORENZO (SALTA)',4401),(17,2889,'TARTAGAL (SALTA)',4560),(17,2893,'VILLA SAAVEDRA',4560),(17,2896,'H.YRIGOYEN (SALTA)',4533),(17,2897,'YATASTO',4440),(18,2900,'ALBARDON',5419),(18,2901,'ANGACO',5415),(18,2904,'BARREAL',5405),(18,2909,'CALINGASTA',5403),(18,2910,'CAUCETE',5442),(18,2911,'BARRIO CONCEPCION',5400),(18,2919,'CHIMBAS',5413),(18,2927,'DESAMPARADOS',5400),(18,2935,'IGLESIAS',5467),(18,2936,'JACHAL',5460),(18,2939,'LAS CASUARINAS',5443),(18,2940,'LOS BERROS',5431),(18,2944,'MARQUESADO',5407),(18,2945,'MEDIA AGUA',5435),(18,2946,'MEDANO DE ORO',5421),(18,2950,'NUEVE DE JULIO (SAN JUAN)',5417),(18,2953,'POCITOS',5400),(18,2961,'BRRIO RAWSON',5425),(18,2962,'RINCONADA',5429),(18,2963,'RIVADAVIA (SAN JUAN)',5400),(18,2964,'RODEO',5465),(18,2970,'SANCHEZ DE LORIA',5427),(18,2971,'SAN JUAN',5400),(18,2972,'SAN MARTIN (SAN JUAN)',5439),(18,2973,'SANTA LUCIA (SAN JUAN)',5411),(18,2981,'TRINIDAD',5400),(18,2985,'ULLUM',5409),(18,2989,'VALLE FERTIL',5449),(18,2990,'VILLA ABERASTAIN',5427),(18,2991,'VILLA AMERICA',5400),(18,2992,'VILLA DEL CARRIL',5400),(18,2993,'VILLA KRAUSE',5425),(18,2994,'VILLA SANTA ROSA',5443),(18,2995,'VILLA SARMIENTO (SAN JUAN)',5400),(18,2996,'VILLA NUEVA (SAN JUAN)',5401),(18,2998,'ZONDA',5401),(18,2999,'CEC SAN JUAN',5400),(19,3000,'ALTO PENCOSO',5724),(19,3001,'ARIZONA',6389),(19,3002,'ANCHORENA',6389),(19,3003,'ALTO BLANCO',5700),(19,3005,'BALDE',5724),(19,3006,'BATAVIA',6279),(19,3008,'BEAZLEY',5721),(19,3009,'B ESPERANZA',6277),(19,3017,'CANDELARIA (SAN LUIS)',5713),(19,3018,'CONCARAN',5770),(19,3019,'CRAMER',5733),(19,3026,'JUSTO DARACT',5738),(19,3030,'DEL MORRO SAN JOSE',5730),(19,3031,'JUANA KOSLAY',5701),(19,3032,'EL VOLCAN',5701),(19,3033,'EL DURAZNO',5701),(19,3034,'FORTUNA',6216),(19,3035,'FRAGA',5736),(19,3038,'JUAN JORBA',5731),(19,3040,'LAS CHACRAS DPTO CAP',5701),(19,3041,'LAS CHACRAS',5753),(19,3042,'LA TOMA',5750),(19,3043,'LUJAN (SAN LUIS)',5709),(19,3044,'LIBORIO LUNA',5730),(19,3045,'LA HUERTITA',5755),(19,3046,'PUNILLA',5831),(19,3047,'LA PUNTA',5710),(19,3051,'JUAN LLERENA',5735),(19,3052,'LOS MOLLES',5883),(19,3059,'VILLA MERCEDES',5730),(19,3060,'MERLO (SAN LUIS)',5881),(19,3068,'NASCHEL',5759),(19,3069,'NUEVA GALIA',6216),(19,3070,'NOGOLI',5703),(19,3072,'P DE LAS CARRETAS',5721),(19,3073,'GRAL PEDERNERA',5738),(19,3074,'PASO GRANDE',5753),(19,3075,'POTRERO DE LOS FUNES',5701),(19,3076,'QUINES',5711),(19,3077,'RINCON DEL ESTE',5881),(19,3084,'SAN FRANCISCO (SAN LUIS)',5705),(19,3085,'SAN LUIS',5700),(19,3086,'SANTA ROSA (SAN LUIS)',5719),(19,3087,'S MARTIN ALTO NEGRO',5719),(19,3088,'STA CLARA DE CONLARA',5777),(19,3094,'TILISARAO',5773),(19,3095,'TRAPICHE',5701),(19,3097,'UNION',6216),(19,3098,'VILLA DEL CARMEN',5837),(19,3099,'VILLA LARCA',5883),(19,10098,'SANTA ROSA DEL CONLARA',5777),(20,3104,'BAJO CARACOLES',9315),(20,3109,'EL CALAFATE',9405),(20,3110,'CAÑADON SECO',9013),(20,3111,'CALETA OLIVIA',9011),(20,3112,'CTE LUIS PIEDRABUENA',9303),(20,3123,'EL TURBIO',9407),(20,3124,'EL CHALTEN',9301),(20,3125,'FITZ ROY',9019),(20,3128,'GDOR GREGORES',9311),(20,3133,'JARAMILLO',9053),(20,3143,'LA ESPERANZA',9401),(20,3144,'LAS HERAS (STA.CRUZ)',9017),(20,3145,'LOS ANTIGUOS',9041),(20,3146,'LAS HORQUETAS',9400),(20,3164,'PERITO MORENO',9040),(20,3165,'PICO TRUNCADO',9015),(20,3166,'PUERTO DESEADO',9050),(20,3167,'PUERTO SANTA CRUZ',9300),(20,3178,'RIO GALLEGOS',9400),(20,3189,'PUERTO SAN JULIAN',9310),(20,3195,'RIO TURBIO',9407),(20,3196,'28 DE NOVIEMBRE',9407),(21,3200,'ACEBAL',2109),(21,3201,'ALCORTA',2117),(21,3202,'ALDAO',2214),(21,3203,'ALEJANDRA',3051),(21,3204,'ALVAREZ',2107),(21,3205,'DIEGO DE ALVEAR',6036),(21,3206,'AMENABAR',6103),(21,3207,'ANGELICA',2303),(21,3208,'AREQUITO',2183),(21,3209,'ARMINDA',2119),(21,3210,'ARMSTRONG',2508),(21,3211,'AROCENA',2242),(21,3212,'ARROYO CEIBAL',3575),(21,3213,'ARROYO SECO',2128),(21,3214,'ARRUFO',2344),(21,3215,'ARTEAGA',2187),(21,3216,'ATALIVA',2307),(21,3217,'AVELLANEDA (SANTA FE)',3561),(21,3218,'ANDINO',2214),(21,3219,'ALBARELLOS',2101),(21,3220,'AMBROSETTI',2352),(21,3221,'AGUARA GRANDE',3071),(21,3222,'ARROYO AGUIAR',3014),(21,3223,'ALVEAR (SANTA FE)',2126),(21,3224,'ALTO VERDE (SANTA FE)',3001),(21,3229,'BELLA ITALIA (SANTA FE)',2301),(21,3230,'BARRANCAS (SANTA FE)',2246),(21,3231,'BAUER Y SIGUEL',2403),(21,3232,'BERAVEBU',2639),(21,3233,'BIGAND',2177),(21,3234,'BOMBAL',2179),(21,3235,'BOUQUET',2523),(21,3236,'BUSTINZA',2501),(21,3237,'BERNA',3569),(21,3238,'COLONIA ROSA',2347),(21,3239,'CAPIVARA',2311),(21,3240,'COLONIA ALDAO',2317),(21,3241,'PLAZA CLUCELLAS',2407),(21,3242,'CAYASTA',3001),(21,3243,'COLONIA  SAN MANUEL',3563),(21,3244,'CLASON',2146),(21,3245,'CONSTANZA',2311),(21,3246,'CAMPO GARAY',3066),(21,3247,'CAVOUR',3081),(21,3248,'CAMPO ANDINO',3021),(21,3249,'CAFFERATA',2646),(21,3250,'CALCHAQUI',3050),(21,3251,'CAMPO CRESPO',3001),(21,3252,'CAÑADA DE GOMEZ',2500),(21,3253,'CAÑADA DEL UCLE',2635),(21,3254,'CAÑADA RICA',2101),(21,3255,'CAÑADA ROSQUIN',2454),(21,3256,'CAP BERMUDEZ',2154),(21,3257,'CARCARAÑA',2138),(21,3258,'CARMEN',2618),(21,3259,'CARRERAS',2729),(21,3260,'CASAS',2148),(21,3261,'CASILDA',2170),(21,3262,'CAÑADA OMBU',3551),(21,3263,'AARON CASTELLANOS',6106),(21,3264,'CENTENO',2148),(21,3265,'CERES',2340),(21,3266,'COLASTINE NORTE',3001),(21,3267,'COLONIA BELGRANO',2257),(21,3268,'COLONIA CASTELAR',2401),(21,3269,'COLONIA SAN JOAQUIN',3001),(21,3270,'CORONDA',2240),(21,3271,'CNEL ARNOLD',2123),(21,3272,'CNEL BOGADO',2103),(21,3273,'CNEL R S DOMINGUEZ',2105),(21,3274,'CURUPAITY',2342),(21,3275,'CORREA',2506),(21,3276,'CHABAS',2173),(21,3277,'CHAÑAR LADEADO',2643),(21,3278,'CHOVET',2633),(21,3279,'CHRISTOPHERSEN',2611),(21,3280,'CLARKE',2218),(21,3281,'COLONIA  SILVA',3042),(21,3282,'COLONIA CELLO',2405),(21,3283,'COLONIA BOSSI',2326),(21,3284,'COLONIA MASCIAS',3001),(21,3285,'CEPEDA',2105),(21,3286,'CRISPI',2441),(21,3287,'COLONIA CASTELLANOS',2301),(21,3288,'COLONIA BICHA',2317),(21,3289,'COLONIA MONTEFIORE',2341),(21,3290,'CNEL FRAGA',2301),(21,3291,'COLONIA MEDICI',2144),(21,3292,'DESVIO ARIJON',2242),(21,3293,'DIAZ',2222),(21,3294,'DR BARROS PAZOS',3569),(21,3304,'CHAPUY',2603),(21,3305,'CASALEGNO',2248),(21,3306,'COLONIA LA CAMILA',3054),(21,3307,'EGUSQUIZA',2301),(21,3308,'ELISA',3029),(21,3309,'ELORTONDO',2732),(21,3310,'EL TREBOL',2535),(21,3311,'EMILIA',3036),(21,3312,'ELME V CONSTITUCION',2918),(21,3313,'MARCELINO ESCALADA',3042),(21,3314,'ESMERALDA',2456),(21,3315,'ESPERANZA',3080),(21,3316,'EUSEBIA',2317),(21,3317,'EST CLUCELLAS',2407),(21,3318,'EL TAJAMAR',3565),(21,3319,'EL NOCHERO',3061),(21,3320,'EL ARAZA',3563),(21,3321,'EL RABON',3592),(21,3322,'EL SOMBRERITO',3585),(21,3329,'FELICIA',3087),(21,3330,'FIGHIERA',2126),(21,3331,'FIRMAT',2630),(21,3332,'FLORENCIA',3516),(21,3333,'FORTIN OLMOS',3553),(21,3334,'FRANCK',3009),(21,3335,'FRAY L.BELTRAN (SANTA FE)',2156),(21,3336,'FUENTES',2123),(21,3337,'FUNES',2132),(21,3338,'FORTIN CHILCAS',3553),(21,3339,'FORTIN ATAHUALPA',3061),(21,3350,'GABOTO',2208),(21,3351,'GALVEZ',2252),(21,3352,'GRAL GELLY',2701),(21,3353,'GRAL LAGOS',2126),(21,3354,'GESSLER',2253),(21,3355,'GDOR CANDIOTI',3018),(21,3356,'GDOR CRESPO',3044),(21,3357,'GODEKEN',2639),(21,3358,'GODOY',2971),(21,3359,'GRANADERO BAIGORRIA',2152),(21,3360,'GRUTLY',3083),(21,3361,'GUADALUPE NORTE',3574),(21,3362,'PEDRO GOMEZ CELLO',3054),(21,3374,'HELVECIA',3003),(21,3375,'HERSILIA',2352),(21,3376,'HUANQUEROS',3076),(21,3377,'HUGHES',2725),(21,3378,'HUMBERTO I',2309),(21,3379,'HUMBOLDT',3081),(21,3380,'HIPATIA',3023),(21,3388,'IBARLUCEA',2142),(21,3389,'INDEPENDENCIA',3060),(21,3390,'IRIGOYEN',2248),(21,3391,'INTIYACO',3551),(21,3392,'BDO. DE IRIGOYEN',2248),(21,3393,'ISLETA',3581),(21,3394,'ITURRALDE',2340),(21,3395,'IRIONDO',3018),(21,3396,'ING CHANOURDIE',3575),(21,3406,'JESUS MARIA (SANTA FE)',2204),(21,3407,'JOBSON',3550),(21,3408,'JUNCAL',2723),(21,3409,'COLONIA JOSEFINA',2403),(21,3412,'LOS NOGALES (SANTA FE)',2183),(21,3413,'KM 302',3551),(21,3414,'LA PENCA',3557),(21,3415,'LUCIO V LOPEZ',2142),(21,3416,'LA SARITA',3563),(21,3417,'LA LUCILA (SANTA FE)',3072),(21,3418,'LA CABRAL',3074),(21,3419,'LA LOLA',3567),(21,3420,'LABORDEBOY',2726),(21,3421,'LA CHISPA',2601),(21,3422,'LA CRIOLLA (SANTA FE)',3052),(21,3423,'LA ESQUINA',3000),(21,3424,'LA GALLARETA',3057),(21,3425,'LA GUARDIA',3001),(21,3426,'LAGUNA PAIVA',3020),(21,3427,'LA LUISA (SANTA FE)',3000),(21,3428,'LANDETA',2531),(21,3429,'LA PELADA',3027),(21,3430,'LARRECHEA',2252),(21,3431,'LA RUBIA',2342),(21,3432,'LA SALADA (SANTA FE)',2142),(21,3433,'LA VANGUARDIA',3561),(21,3434,'LARGUIA',2144),(21,3435,'LAS PAREJAS',2505),(21,3436,'LAS PETACAS',2451),(21,3437,'LAS ROSAS',2520),(21,3438,'LAS TOSCAS (SANTA FE)',3586),(21,3439,'LEHMANN',2305),(21,3440,'LOPEZ',2255),(21,3441,'LOS CARDOS',2533),(21,3442,'LOS LAURELES',3567),(21,3443,'LOS MOLINOS (SANTA FE)',2181),(21,3444,'LOS QUIRQUINCHOS',2637),(21,3445,'LLAMBI CAMPBELL',3036),(21,3446,'LOS TABANOS',3551),(21,3447,'LAZZARINO',6103),(21,3448,'LAS GARZAS',3574),(21,3449,'LOS CHARABONES',3060),(21,3450,'LOGROÑO',3066),(21,3451,'LAS PALMERAS',2326),(21,3452,'LANTERI',3575),(21,3453,'LOMA ALTA',2253),(21,3454,'LAS FLORES (SANTA FE)',3000),(21,3455,'LAS TUNAS',3009),(21,3456,'LAS AVISPAS',3074),(21,3457,'LAS BANDURRIAS',2148),(21,3458,'MACIEL',2208),(21,3459,'MAGGIOLO',2622),(21,3460,'MALABRIGO',3572),(21,3461,'MARGARITA',3056),(21,3462,'MARIA JUANA',2443),(21,3463,'MARIA SUSANA',2527),(21,3464,'MARIA TERESA',2609),(21,3465,'EST MATILDE',3013),(21,3466,'MAXIMO PAZ (SANTA FE)',2115),(21,3467,'MELINCUE',2728),(21,3468,'MOISES VILLE',2313),(21,3469,'J B MOLINA',2103),(21,3470,'MONJE',2212),(21,3471,'MONTE VERA',3014),(21,3472,'MONTES DE OCA',2521),(21,3473,'MURPHY',2601),(21,3474,'MONSERRAT',3000),(21,3475,'MOUSSY',3561),(21,3476,'MARIA LUISA',3025),(21,3477,'MONIGOTES',2342),(21,3478,'MARIA EUGENIA',3072),(21,3479,'MAIZALES',2119),(21,3486,'NELSON',3032),(21,3487,'NUEVA ITALIA',3074),(21,3488,'NANDUCITA',3072),(21,3489,'NUEVO TORINO',3087),(21,3500,'OLIVEROS',2206),(21,3501,'PIÑERO',2119),(21,3511,'PUEBLO NUEVO',2124),(21,3512,'PUEBLO ESTHER',2126),(21,3513,'PALACIOS',2326),(21,3514,'PAVON ARRIBA',2109),(21,3515,'CARLOS PELLEGRINI',2453),(21,3516,'ZENON PEREYRA',2409),(21,3517,'PEREZ',2121),(21,3518,'PEYRANO',2113),(21,3519,'PIAMONTE',2529),(21,3520,'PILAR (SANTA FE)',3085),(21,3521,'PRESIDENTE ROCA (SANTA FE)',2301),(21,3522,'POZO BORRADO',3061),(21,3523,'PROGRESO',3023),(21,3524,'PUEBLO MARINI',2301),(21,3525,'PUEBLO MUÑOZ',2119),(21,3526,'PUERTO GRAL S MARTIN',2202),(21,3527,'PUJATO',2123),(21,3528,'PROVIDENCIA',3025),(21,3529,'PAVON',2918),(21,3540,'RAFAELA',2300),(21,3541,'RAMAYON',3042),(21,3542,'RAMONA',3070),(21,3543,'RAQUEL',2322),(21,3544,'RECONQUISTA',3560),(21,3545,'RECREO (SANTA FE)',3018),(21,3546,'RICARDONE',2201),(21,3547,'ROLDAN',2134),(21,3548,'ROMANG',3555),(21,3549,'ROSARIO',2000),(21,3550,'RUEDA',2921),(21,3551,'RUFINO',6100),(21,3552,'ESTEBAN RAMS',3066),(21,3553,'RUNCIMAN',2611),(21,3564,'SAGUIER',2301),(21,3565,'SALADERO M CABAL',3001),(21,3566,'SALTO GRANDE',2142),(21,3567,'SAN AGUSTIN (SANTA FE)',3017),(21,3568,'SANCTI SPIRITU',2617),(21,3569,'SAN CARLOS CENTRO',3013),(21,3570,'SAN CARLOS NORTE',3009),(21,3571,'SAN CRISTOBAL',3070),(21,3572,'SANFORD',2173),(21,3573,'SAN EDUARDO',2615),(21,3574,'SAN EUGENIO',2253),(21,3575,'SAN FABIAN',2242),(21,3576,'SAN FRANCISCO DE S F',2601),(21,3577,'SAN GENARO',2146),(21,3578,'SAN GENARO NORTE',2147),(21,3579,'SAN GREGORIO',2613),(21,3580,'SAN GUILLERMO',2347),(21,3581,'SAN JAVIER (SANTA FE)',3005),(21,3582,'S JERONIMO DEL SAUCE',3009),(21,3583,'SAN JERONIMO NORTE',3011),(21,3584,'SAN JERONIMO SUD',2136),(21,3586,'SAN JORGE (SANTA FE)',2451),(21,3587,'S JOSE DE LA ESQUINA',2185),(21,3588,'SAN JOSE DEL RINCON',3001),(21,3589,'SAN JUSTO (SANTA FE)',3040),(21,3590,'SAN LORENZO (SANTA FE)',2200),(21,3591,'SAN M DE LAS ESCOBAS',2449),(21,3592,'SAN VICENTE (SANTA FE)',2447),(21,3593,'SANTA CLARA B VISTA',2258),(21,3594,'STA CLARA DE SAGUIER',2405),(21,3595,'SANTA FE',3000),(21,3596,'SANTA ISABEL (SANTA FE)',2605),(21,3597,'SANTA ROSA (SANTA FE)',3001),(21,3598,'SANTA TERESA',2111),(21,3599,'SANTO DOMINGO (SANTA FE)',3025),(21,3600,'SANTO TOME (SANTA FE)',3016),(21,3601,'SA PEREIRA',3011),(21,3602,'SARGENTO CABRAL',2105),(21,3603,'SARMIENTO (SANTA FE)',3023),(21,3604,'SASTRE',2440),(21,3605,'SAUCE VIEJO',3017),(21,3606,'SERODINO',2216),(21,3608,'SOLEDAD',3025),(21,3609,'SUARDI',2349),(21,3610,'SUNCHALES',2322),(21,3611,'SOLDINI',2107),(21,3612,'SAN ANTONIO (SANTA FE)',2301),(21,3613,'SAN CARLOS SUD',3013),(21,3614,'SUSANA',2301),(21,3615,'SAN ANTONIO OBLIGADO',3587),(21,3616,'SANTA MARGARITA',3061),(21,3621,'TARRAGONA',6103),(21,3622,'TARTAGAL (SANTA FE)',3565),(21,3623,'TACURAL',2324),(21,3624,'TEODELINA',6009),(21,3625,'THEOBALD',2918),(21,3626,'TIMBUES',2204),(21,3627,'MIGUEL TORRES',2631),(21,3628,'TORTUGAS',2512),(21,3629,'TOSTADO',3060),(21,3630,'TOTORAS',2144),(21,3631,'TRAILL',2451),(21,3643,'URANGA',2105),(21,3655,'VERA',3550),(21,3656,'VENADO TUERTO',2600),(21,3657,'VERA Y PINTADO',3054),(21,3658,'VIDELA',3048),(21,3659,'VILA',2301),(21,3660,'VILLA ANA',3581),(21,3661,'VILLA CAÑAS',2607),(21,3662,'VILLA CONSTITUCION',2919),(21,3663,'VILLA DIEGO',2124),(21,3664,'VILLA ELOISA',2503),(21,3665,'VILLA GDOR GALVEZ',2124),(21,3666,'VILLA GUILLERMINA',3589),(21,3667,'VILLA MUGUETA',2175),(21,3668,'VILLA OCAMPO',3580),(21,3669,'VILLA SAN JOSE',2301),(21,3670,'VILLA TRINIDAD',2345),(21,3671,'VILLADA',2173),(21,3672,'VILLA MINETTI',3161),(21,3673,'VILLA SARALEGUI',3046),(21,3674,'VILLA AMELIA',2101),(21,3675,'VIRGINIA (SANTA FE)',2311),(21,3680,'WHEELWRIGHT',2722),(21,3690,'ZAVALLA',2123),(21,9998,'GARABATO',3551),(22,3700,'AÑATUYA',3760),(22,3707,'BANDERA',3064),(22,3708,'BELTRAN',4308),(22,3709,'BREA POZO',4313),(22,3714,'CASARES',2354),(22,3715,'CLODOMIRA',4338),(22,3716,'CAMPO GALLO',3747),(22,3717,'COLONIA DORA',4332),(22,3718,'COLONIA ALPINA',2341),(22,3720,'EL BOBADAL',4187),(22,3721,'CHOYA',4233),(22,3722,'FERNANDEZ',4322),(22,3723,'FORRES',4312),(22,3724,'FRIAS',4230),(22,3730,'GARZA',4324),(22,3731,'GRAMILLA',4304),(22,3732,'GUARDIA ESCOLTA',3062),(22,3737,'HERRERA (S. DEL ESTERO)',4328),(22,3738,'HUAICO HONDO',4200),(22,3745,'ICAÑO',4334),(22,3749,'LA CAÑADA (S. DEL ESTERO)',4302),(22,3750,'LAS TINAJAS',4351),(22,3751,'LAVALLE (S. DEL ESTERO)',4234),(22,3752,'LA BANDA',4300),(22,3753,'LORETO (S. DEL ESTERO)',4208),(22,3754,'LOS JURIES',3773),(22,3755,'LUGONES',4326),(22,3756,'MEDELLIN',4313),(22,3757,'MONTE QUEMADO',4195),(22,3758,'NUEVA ESPERANZA',4197),(22,3759,'LOS TELARES',4321),(22,3761,'OJO DE AGUA',5250),(22,3762,'OTUMPA',3741),(22,3765,'P DE LOS GUANACOS',3712),(22,3768,'PINTO',2356),(22,3769,'POZO HONDO',4184),(22,3774,'ROVERSI',3736),(22,3775,'QUIMILI',3470),(22,3776,'REAL SAYANA',4334),(22,3777,'RAPELLI',4189),(22,3778,'SIMBOLAR-DTO MORENO',4351),(22,3779,'SIMBOLAR DTO BANDA',4339),(22,3780,'SOL DE JULIO',5255),(22,3781,'SAN PEDRO (S. DEL ESTERO)',4238),(22,3782,'SANTIAGO DEL ESTERO',4200),(22,3783,'SACHAYOJ',3731),(22,3784,'SUMAMPA',5253),(22,3785,'SELVA',2354),(22,3786,'SUNCHO CORRAL',4350),(22,3787,'TINTINA',3743),(22,3788,'TABOADA',4324),(22,3791,'TERMAS DE RIO HONDO',4220),(22,3793,'VILELAS',3752),(22,3794,'VILLA NUEVA (S. DEL ESTERO)',4313),(22,3795,'VILLA ATAMISQUI',4317),(22,3796,'VILLA SAN MARTIN',4208),(22,3797,'ZANJON',4206),(22,3798,'WEISBURD',4351),(22,3799,'YANDA',4206),(23,3800,'AGUILARES',4152),(23,3801,'J B ALBERDI (TUCUMAN)',4158),(23,3802,'ALDERETES',4178),(23,3803,'AMBERES',4144),(23,3804,'ALTO VERDE (TUCUMAN)',4153),(23,3805,'ACHERAL',4134),(23,3806,'ALTO N SRA DEL VALLE',4000),(23,3807,'ARCADIA',4147),(23,3808,'BENJAMIN ARAOZ',4178),(23,3810,'BANDA RIO SALI',4109),(23,3811,'BELLA VISTA (TUCUMAN)',4168),(23,3812,'TENIENTE BERDINA',4132),(23,3813,'INGENIO CRUZ ALTA',4184),(23,3814,'BURRUYACU',4119),(23,3815,'CEVIL REDONDO',4105),(23,3816,'CEVIL POZO',4178),(23,3817,'COLOMBRES',4111),(23,3818,'CONCEPCION (TUCUMAN)',4146),(23,3819,'CHICLIGASTA',4174),(23,3820,'COLALAO DEL VALLE',4141),(23,3821,'DELFIN GALLO',4117),(23,3822,'EL SIAMBON',4105),(23,3823,'EL COLMENAL',4101),(23,3824,'EL MANANTIAL',4105),(23,3825,'EL CHAÑAR',4117),(23,3826,'EL MIRADOR',4000),(23,3827,'ESQUINA DTO LEALES',4111),(23,3828,'PADILLA',4133),(23,3829,'PEDRO G MENDEZ',4117),(23,3830,'FAMAILLA',4132),(23,3831,'CHOROMORO',4122),(23,3832,'GASTONA',4146),(23,3833,'GRANEROS',4159),(23,3834,'ING LA FLORIDA',4117),(23,3835,'INGENIO SANTA ANA',4155),(23,3836,'ING SANTA LUCIA',4135),(23,3837,'INGENIO SAN JUAN',4109),(23,3838,'LA CAÑADA (TUCUMAN)',4159),(23,3839,'LA TRINIDAD',4151),(23,3840,'LAMADRID',4176),(23,3841,'LA INVERNADA',4132),(23,3842,'LA FRONTERITA',4111),(23,3843,'LA RAMADA',4119),(23,3844,'LASTENIA',4111),(23,3845,'LOS RALOS',4182),(23,3846,'LULES',4128),(23,3847,'LOS POCITOS',4101),(23,3848,'LOS NOGALES',4101),(23,3849,'LEALES',4113),(23,3850,'LA COCHA',4162),(23,3851,'MARCOS PAZ (TUCUMAN)',4107),(23,3852,'MONTEROS',4142),(23,3853,'LAS CEJAS',4200),(23,3854,'LOS SARMIENTO',4157),(23,3855,'OHUANTA',4132),(23,3856,'LOS GUCHEAS',4151),(23,3857,'LOS PUESTOS',4115),(23,3858,'RANCHILLOS',4178),(23,3859,'RIO COLORADO (TUCUMAN)',4166),(23,3860,'RIO SECO',4145),(23,3861,'RUMI PUNCO',4164),(23,3862,'LEON ROUGES',4143),(23,3863,'RIO CHICO',4153),(23,3864,'LOS GUTIERREZ',4178),(23,3865,'LAS TALITAS',4101),(23,3866,'SAN JAVIER (TUCUMAN)',4105),(23,3867,'SAN ANDRES (TUCUMAN)',4111),(23,3868,'SAN M DE TUCUMAN',4000),(23,3869,'SIMOCA',4172),(23,3870,'SOLEDAD FRONTERITA',4000),(23,3871,'SAN PABLO',4129),(23,3872,'SAN PEDRO DE COLALAO',4124),(23,3875,'TACO RALO',4242),(23,3876,'TAFI DEL VALLE',4137),(23,3877,'TAFI VIEJO',4103),(23,3878,'TRANCAS',4124),(23,3884,'VILLA ALBERDI',4158),(23,3885,'VILLA FIAD',4111),(23,3886,'VILLA CARMELA',4105),(23,3891,'VILLA C HILERET',4155),(23,3892,'VILLA QUINTEROS',4144),(23,3893,'VILLA MARIANO MORENO',4101),(23,3894,'VILLA NUEVA (TUCUMAN)',4142),(23,3896,'YERBA BUENA',4107),(23,3941,'SIETE DE ABRIL',4195),(24,3930,'RIO GRANDE',9420),(24,3935,'TOLHUIN',9420),(24,3940,'USHUAIA',9410),(24,10090,'TOLHIUN',9120);
/*!40000 ALTER TABLE `localidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcastarjetas`
--

DROP TABLE IF EXISTS `marcastarjetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marcastarjetas` (
  `IdMarca` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`IdMarca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcastarjetas`
--

LOCK TABLES `marcastarjetas` WRITE;
/*!40000 ALTER TABLE `marcastarjetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `marcastarjetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personas` (
  `IdPersona` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) NOT NULL,
  `Apellido` varchar(60) NOT NULL,
  `IdTipoDoc` int(11) NOT NULL,
  `NroDoc` int(11) NOT NULL,
  `Email` varchar(60) NOT NULL,
  PRIMARY KEY (`IdPersona`),
  UNIQUE KEY `NroDoc` (`NroDoc`),
  UNIQUE KEY `Email` (`Email`),
  KEY `IdTipoDoc` (`IdTipoDoc`),
  CONSTRAINT `personas_ibfk_1` FOREIGN KEY (`IdTipoDoc`) REFERENCES `tiposdoc` (`IdTipoDoc`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (2,'unCliente','unApellido',2,99999999,'cliente@hotmail.com'),(3,'asdasd','sadsadsa',1,1342131,'sadas@sada.com'),(4,'asdasdas','sadsadsa',1,2312321,'bbbb@asdas.com'),(5,'asdasd','asdasd',1,222453,'dddddd@sad.com'),(6,'asdsad','sadsad',1,4444343,'sadsadsa@asd.com'),(7,'Pepeee','asdsadsa',1,0,'asdsadas@asdsa.com'),(11,'asdasd','sadsada',1,56595653,'asdas@sadas.com'),(12,'asdasdsad','sadsadsa',1,23423,'asdsa@dasda.com'),(13,'Enrique','Cito',1,99885653,'enri@yahoo.com.ar'),(14,'leonardo','gomez',1,99896223,'atpatp@hotmail.com'),(15,'diego','forlan',1,23232221,'loffdso@gmail.com'),(16,'taladro','del sur',1,899983423,'banfield@hotmail.com'),(17,'Leonardo','Fernandez',1,988532221,'leocab@hotmail.com'),(18,'carlos','tevez',1,30565995,'tevez@hotmail.com'),(19,'pruebitaaa','pruebon',1,234337786,'pruebita@hotmail.com'),(20,'asdasd','asdsad',1,34343,'czx@sdsa.com'),(21,'jhhj','23',1,2132,'adsadasdsadsadsadasdsa@sad.com'),(22,'ivancito','fernandito',1,123454,'ivan@hotmail.com'),(23,'matiii','fumacooooo',1,1321222225,'sadsad@dsadas.com'),(24,'asdasdsa','sadsadsa',1,32432437,'asdsa@sadas.com'),(25,'asdsad','asdasdas',1,343333331,'asdsa@sasdas.com'),(26,'asdasd','dasdsa',1,2223988,'bb@sdas.com'),(27,'asdasda','sadasdas',1,3434,'asdsa@dsadas.com'),(28,'asdasd','asdsada',1,3434333,'sad3as@sadas.com'),(29,'asdasd','sadf',1,9983632,'dsad@hmail.casom'),(30,'asdsadsa','asdsad',2,3334331,'sss@sasss.com'),(31,'asdasd','3434asdas',1,33314,'asdas@sadsada.com'),(32,'pendientee','apependiente',2,2223232,'pendiente@hotmail.com'),(33,'Reynaldo','Lardapide',1,12052624,'todoFutbol@hotmail.com'),(34,'Carlos','Delgadillo',1,28236550,'oasis_banfield@hotmail.com'),(35,'Daniel','Gentile',1,14522303,'maracana_escalada@yahoo.com.ar'),(36,'Maximiliano','Gonzalez',1,30262559,'loslagartosfutbol@yahoo.com.ar'),(37,'Gustavo','Castro',1,20374469,'flasheras5@hotmail.com'),(38,'juancho','Vazques',1,32123123,'juan@gmail.com'),(39,'Torneo','Torneo',1,999999999,'torneos@gmail.com'),(40,'ivan','fernn',1,359593,'ivanjfernandez@outlook.com');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provincias` (
  `IdProvincia` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`IdProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES (1,'Buenos Aires'),(2,'Capital Federal'),(3,'Catamarca'),(4,'Córdoba'),(5,'Corrientes'),(6,'Chaco'),(7,'Chubut'),(8,'Entre Ríos'),(9,'Formosa'),(10,'Jujuy'),(11,'La Pampa'),(12,'La Rioja'),(13,'Mendoza'),(14,'Misiones'),(15,'Neuquen'),(16,'Río Negro'),(17,'Salta'),(18,'San Juan'),(19,'San Luis'),(20,'Santa Cruz'),(21,'Santa Fe'),(22,'Santiago del Estero'),(23,'Tucuman'),(24,'Tierra del Fuego');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puntajesporfechas`
--

DROP TABLE IF EXISTS `puntajesporfechas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puntajesporfechas` (
  `IdTorneo` int(11) NOT NULL,
  `IdFecha` int(11) NOT NULL,
  `IdEquipo` int(11) NOT NULL,
  `CantPuntos` int(11) NOT NULL,
  `Jugados` int(11) NOT NULL,
  `Ganados` int(11) NOT NULL,
  `Empatados` int(11) NOT NULL,
  `Perdidos` int(11) NOT NULL,
  PRIMARY KEY (`IdTorneo`,`IdFecha`,`IdEquipo`),
  KEY `PuntajesPorFechas_Equipo_fk` (`IdEquipo`),
  CONSTRAINT `PuntajesPorFechas_Equipo_fk` FOREIGN KEY (`IdEquipo`) REFERENCES `equipos` (`IdEquipo`),
  CONSTRAINT `PuntajesPorFechas_Torneo_fk` FOREIGN KEY (`IdTorneo`) REFERENCES `torneos` (`IdTorneo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntajesporfechas`
--

LOCK TABLES `puntajesporfechas` WRITE;
/*!40000 ALTER TABLE `puntajesporfechas` DISABLE KEYS */;
INSERT INTO `puntajesporfechas` VALUES (13,1,1,0,0,0,0,0),(13,1,2,0,0,0,0,0),(13,1,3,0,0,0,0,0),(13,1,4,0,0,0,0,0),(13,1,5,0,0,0,0,0),(13,1,6,0,0,0,0,0),(13,1,7,0,0,0,0,0),(13,1,8,0,0,0,0,0);
/*!40000 ALTER TABLE `puntajesporfechas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puntuaciones`
--

DROP TABLE IF EXISTS `puntuaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puntuaciones` (
  `IdPuntuacion` int(11) NOT NULL AUTO_INCREMENT,
  `Puntos` int(11) NOT NULL,
  `Descripcion` varchar(30) NOT NULL,
  PRIMARY KEY (`IdPuntuacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntuaciones`
--

LOCK TABLES `puntuaciones` WRITE;
/*!40000 ALTER TABLE `puntuaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `puntuaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservas` (
  `IdReserva` int(11) NOT NULL AUTO_INCREMENT,
  `IdComplejo` int(11) NOT NULL,
  `IdCancha` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `HoraInicio` time NOT NULL,
  `HoraFin` time NOT NULL,
  `APagar` double NOT NULL,
  `PorcentajePago` int(11) NOT NULL,
  `IdEstado` int(11) NOT NULL,
  `FechaReserva` datetime NOT NULL,
  `Pagado` double NOT NULL,
  `idTorneo` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdReserva`),
  KEY `Reservas_Canchas_fk` (`IdComplejo`,`IdCancha`),
  KEY `Reservas_Clientes_fk` (`IdCliente`),
  KEY `Reservas_Estados_fk` (`IdEstado`),
  CONSTRAINT `Reservas_Canchas_fk` FOREIGN KEY (`IdComplejo`, `IdCancha`) REFERENCES `canchas` (`IdComplejo`, `IdCancha`),
  CONSTRAINT `Reservas_Clientes_fk` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`),
  CONSTRAINT `Reservas_Estados_fk` FOREIGN KEY (`IdEstado`) REFERENCES `reservasestados` (`IdEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=2006 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,5,12,20,'2016-06-26','16:00:00','18:00:00',500,20,1,'2016-05-25 00:00:00',0,NULL),(18,6,16,20,'2016-06-19','18:00:00','19:00:00',800,110,2,'2016-06-03 00:00:00',800,NULL),(650,1,1,32,'2016-06-18','20:00:00','21:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(651,1,1,32,'2016-06-18','21:00:00','22:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(652,1,2,32,'2016-06-18','20:00:00','21:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(653,1,2,32,'2016-06-18','21:00:00','22:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(654,1,1,32,'2016-06-19','17:00:00','18:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(655,1,1,32,'2016-06-19','18:00:00','19:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(656,1,1,32,'2016-06-19','19:00:00','20:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(657,1,1,32,'2016-06-19','20:00:00','21:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(658,1,1,32,'2016-06-19','21:00:00','22:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(659,1,2,32,'2016-06-19','17:00:00','18:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(660,1,2,32,'2016-06-19','18:00:00','19:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(661,1,2,32,'2016-06-19','19:00:00','20:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(662,1,2,32,'2016-06-19','20:00:00','21:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(663,1,2,32,'2016-06-19','21:00:00','22:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(664,1,1,32,'2016-06-25','20:00:00','21:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(665,1,1,32,'2016-06-25','21:00:00','22:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(666,1,2,32,'2016-06-25','20:00:00','21:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(667,1,2,32,'2016-06-25','21:00:00','22:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(668,1,1,32,'2016-06-26','17:00:00','18:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(669,1,1,32,'2016-06-26','18:00:00','19:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(670,1,1,32,'2016-06-26','19:00:00','20:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(671,1,1,32,'2016-06-26','20:00:00','21:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(672,1,1,32,'2016-06-26','21:00:00','22:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(673,1,2,32,'2016-06-26','17:00:00','18:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(674,1,2,32,'2016-06-26','18:00:00','19:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(675,1,2,32,'2016-06-26','19:00:00','20:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(676,1,2,32,'2016-06-26','20:00:00','21:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(677,1,2,32,'2016-06-26','21:00:00','22:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(678,1,1,32,'2016-07-02','20:00:00','21:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(679,1,1,32,'2016-07-02','21:00:00','22:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(680,1,2,32,'2016-07-02','20:00:00','21:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(681,1,2,32,'2016-07-02','21:00:00','22:00:00',0,0,1,'2016-06-08 00:00:00',0,12),(1401,1,1,32,'2016-06-16','10:00:00','11:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1402,1,1,32,'2016-06-16','11:00:00','12:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1403,1,1,32,'2016-06-16','12:00:00','13:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1404,1,1,32,'2016-06-16','13:00:00','14:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1405,1,1,32,'2016-06-16','14:00:00','15:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1406,1,1,32,'2016-06-16','15:00:00','16:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1407,1,1,32,'2016-06-16','16:00:00','17:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1408,1,1,32,'2016-06-16','17:00:00','18:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1409,1,1,32,'2016-06-16','18:00:00','19:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1410,1,1,32,'2016-06-16','19:00:00','20:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1411,1,1,32,'2016-06-16','20:00:00','21:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1412,1,1,32,'2016-06-16','21:00:00','22:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1413,1,2,32,'2016-06-16','10:00:00','11:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1414,1,2,32,'2016-06-16','11:00:00','12:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1415,1,2,32,'2016-06-16','12:00:00','13:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1416,1,2,32,'2016-06-16','13:00:00','14:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1417,1,2,32,'2016-06-16','14:00:00','15:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1418,1,2,32,'2016-06-16','15:00:00','16:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1419,1,2,32,'2016-06-16','16:00:00','17:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1420,1,2,32,'2016-06-16','17:00:00','18:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1421,1,2,32,'2016-06-16','18:00:00','19:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1422,1,2,32,'2016-06-16','19:00:00','20:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1423,1,2,32,'2016-06-16','20:00:00','21:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1424,1,2,32,'2016-06-16','21:00:00','22:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1425,1,1,32,'2016-06-22','10:00:00','11:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1426,1,1,32,'2016-06-22','11:00:00','12:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1427,1,1,32,'2016-06-22','12:00:00','13:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1428,1,1,32,'2016-06-22','13:00:00','14:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1429,1,1,32,'2016-06-22','14:00:00','15:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1430,1,1,32,'2016-06-22','15:00:00','16:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1431,1,1,32,'2016-06-22','16:00:00','17:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1432,1,1,32,'2016-06-22','17:00:00','18:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1433,1,1,32,'2016-06-22','18:00:00','19:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1434,1,1,32,'2016-06-22','19:00:00','20:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1435,1,1,32,'2016-06-22','20:00:00','21:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1436,1,1,32,'2016-06-22','21:00:00','22:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1437,1,2,32,'2016-06-22','10:00:00','11:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1438,1,2,32,'2016-06-22','11:00:00','12:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1439,1,2,32,'2016-06-22','12:00:00','13:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1440,1,2,32,'2016-06-22','13:00:00','14:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1441,1,2,32,'2016-06-22','14:00:00','15:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1442,1,2,32,'2016-06-22','15:00:00','16:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1443,1,2,32,'2016-06-22','16:00:00','17:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1444,1,2,32,'2016-06-22','17:00:00','18:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1445,1,2,32,'2016-06-22','18:00:00','19:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1446,1,2,32,'2016-06-22','19:00:00','20:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1447,1,2,32,'2016-06-22','20:00:00','21:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1448,1,2,32,'2016-06-22','21:00:00','22:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1449,1,1,32,'2016-06-23','10:00:00','11:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1450,1,1,32,'2016-06-23','11:00:00','12:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1451,1,1,32,'2016-06-23','12:00:00','13:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1452,1,1,32,'2016-06-23','13:00:00','14:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1453,1,1,32,'2016-06-23','14:00:00','15:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1454,1,1,32,'2016-06-23','15:00:00','16:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1455,1,1,32,'2016-06-23','16:00:00','17:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1456,1,1,32,'2016-06-23','17:00:00','18:00:00',0,0,1,'2016-06-09 00:00:00',0,13),(1471,6,16,2,'2016-06-30','14:00:00','15:00:00',800,100,2,'2016-06-23 00:00:00',800,NULL),(1472,6,16,2,'2016-06-25','18:00:00','19:00:00',800,100,2,'2016-06-23 00:00:00',800,NULL),(1473,6,16,2,'2016-06-25','21:00:00','22:00:00',800,100,2,'2016-06-23 20:55:57',800,NULL),(1474,6,16,2,'2016-06-25','19:00:00','20:00:00',885,100,2,'2016-06-23 21:22:30',885,NULL),(1475,5,12,2,'2016-06-25','22:00:00','23:00:00',747.5,20,1,'2016-06-23 21:25:32',149.5,NULL),(1476,5,12,2,'2016-06-25','21:00:00','22:00:00',747.5,100,2,'2016-06-23 21:27:53',747.5,NULL),(1477,6,16,2,'2016-06-25','20:00:00','21:00:00',885,100,2,'2016-06-23 22:53:14',885,NULL),(1478,6,16,2,'2016-07-01','14:00:00','15:00:00',750,100,2,'2016-06-23 23:40:54',750,NULL),(1479,6,16,2,'2016-07-02','14:00:00','15:00:00',750,100,2,'2016-06-23 23:45:42',750,NULL),(1480,6,16,2,'2016-06-25','22:00:00','23:00:00',885,100,2,'2016-06-23 23:47:32',885,NULL),(1481,6,16,2,'2016-07-01','15:00:00','16:00:00',750,100,2,'2016-06-23 23:53:41',750,NULL),(1482,6,16,2,'2016-07-01','17:00:00','20:00:00',2520,100,2,'2016-06-28 01:41:28',2520,NULL),(1483,6,16,2,'2016-07-08','20:00:00','22:00:00',1770,100,2,'2016-06-28 01:42:30',1770,NULL),(1509,6,16,2,'2016-07-09','18:00:00','20:00:00',1770,100,2,'2016-06-28 01:44:42',1770,NULL),(1510,6,16,2,'2016-07-16','18:00:00','20:00:00',1770,0,3,'2016-06-28 01:44:42',0,NULL),(1511,6,16,2,'2016-07-23','18:00:00','20:00:00',1770,0,3,'2016-06-28 01:44:42',0,NULL),(1512,6,16,2,'2016-07-30','18:00:00','20:00:00',1770,0,3,'2016-06-28 01:44:42',0,NULL),(1513,6,16,2,'2016-08-06','18:00:00','20:00:00',1770,0,3,'2016-06-28 01:44:42',0,NULL),(1514,6,16,2,'2016-08-13','18:00:00','20:00:00',1770,0,3,'2016-06-28 01:44:42',0,NULL),(1515,6,16,2,'2016-08-20','18:00:00','20:00:00',1770,0,3,'2016-06-28 01:44:42',0,NULL),(1516,6,16,2,'2016-08-27','18:00:00','20:00:00',1770,0,3,'2016-06-28 01:44:42',0,NULL),(1517,6,16,2,'2016-09-03','18:00:00','20:00:00',1770,0,3,'2016-06-28 01:44:42',0,NULL),(1518,6,16,2,'2016-09-10','18:00:00','20:00:00',1770,0,3,'2016-06-28 01:44:42',0,NULL),(1519,6,16,2,'2016-09-17','18:00:00','20:00:00',1770,0,3,'2016-06-28 01:44:42',0,NULL),(1520,6,16,2,'2016-09-24','18:00:00','20:00:00',1770,0,3,'2016-06-28 01:44:42',0,NULL),(1521,6,16,2,'2016-10-01','18:00:00','20:00:00',1770,0,3,'2016-06-28 01:44:42',0,NULL),(1522,6,16,2,'2016-10-08','18:00:00','20:00:00',1770,0,3,'2016-06-28 01:44:42',0,NULL),(1523,6,16,2,'2016-10-15','18:00:00','20:00:00',1770,0,3,'2016-06-28 01:44:42',0,NULL),(1524,6,16,2,'2016-10-22','18:00:00','20:00:00',1770,0,3,'2016-06-28 01:44:42',0,NULL),(1525,6,16,2,'2016-10-29','18:00:00','20:00:00',1770,0,3,'2016-06-28 01:44:42',0,NULL),(1526,6,16,2,'2016-11-05','18:00:00','20:00:00',1770,0,3,'2016-06-28 01:44:42',0,NULL),(1527,6,16,2,'2016-11-12','18:00:00','20:00:00',1770,0,3,'2016-06-28 01:44:42',0,NULL),(1528,6,16,2,'2016-11-19','18:00:00','20:00:00',1770,0,3,'2016-06-28 01:44:42',0,NULL),(1529,6,16,2,'2016-11-26','18:00:00','20:00:00',1770,0,3,'2016-06-28 01:44:42',0,NULL),(1530,6,16,2,'2016-12-03','18:00:00','20:00:00',1770,0,3,'2016-06-28 01:44:42',0,NULL),(1531,6,16,2,'2016-12-10','18:00:00','20:00:00',1770,0,3,'2016-06-28 01:44:42',0,NULL),(1532,6,16,2,'2016-12-17','18:00:00','20:00:00',1770,0,3,'2016-06-28 01:44:42',0,NULL),(1533,6,16,2,'2016-12-24','18:00:00','20:00:00',1770,0,3,'2016-06-28 01:44:42',0,NULL),(1534,6,16,2,'2016-12-31','18:00:00','20:00:00',1770,0,3,'2016-06-28 01:44:42',0,NULL),(1535,6,16,2,'2016-06-30','18:00:00','19:00:00',885,100,2,'2016-06-28 22:42:10',885,NULL),(1536,6,16,2,'2016-07-07','18:00:00','19:00:00',885,0,3,'2016-06-28 22:42:10',0,NULL),(1537,6,16,2,'2016-07-14','18:00:00','19:00:00',885,0,3,'2016-06-28 22:42:10',0,NULL),(1538,6,16,2,'2016-07-21','18:00:00','19:00:00',885,0,3,'2016-06-28 22:42:10',0,NULL),(1539,6,16,2,'2016-07-28','18:00:00','19:00:00',885,0,3,'2016-06-28 22:42:10',0,NULL),(1540,6,16,2,'2016-08-04','18:00:00','19:00:00',885,0,3,'2016-06-28 22:42:10',0,NULL),(1541,6,16,2,'2016-08-11','18:00:00','19:00:00',885,0,3,'2016-06-28 22:42:10',0,NULL),(1542,6,16,2,'2016-08-18','18:00:00','19:00:00',885,0,3,'2016-06-28 22:42:10',0,NULL),(1543,6,16,2,'2016-08-25','18:00:00','19:00:00',885,0,3,'2016-06-28 22:42:10',0,NULL),(1544,6,16,2,'2016-09-01','18:00:00','19:00:00',885,0,3,'2016-06-28 22:42:10',0,NULL),(1545,6,16,2,'2016-09-08','18:00:00','19:00:00',885,0,3,'2016-06-28 22:42:10',0,NULL),(1546,6,16,2,'2016-09-15','18:00:00','19:00:00',885,0,3,'2016-06-28 22:42:10',0,NULL),(1547,6,16,2,'2016-09-22','18:00:00','19:00:00',885,0,3,'2016-06-28 22:42:10',0,NULL),(1548,6,16,2,'2016-09-29','18:00:00','19:00:00',885,0,3,'2016-06-28 22:42:10',0,NULL),(1549,6,16,2,'2016-10-06','18:00:00','19:00:00',885,0,3,'2016-06-28 22:42:10',0,NULL),(1550,6,16,2,'2016-10-13','18:00:00','19:00:00',885,0,3,'2016-06-28 22:42:10',0,NULL),(1551,6,16,2,'2016-10-20','18:00:00','19:00:00',885,0,3,'2016-06-28 22:42:10',0,NULL),(1552,6,16,2,'2016-10-27','18:00:00','19:00:00',885,0,3,'2016-06-28 22:42:10',0,NULL),(1553,6,16,2,'2016-11-03','18:00:00','19:00:00',885,0,3,'2016-06-28 22:42:10',0,NULL),(1554,6,16,2,'2016-11-10','18:00:00','19:00:00',885,0,3,'2016-06-28 22:42:10',0,NULL),(1555,6,16,2,'2016-11-17','18:00:00','19:00:00',885,0,3,'2016-06-28 22:42:10',0,NULL),(1556,6,16,2,'2016-11-24','18:00:00','19:00:00',885,0,3,'2016-06-28 22:42:10',0,NULL),(1557,6,16,2,'2016-12-01','18:00:00','19:00:00',885,0,3,'2016-06-28 22:42:10',0,NULL),(1558,6,16,2,'2016-12-08','18:00:00','19:00:00',885,0,3,'2016-06-28 22:42:10',0,NULL),(1559,6,16,2,'2016-12-15','18:00:00','19:00:00',885,0,3,'2016-06-28 22:42:10',0,NULL),(1560,6,16,2,'2016-12-22','18:00:00','19:00:00',885,0,3,'2016-06-28 22:42:10',0,NULL),(1561,6,16,2,'2016-12-29','18:00:00','19:00:00',885,0,3,'2016-06-28 22:42:10',0,NULL),(1562,6,16,2,'2016-07-01','16:00:00','17:00:00',750,100,2,'2016-06-29 23:10:19',750,NULL),(1563,6,16,2,'2016-07-07','14:00:00','15:00:00',750,100,2,'2016-06-30 20:03:53',750,NULL),(1564,6,16,2,'2016-07-09','14:00:00','15:00:00',750,100,2,'2016-06-30 20:06:59',750,NULL),(1565,6,16,2,'2016-07-09','15:00:00','16:00:00',750,100,2,'2016-06-30 20:14:44',750,NULL),(1566,6,16,2,'2016-07-07','15:00:00','16:00:00',750,100,2,'2016-06-30 20:16:19',750,NULL),(1567,6,16,2,'2016-07-09','16:00:00','17:00:00',750,100,2,'2016-06-30 20:16:37',750,NULL),(1568,6,16,2,'2016-07-08','14:00:00','15:00:00',750,100,2,'2016-06-30 20:17:01',750,NULL),(1569,5,12,2,'2016-07-06','14:00:00','15:00:00',650,100,2,'2016-06-30 20:18:41',650,NULL),(1570,6,16,2,'2016-07-08','15:00:00','16:00:00',750,100,2,'2016-06-30 20:53:35',750,NULL),(1571,6,16,2,'2016-07-09','17:00:00','18:00:00',750,100,2,'2016-06-30 20:58:21',750,NULL),(1572,6,16,2,'2016-07-02','15:00:00','16:00:00',750,100,2,'2016-06-30 21:00:20',750,NULL),(1573,6,16,2,'2016-08-06','20:00:00','21:00:00',885,100,2,'2016-06-30 21:01:37',885,NULL),(1574,6,16,2,'2016-07-01','20:00:00','21:00:00',885,100,2,'2016-06-30 21:03:06',885,NULL),(1575,6,16,2,'2016-07-01','21:00:00','22:00:00',885,100,2,'2016-06-30 21:03:33',885,NULL),(1576,6,16,2,'2016-07-04','14:00:00','15:00:00',750,100,2,'2016-06-30 21:07:44',750,NULL),(1577,6,16,2,'2016-07-09','20:00:00','21:00:00',885,100,2,'2016-06-30 21:11:39',885,NULL),(1578,6,16,2,'2016-07-05','14:00:00','15:00:00',750,100,2,'2016-06-30 21:55:13',750,NULL),(1579,6,16,2,'2016-07-01','22:00:00','23:00:00',885,100,2,'2016-06-30 21:56:21',885,NULL),(1580,6,16,2,'2016-07-07','16:00:00','17:00:00',750,100,2,'2016-06-30 22:32:44',750,NULL),(1581,6,16,2,'2016-07-08','16:00:00','17:00:00',750,100,2,'2016-06-30 22:34:56',750,NULL),(1582,6,16,2,'2016-07-30','14:00:00','15:00:00',750,100,2,'2016-06-30 22:35:27',750,NULL),(1583,6,16,2,'2016-07-09','21:00:00','22:00:00',885,100,2,'2016-06-30 22:36:27',885,NULL),(1584,6,16,2,'2016-08-02','14:00:00','15:00:00',750,100,2,'2016-06-30 22:37:03',750,NULL),(1585,6,16,2,'2016-07-07','17:00:00','18:00:00',750,100,2,'2016-06-30 22:38:12',750,NULL),(1586,6,16,2,'2016-07-08','17:00:00','18:00:00',750,100,2,'2016-06-30 22:39:05',750,NULL),(1587,6,16,2,'2016-07-09','22:00:00','23:00:00',885,100,2,'2016-06-30 22:44:40',885,NULL),(1588,6,16,2,'2016-07-20','14:00:00','15:00:00',750,100,2,'2016-06-30 22:45:29',750,NULL),(1589,6,16,2,'2016-07-02','16:00:00','17:00:00',750,100,2,'2016-06-30 22:50:24',750,NULL),(1590,6,16,2,'2016-07-02','17:00:00','18:00:00',750,100,2,'2016-06-30 22:52:24',750,NULL),(1591,6,16,2,'2016-07-08','18:00:00','19:00:00',885,100,2,'2016-06-30 23:12:03',885,NULL),(1592,6,16,2,'2016-07-28','17:00:00','18:00:00',750,100,2,'2016-07-01 21:36:33',750,NULL),(1593,6,16,2,'2016-07-29','14:00:00','15:00:00',750,100,2,'2016-07-02 00:27:25',750,NULL),(1594,3,8,2,'2016-08-04','12:00:00','13:00:00',550,40,1,'2016-07-02 13:39:59',220,NULL),(1595,3,8,2,'2016-07-23','12:00:00','13:00:00',550,100,2,'2016-07-02 16:36:44',550,NULL),(1596,3,8,2,'2016-07-30','12:00:00','13:00:00',550,0,3,'2016-07-02 16:36:44',0,NULL),(1597,3,8,2,'2016-08-06','12:00:00','13:00:00',550,0,3,'2016-07-02 16:36:44',0,NULL),(1598,3,8,2,'2016-08-13','12:00:00','13:00:00',550,0,3,'2016-07-02 16:36:44',0,NULL),(1599,3,8,2,'2016-08-20','12:00:00','13:00:00',550,0,3,'2016-07-02 16:36:44',0,NULL),(1600,3,8,2,'2016-08-27','12:00:00','13:00:00',550,0,3,'2016-07-02 16:36:44',0,NULL),(1601,3,8,2,'2016-09-03','12:00:00','13:00:00',550,0,3,'2016-07-02 16:36:44',0,NULL),(1602,3,8,2,'2016-09-10','12:00:00','13:00:00',550,0,3,'2016-07-02 16:36:44',0,NULL),(1603,3,8,2,'2016-09-17','12:00:00','13:00:00',550,0,3,'2016-07-02 16:36:44',0,NULL),(1604,3,8,2,'2016-09-24','12:00:00','13:00:00',550,0,3,'2016-07-02 16:36:44',0,NULL),(1605,3,8,2,'2016-10-01','12:00:00','13:00:00',550,0,3,'2016-07-02 16:36:44',0,NULL),(1606,3,8,2,'2016-10-08','12:00:00','13:00:00',550,0,3,'2016-07-02 16:36:44',0,NULL),(1607,3,8,2,'2016-10-15','12:00:00','13:00:00',550,0,3,'2016-07-02 16:36:44',0,NULL),(1608,3,8,2,'2016-10-22','12:00:00','13:00:00',550,0,3,'2016-07-02 16:36:44',0,NULL),(1609,3,8,2,'2016-10-29','12:00:00','13:00:00',550,0,3,'2016-07-02 16:36:44',0,NULL),(1610,3,8,2,'2016-11-05','12:00:00','13:00:00',550,0,3,'2016-07-02 16:36:44',0,NULL),(1611,3,8,2,'2016-11-12','12:00:00','13:00:00',550,0,3,'2016-07-02 16:36:44',0,NULL),(1612,3,8,2,'2016-11-19','12:00:00','13:00:00',550,0,3,'2016-07-02 16:36:44',0,NULL),(1613,3,8,2,'2016-11-26','12:00:00','13:00:00',550,0,3,'2016-07-02 16:36:44',0,NULL),(1614,3,8,2,'2016-12-03','12:00:00','13:00:00',550,0,3,'2016-07-02 16:36:44',0,NULL),(1615,3,8,2,'2016-12-10','12:00:00','13:00:00',550,0,3,'2016-07-02 16:36:44',0,NULL),(1616,3,8,2,'2016-12-17','12:00:00','13:00:00',550,0,3,'2016-07-02 16:36:45',0,NULL),(1617,3,8,2,'2016-12-24','12:00:00','13:00:00',550,0,3,'2016-07-02 16:36:45',0,NULL),(1618,3,8,2,'2016-12-31','12:00:00','13:00:00',550,0,3,'2016-07-02 16:36:45',0,NULL),(1619,3,8,2,'2016-07-26','12:00:00','13:00:00',550,100,2,'2016-07-02 21:58:30',550,NULL),(1620,3,8,2,'2016-07-20','12:00:00','13:00:00',550,100,2,'2016-07-02 22:21:33',550,NULL),(1621,3,8,2,'2016-07-30','13:00:00','14:00:00',550,100,2,'2016-07-02 22:24:29',550,NULL),(1623,3,8,2,'2016-08-04','13:00:00','14:00:00',550,100,2,'2016-07-08 13:26:56',550,NULL),(1716,1,4,32,'2016-07-18','10:00:00','11:00:00',0,0,1,'2016-07-09 00:00:00',0,16),(1717,1,4,32,'2016-07-18','11:00:00','12:00:00',0,0,1,'2016-07-09 00:00:00',0,16),(1718,1,4,32,'2016-07-18','12:00:00','13:00:00',0,0,1,'2016-07-09 00:00:00',0,16),(1719,1,4,32,'2016-07-18','13:00:00','14:00:00',0,0,1,'2016-07-09 00:00:00',0,16),(1720,1,4,32,'2016-07-18','14:00:00','15:00:00',0,0,1,'2016-07-09 00:00:00',0,16),(1721,1,4,32,'2016-07-18','15:00:00','16:00:00',0,0,1,'2016-07-09 00:00:00',0,16),(1722,1,4,32,'2016-07-18','16:00:00','17:00:00',0,0,1,'2016-07-09 00:00:00',0,16),(1723,1,4,32,'2016-07-18','17:00:00','18:00:00',0,0,1,'2016-07-09 00:00:00',0,16),(1724,1,4,32,'2016-07-18','18:00:00','19:00:00',0,0,1,'2016-07-09 00:00:00',0,16),(1725,1,4,32,'2016-07-18','19:00:00','20:00:00',0,0,1,'2016-07-09 00:00:00',0,16),(1726,1,4,32,'2016-07-18','20:00:00','21:00:00',0,0,1,'2016-07-09 00:00:00',0,16),(1727,1,4,32,'2016-07-18','21:00:00','22:00:00',0,0,1,'2016-07-09 00:00:00',0,16),(1728,1,5,32,'2016-07-18','10:00:00','11:00:00',0,0,1,'2016-07-09 00:00:00',0,16),(1729,1,5,32,'2016-07-18','11:00:00','12:00:00',0,0,1,'2016-07-09 00:00:00',0,16),(1730,1,5,32,'2016-07-18','12:00:00','13:00:00',0,0,1,'2016-07-09 00:00:00',0,16),(1731,1,5,32,'2016-07-18','13:00:00','14:00:00',0,0,1,'2016-07-09 00:00:00',0,16),(1867,1,1,32,'2016-07-16','17:00:00','18:00:00',0,0,1,'2016-07-09 00:00:00',0,17),(1868,1,1,32,'2016-07-16','18:00:00','19:00:00',0,0,1,'2016-07-09 00:00:00',0,17),(1869,1,1,32,'2016-07-16','19:00:00','20:00:00',0,0,1,'2016-07-09 00:00:00',0,17),(1870,1,1,32,'2016-07-16','20:00:00','21:00:00',0,0,1,'2016-07-09 00:00:00',0,17),(1871,1,1,32,'2016-07-16','21:00:00','22:00:00',0,0,1,'2016-07-09 00:00:00',0,17),(1872,1,2,32,'2016-07-16','17:00:00','18:00:00',0,0,1,'2016-07-09 00:00:00',0,17),(1873,1,2,32,'2016-07-16','18:00:00','19:00:00',0,0,1,'2016-07-09 00:00:00',0,17),(1874,1,2,32,'2016-07-16','19:00:00','20:00:00',0,0,1,'2016-07-09 00:00:00',0,17),(1897,1,1,32,'2016-07-18','10:00:00','11:00:00',0,0,1,'2016-07-09 00:00:00',0,19),(1898,1,1,32,'2016-07-18','11:00:00','12:00:00',0,0,1,'2016-07-09 00:00:00',0,19),(1899,1,1,32,'2016-07-18','12:00:00','13:00:00',0,0,1,'2016-07-09 00:00:00',0,19),(1900,1,1,32,'2016-07-18','13:00:00','14:00:00',0,0,1,'2016-07-09 00:00:00',0,19),(1901,1,1,32,'2016-07-18','14:00:00','15:00:00',0,0,1,'2016-07-09 00:00:00',0,19),(1902,1,1,32,'2016-07-18','15:00:00','16:00:00',0,0,1,'2016-07-09 00:00:00',0,19),(1903,1,1,32,'2016-07-18','16:00:00','17:00:00',0,0,1,'2016-07-09 00:00:00',0,19),(1904,1,1,32,'2016-07-18','17:00:00','18:00:00',0,0,1,'2016-07-09 00:00:00',0,19),(1905,1,1,32,'2016-07-18','18:00:00','19:00:00',0,0,1,'2016-07-09 00:00:00',0,19),(1906,1,1,32,'2016-07-18','19:00:00','20:00:00',0,0,1,'2016-07-09 00:00:00',0,19),(1907,1,1,32,'2016-07-18','20:00:00','21:00:00',0,0,1,'2016-07-09 00:00:00',0,19),(1908,1,1,32,'2016-07-18','21:00:00','22:00:00',0,0,1,'2016-07-09 00:00:00',0,19),(1909,1,2,32,'2016-07-18','10:00:00','11:00:00',0,0,1,'2016-07-09 00:00:00',0,19),(1910,1,2,32,'2016-07-18','11:00:00','12:00:00',0,0,1,'2016-07-09 00:00:00',0,19),(1911,1,2,32,'2016-07-18','12:00:00','13:00:00',0,0,1,'2016-07-09 00:00:00',0,19),(1912,1,2,32,'2016-07-18','13:00:00','14:00:00',0,0,1,'2016-07-09 00:00:00',0,19),(1928,1,1,32,'2016-07-03','17:00:00','18:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1929,1,1,32,'2016-07-03','18:00:00','19:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1930,1,1,32,'2016-07-03','19:00:00','20:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1931,1,1,32,'2016-07-03','20:00:00','21:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1932,1,1,32,'2016-07-03','21:00:00','22:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1933,1,2,32,'2016-07-03','17:00:00','18:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1934,1,2,32,'2016-07-03','18:00:00','19:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1935,1,2,32,'2016-07-03','19:00:00','20:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1936,1,2,32,'2016-07-03','20:00:00','21:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1937,1,2,32,'2016-07-03','21:00:00','22:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1938,1,1,32,'2016-07-09','20:00:00','21:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1939,1,1,32,'2016-07-09','21:00:00','22:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1940,1,2,32,'2016-07-09','20:00:00','21:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1941,1,2,32,'2016-07-09','21:00:00','22:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1942,1,1,32,'2016-07-10','17:00:00','18:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1943,1,1,32,'2016-07-10','18:00:00','19:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1944,1,1,32,'2016-07-10','19:00:00','20:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1945,1,1,32,'2016-07-10','20:00:00','21:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1946,1,1,32,'2016-07-10','21:00:00','22:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1947,1,2,32,'2016-07-10','17:00:00','18:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1948,1,2,32,'2016-07-10','18:00:00','19:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1949,1,2,32,'2016-07-10','19:00:00','20:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1950,1,2,32,'2016-07-10','20:00:00','21:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1951,1,2,32,'2016-07-10','21:00:00','22:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1952,1,2,32,'2016-07-16','20:00:00','21:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1953,1,2,32,'2016-07-16','21:00:00','22:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1954,1,1,32,'2016-07-17','17:00:00','18:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1955,1,1,32,'2016-07-17','18:00:00','19:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1956,1,1,32,'2016-07-17','19:00:00','20:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1957,1,1,32,'2016-07-17','20:00:00','21:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1958,1,1,32,'2016-07-17','21:00:00','22:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1959,1,2,32,'2016-07-17','17:00:00','18:00:00',0,0,1,'2016-07-10 00:00:00',0,12),(1991,1,2,32,'2016-07-18','14:00:00','15:00:00',0,0,1,'2016-07-10 00:00:00',0,20),(1992,1,2,32,'2016-07-18','15:00:00','16:00:00',0,0,1,'2016-07-10 00:00:00',0,20),(1993,1,2,32,'2016-07-18','16:00:00','17:00:00',0,0,1,'2016-07-10 00:00:00',0,20),(1994,1,2,32,'2016-07-18','17:00:00','18:00:00',0,0,1,'2016-07-10 00:00:00',0,20),(1995,1,2,32,'2016-07-18','18:00:00','19:00:00',0,0,1,'2016-07-10 00:00:00',0,20),(1996,1,2,32,'2016-07-18','19:00:00','20:00:00',0,0,1,'2016-07-10 00:00:00',0,20),(1997,1,2,32,'2016-07-18','20:00:00','21:00:00',0,0,1,'2016-07-10 00:00:00',0,20),(1998,1,2,32,'2016-07-18','21:00:00','22:00:00',0,0,1,'2016-07-10 00:00:00',0,20),(1999,1,5,32,'2016-07-18','14:00:00','15:00:00',0,0,1,'2016-07-10 00:00:00',0,20),(2000,1,5,32,'2016-07-18','15:00:00','16:00:00',0,0,1,'2016-07-10 00:00:00',0,20),(2001,1,5,32,'2016-07-18','16:00:00','17:00:00',0,0,1,'2016-07-10 00:00:00',0,20),(2002,1,5,32,'2016-07-18','17:00:00','18:00:00',0,0,1,'2016-07-10 00:00:00',0,20),(2003,1,5,32,'2016-07-18','18:00:00','19:00:00',0,0,1,'2016-07-10 00:00:00',0,20),(2004,1,5,32,'2016-07-18','19:00:00','20:00:00',0,0,1,'2016-07-10 00:00:00',0,20),(2005,1,5,32,'2016-07-18','20:00:00','21:00:00',0,0,1,'2016-07-10 00:00:00',0,20);
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservasestados`
--

DROP TABLE IF EXISTS `reservasestados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservasestados` (
  `IdEstado` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(30) NOT NULL,
  PRIMARY KEY (`IdEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservasestados`
--

LOCK TABLES `reservasestados` WRITE;
/*!40000 ALTER TABLE `reservasestados` DISABLE KEYS */;
INSERT INTO `reservasestados` VALUES (1,'Señada'),(2,'Pagada completa'),(3,'Fija');
/*!40000 ALTER TABLE `reservasestados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservastemporal`
--

DROP TABLE IF EXISTS `reservastemporal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservastemporal` (
  `idComplejo` int(11) NOT NULL,
  `idCancha` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservastemporal`
--

LOCK TABLES `reservastemporal` WRITE;
/*!40000 ALTER TABLE `reservastemporal` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservastemporal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposdoc`
--

DROP TABLE IF EXISTS `tiposdoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposdoc` (
  `IdTipoDoc` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(30) NOT NULL,
  `IdEstado` int(11) NOT NULL,
  PRIMARY KEY (`IdTipoDoc`),
  KEY `IdEstado` (`IdEstado`),
  CONSTRAINT `tiposdoc_ibfk_1` FOREIGN KEY (`IdEstado`) REFERENCES `docestados` (`IdEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposdoc`
--

LOCK TABLES `tiposdoc` WRITE;
/*!40000 ALTER TABLE `tiposdoc` DISABLE KEYS */;
INSERT INTO `tiposdoc` VALUES (1,'DNI',1),(2,'CUIL',1),(3,'DNI',1),(4,'CUIL',1);
/*!40000 ALTER TABLE `tiposdoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipossuperficie`
--

DROP TABLE IF EXISTS `tipossuperficie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipossuperficie` (
  `IdSuperficie` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(30) NOT NULL,
  PRIMARY KEY (`IdSuperficie`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipossuperficie`
--

LOCK TABLES `tipossuperficie` WRITE;
/*!40000 ALTER TABLE `tipossuperficie` DISABLE KEYS */;
INSERT INTO `tipossuperficie` VALUES (1,'Alfombra'),(2,'Baldosa'),(3,'Cemento'),(4,'Césped'),(5,'Cesped sintético'),(6,'Tierra');
/*!40000 ALTER TABLE `tipossuperficie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipotorneos`
--

DROP TABLE IF EXISTS `tipotorneos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipotorneos` (
  `IdTipoTorneo` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`IdTipoTorneo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipotorneos`
--

LOCK TABLES `tipotorneos` WRITE;
/*!40000 ALTER TABLE `tipotorneos` DISABLE KEYS */;
INSERT INTO `tipotorneos` VALUES (1,'Liga'),(2,'Copa');
/*!40000 ALTER TABLE `tipotorneos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipotorneosequipos`
--

DROP TABLE IF EXISTS `tipotorneosequipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipotorneosequipos` (
  `IdTipoTorneo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`IdTipoTorneo`,`cantidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipotorneosequipos`
--

LOCK TABLES `tipotorneosequipos` WRITE;
/*!40000 ALTER TABLE `tipotorneosequipos` DISABLE KEYS */;
INSERT INTO `tipotorneosequipos` VALUES (1,4),(1,6),(1,8),(1,10),(1,12),(1,14),(1,16),(1,18),(1,20),(1,22),(1,24),(1,26),(1,28),(1,30),(2,4),(2,8),(2,16),(2,32);
/*!40000 ALTER TABLE `tipotorneosequipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmpequipos`
--

DROP TABLE IF EXISTS `tmpequipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmpequipos` (
  `posicion` int(11) DEFAULT NULL,
  `idtorneo` int(11) DEFAULT NULL,
  `idReserva` int(11) DEFAULT NULL,
  `IdEquipo1` int(11) DEFAULT NULL,
  `IdEquipo2` int(11) DEFAULT NULL,
  `idFecha` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmpequipos`
--

LOCK TABLES `tmpequipos` WRITE;
/*!40000 ALTER TABLE `tmpequipos` DISABLE KEYS */;
INSERT INTO `tmpequipos` VALUES (1,19,1897,1,2,NULL),(2,19,1898,1,3,NULL),(3,19,1899,1,4,NULL),(4,19,1900,1,5,NULL),(5,19,1901,1,6,NULL),(6,19,1902,2,3,NULL),(7,19,1903,2,4,NULL),(8,19,1904,2,5,NULL);
/*!40000 ALTER TABLE `tmpequipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torneos`
--

DROP TABLE IF EXISTS `torneos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torneos` (
  `IdTorneo` int(11) NOT NULL AUTO_INCREMENT,
  `IdDuenio` int(11) NOT NULL,
  `IdTipoTorneo` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `CantEquipos` int(11) NOT NULL,
  `CantJugadores` int(11) NOT NULL,
  `IdSuperficie` int(11) NOT NULL,
  `IdaYvuelta` tinyint(1) NOT NULL,
  `PrecioInscripcion` double(6,2) NOT NULL,
  `FecIniInscripcion` date NOT NULL,
  `FecFinInscripcion` date NOT NULL,
  `HorasCancelacion` int(11) NOT NULL,
  `FechaInicio` date NOT NULL,
  `FechaFin` date NOT NULL,
  `Descripcion` varchar(300) NOT NULL,
  `Reglas` varchar(300) NOT NULL,
  `IdEstado` int(11) NOT NULL,
  `tiempoPArtido` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdTorneo`),
  KEY `Torneo_duenio_fk` (`IdDuenio`),
  KEY `Torneo_Tipos_fk` (`IdTipoTorneo`),
  KEY `Torneo_Superficie_fk` (`IdSuperficie`),
  KEY `Torneo_Estados_fk` (`IdEstado`),
  CONSTRAINT `Torneo_Estados_fk` FOREIGN KEY (`IdEstado`) REFERENCES `torneosestados` (`IdEstado`),
  CONSTRAINT `Torneo_Superficie_fk` FOREIGN KEY (`IdSuperficie`) REFERENCES `tipossuperficie` (`IdSuperficie`),
  CONSTRAINT `Torneo_Tipos_fk` FOREIGN KEY (`IdTipoTorneo`) REFERENCES `tipotorneos` (`IdTipoTorneo`),
  CONSTRAINT `Torneo_duenio_fk` FOREIGN KEY (`IdDuenio`) REFERENCES `duenios` (`IdDuenio`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torneos`
--

LOCK TABLES `torneos` WRITE;
/*!40000 ALTER TABLE `torneos` DISABLE KEYS */;
INSERT INTO `torneos` VALUES (1,1,1,'pepe',4,5,1,0,0.00,'2016-05-29','2016-05-29',72,'2016-05-29','2016-05-29','Inscripcion','fdfd',1,NULL),(2,1,1,'fdf',4,5,1,0,0.00,'2016-05-29','2016-05-29',72,'2016-05-29','2016-05-29','Inscripcion','dfdfdf',2,NULL),(3,1,1,'lanus',4,5,1,0,0.00,'2016-05-29','2016-05-29',72,'2016-05-29','2016-05-29','Inscripcion','dsda',2,NULL),(4,1,1,'dsds',4,5,1,0,0.00,'2016-05-29','2016-05-29',72,'2016-05-29','2016-05-29','Inscripcion','dsadsdsd',2,NULL),(5,1,1,'ddd',4,5,1,0,0.00,'2016-05-29','2016-05-29',72,'2016-05-29','2016-05-29','Inscripcion','dsdsd',2,NULL),(6,1,1,'hhhh',4,5,1,0,0.00,'2016-05-29','2016-05-29',72,'2016-05-29','2016-05-29','Inscripcion','hhh',2,NULL),(7,1,1,'ssas',4,5,1,0,0.00,'2016-05-29','2016-05-29',72,'2016-05-29','2016-05-29','Inscripcion','dfdfdf',2,NULL),(8,1,1,'ddd',4,5,1,0,0.00,'2016-05-29','2016-05-29',72,'2016-05-29','2016-05-29','Inscripcion','d',2,NULL),(9,1,1,'xdccc',4,5,1,0,0.00,'2016-05-29','2016-05-29',72,'2016-05-29','2016-05-29','Inscripcion','cdf',2,NULL),(10,1,1,'ddd',4,5,1,0,0.00,'2016-05-29','2016-05-29',72,'2016-05-29','2016-05-29','Inscripcion','fgfgf',2,NULL),(11,1,1,'lanus cup',4,5,1,0,0.00,'2016-05-30','2016-05-30',72,'2016-05-30','2016-05-30','Inscripcion','mis reglas',2,NULL),(12,1,2,'Centenario',32,5,1,0,50.00,'2016-06-04','2016-06-07',72,'2016-06-15','2016-07-19','Inscripcion','se vale todo amigo.',1,60),(13,1,1,'Superliga',8,7,1,1,150.00,'2016-06-08','2016-06-15',72,'2016-06-16','2016-08-25','Inscripcion','fdfdfdf',1,40),(14,1,1,'ligaGol',8,5,1,0,10.00,'2016-06-08','2016-06-10',72,'2016-06-10','2016-08-30','Inscripcion','fdfdf',2,20),(15,1,2,'Eurocopa',8,5,1,0,0.00,'2016-06-12','2016-06-19',72,'2016-06-23','2016-09-03','nuevo torneo','no valen patadas',2,20),(16,1,2,'Afanados',16,5,3,0,0.00,'2016-07-09','2016-07-15',72,'2016-07-15','2016-09-02','nuevo torneo afanados','En este torneo se aplican todas las reglas conocidas.',1,10),(17,1,2,'Afa Ida y Vuelta',4,5,1,1,0.00,'2016-07-09','2016-07-15',72,'2016-07-15','2016-09-23','nuevo torneo ida y vuelta','vale todo che!!',1,10),(19,1,2,'copa mundo',8,5,1,1,0.00,'2016-07-09','2016-07-15',72,'2016-07-15','2016-10-01','es la copa del munco','aplican todas las reglas de una copa del mundo.',1,10),(20,1,1,'la premier22',6,7,2,0,0.00,'2016-07-10','2016-07-15',72,'2016-07-15','2016-07-15','es la premier league','todas las reglas del torneo ingles',2,10);
/*!40000 ALTER TABLE `torneos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torneoscanchas`
--

DROP TABLE IF EXISTS `torneoscanchas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torneoscanchas` (
  `IdTorneo` int(11) NOT NULL,
  `IdComplejo` int(11) NOT NULL,
  `IdCancha` int(11) NOT NULL,
  PRIMARY KEY (`IdTorneo`,`IdComplejo`,`IdCancha`),
  KEY `com_Torneos_fk` (`IdComplejo`,`IdCancha`),
  CONSTRAINT `canchas_Torneos_fk` FOREIGN KEY (`IdTorneo`) REFERENCES `torneos` (`IdTorneo`),
  CONSTRAINT `com_Torneos_fk` FOREIGN KEY (`IdComplejo`, `IdCancha`) REFERENCES `canchas` (`IdComplejo`, `IdCancha`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torneoscanchas`
--

LOCK TABLES `torneoscanchas` WRITE;
/*!40000 ALTER TABLE `torneoscanchas` DISABLE KEYS */;
INSERT INTO `torneoscanchas` VALUES (12,1,1),(13,1,1),(17,1,1),(19,1,1),(12,1,2),(13,1,2),(17,1,2),(19,1,2),(20,1,2),(16,1,4),(16,1,5),(20,1,5);
/*!40000 ALTER TABLE `torneoscanchas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torneosdias`
--

DROP TABLE IF EXISTS `torneosdias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torneosdias` (
  `IdTorneo` int(11) NOT NULL,
  `IdDia` int(11) NOT NULL,
  `HoraDesde` time NOT NULL,
  `HoraHasta` time NOT NULL,
  PRIMARY KEY (`IdTorneo`,`IdDia`),
  KEY `DiaDesde_TDias_fk` (`IdDia`),
  CONSTRAINT `DiaDesde_TDias_fk` FOREIGN KEY (`IdDia`) REFERENCES `dias` (`IdDia`),
  CONSTRAINT `Dias_Torneos_fk` FOREIGN KEY (`IdTorneo`) REFERENCES `torneos` (`IdTorneo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torneosdias`
--

LOCK TABLES `torneosdias` WRITE;
/*!40000 ALTER TABLE `torneosdias` DISABLE KEYS */;
INSERT INTO `torneosdias` VALUES (1,2,'10:00:00','22:00:00'),(2,4,'10:00:00','22:00:00'),(3,7,'17:00:00','22:00:00'),(4,6,'17:00:00','22:00:00'),(5,7,'17:00:00','22:00:00'),(6,7,'17:00:00','22:00:00'),(7,6,'17:00:00','22:00:00'),(8,4,'10:00:00','22:00:00'),(9,7,'17:00:00','22:00:00'),(10,6,'17:00:00','22:00:00'),(11,7,'17:00:00','22:00:00'),(12,6,'20:00:00','22:00:00'),(12,7,'17:00:00','22:00:00'),(13,3,'10:00:00','22:00:00'),(13,4,'10:00:00','22:00:00'),(14,3,'10:00:00','22:00:00'),(14,4,'10:00:00','22:00:00'),(15,6,'17:00:00','22:00:00'),(15,7,'17:00:00','22:00:00'),(16,1,'10:00:00','22:00:00'),(16,2,'10:00:00','22:00:00'),(16,3,'10:00:00','22:00:00'),(17,1,'10:00:00','22:00:00'),(17,2,'10:00:00','22:00:00'),(17,6,'17:00:00','22:00:00'),(17,7,'17:00:00','22:00:00'),(19,1,'10:00:00','22:00:00'),(19,2,'10:00:00','22:00:00'),(19,3,'10:00:00','22:00:00'),(20,2,'10:00:00','22:00:00'),(20,3,'10:00:00','22:00:00');
/*!40000 ALTER TABLE `torneosdias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torneosequipos`
--

DROP TABLE IF EXISTS `torneosequipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torneosequipos` (
  `IdTorneo` int(11) NOT NULL,
  `IdEquipo` int(11) NOT NULL,
  `IdEstado` int(11) NOT NULL,
  `fechaInscipcion` date DEFAULT NULL,
  PRIMARY KEY (`IdTorneo`,`IdEquipo`),
  KEY `TorneoEquipo_Equipo_fk` (`IdEquipo`),
  KEY `TorneoEquipo_Estado_fk` (`IdEstado`),
  CONSTRAINT `TorneoEquipo_Equipo_fk` FOREIGN KEY (`IdEquipo`) REFERENCES `equipos` (`IdEquipo`),
  CONSTRAINT `TorneoEquipo_Estado_fk` FOREIGN KEY (`IdEstado`) REFERENCES `torneosestados` (`IdEstado`),
  CONSTRAINT `TorneoEquipo_Torneo_fk` FOREIGN KEY (`IdTorneo`) REFERENCES `torneos` (`IdTorneo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torneosequipos`
--

LOCK TABLES `torneosequipos` WRITE;
/*!40000 ALTER TABLE `torneosequipos` DISABLE KEYS */;
INSERT INTO `torneosequipos` VALUES (12,1,1,NULL),(12,2,1,NULL),(12,3,1,NULL),(12,4,1,NULL),(12,5,1,NULL),(12,6,1,NULL),(12,7,1,NULL),(12,8,1,NULL),(12,9,1,NULL),(12,10,1,NULL),(12,11,1,NULL),(12,12,1,NULL),(12,13,1,NULL),(12,14,1,NULL),(12,15,1,NULL),(12,16,1,NULL),(12,17,1,NULL),(12,18,1,NULL),(12,19,1,NULL),(12,20,1,NULL),(12,21,1,NULL),(12,22,1,NULL),(12,23,1,NULL),(12,24,1,NULL),(12,25,1,NULL),(12,26,1,NULL),(12,27,1,NULL),(12,28,1,NULL),(12,29,1,NULL),(12,30,1,NULL),(12,31,1,NULL),(12,32,1,NULL),(13,1,1,'2016-06-12'),(13,2,1,'2016-06-12'),(13,3,1,'2016-06-12'),(13,4,1,'2016-06-12'),(13,5,1,'2016-06-12'),(13,6,1,'2016-06-12'),(13,7,1,'2016-06-12'),(13,8,1,'2016-06-12'),(16,1,1,'2016-07-09'),(16,2,1,'2016-07-09'),(16,3,1,'2016-07-09'),(16,4,1,'2016-07-09'),(16,5,1,'2016-07-09'),(16,6,1,'2016-07-09'),(16,7,1,'2016-07-09'),(16,8,1,'2016-07-09'),(16,9,1,'2016-07-09'),(16,10,1,'2016-07-09'),(16,11,1,'2016-07-09'),(16,12,1,'2016-07-09'),(16,13,1,'2016-07-09'),(16,14,1,'2016-07-09'),(16,15,1,'2016-07-09'),(16,16,1,'2016-07-09'),(17,1,1,'2016-07-09'),(17,2,1,'2016-07-09'),(17,3,1,'2016-07-09'),(17,4,1,'2016-07-09'),(19,1,1,'2016-07-09'),(19,2,1,'2016-07-09'),(19,3,1,'2016-07-09'),(19,4,1,'2016-07-09'),(19,5,1,'2016-07-09'),(19,6,1,'2016-07-09'),(19,7,1,'2016-07-09'),(19,8,1,'2016-07-09'),(20,1,1,'2016-07-10'),(20,2,1,'2016-07-10'),(20,3,1,'2016-07-10'),(20,4,1,'2016-07-10'),(20,5,1,'2016-07-10'),(20,6,1,'2016-07-10');
/*!40000 ALTER TABLE `torneosequipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torneosestados`
--

DROP TABLE IF EXISTS `torneosestados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torneosestados` (
  `IdEstado` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(30) NOT NULL,
  PRIMARY KEY (`IdEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torneosestados`
--

LOCK TABLES `torneosestados` WRITE;
/*!40000 ALTER TABLE `torneosestados` DISABLE KEYS */;
INSERT INTO `torneosestados` VALUES (1,'Activo'),(2,'Inscripcion'),(3,'Finalizado');
/*!40000 ALTER TABLE `torneosestados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torneosimagenes`
--

DROP TABLE IF EXISTS `torneosimagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torneosimagenes` (
  `IdTorneo` int(11) NOT NULL,
  `url` varchar(150) NOT NULL,
  `fechaAlta` datetime NOT NULL,
  PRIMARY KEY (`IdTorneo`,`url`),
  CONSTRAINT `Imagenes_Torneos_fk` FOREIGN KEY (`IdTorneo`) REFERENCES `torneos` (`IdTorneo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torneosimagenes`
--

LOCK TABLES `torneosimagenes` WRITE;
/*!40000 ALTER TABLE `torneosimagenes` DISABLE KEYS */;
INSERT INTO `torneosimagenes` VALUES (16,'chilena_201679_55733.jpg','2016-07-09 00:57:33'),(16,'descarga (1)_201679_55739.jpg','2016-07-09 00:57:39'),(16,'new_201679_55750.jpg','2016-07-09 00:57:50'),(17,'descarga_201679_6512.jpg','2016-07-09 01:05:12');
/*!40000 ALTER TABLE `torneosimagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tornosfases`
--

DROP TABLE IF EXISTS `tornosfases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tornosfases` (
  `idFase` int(11) NOT NULL,
  `fase` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idFase`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tornosfases`
--

LOCK TABLES `tornosfases` WRITE;
/*!40000 ALTER TABLE `tornosfases` DISABLE KEYS */;
INSERT INTO `tornosfases` VALUES (1,'16avos'),(2,'Octavos'),(3,'Cuartos'),(4,'Semis'),(5,'Final');
/*!40000 ALTER TABLE `tornosfases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'resergol'
--
/*!50003 DROP PROCEDURE IF EXISTS `SP_administrarDuePendiente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_administrarDuePendiente`(IN `pIdDuenio` INT(11), IN `pAcepta` INT, OUT `pResultado` INT)
    NO SQL
BEGIN 



































































DECLARE Error INT DEFAULT 0;

































DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;



































































if (pAcepta = 1) then



































































update duenios set

































IdEstado = 2

































where IdDuenio = pIdDuenio;



































































ELSE



































































update duenios set

































IdEstado = 4

































where IdDuenio = pIdDuenio;



































































end IF;





































































































    IF Error=-1 THEN

































        SET pResultado = -1; 

































    ELSE

































        SET pResultado = 1;

































	end IF;



































































end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_armarCalendario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_armarCalendario`()
BEGIN







	DECLARE vFecIni DATETIME;







    DECLARE vIdDia 	INT;







    







    SET vFecIni = STR_TO_DATE('01/06/2016', '%d/%m/%Y');







    







    







    







    WHILE vFecIni <= STR_TO_DATE('01/01/2018', '%d/%m/%Y') DO







	







	  SET vIdDia = (select iddia from dias where idDiaEquivalente = dayofweek(vFecIni));







	  















      INSERT INTO calendario (fecha, idDia) VALUES(vFecIni, vIdDia);







      







      







	  SET vFecIni = DATE_ADD(vFecIni,INTERVAL 1 DAY);







      







	END WHILE;















END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_atest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_atest`(







  pIdTorneo	   INT,







  pLimite	   INT







)
BEGIN 







	DECLARE done INT DEFAULT FALSE;







    DECLARE vidReserva INT;







    DECLARE vidEquipo INT;







    DECLARE i INT;







	DECLARE cur1 CURSOR FOR SELECT idreserva from tmpEquipos where pIdTorneo =pIdTorneo;







    DECLARE cur2 CURSOR FOR SELECT idequipo from torneosequipos where IdTorneo =pIdTorneo order by idequipo limit pLimite;







    DECLARE cur3 CURSOR FOR SELECT idequipo from torneosequipos where IdTorneo =pIdTorneo order by idequipo desc limit pLimite;







    







    







     







	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;







  







    







    /*Cargo la tabla de fixture con los datos que tengo*/







	INSERT INTO fixture( idTorneo,







						 idFecha,







						 idReserva,







						 IdEquipo1,







						 IdEquipo2







						 )







	SELECT  t.idTorneo,







			R.idReserva,







			R.idReserva,







			1,2







	FROM reservas as R







	INNER JOIN torneos as T on t.idTorneo = R.idTorneo







	WHERE T.idtorneo = pIdTorneo







	ORDER BY R.fecha







	LIMIT pLimite;















    







    







    SET i =1;







     







    /*Cursor de posiciones*/ 







	OPEN cur1;







       







	read_loop: LOOP







		FETCH cur1 INTO vidReserva;







		







		IF done THEN







		  LEAVE read_loop;







		END IF;















		UPDATE tmpEquipos







        SET posicion = i







        WHERE idreserva = vidReserva;







        







         SET i =i + 1;







	END LOOP;







	







    CLOSE cur1;







	







    







	/*Cursor de equipo 1*/ 







    SET done = false;







    SET i =1;







	OPEN cur2;







    







       







	read_loop: LOOP







		FETCH cur2 INTO vidEquipo;







		 







		IF done THEN







		  LEAVE read_loop;







		END IF;















		UPDATE tmpEquipos







        SET idequipo1 = vidEquipo







        WHERE posicion = i;







       







         SET i =i + 1;







	END LOOP;















	CLOSE cur2;















	/*Cursor de equipo 1*/ 







    SET done = false;







    SET i =1;







	OPEN cur3;







    







       







	read_loop: LOOP







		FETCH cur3 INTO vidEquipo;







		 







		IF done THEN







		  LEAVE read_loop;







		END IF;















		UPDATE tmpEquipos







        SET idequipo2 = vidEquipo







        WHERE posicion = i;







       







         SET i =i + 1;







	END LOOP;















	







	CLOSE cur3;







    







    







    /*Finalizo el fixture*/







    UPDATE fixture as f







	INNER JOIN  tmpEquipos as t ON f.idTorneo = t.idtorneo AND f.idReserva = t.idReserva







	SET f.IdEquipo1 = t.IdEquipo1,







		f.IdEquipo2 = t.IdEquipo2;







END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_deleteCanchasImagenes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_deleteCanchasImagenes`(IN `pIdComplejo` INT, IN `pIdCancha` INT, IN `pUrl` VARCHAR(150), OUT `vResultado` INT)
    NO SQL
BEGIN 



    DECLARE Error INT DEFAULT 0;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;



    SET vResultado = 1;

    

    DELETE FROM canchasimagenes

    WHERE IdComplejo =  pIdComplejo

    AND IdCancha = pIdCancha

    AND url = pUrl;



	IF (Error=-1)  THEN

        SET vResultado = -1; /*Devuelve -1 en caso de error*/

    END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_deleteClienteListaNegra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_deleteClienteListaNegra`(IN `pIdComplejo` INT, IN `pIdCliente` INT, OUT `pValor` INT)
BEGIN 



	DECLARE Error INT DEFAULT 0;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;



    delete FROM listanegra 

    where IdComplejo = pIdComplejo

    and IdCliente = pIdCliente;

    

    IF Error=-1 THEN

        SET pValor = -1; 

    ELSE

        SET pValor = 1; 

    END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_deleteComplejosDias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_deleteComplejosDias`(IN `pIdComplejo` INT)
BEGIN



    DELETE FROM complejosdias 

    WHERE IdComplejo = pIdComplejo;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_deleteComplejosImagenes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_deleteComplejosImagenes`(IN `pIdComplejo` INT, IN `pUrl` VARCHAR(150), OUT `vResultado` INT)
    NO SQL
BEGIN 



    DECLARE Error INT DEFAULT 0;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;



    SET vResultado = 1;

    

    DELETE FROM complejosimagenes

    WHERE IdComplejo =  pIdComplejo

    AND url = pUrl;



	IF (Error=-1)  THEN

        SET vResultado = -1; /*Devuelve -1 en caso de error*/

    END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_deleteDiasYCanchasByTorneo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_deleteDiasYCanchasByTorneo`(
	pIdTorneo	INT
)
BEGIN
	DELETE FROM torneosdias  WHERE idtorneo = pIdTorneo;
    DELETE FROM torneoscanchas WHERE idtorneo = pIdTorneo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_deleteReserva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_deleteReserva`(IN `pIdReserva` INT(11), OUT `valor` INT)
BEGIN

 DECLARE Error INT DEFAULT 0;



 DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;

    

DELETE FROM reservas

WHERE idReserva = pIdReserva;



 IF Error=-1 THEN







        SET valor = -1; 







    ELSE



        SET valor = 1; 



    END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_deleteReservaTemp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_deleteReservaTemp`(IN `pIdCancha` INT(11), IN `pIdComplejo` INT(11), OUT `pValor` INT)
BEGIN 







    DECLARE Error INT DEFAULT 0;



    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;







        DELETE FROM reservastemporal



        WHERE idComplejo = pIdComplejo and idCancha = pIdCancha;







    IF Error=-1 THEN







        SET pValor = -1; 







    ELSE



        SET pValor = 1; 



    END IF;







END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_deleteTorneosImagenes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_deleteTorneosImagenes`(




















    pIdTorneo	        INT        ,




















	pUrl                VARCHAR(150),




















    OUT vResultado       INT




















)
BEGIN 




















    DECLARE Error INT DEFAULT 0;




















    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;




















    




















    SET vResultado = 1;




















    




















    DELETE FROM torneosimagenes




















    WHERE IdTorneo =  pIdTorneo 




















    AND   url = pUrl;









































	IF (Error=-1)  THEN




















        SET vResultado = -1; /*Devuelve -1 en caso de error*/




















    END IF;




















END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_existeComplejo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_existeComplejo`(IN `pIdComplejo` INT(11))
BEGIN



	SELECT COUNT(*) as existe 

	FROM complejos

	where IdComplejo = pIdComplejo;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_existeComplejoDireccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_existeComplejoDireccion`(IN `pIdComplejoDireccion` INT)
BEGIN







SELECT COUNT(*) AS existe



FROM complejosdireccion



where IdComplejo = pIdComplejoDireccion;







END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_existeComplejoPagos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_existeComplejoPagos`(IN `pIdComplejoPagos` INT(11))
BEGIN









SELECT COUNT(*) AS existe




from complejospagos




where idComplejo = pIdComplejoPagos;









END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_existeDocumento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_existeDocumento`( 

































    pIdTipoDoc 	    INT,

































    pNroDoc	        INT,

































    pTipo           VARCHAR(1),

































    OUT resultado   INT

































)
BEGIN 



































































    

































    

































    

































    DECLARE Aux   INT;

































    

































    SET resultado = 0;

































    SET Aux = -1;

































       

































    IF pTipo = 'D' THEN

































        

































        SELECT IFNULL(D.idDuenio, -1) INTO Aux 

































        FROM Duenios AS D

































        INNER JOIN Personas AS p ON D.idPersona = P.idPersona

































        WHERE P.IdTipoDoc = pIdTipoDoc 

































            AND P.NroDoc  = pNroDoc

































            AND D.FechaBaja IS NULL;

































            

































    ELSE



































































        SELECT IFNULL(C.idCliente, -1) INTO Aux 

































        FROM Clientes AS C

































        INNER JOIN Personas AS p ON C.idPersona = P.idPersona

































        WHERE P.IdTipoDoc = pIdTipoDoc 

































            AND P.NroDoc  = pNroDoc

































            AND C.FechaBaja IS NULL;

































            

































    END IF;

































         

































    IF Aux > -1 THEN

































        SET resultado = 1;

































    END IF;

































    

































    

































END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_existeEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_existeEmail`( 

































    pEmail  		VARCHAR(60),

































    OUT resultado   INT

































)
BEGIN 



































































    

































    

































    

































    DECLARE Aux   INT;

































    

































    SET resultado = 0;

































    SET Aux = -1;

































        

































	SELECT IFNULL(IdPersona, -1) INTO Aux 

































	FROM Personas 

































	WHERE Email = pEmail;

































		

































	


































    IF Aux > -1 THEN

































        SET resultado = 1;

































    END IF;

































END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_existeEmailComplejo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_existeEmailComplejo`(IN `pEmail` VARCHAR(60), IN `pIdComplejo` INT, OUT `resultado` INT)
BEGIN 



    SET resultado = 0;



	SELECT COUNT(*) INTO resultado 

	FROM complejos 

	WHERE Email = pEmail

    AND IdComplejo != pIdComplejo;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_existeEmailDuenio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_existeEmailDuenio`(IN `pEmail` VARCHAR(60), IN `pidPersona` INT, OUT `resultado` INT)
BEGIN 



    DECLARE Aux INT;

    SET resultado = -1;



	SELECT count(0) into resultado

	FROM personas per

	WHERE per.Email = pEmail

    AND per.IdPersona != pidPersona;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_existeUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_existeUsuario`( 

































    pUsuario	VARCHAR(25),

































    OUT Id      INT,

































    OUT tipo	VARCHAR(1)

































)
BEGIN 



































































    

































    

































    

































    DECLARE IdAux   INT;

































    

































    SET IdAux = -1;

































    SET tipo = 'A';     

































         

































    SELECT IFNULL(a.id, -1) INTO IdAux

































    FROM Administradores as a

































    WHERE a.Usuario = pUsuario;

































    

































    IF (IdAux = -1) THEN

































    

































        SET tipo = 'D';     

































        

































        SELECT IFNULL(idDuenio, -1) INTO IdAux 

































        FROM Duenios 

































        WHERE Usuario = pUsuario AND FechaBaja IS NULL;

































        

































        IF (IdAux = -1) THEN

































        

































            SET tipo = 'C';     

































            

































            SELECT IFNULL(idCliente,-1) INTO IdAux 

































            FROM Clientes 

































            WHERE Usuario = pUsuario AND FechaBaja IS NULL;

































        END IF;

































        

































    END IF;

































    

































    SET Id = IdAux;

































END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_existeUsuarioDuenio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_existeUsuarioDuenio`(IN `pIdPersona` INT, IN `pUsuario` VARCHAR(25), OUT `existe` INT)
BEGIN





SELECT count(*) into existe


FROM duenios due


inner join personas per


on due.IdPersona = per.IdPersona


where due.Usuario = pUsuario


and due.IdPersona != pIdPersona;





END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getAdministrador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getAdministrador`( 

































    pUsuario	    VARCHAR(25),

































    pContrasenia  VARCHAR(20)   

































    )
BEGIN 

































    

































   

































    

































    

































    

































    SELECT *

































    FROM administradores as Adm

































    WHERE Adm.Usuario = pUsuario 

































    AND Adm.Contrasenia = pContrasenia;

































    

































    

































   

































END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getCancha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getCancha`(IN `idCancha` INT(11), IN `idComplejo` INT(11))
BEGIN 



SELECT CO.IdDuenio, CA.IdCancha, CA.nombre, CO.IdComplejo, CO.Nombre as Complejo, P.Nombre AS Provincia, L.Nombre as Localidad,



       CD.Calle, CD.Altura, CO.nroTelefono, CO.nroCelular, CA.CantJugadores, TS.Descripcion as Superficie, CA.Techada, CA.Luz,























       CA.Precio, CO.PorcentajeSeña as PorcentSenia, CO.Buffet, CO.Parrillas, CO.Duchas, CO.WiFi, CO.Estacionamiento, CO.HoraCobroLuz,



CO.PorcentajeLuz, CO.HorasCancelacion























       























FROM CANCHAS CA























INNER JOIN COMPLEJOS CO























	ON CA.IdComplejo = CO.IdComplejo























INNER JOIN complejosdireccion CD























	ON CD.IdComplejo = CO.IdComplejo























INNER JOIN provincias p























	ON P.IdProvincia = CD.IdProvincia























INNER JOIN localidades L























	ON L.IdProvincia = CD.IdProvincia AND L.IdLocalidad = CD.IdLocalidad









INNER JOIN tipossuperficie TS























	ON TS.IdSuperficie = CA.IdSuperficie























WHERE CA.IdEstado = 1 and CO.IdEstado = 1 AND























CA.IdCancha = idCancha AND CO.IdComplejo = idComplejo;






  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getCanchas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getCanchas`(IN `pIdProv` INT(11), IN `pIdLoc` INT(11), IN `pCantJug` INT(11), IN `pIdSuperficie` INT(11), IN `pPrecioMax` DECIMAL(6,2), IN `pTechada` TINYINT(1), IN `pConLuz` TINYINT(1), IN `pConEstac` TINYINT(1), IN `pConDuchas` TINYINT(1), IN `pConBuffet` TINYINT(1), IN `pConParrilla` TINYINT(1), IN `pConWifi` TINYINT(1), IN `pFecha` DATE, IN `pHora` VARCHAR(10), IN `pDiaSemana` INT(10))
BEGIN 


    IF pFecha = '19000101'


    THEN SET pFecha = null;


    END IF;

    IF pHora != '-1'


    THEN SET pHora = CONCAT(pHora, ':00:00');

    END IF;


    IF pHora = '-1'


    THEN SET pHora = null;

    END IF;

    IF pDiaSemana = '-1'

    THEN SET pDiaSemana = null;

    END IF;


     SELECT ca.IdCancha, ca.IdComplejo, ca.nombre as NombreCancha, ca.CantJugadores, ca.Techada, ca.Luz, ca.Precio,

    co.Nombre as NombreComplejo, prov.Nombre as Provincia, loc.Nombre as Localidad, ts.Descripcion as Superficie, cd.Calle, cd.Altura ,ifnull(concat('http://localhost:8080/resergol1.1/api/Imagenes/canchas/',ci.url), 'http://localhost:8080/resergol1.1/api/Imagenes/default-image.jpg') as Imagen, IFNULL(AVG(CP.Puntaje),0) AS Puntaje, co.HoraCobroLuz, co.PorcentajeLuz, (ca.Precio + (ca.Precio * co.PorcentajeLuz / 100)) as PrecioConLuz












    FROM canchas ca












    INNER JOIN complejos co ON co.IdComplejo = ca.IdComplejo












    INNER JOIN duenios d ON d.IdDuenio = co.IdDuenio












    INNER JOIN personas p ON p.IdPersona = d.IdPersona












    INNER JOIN complejosdireccion cd ON cd.IdComplejo = co.IdComplejo












    INNER JOIN provincias prov ON prov.IdProvincia = cd.IdProvincia 












    INNER JOIN localidades loc ON loc.IdLocalidad = cd.IdLocalidad AND loc.IdProvincia = prov.IdProvincia












    INNER JOIN tipossuperficie ts ON ts.IdSuperficie = ca.IdSuperficie












    LEFT JOIN canchasimagenes CI ON CI.IdCancha = CA.IdCancha












    LEFT JOIN canchaspuntuacion CP ON CP.IdCancha = CA.IdCancha AND CP.IdComplejo = CO.IdComplejo












    WHERE ca.IdEstado = 1 












    AND (cd.IdProvincia = pIdProv AND cd.IdLocalidad = pIdLoc)    












    AND (ca.CantJugadores = pCantJug OR pCantJug = -1)












    AND (ca.IdSuperficie = pIdSuperficie OR pIdSuperficie = -1)












    AND (ca.Precio <= pPrecioMax OR pPrecioMax = -1)












    AND (ca.Techada = 1 OR pTechada = 0) 












    AND (ca.Luz = pConLuz OR pConLuz = 0)












    AND (co.Estacionamiento = pConEstac OR pConEstac = 0)












    AND (co.Duchas = pConDuchas OR pConDuchas = 0)












    AND (co.Buffet = pConBuffet OR pConBuffet = 0)












    AND (co.Parrillas = pConParrilla OR pConParrilla = 0)












    AND (co.WiFi = pConWifi OR pConWifi = 0)












    AND exists(select idcomplejo












                from complejosdias cd












                where idcomplejo = co.IdComplejo












                and ifnull(pDiaSemana,cd.iddiadesde) between cd.iddiadesde and cd.iddiahasta












                and ifnull(pHora,horadesde) >= horadesde and ifnull(pHora,horahasta-1) < horahasta)  












    AND not exists(select idcomplejo












                    from reservas R












                    where R.idcomplejo = co.IdComplejo












                    and R.idCancha = ca.idcancha












                    and R.fecha = ifnull(pFecha,'19000101')












                    and ifnull(pHora,55) >= HoraInicio and ifnull(pHora,55) < horafin)

























GROUP BY ca.IdCancha, ca.IdComplejo, ca.nombre, ca.CantJugadores, ca.Techada, ca.Luz, ca.Precio,












    co.Nombre, prov.Nombre, loc.Nombre, ts.Descripcion, cd.Calle, cd.Altura












   












ORDER BY IFNULL(AVG(CP.Puntaje),0) DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getCanchasByComplejo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getCanchasByComplejo`(IN `pIdComplejo` INT)
BEGIN



    SELECT 

        ca.IdCancha

        ,ca.nombre

        ,ca.CantJugadores

        ,ca.IdSuperficie

        ,ca.Techada

        ,ca.Luz

        ,ca.Precio

        ,ca.IdEstado

        ,IFNULL(ELT(FIELD(ca.IdEstado,1, 2),'Activo','Inactivo'),'Sin Estado') AS estado

        ,ca.IdComplejo

        ,ts.Descripcion

        ,ifnull(concat('http://localhost:8080/resergol1.1/api/Imagenes/canchas/',ci.url), 'http://localhost:8080/resergol1.1/api/Imagenes/default-image.jpg') as imagen

    FROM 

        canchas ca

    INNER JOIN tipossuperficie ts 

   	ON ts.IdSuperficie = ca.idSuperficie

    LEFT JOIN canchasimagenes ci 

    on ca.IdCancha = ci.IdCancha

    and ca.IdComplejo = ci.IdComplejo

    WHERE 

        ca.IdComplejo = pIdComplejo

    group by ca.IdCancha;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getCanchasByDuenio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getCanchasByDuenio`(

































    pIdDuenio  	  INT 

































)
BEGIN 

































    SELECT CA.idcancha, CA.nombre, CA.CantJugadores, ts.descripcion, CA.techada, CA.luz, CA.precio

































    FROM canchas      AS CA

































    INNER JOIN complejos    AS c ON (c.idcomplejo = ca.idcomplejo)

































    INNER JOIN tipossuperficie ts ON ts.IdSuperficie = ca.idSuperficie

































    WHERE c.idduenio = pIdDuenio

































        AND CA.idestado = 1

































        AND C.idestado = 1

































    ORDER BY 2;

































END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getCanchasByDuenioTorneo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getCanchasByDuenioTorneo`(
    pIdDuenio  	  INT,
    pIdTorneo 	  INT
)
BEGIN
    SELECT CA.idcancha, CA.nombre, CA.CantJugadores, ts.descripcion, CA.techada, CA.luz, CA.precio, ifnull(tc.idCancha,0) as tIdCancha
    FROM canchas      AS CA
    INNER JOIN complejos    AS c ON (c.idcomplejo = ca.idcomplejo)
    INNER JOIN tipossuperficie ts ON ts.IdSuperficie = ca.idSuperficie
    LEFT JOIN  torneoscanchas AS tc ON tc.idcancha = CA.idcancha and tc.idtorneo=pIdTorneo
    WHERE c.idduenio = pIdDuenio
        AND CA.idestado = 1
        AND C.idestado = 1
    ORDER BY 2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getCanchasByTorneo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getCanchasByTorneo`(
	pIdTorneo	INT
)
BEGIN 
    SELECT 
		 C.IdCancha, 
         C.IdComplejo, 
         C.nombre as NombreCancha, 
         C.CantJugadores, 
         C.Techada, 
         C.Luz, 
         C.Precio,
		 co.Nombre as NombreComplejo,
		 ts.Descripcion as Superficie, 
         ifnull(concat('http://localhost:8080/resergol1.1/api/Imagenes/canchas/',ci.url), 'http://localhost:8080/resergol1.1/api/Imagenes/default-image.jpg') as Imagen, 
         IFNULL(AVG(CP.Puntaje),0) AS Puntaje, 
         co.HoraCobroLuz, 
         co.PorcentajeLuz, 
         (C.Precio + (C.Precio * co.PorcentajeLuz / 100)) as PrecioConLuz
    FROM torneoscanchas as tc
    INNER JOIN canchas as C ON tc.IdComplejo = C.IdComplejo
							AND tc.IdCancha = C.IdCancha
	INNER JOIN complejos co ON co.IdComplejo = C.IdComplejo
    INNER JOIN tipossuperficie ts ON ts.IdSuperficie = C.IdSuperficie
	LEFT JOIN canchaspuntuacion CP ON CP.IdCancha = C.IdCancha AND CP.IdComplejo = C.IdComplejo
    LEFT JOIN  canchasimagenes  as ci   ON ci.idcomplejo = C.IdComplejo
										AND ci.IdCancha = C.IdCancha                
    LEFT JOIN (select IdComplejo, IdCancha, min(fechaAlta) as fec
				from canchasimagenes 
                group by IdComplejo, IdCancha) AS res ON res.idcomplejo = ci.IdComplejo
													 AND res.IdCancha = ci.IdCancha  
                                                     AND res.fec = ci.fechaAlta
    
    WHERE tc.idtorneo = pIdTorneo
    ORDER BY 5;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getCanchasImagenes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getCanchasImagenes`(IN `pIdComplejo` INT, IN `pIdCancha` INT)
BEGIN 



    SELECT 

    ci.IdComplejo

    ,ci.IdCancha

    , c.nombre

    , ci.url   

    ,concat('http://localhost:8080/resergol1.1/api/Imagenes/canchas/',ci.url) as imagen

    , ci.fechaalta

    FROM canchasimagenes AS CI

    INNER JOIN canchas as C 

    ON CI.IdComplejo = C.IdComplejo

    AND CI.IdCancha = C.IdCancha

    WHERE c.IdComplejo = pIdComplejo

    AND C.IdCancha = pIdCancha

    ORDER BY 5;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getCanchasTOP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getCanchasTOP`()
    NO SQL
BEGIN 












     SELECT ca.IdCancha, ca.IdComplejo, ca.nombre as NombreCancha, 












    co.Nombre as NombreComplejo, prov.Nombre as Provincia, loc.Nombre as Localidad, cd.Calle, cd.Altura ,ifnull(concat('http://localhost:8080/resergol1.1/api/Imagenes/canchas/',ci.url), 'http://localhost:8080/resergol1.1/api/Imagenes/default-image.jpg') as Imagen, IFNULL(AVG(CP.Puntaje),0) AS Puntaje












    FROM canchas ca












    INNER JOIN complejos co ON co.IdComplejo = ca.IdComplejo












    INNER JOIN duenios d ON d.IdDuenio = co.IdDuenio












    INNER JOIN complejosdireccion cd ON cd.IdComplejo = co.IdComplejo












    INNER JOIN provincias prov ON prov.IdProvincia = cd.IdProvincia 












    INNER JOIN localidades loc ON loc.IdLocalidad = cd.IdLocalidad AND loc.IdProvincia = prov.IdProvincia












    LEFT JOIN canchasimagenes CI ON CI.IdCancha = CA.IdCancha












    INNER JOIN canchaspuntuacion CP ON CP.IdCancha = CA.IdCancha AND CP.IdComplejo = CO.IdComplejo












    /*INNER JOIN (select cp.IdCancha, cp.IdComplejo, count(*) as votos












	from canchaspuntuacion cp












	group by cp.IdCancha












	order by votos DESC












	) AS CANTVOTOS ON CA.IdCancha = CANTVOTOS.IdCancha AND CA.IdComplejo = CANTVOTOS.IdComplejo*/












    WHERE ca.IdEstado = 1 and co.IdEstado = 1












 












GROUP BY ca.IdCancha, ca.IdComplejo, ca.nombre,












    co.Nombre, prov.Nombre, loc.Nombre, cd.Calle, cd.Altura












   












ORDER BY IFNULL(AVG(CP.Puntaje),0) DESC












LIMIT 3;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getCantEquiposByTipoTorneo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getCantEquiposByTipoTorneo`(IN `pIdTipo` INT)
BEGIN 












    SELECT distinct cantidad 












    FROM tipotorneosEquipos 












    WHERE IdTipoTorneo = IFNULL(pIdTipo, IdTipoTorneo);












END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getCantJugByDuenio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getCantJugByDuenio`(

































    pIdDuenio  	  INT 

































)
BEGIN 

































     SELECT distinct C.CantJugadores

































	FROM  canchas AS C 

































	INNER JOIN complejos AS CO ON CO.idcomplejo = C.idcomplejo

































	WHERE   C.idEstado = 1

































		AND CO.idestado = 1 

































		AND CO.idDuenio = pIdDuenio

































    ORDER BY 1;

































		

































END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getCliente`( 

































    pUsuario	    VARCHAR(25),

































    pContrasenia  VARCHAR(20)   

































    )
BEGIN 



































































    

































    

































    

































    SELECT *

































    FROM personas as P

































    INNER JOIN clientes as C ON P.idPersona = C.idPersona

































    WHERE C.usuario = pUsuario 

































    AND C.contrasenia = pContrasenia

































    AND C.idEstado = 1; 

































    

































   

































END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getComentariosCancha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getComentariosCancha`(IN `pIdCancha` INT(11), IN `pIdComplejo` INT(11))
BEGIN





SELECT c.Usuario, cc.Fecha, cc.Comentario


FROM CanchasComentarios cc


INNER JOIN Clientes c ON c.IdCliente = cc.IdCliente


WHERE cc.IdCancha = pIdCancha AND cc.IdComplejo = pIdComplejo


ORDER BY cc.Fecha desc


LIMIT 20;








END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getComentariosComplejo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getComentariosComplejo`(IN `pIdComplejo` INT(11))
BEGIN



SELECT c.Usuario, cc.Fecha, cc.Comentario



FROM ComplejosComentarios cc



INNER JOIN Clientes c ON c.IdCliente = cc.IdCliente



WHERE cc.IdComplejo = pIdComplejo



ORDER BY cc.Fecha desc



LIMIT 20;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getComplejo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getComplejo`(IN `pIdComplejo` INT(11))
BEGIN 



SELECT CO.IdDuenio, CO.IdComplejo, CO.Nombre as nombreComplejo, P.Nombre AS Provincia, L.Nombre as Localidad,

CD.Calle, CD.Altura, CO.nroTelefono, CO.nroCelular, CO.PorcentajeSeña as PorcentSenia, CO.Buffet, CO.Parrillas, CO.Duchas, CO.WiFi, CO.Estacionamiento,

CO.HoraCobroLuz, CO.PorcentajeLuz, CO.HorasCancelacion, CO.Descripcion, COUNT(CA.IdCancha) as CantidadCanchas

 

FROM COMPLEJOS CO



INNER JOIN CANCHAS CA

ON CA.IdComplejo = CO.IdComplejo



INNER JOIN complejosdireccion CD

ON CD.IdComplejo = CO.IdComplejo



INNER JOIN provincias p

ON P.IdProvincia = CD.IdProvincia



INNER JOIN localidades L

ON L.IdProvincia = CD.IdProvincia AND L.IdLocalidad = CD.IdLocalidad



WHERE CO.IdEstado = 1

AND CO.IdComplejo = pIdComplejo



GROUP BY CO.IdDuenio, CO.IdComplejo, CO.Nombre, P.Nombre, L.Nombre,

CD.Calle, CD.Altura, CO.nroTelefono, CO.nroCelular, CO.PorcentajeSeña, CO.Buffet, CO.Parrillas, CO.Duchas, CO.WiFi, CO.Estacionamiento,

CO.HoraCobroLuz, CO.PorcentajeLuz, CO.HorasCancelacion, CO.Descripcion;





END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getComplejoByIdDuenio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getComplejoByIdDuenio`(IN `pIdDuenio` INT)
    NO SQL
BEGIN



DECLARE estadoDuenio INT;

    

set estadoDuenio = -1;



select IdEstado into estadoDuenio

from duenios

where IdDuenio = pIdDuenio;



if estadoDuenio = 2 THEN



    SELECT 

        due.IdDuenio

        ,due.Usuario

        ,due.Contrasenia

        ,due.IdPersona

        ,due.IdEstado estadoDuenio

        ,per.Nombre NombrePersona

        ,per.Apellido

        ,per.IdTipoDoc

        ,per.NroDoc

        ,per.Email EmailPersona

        ,duepen.nombreComplejo NombreComplejo

        ,duepen.NroTelef nroTelefono

        ,duepen.Calle

        ,duepen.Altura

        ,duepen.IdLocalidad

        ,duepen.IdProvincia

        ,'' as Descripcion

    FROM duenios DUE 

    INNER JOIN dueniospendientes duepen

    on due.IdDuenio = duepen.IdDuenio

    inner join personas per 

    on due.IdPersona = per.IdPersona

    where due.IdDuenio = pIdDuenio;



ELSE 



    select 



        due.IdDuenio

        ,due.Usuario

        ,due.Contrasenia

        ,due.IdPersona

        ,due.IdEstado estadoDuenio

        ,com.IdComplejo

        ,com.Nombre NombreComplejo

        ,com.Descripcion

        ,com.Estacionamiento

        ,com.Buffet

        ,com.Duchas

        ,com.Parrillas

        ,com.WiFi

        ,com.HoraCobroLuz

        ,com.PorcentajeSeña

        ,com.HorasCancelacion

        ,com.TiempoReserva

        ,com.Email EmailComplejo

        ,com.PorcentajeLuz

        ,com.nroCelular

        ,com.nroTelefono

        ,per.Nombre NombrePersona

        ,per.Apellido

        ,per.IdTipoDoc

        ,per.NroDoc

        ,per.Email EmailPersona

        ,cp.CBU

        ,cp.NroCuenta

        ,cd.Calle

        ,cd.Altura

        ,cd.IdLocalidad

        ,cd.IdProvincia

        ,cd.X

        ,cd.Y

    from duenios due

    inner join complejos com 

    on due.IdDuenio = com.IdDuenio

    inner join personas per 

    on due.IdPersona = per.IdPersona

    left join complejospagos cp

    on com.IdComplejo = cp.IdComplejo

    left join complejosdireccion cd

    on com.IdComplejo = cd.IdComplejo

    where due.IdDuenio = pIdDuenio;

end if;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getComplejos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getComplejos`(IN `pNombreComplejo` VARCHAR(100), IN `pIdProv` INT(11), IN `pIdLoc` INT(11), IN `pCantJug` INT(11), IN `pIdSuperficie` INT(11), IN `pPrecioMax` DECIMAL(6,2), IN `pTechada` TINYINT(1), IN `pConLuz` TINYINT(1), IN `pConEstac` TINYINT(1), IN `pConDuchas` TINYINT(1), IN `pConBuffet` TINYINT(1), IN `pConParrilla` TINYINT(1), IN `pConWifi` TINYINT(1), IN `pFecha` DATE, IN `pHora` VARCHAR(10), IN `pDiaSemana` INT(10))
BEGIN 

	IF pFecha = '19000101'

    THEN SET pFecha = null;

    END IF;
    

    IF pHora != '-1'

    THEN SET pHora = CONCAT(pHora, ':00:00');

    END IF;
    
    IF pHora = '-1'

    THEN SET pHora = null;

    END IF;
    
    IF pDiaSemana = '-1'

    THEN SET pDiaSemana = null;

    END IF;

    SELECT DISTINCT co.IdComplejo, co.Nombre as NombreComplejo, prov.Nombre as Provincia, loc.Nombre as Localidad, cd.Calle, cd.Altura, co.Estacionamiento, co.Duchas, co.Buffet, co.Parrillas, co.WiFi,
    IFNULL(AVG(CP.Puntaje),0) AS Puntaje, ifnull(concat('http://localhost:8080/resergol1.1/api/Imagenes/complejos/',ci.url), 'http://localhost:8080/resergol1.1/api/Imagenes/default-image.jpg') as Imagen

    FROM complejos co

    INNER JOIN canchas ca ON ca.IdComplejo = co.IdComplejo

    INNER JOIN duenios d ON d.IdDuenio = co.IdDuenio

    INNER JOIN personas p ON p.IdPersona = d.IdPersona

    INNER JOIN complejosdireccion cd ON cd.IdComplejo = co.IdComplejo

    INNER JOIN provincias prov ON prov.IdProvincia = cd.IdProvincia 

    INNER JOIN localidades loc ON loc.IdLocalidad = cd.IdLocalidad AND loc.IdProvincia = prov.IdProvincia
    
    INNER JOIN tipossuperficie ts ON ts.IdSuperficie = ca.IdSuperficie

    LEFT JOIN complejosimagenes CI ON CI.IdComplejo = CO.IdComplejo

    LEFT JOIN complejospuntuacion CP ON CP.IdComplejo = CO.IdComplejo

    WHERE CO.IdEstado = 1

   AND (cd.IdProvincia = pIdProv AND cd.IdLocalidad = pIdLoc) 
   
   AND (ca.CantJugadores = pCantJug OR pCantJug = -1)
   
   AND (ca.IdSuperficie = pIdSuperficie OR pIdSuperficie = -1)
   
    AND (ca.Precio <= pPrecioMax OR pPrecioMax = -1)
    
    AND (ca.Techada = 1 OR pTechada = 0) 
    
    AND (ca.Luz = pConLuz OR pConLuz = 0)

    AND (co.Estacionamiento = pConEstac OR pConEstac = 0)

    AND (co.Duchas = pConDuchas OR pConDuchas = 0)

    AND (co.Buffet = pConBuffet OR pConBuffet = 0)

    AND (co.Parrillas = pConParrilla OR pConParrilla = 0)

    AND (co.WiFi = pConWifi OR pConWifi = 0)

    AND (co.Nombre like CONCAT('%',pNombreComplejo,'%') OR pNombreComplejo = '-1')
    
    AND exists(select idcomplejo

                from complejosdias cd

                where idcomplejo = co.IdComplejo

                and ifnull(pDiaSemana,cd.iddiadesde) between cd.iddiadesde and cd.iddiahasta

                and ifnull(pHora,horadesde) >= horadesde and ifnull(pHora,horahasta-1) < horahasta)  

    AND not exists(select idcomplejo

                    from reservas R


                    where R.idcomplejo = co.IdComplejo


                    and R.idCancha = ca.idcancha


                    and R.fecha = ifnull(pFecha,'19000101')


                    and ifnull(pHora,55) >= HoraInicio and ifnull(pHora,55) < horafin)

GROUP BY co.IdComplejo, co.Nombre, prov.Nombre, loc.Nombre, cd.Calle, cd.Altura, co.Estacionamiento, co.Duchas, co.Buffet, co.Parrillas, co.WiFi

ORDER BY IFNULL(AVG(CP.Puntaje),0) DESC;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getComplejosDias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getComplejosDias`(IN `pIdComplejo` INT)
BEGIN









    SELECT 




    	cd.IdDiaDesde idDiaDesde




        ,cd.IdDiaHasta idDiaHasta




        ,cd.HoraDesde horaDesde




        ,cd.HoraHasta horaHasta




        ,dDesde.Nombre diaDesde




        ,dHasta.Nombre diaHasta




    FROM complejosdias cd




    inner join dias dDesde




    on cd.IdDiaDesde = dDesde.IdDia




    inner join dias dHasta




    on cd.IdDiaHasta = dHasta.IdDia




    where IdComplejo = pIdComplejo;









END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getComplejosImagenes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getComplejosImagenes`(IN `pIdComplejo` INT)
    NO SQL
BEGIN





    SELECT 


    ci.IdComplejo


    , c.nombre


    , ci.url   


 	,concat('http://localhost:8080/resergol1.1/api/Imagenes/complejos/',ci.url) as imagen


    , ci.fechaalta


    FROM complejosimagenes AS CI


    INNER JOIN complejos as C 


    ON CI.IdComplejo = C.IdComplejo


    WHERE c.IdComplejo = pIdComplejo


    ORDER BY 5;





END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getComplejosTOP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getComplejosTOP`()
BEGIN

SELECT co.IdComplejo, co.Nombre as NombreComplejo, prov.Nombre as Provincia, loc.Nombre as Localidad, cd.Calle, cd.Altura, ci.url, IFNULL(AVG(CP.Puntaje),0) AS Puntaje,
ifnull(concat('http://localhost:8080/resergol1.1/api/Imagenes/complejos/',ci.url), 'http://localhost:8080/resergol1.1/api/Imagenes/default-image.jpg') as Imagen

FROM complejos co

/*INNER JOIN canchas co ON co.IdComplejo = ca.IdComplejo*/

INNER JOIN duenios d ON d.IdDuenio = co.IdDuenio

INNER JOIN complejosdireccion cd ON cd.IdComplejo = co.IdComplejo

INNER JOIN provincias prov ON prov.IdProvincia = cd.IdProvincia 

INNER JOIN localidades loc ON loc.IdLocalidad = cd.IdLocalidad AND loc.IdProvincia = prov.IdProvincia

LEFT JOIN complejosimagenes CI ON CI.IdComplejo = CO.IdComplejo

INNER JOIN complejospuntuacion CP ON CP.IdComplejo = CO.IdComplejo

WHERE co.IdEstado = 1

GROUP BY co.IdComplejo, co.nombre, prov.Nombre, loc.Nombre, cd.Calle, cd.Altura

ORDER BY IFNULL(AVG(CP.Puntaje),0) DESC

LIMIT 3;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getDias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getDias`()
BEGIN 




















select 




















	idDia




















	,Nombre 




















from dias;




















    




















END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getDiasByDuenio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getDiasByDuenio`(
    pIdDuenio  	  INT 
)
BEGIN 

    SELECT d.iddia, d.nombre , TIME_FORMAT(cd.HoraDesde, "%H:%S" ) as HoraDesde ,  TIME_FORMAT(cd.HoraHasta, "%H:%S" ) as HoraHasta
    FROM complejosdias      AS cd
    INNER JOIN complejos    AS c ON (c.idcomplejo = cd.idcomplejo)
    INNER JOIN dias         AS d ON (d.iddia between cd.iddiadesde and cd.iddiahasta)
    WHERE c.idduenio = pIdDuenio
    AND C.idestado = 1
    ORDER BY 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getDiasByTorneo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getDiasByTorneo`(
	pIdDuenio  	  INT,
    pIdTtorneo 	  INT 
)
BEGIN    
    SELECT d.iddia, d.nombre , TIME_FORMAT(cd.HoraDesde, "%H:%S" ) as HoraDesde ,  TIME_FORMAT(cd.HoraHasta, "%H:%S" ) as HoraHasta,
			ifnull(td.IdDia,0) as tIdDia, TIME_FORMAT(td.HoraDesde, "%H:%S" ) as tHoraDesde, TIME_FORMAT(td.HoraHasta, "%H:%S" ) as tHoraHasta
    FROM complejosdias      AS cd
    INNER JOIN complejos    AS c ON (c.idcomplejo = cd.idcomplejo)
    INNER JOIN dias         AS d ON (d.iddia between cd.iddiadesde and cd.iddiahasta)
    LEFT JOIN torneosdias   AS td ON (td.iddia = d.iddia and td.idtorneo =pIdTtorneo)
    WHERE c.idduenio = pIdDuenio
    AND C.idestado = 1
    ORDER BY 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getDuenio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getDuenio`(IN `pUsuario` VARCHAR(25), IN `pContrasenia` VARCHAR(20))
BEGIN 















    /*El SP devuelve el cliente para el usuario y contraseña ingresado*/







    /*call SP_getDuenio('CARMIE'  , 11);*/







    







    SELECT C.idComplejo, P.*, C.*, d.*







    FROM personas as P







    INNER JOIN duenios as D ON P.idPersona = D.idPersona







    LEFT JOIN complejos as C ON D.idDuenio = C.idDuenio







    WHERE D.usuario = pUsuario 







    AND D.contrasenia = pContrasenia







    AND (D.idEstado = 2 or D.idEstado = 3); /*Aceptado*/







    







   







END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getDueniosPendientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getDueniosPendientes`()
BEGIN 

































select due.IdDuenio,due.Usuario, due.FechaAlta, duep.nombreComplejo, duep.NroTelef, duep.Calle, duep.Altura,prov.Nombre as Provincia, loc.Nombre as Localidad

































    from duenios due

































    inner join dueniospendientes duep

































    on due.IdDuenio = duep.IdDuenio

































    inner join localidades loc 

































    on duep.IdLocalidad = loc.IdLocalidad

































    and duep.IdProvincia = loc.IdProvincia

































    inner join provincias prov

































    on duep.IdProvincia = prov.IdProvincia

































    where due.IdEstado = 1;

































  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getEquiposByIdTorneo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getEquiposByIdTorneo`(




	pIdTorneo	INT




)
BEGIN 




	SELECT te.IdEquipo, e.nombre, Date_format(fechaInscipcion,'%d/%m/%Y') as 'fechaInscripcion', es.Descripcion as 'Estado'




	FROM torneosequipos AS te




	INNER JOIN equipos AS e ON e.IdEquipo = te.idequipo




	INNER JOIN torneosestados AS es ON es.idestado = te.idEstado




	WHERE te.idtorneo =pIdTorneo;




END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getfechasLigaByIdTorneo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getfechasLigaByIdTorneo`(


	pIdTorneo	INT


)
BEGIN


	SELECT DISTINCT idFecha 


    FROM fixture 


    WHERE idtorneo =pIdTorneo;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getFechasReservaFija` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getFechasReservaFija`(pIdCancha INT(11), pIdComplejo INT(11), pHoraDesde VARCHAR(8), pIdDia INT, pAnio INT, pFechaPrimerReserva DATE)
SELECT date_format(c.fecha, '%d/%m/%Y') as fecha, c.idDia, d.nombre, NoDisp.fecha as NoDisponible





FROM complejos co





INNER JOIN canchas ca ON ca.idcomplejo = co.idcomplejo


INNER JOIN complejosdias td ON td.idComplejo = co.idComplejo


INNER JOIN calendario c


		ON c.idDia BETWEEN td.IdDiaDesde AND td.IdDiaHasta


INNER JOIN dias d ON d.iddia = c.iddia


LEFT JOIN (SELECT fecha, idcomplejo, idcancha


 FROM reservas WHERE idCancha = pIdCancha AND idcomplejo = pIdComplejo AND pHoraDesde >= HoraInicio AND pHoraDesde < HoraFin) AS NoDisp


 


ON NoDisp.idCancha = ca.idCancha and NoDisp.idComplejo = co.idComplejo


 AND NoDisp.fecha = c.fecha





WHERE ca.idcancha = pIdCancha AND co.idComplejo = pIdComplejo


AND d.iddia = pIdDia AND YEAR(c.fecha) = pAnio 


AND c.fecha > pFechaPrimerReserva ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getFixtureByFecha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getFixtureByFecha`(


	pIdTorneo	INT,


    pIdFecha	INT


)
BEGIN 


	SELECT  fi.IdTorneo, fi.IdFecha, fi.idreserva, fi.idEquipo1, eq1.nombre as 'equipo1', fi.gol1, 'VS' as 'VS',


			fi.idEquipo2, eq2.nombre as 'equipo2', fi.gol2, SUBSTRING(r.horaInicio,1,5) as 'horaInicio', c.nombre as 'cancha', 


             Date_format(r.fecha,'%d/%m/%Y') as 'fecha'


	FROM  fixture AS fi


	INNER JOIN reservas AS r ON fi.idreserva = r.idreserva


	INNER JOIN equipos AS eq1 ON eq1.idEquipo = fi.idEquipo1


	INNER JOIN equipos AS eq2 ON eq2.idEquipo = fi.idEquipo2


	INNER JOIN canchas AS c ON c.idcancha = r.idcancha and c.idcomplejo = r.idComplejo


	WHERE  fi.idtorneo = pIdTorneo and fi.idfecha =pIdFecha;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getFixtureByFechaIdayVuelta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getFixtureByFechaIdayVuelta`(
	pIdTorneo	INT,
	pIdFecha	INT
)
BEGIN

	DECLARE vLimite INT;

	SET vLimite = (select case pIdFecha when 1 then 16
						when 2 then 8
                        when 3 then 4
                        when 4 then 2
                        when 5 then 1
						end
				from torneos where IdTorneo = pIdTorneo);
                
                
	SELECT  fi.IdTorneo, 
			fi.IdFecha, 
			fi.idreserva, 
			fi.idEquipo1, 
			eq1.nombre as 'equipo1', 
			fi.gol1, 
			'VS' as 'VS',
			fi.idEquipo2, 
			eq2.nombre as 'equipo2', 
			fi.gol2, SUBSTRING(r.horaInicio,1,5) as 'horaInicio', 
			c.nombre as 'cancha', 
			Date_format(r.fecha,'%d/%m/%Y') as 'fecha',
			 res.idreserva as 'vIdReserva',
			 res.idequipo1 as 'vIdEquipo1',
			 res.equipo1 as 'vEquipo1',
			 res.gol1 as 'vGol2', /*para que sea el mismo orden q en la ida*/ 
			 'VS' as 'vVS',
			 res.idEquipo2 as 'vIdEquipo2',  
			 res.equipo2 as 'vEquipo2', 
			 res.gol2 as 'vGol1', 
             SUBSTRING(res.horaInicio,1,5) as 'vHoraInicio', 
			 res.cancha as 'vCancha', 
			 Date_format(r.fecha,'%d/%m/%Y') as 'vFecha'
	FROM  fixture AS fi
	INNER JOIN reservas AS r ON fi.idreserva = r.idreserva
	INNER JOIN equipos AS eq1 ON eq1.idEquipo = fi.idEquipo1
	INNER JOIN equipos AS eq2 ON eq2.idEquipo = fi.idEquipo2
	INNER JOIN canchas AS c ON c.idcancha = r.idcancha and c.idcomplejo = r.idComplejo
	INNER JOIN (SELECT  fi.IdTorneo, fi.IdFecha, fi.idreserva, fi.idEquipo1, eq1.nombre as 'equipo1', fi.gol1, 'VS' as 'VS',
				fi.idEquipo2, eq2.nombre as 'equipo2', fi.gol2, SUBSTRING(r.horaInicio,1,5) as 'horaInicio', c.nombre as 'cancha', 
				 Date_format(r.fecha,'%d/%m/%Y') as 'fecha'
				FROM  fixture AS fi
				INNER JOIN reservas AS r ON fi.idreserva = r.idreserva
				INNER JOIN equipos AS eq1 ON eq1.idEquipo = fi.idEquipo1
				INNER JOIN equipos AS eq2 ON eq2.idEquipo = fi.idEquipo2
				INNER JOIN canchas AS c ON c.idcancha = r.idcancha and c.idcomplejo = r.idComplejo
				WHERE  fi.idtorneo = pIdTorneo and fi.idfecha =pIdFecha) AS res ON res.idequipo1 = fi.idEquipo2 AND res.idequipo2 = fi.idEquipo1
	WHERE  fi.idtorneo = pIdTorneo and fi.idfecha =pIdFecha
	ORDER BY fi.idreserva
    LIMIT vLimite;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getHorariosReservasByDia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getHorariosReservasByDia`(pIdComplejo INT(11), pIdCancha INT(11), pFecha DATE)
SELECT r.HoraInicio, r.HoraFin



FROM reservas r



WHERE r.IdComplejo = pIdComplejo and r.IdCancha = pIdCancha



AND R.Fecha = pFecha ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getHorasDisponiblesByFecha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getHorasDisponiblesByFecha`(pIdCancha INT(11), IN pIdComplejo INT(11), pFecha DATE)
SELECT DISTINCT h.hora



	FROM complejos c



    INNER JOIN complejosdias td ON td.idComplejo = c.idComplejo



    INNER JOIN canchas can on can.idComplejo = c.idComplejo



	INNER JOIN horas as H ON H.hora >= td.HoraDesde and H.hora < td.HoraHasta



	WHERE c.idComplejo = pIdComplejo and can.idCancha = pIdCancha



		AND not exists(select idcomplejo



						from reservas R



						where R.idcomplejo = c.IdComplejo



						and R.idCancha = can.idcancha



						and R.fecha = pFecha



						and h.hora >= HoraInicio and h.hora < horafin) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getJugadoresByTipoTorneo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getJugadoresByTipoTorneo`(




















    pIdTipo 	  INT 




















)
BEGIN 




















    SELECT cantidad 




















    FROM tipotorneosEquipos 




















    WHERE IdTipoTorneo =pIdTipo;




















END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getListaNegraByComplejo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getListaNegraByComplejo`(IN `pIdComplejo` INT)
BEGIN



    SELECT 

        ln.IdComplejo

        ,ln.IdCliente

        ,ln.FechaIngreso

        ,cli.Usuario

        ,CONCAT(per.Nombre,  ' ', per.Apellido) as Cliente

    FROM 

        listanegra ln

    INNER JOIN clientes cli 

    on ln.IdCliente = cli.IdCliente

    inner join personas per 

    on cli.IdPersona = per.IdPersona

    Where ln.IdComplejo = pIdComplejo;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getLocalidadesByProvincia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getLocalidadesByProvincia`(

































    pIdProvincia 	  INT 

































)
BEGIN 

































    SELECT l.IdLocalidad,

































           l.Nombre 

































    FROM Localidades as l

































    INNER JOIN Provincias as p ON l.IdProvincia = p.IdProvincia

































    WHERE p.IdProvincia = pIdProvincia

































    ORDER BY  l.Nombre ;

































END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getProvincias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getProvincias`()
BEGIN 

































    SELECT IdProvincia,

































           Nombre 

































    FROM Provincias

































    ORDER BY Nombre;

































END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getPuntuacionCancha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getPuntuacionCancha`(pIdCancha INT(11), pIdComplejo INT(11))
SELECT IFNULL(AVG(Puntaje),0) as Puntaje

FROM CanchasPuntuacion

WHERE IdCancha = pIdCancha AND IdComplejo = pIdComplejo ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getPuntuacionCanchaCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getPuntuacionCanchaCliente`(IN `pIdCancha` INT(11), IN `pIdComplejo` INT(11), IN `pIdCliente` INT(11))
BEGIN



/*Si no puntuó, va a traer null, asique no voy a marcar ningún botón si es null...*/

SELECT Puntaje

FROM CanchasPuntuacion

WHERE IdCancha = pIdCancha AND IdComplejo = pIdComplejo and IdCliente = pIdCliente;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getPuntuacionComplejo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getPuntuacionComplejo`(IN `pIdComplejo` INT(11))
BEGIN



SELECT IFNULL(AVG(Puntaje),0) as Puntaje



FROM ComplejosPuntuacion



WHERE IdComplejo = pIdComplejo;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getPuntuacionComplejoCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getPuntuacionComplejoCliente`(IN `pIdCancha` INT(11), IN `pIdComplejo` INT(11), IN `pIdCliente` INT(11))
BEGIN



/*Si no puntuó, va a traer null, asique no voy a marcar ningún botón si es null...*/

SELECT Puntaje

FROM ComplejosPuntuacion

WHERE IdComplejo = pIdComplejo and IdCliente = pIdCliente;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getReservasByCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getReservasByCliente`(IN `pIdCliente` INT(11), IN `pTodos` INT, IN `pPagosCompletos` INT, IN `pSeniadas` INT, IN `pFijas` INT)
BEGIN



IF (pTodos = 1) THEN



select DISTINCT r.IdReserva, r.IdComplejo, r.IdCancha, r.FechaReserva, DATE_FORMAT(r.FechaReserva,'%d-%m-%Y %T') as FechaReservaFormateada, r.Fecha as FechaPartido, DATE_FORMAT(r.Fecha,'%d-%m-%Y') as FechaPartidoFormateada, r.HoraInicio, r.HoraFin, re.Descripcion as Estado, c.Nombre as Complejo, ca.nombre as Cancha, r.Pagado,

(r.APagar - r.Pagado) as Restante, c.HorasCancelacion,

CONCAT(r.Fecha, " ",r.HoraInicio) as FPartido,

date_sub(CONCAT(r.Fecha, " ",r.HoraInicio), INTERVAL + c.HorasCancelacion HOUR) as CancelacionHasta,

cd.Calle, cd.Altura, l.Nombre as Localidad, p.Nombre as Provincia, c.IdDuenio

from reservas r

inner join reservasestados re on r.IdEstado = re.IdEstado

inner join complejos c on c.IdComplejo = r.IdComplejo

inner join complejosdireccion cd on cd.IdComplejo = r.IdComplejo

inner join localidades l on l.IdProvincia = cd.IdProvincia and l.IdLocalidad = cd.IdLocalidad

inner join provincias p on p.IdProvincia = cd.IdProvincia

inner join canchas ca on ca.IdCancha = r.IdCancha and ca.IdComplejo = r.IdComplejo

where r.IdCliente = pIdCliente

order by r.FechaReserva desc, r.Fecha desc;



ELSE



select DISTINCT r.IdReserva, r.IdComplejo, r.IdCancha, r.FechaReserva, DATE_FORMAT(r.FechaReserva,'%d-%m-%Y %T') as FechaReservaFormateada, r.Fecha as FechaPartido, DATE_FORMAT(r.Fecha,'%d-%m-%Y') as FechaPartidoFormateada, r.HoraInicio, r.HoraFin, re.Descripcion as Estado, c.Nombre as Complejo, ca.nombre as Cancha, r.Pagado,

(r.APagar - r.Pagado) as Restante, c.HorasCancelacion,

CONCAT(r.Fecha, " ",r.HoraInicio) as FPartido,

date_sub(CONCAT(r.Fecha, " ",r.HoraInicio), INTERVAL + c.HorasCancelacion HOUR) as CancelacionHasta,

cd.Calle, cd.Altura, l.Nombre as Localidad, p.Nombre as Provincia,

c.IdDuenio

from reservas r

inner join reservasestados re on r.IdEstado = re.IdEstado

inner join complejos c on c.IdComplejo = r.IdComplejo

inner join complejosdireccion cd on cd.IdComplejo = r.IdComplejo

inner join localidades l on l.IdProvincia = cd.IdProvincia and l.IdLocalidad = cd.IdLocalidad

inner join provincias p on p.IdProvincia = cd.IdProvincia

inner join canchas ca on ca.IdCancha = r.IdCancha and ca.IdComplejo = r.IdComplejo

where r.IdCliente = pIdCliente

and r.IdEstado in (pPagosCompletos, pSeniadas, pFijas)

order by r.FechaReserva desc, r.Fecha desc;



END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getReservasDuenio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getReservasDuenio`(IN `pIdComplejo` INT, IN `pFecha` DATE)
BEGIN

	DECLARE done INT DEFAULT FALSE;
    DECLARE vIdCancha INT;
    DECLARE i INT;
	DECLARE cur1 CURSOR FOR select can.IdCancha from complejos com  inner join canchas can  on com.IdComplejo = can.IdComplejo where com.IdComplejo = pIdComplejo and can.CantJugadores > 0;
    
    
    SET i =1;

    /*Cursor de posiciones*/ 
	OPEN cur1;
	read_loop: LOOP
		FETCH cur1 INTO vIdCancha;
		IF done THEN
		  LEAVE read_loop;
		END IF;

		/*select d.Nombre
		, calen.fecha
		, res.Fecha
		, res.IdComplejo
		, res.IdCancha
		, res.HoraInicio
		, res.HoraFin
		from dias d 
		left join calendario calen 
		on d.IdDia = calen.idDia 
		left join 
			(select 
			IdComplejo
			,IdCancha
			,Fecha 
			,HoraInicio
			,HoraFin
			from reservas
			where IdCancha = vIdCancha
			and IdComplejo = pIdComplejo) as res
		on calen.fecha = res.Fecha;*/
        
        select 
            calen.fecha 
            , calen.idDia 
            , cd.HoraDesde 
            , cd.HoraHasta 
            , h.hora 
            , can.nombre 
            , reser.idCliente
            , cli.usuario
        from calendario calen 
        inner join dias d 
        on calen.idDia = d.IdDia 
        inner join complejosdias cd 
        on d.IdDia between cd.IdDiaDesde and cd.IdDiaHasta
        inner join horas h 
        on h.hora BETWEEN cd.HoraDesde and cd.HoraHasta 
        inner join complejos com 
        on cd.IdComplejo = com.IdComplejo 
        inner join canchas can 
        on com.IdComplejo = can.IdComplejo 
        left join reservas reser
        on reser.idComplejo = com.idComplejo
        and reser.IdCancha = can.IdCancha
        and reser.fecha = pFecha 
        and h.hora >= reser.HoraInicio 
        and h.hora < reser.horaFin
        left join clientes cli 
        on reser.idCliente = cli.idCliente
        where calen.fecha = pFecha
        and cd.IdComplejo = pIdComplejo
        and can.nombre != ''
        and can.idCancha = vIdCancha ;
        
		SET i =i + 1;
	END LOOP;

    CLOSE cur1;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getReservaTemp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getReservaTemp`(pIdCancha INT(11), pIdComplejo INT(11))
select count(*) as existe


from reservastemporal


where idComplejo = pIdComplejo and idCancha = pIdCancha ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getSuperficies` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getSuperficies`()
SELECT IdSuperficie,

































       Descripcion

































    FROM tipossuperficie

































    ORDER BY Descripcion ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getSuperficiesByIdDuenio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getSuperficiesByIdDuenio`(

































    pIdDuenio  	  INT 

































)
BEGIN 

































    SELECT distinct S.* 

































	FROM tipossuperficie AS S

































	INNER JOIN canchas AS C ON C.idSuperficie = S.idSuperficie

































	INNER JOIN complejos AS CO ON CO.idcomplejo = C.idcomplejo

































	WHERE   C.idEstado = 1

































		AND CO.idestado = 1 

































		AND CO.idDuenio = pIdDuenio;

































END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getTablaPosiciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getTablaPosiciones`(


	pIdTorneo	INT


)
BEGIN





	/* Comento por que no voy a grabar esta tabla <PI)>

	SELECT p.*, eq.nombre 

    FROM puntajesporfechas AS P 

    INNER JOIN equipos AS eq ON eq.idEquipo = p.idequipo

    WHERE P.idTorneo = pIdTorneo 

    AND idFecha = (select max(idfecha) from puntajesporfechas porfecha where idTorneo = pIdTorneo )

    ORDER BY P.cantPuntos DESC, eq.nombre;

    */

    SELECT 	idequipo1 as IdEquipo, 

			sum(puntos) as CantPuntos,

			sum(cant) as Jugados,

            sum(ganados) as Ganados, 

            sum(empatados) as Empatados, 

            sum(perdidos) as Perdidos, 

            eq.nombre

    FROM (	

			select   idequipo1, count(1) as cant,

					sum(if(gol1 > gol2,1,0)) as ganados, 

					sum(if(gol1 = gol2,1,0)) as empatados,

					sum(if(gol1 < gol2,1,0)) as perdidos,

					sum(if(gol1 > gol2,1,0)) * 3 + sum(if(gol1 = gol2,1,0)) as puntos

			from fixture 

			where idtorneo= pIdTorneo  and  jugado = 1

			group by idequipo1

            

			union all



			select  idequipo2,  count(1) as cant,

					sum(if(gol2 > gol1,1,0)) as ganados, 

					sum(if(gol2 = gol1,1,0)) as empatados,

					sum(if(gol2 < gol1,1,0)) as perdidos,

					sum(if(gol1 > gol2,1,0)) * 3 + sum(if(gol1 = gol2,1,0)) as puntos

			from fixture 

			where idtorneo= pIdTorneo   and jugado = 1

            group by idequipo2

		 ) as res

	INNER JOIN   equipos AS eq ON eq.idEquipo = res.idequipo1

	GROUP BY idequipo1;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getTarjetaCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getTarjetaCliente`(pIdCliente INT(11))
SELECT NroTarjeta, Mes, Anio





from clientespagos





where IdCliente = pIdCliente ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getTiposDoc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getTiposDoc`()
BEGIN 

































    SELECT IdTipoDoc,

































           Descripcion 

































    FROM TiposDoc

































    WHERE IdEstado = 1; 

































    

































END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getTipoTorneos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getTipoTorneos`(

































    pIdTipoTorneo  	  INT 

































)
BEGIN 

































    SELECT *

































    FROM TipoTorneos 

































    WHERE idtipoTorneo  = IFNULL(pIdTipoTorneo,idtipoTorneo);

































END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getTorneoByIdTorneo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getTorneoByIdTorneo`(


	pIdTorneo		INT


)
BEGIN


	SELECT 	t.idTorneo, 


			t.nombre, 


            tt.Nombre as tipo, 


            te.descripcion as estado, 


            t.CantEquipos, 


            t.CantJugadores ,


            s.Descripcion as 'superficie',


            t.idaYvuelta,


            t.tiempoPartido    ,


			t.PrecioInscripcion,


            Date_format(t.FecIniInscripcion,'%d/%m/%Y') as 'FecIniInscripcion',


			Date_format(t.FecFinInscripcion,'%d/%m/%Y') as 'FecFinInscripcion',


			t.HorasCancelacion	,


			Date_format(t.FechaInicio,'%d/%m/%Y') as 'FechaInicio',


			Date_format(t.FechaFin,'%d/%m/%Y') as 'FechaFin',


			t.Descripcion	  ,


			t.Reglas	 


	FROM torneos AS t


	INNER JOIN tipotorneos AS tt ON tt.idTipoTorneo = t.idTipoTorneo


	INNER JOIN torneosestados AS te ON te.idEstado = t.idEstado


    INNER JOIN tiposSuperficie AS s ON s.idSuperficie = t.idSuperficie


	WHERE t.idTorneo = pIdTorneo;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getTorneos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getTorneos`(IN `pNombre` VARCHAR(100), IN `pTipo` INT(11), IN `pCantEquipos` INT(11), IN `pIdProv` INT(11), IN `pIdLoc` INT(11), IN `pCantJug` INT(11), IN `pIdSuperficie` INT(11), IN `pInscripcion` INT(11), IN `pActivos` INT(11), IN `pFinalizados` INT(11), IN `pIdaYVuelta` TINYINT(1))
select t.IdTorneo, t.IdTipoTorneo, t.Nombre, tt.Nombre as Tipo, t.CantEquipos, t.CantJugadores, te.Descripcion, c.IdComplejo, c.Nombre as Complejo, cd.Calle, cd.Altura, p.Nombre as Provincia, l.Nombre as Localidad, t.PrecioInscripcion, t.IdaYvuelta, ts.Descripcion as Superficie, ifnull(concat('http://localhost:8080/resergol1.1/api/Imagenes/torneos/',ti.url), 'http://localhost:8080/resergol1.1/api/Imagenes/default-image.jpg') as Imagen

from torneos t

inner join torneosestados te on te.IdEstado = t.IdEstado

inner join duenios d on d.IdDuenio = t.IdDuenio

inner join complejos c on c.IdDuenio = t.IdDuenio

inner join complejosdireccion cd on cd.IdComplejo = c.IdComplejo

inner join provincias p on p.IdProvincia = cd.IdProvincia

inner join localidades l on l.IdLocalidad = cd.IdLocalidad

inner join tipotorneos tt on tt.IdTipoTorneo = t.IdTipoTorneo

left  join torneosimagenes ti ON ti.IdTorneo = t.IdTorneo

inner join tipossuperficie ts  on ts.IdSuperficie = t.IdSuperficie



where c.IdEstado = 1



 AND (cd.IdProvincia = pIdProv AND cd.IdLocalidad = pIdLoc) 

 AND (t.CantJugadores = pCantJug OR pCantJug = -1)

 AND (t.IdSuperficie = pIdSuperficie OR pIdSuperficie = -1)

 AND (t.IdEstado in(pInscripcion,pActivos, pFinalizados))

 AND (t.IdaYvuelta = pIdaYVuelta OR pIdaYVuelta = -1)

 AND (t.IdTipoTorneo = pTipo OR pTipo = -1)      

 AND (t.CantEquipos = pCantEquipos OR pCantEquipos = -1)

      

 AND (t.Nombre like CONCAT('%',pNombre,'%') OR pNombre = '-1')

 

group by t.IdTorneo ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getTorneosByDuenio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getTorneosByDuenio`(




	pIdDuenio		INT,




    pTodos 			INT,




    pActivos		INT,




    pInscripcion	INT,




    pFinalizados	INT)
BEGIN




	




    IF (pTodos = 1) THEN




		SELECT t.idTorneo, t.nombre, tt.Nombre as tipo, te.descripcion, t.CantEquipos,  IFNULL(res.cant,0) as 'Inscriptos', t.CantJugadores 




		FROM torneos AS t




		INNER JOIN tipotorneos AS tt ON tt.idTipoTorneo = t.idTipoTorneo




		INNER JOIN torneosestados AS te ON te.idEstado = t.idEstado




		LEFT JOIN (select idtorneo, count(1) as cant 




					from torneosequipos




					group by idTorneo) as res ON res.idTorneo = t.idTorneo




		WHERE t.idDuenio = pIdDuenio




		ORDER BY 1;




	ELSE




		SELECT t.idTorneo, t.nombre, tt.Nombre as tipo, te.descripcion, t.CantEquipos,  IFNULL(res.cant,0) as 'Inscriptos', t.CantJugadores 




		FROM torneos AS t




		INNER JOIN tipotorneos AS tt ON tt.idTipoTorneo = t.idTipoTorneo




		INNER JOIN torneosestados AS te ON te.idEstado = t.idEstado




		LEFT JOIN (select idtorneo, count(1) as cant 




					from torneosequipos




					group by idTorneo) as res ON res.idTorneo = t.idTorneo




		WHERE t.idDuenio = pIdDuenio




        AND t.idEstado in (pActivos,pInscripcion,pFinalizados)




		ORDER BY 1;




    




    END IF;



















END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getTorneosByIdTorneo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getTorneosByIdTorneo`(
	pIdTorneo		INT
)
BEGIN

	SELECT 	t.idTorneo, 
			t.nombre, 
            tt.Nombre as tipo, 
            te.descripcion as estado, 
            t.CantEquipos, 
            t.CantJugadores ,
            s.Descripcion as 'superficie',
            t.idaYvuelta,
            t.tiempoPartido    ,
			t.PrecioInscripcion,
			t.FecIniInscripcion	,
			t.FecFinInscripcion	,
			t.HorasCancelacion	,
			t.FechaInicio	  ,
			t.FechaFin	      ,
			t.Descripcion	  ,
			t.Reglas	 ,
            t.idEstado,
            t.idTipoTorneo,
            t.idSuperficie
	FROM torneos AS t
	INNER JOIN tipotorneos AS tt ON tt.idTipoTorneo = t.idTipoTorneo
	INNER JOIN torneosestados AS te ON te.idEstado = t.idEstado
    INNER JOIN tiposSuperficie AS s ON s.idSuperficie = t.idSuperficie
	WHERE t.idTorneo = pIdTorneo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_getTorneosImagenes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getTorneosImagenes`(




















    pIdTorneo  	  INT 




















)
BEGIN 




















    SELECT t.idtorneo, t.nombre, TI.url,  




















    concat('http://localhost:8080/resergol1.1/api/Imagenes/torneos/',TI.url) as imagen, TI.fechaalta




















    FROM torneosimagenes AS TI




















    INNER JOIN torneos as T ON T.idtorneo = TI.idtorneo




















    WHERE T.idtorneo = pIdTorneo




















    ORDER BY 5;




















END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insertCanchas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertCanchas`(IN `pIdComplejo` INT, IN `pNombre` VARCHAR(30), IN `pCantJugadores` INT, IN `pIdSuperficie` INT, IN `pTechada` INT, IN `pLuz` INT, IN `pPrecio` DECIMAL(6,2), IN `pIdEstado` INT, INOUT `pIdCancha` INT)
BEGIN



	DECLARE Error INT DEFAULT 0;

    DECLARE EXISTE INT DEFAULT 0;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  

    SET Error = -1;

    

	IF(pIdCancha = 0 or pIdCancha = null or pIdCancha = NULL) THEN

    

        SET pIdCancha = (SELECT IFNULL(MAX(IdCancha), 0) + 1 

            from canchas where IdComplejo = pIdComplejo);



        INSERT INTO canchas

        (

            IdComplejo

            ,IdCancha

            ,nombre

            ,CantJugadores

            ,IdSuperficie

            ,Techada

            ,Luz

            ,Precio

            ,IdEstado

        ) 

        VALUES 

        (

            pIdComplejo

            ,pIdCancha

            ,pNombre

            ,pCantJugadores

            ,pIdSuperficie

            ,pTechada

            ,pLuz

            ,pPrecio

            ,pIdEstado

        );

    

    ELSE

    

        UPDATE canchas SET 

            nombre = pNombre

            ,CantJugadores = pCantJugadores

            ,IdSuperficie = pIdSuperficie

            ,Techada = pTechada

            ,Luz = pLuz

            ,Precio =pPrecio

            ,IdEstado = pIdEstado 

        WHERE IdComplejo = pIdComplejo

        AND IdCancha = pIdCancha;

    

    END IF;



    IF Error=-1 THEN

        SET pIdCancha = -1; 

    END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insertCanchasImagenes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertCanchasImagenes`(IN `pIdComplejo` INT, IN `pIdCancha` INT, IN `pUrl` VARCHAR(150), OUT `vResultado` INT)
BEGIN 





    DECLARE Error INT DEFAULT 0;


    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;


    SET vResultado = 1;





	INSERT INTO canchasimagenes	


    (


        IdComplejo


        ,IdCancha


        ,url


        ,fechaAlta


    )	        


	VALUES


    ( 


        pIdComplejo


        ,pIdCancha


		,pUrl


        ,NOW()


    );  





	IF (Error=-1)  THEN


        SET vResultado = -1; /*Devuelve -1 en caso de error*/


    END IF;





END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insertClientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertClientes`(

































    pUsuario	    VARCHAR(25),

































    pContrasenia	BLOB(30),

































    pNombre	      VARCHAR(60),

































    pApellido	    VARCHAR(60),

































    pIdTipoDoc 	  INT        ,

































    pNroDoc	      INT        ,   

































    pEmail	      VARCHAR(60),

































    OUT pIdCliente  INT

































)
BEGIN 

































    DECLARE Error INT DEFAULT 0;

































    DECLARE idPersonaAux INT DEFAULT 0;

































    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;

































    

































    

































	SELECT IFNULL(idPersona, 0) INTO idPersonaAux FROM personas WHERE  idTipoDoc = pIdTipoDoc and nroDoc = pNroDoc;

































    

































    

































    IF (idPersonaAux = 0) THEN  

































    	CALL SP_insertPersonas (pNombre, pApellido, pIdTipoDoc, 			pNroDoc,pEmail, @idPersona);

































    END IF;

































     

































    IF Error = 0 THEN

































        

































        INSERT INTO Clientes(IdPersona, 

































                            Usuario,

































                            Contrasenia,	

































                            IdEstado,	

































                            FechaAlta,	

































                            FechaBaja)

































        VALUES( @idPersona,

































                pUsuario, 

































                pContrasenia, 

































                1,

































                CURDATE(),

































                null );

































        

































    ELSE

































        SET pIdCliente = -1; 

































    END IF;

































    

































    

































    IF Error=-1 THEN

































        SET pIdCliente = -1; 

































    ELSE

































        SET pIdCliente = (SELECT MAX(idCliente) FROM Clientes); 

































    END IF;



































































END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insertComentarioCancha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertComentarioCancha`(IN `pIdCancha` INT(11), IN `pIdComplejo` INT(11), IN `PIdCliente` INT(11), IN `pComentario` VARCHAR(300), OUT `pValor` INT)
BEGIN



DECLARE Error INT DEFAULT 0;



	DECLARE EXISTE INT DEFAULT 0;



    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;



        INSERT INTO CanchasComentarios(IdComplejo,

        						  IdCancha,

		                          IdCliente,

		                          Comentario,

		                          Fecha)



        VALUES( pIdComplejo,

       		    pIdCancha,

                pIdCliente,

                pComentario,

                NOW());



    IF Error=-1 THEN



        SET pValor = -1; 



    ELSE



        SET pValor = 1; 



    END IF;

    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insertComentarioComplejo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertComentarioComplejo`(IN `pIdComplejo` INT(11), IN `pIdCliente` INT(11), IN `pComentario` VARCHAR(200), OUT `pValor` INT(11))
BEGIN

DECLARE Error INT DEFAULT 0;

	DECLARE EXISTE INT DEFAULT 0;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;

        INSERT INTO ComplejosComentarios(IdComplejo,

		                          IdCliente,

		                          Comentario,

		                          Fecha)

        VALUES( pIdComplejo,

                pIdCliente,

                pComentario,

                NOW());



    IF Error=-1 THEN

        SET pValor = -1; 

    ELSE

        SET pValor = 1; 

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insertComplejo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertComplejo`(OUT `pIdComplejo` INT, IN `pNombre` VARCHAR(60), IN `pDescripcion` VARCHAR(200), IN `pEstacionamiento` TINYINT, IN `pBuffet` TINYINT, IN `pDuchas` TINYINT, IN `pParrillas` TINYINT, IN `pWiFi` TINYINT, IN `pHoraCobroLuz` TIME, IN `pPorcentajeSeña` INT, IN `pHorasCancelacion` INT, IN `pTiempoReserva` TIME, IN `pEmail` VARCHAR(60), IN `pIdEstado` INT, IN `pIdDuenio` INT, IN `pPorcentajeLuz` INT, IN `pNroCelular` INT, IN `pNroTelefono` INT)
BEGIN



	DECLARE Error INT DEFAULT 0;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;



INSERT INTO Complejos 

(

	Nombre

	, Descripcion

	, Estacionamiento

	, Buffet

	, Duchas

    , Parrillas

    , WiFi

    , HoraCobroLuz

    , PorcentajeSeña

    , HorasCancelacion

    , Email

    , IdEstado

    , IdDuenio

    , PorcentajeLuz

    , nroCelular

    , nroTelefono

)

VALUES 

(

	pNombre

    , pDescripcion

    , pEstacionamiento

    , pBuffet

    , pDuchas

    , pParrillas

    , pWiFi

    , pHoraCobroLuz

    , pPorcentajeSeña

    , pHorasCancelacion

    , pEmail

    , pIdEstado

    , pIdDuenio

    , pPorcentajeLuz

    , pNroCelular

    , pNroTelefono

);



    IF Error=-1 THEN

        SET pIdComplejo = -1; 

    ELSE

		SET pIdComplejo = (SELECT MAX(IdComplejo) FROM Complejos);

    END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insertComplejosDireccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertComplejosDireccion`(IN `pIdComplejo` INT, IN `pCalle` VARCHAR(40), IN `pAltura` INT, IN `pIdLocalidad` INT, IN `pIdProvincia` INT, IN `pX` INT, IN `pY` INT, OUT `vResultado` INT)
BEGIN



    DECLARE Error INT DEFAULT 0;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;



INSERT INTO complejosdireccion 

(

    IdComplejo

    ,Calle

    ,Altura

    ,IdLocalidad

    ,IdProvincia

    ,X

    ,Y

) 

VALUES 

(

    pIdComplejo

    ,pCalle

    ,pAltura

    ,pIdLocalidad

    ,pIdProvincia

    ,pX

    ,pY

);



    IF Error=-1 THEN

        SET vResultado = -1; 

    END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insertComplejosImagenes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertComplejosImagenes`(IN `pIdComplejo` INT, IN `pUrl` VARCHAR(150), OUT `vResultado` INT)
BEGIN 



    DECLARE Error INT DEFAULT 0;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;

    SET vResultado = 1;



	INSERT INTO complejosimagenes	

    (

        IdComplejo

        ,url

        ,fechaAlta

    )	        

	VALUES

    ( 

        pIdComplejo

		,pUrl

        ,NOW()

    );  



	IF (Error=-1)  THEN

        SET vResultado = -1; /*Devuelve -1 en caso de error*/

    END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insertComplejosPagos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertComplejosPagos`(IN `pIdComplejo` INT, IN `pCBU` VARCHAR(22), IN `pNroCuenta` VARCHAR(18))
BEGIN 



    DECLARE Error INT DEFAULT 0;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;



INSERT INTO complejospagos

(

    IdComplejo

    ,CBU

    ,NroCuenta

) 

VALUES 



(

    pIdComplejo

    ,pCBU

    ,pNroCuenta

);



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insertDevolucion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertDevolucion`(IN `pIdCliente` INT(11), IN `pIdDuenio` INT(11), IN `pMonto` DOUBLE(6,2), OUT `pValor` INT)
BEGIN 

    DECLARE Error INT DEFAULT 0;



    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;



        INSERT INTO devoluciones(IdCliente, IdDuenio, Monto)



        VALUES(pIdCliente, pIdDuenio, pMonto);



    IF Error=-1 THEN



	 SET pValor = -1; 



    ELSE

		 SET pValor = 1; 



    END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insertDiasComplejos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertDiasComplejos`(IN `pIdComplejo` INT, IN `pIdDiaDesde` INT, IN `pIdDiaHasta` INT, IN `pHoraDesde` TIME, IN `pHoraHasta` TIME)
BEGIN



	DECLARE Error INT DEFAULT 0;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;



    INSERT INTO complejosdias 

    (

        IdComplejo

        ,IdDiaDesde

        ,IdDiaHasta

        ,HoraDesde

        ,HoraHasta

    ) 

    VALUES 

    (

        pIdComplejo

        ,pIdDiaDesde

        ,pIdDiaHasta

        ,pHoraDesde

        ,pHoraHasta

    );



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insertDuenios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertDuenios`(

































    pUsuario	      VARCHAR(25),

































    pContrasenia	  BLOB(30),

































    pNombre	        VARCHAR(60),

































    pApellido	      VARCHAR(60),

































    pIdTipoDoc 	    INT        ,

































    pNroDoc	        INT        ,   

































    pEmail	        VARCHAR(60),

































    pNombreComplejo VARCHAR(60),

































    pNroTelef       VARCHAR(15),

































    pIdProv         INT,

































    pIdLoc          INT,

































    pDireccion	    VARCHAR(40),   

































    pNroCalle       INT, 

































    OUT pIdDuenio   INT

































)
BEGIN 

































	

































    

































    DECLARE Error INT DEFAULT 0;

































    DECLARE idPersonaAux INT DEFAULT 0;

































    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;

































    

































      

































      SELECT IFNULL(idPersona, 0) INTO idPersonaAux FROM personas WHERE idTipoDoc = pIdTipoDoc and nroDoc = pNroDoc;

































      

































      IF (idPersonaAux = 0) THEN 

































        CALL SP_insertPersonas (pNombre, pApellido, pIdTipoDoc, pNroDoc,pEmail, @idPersona);

































      END IF;

































      

































    

































     

































    IF (Error = 0) THEN

































        

































        INSERT INTO Duenios(IdPersona, 

































                            Usuario,

































                            Contrasenia,	

































                            IdEstado,	

































                            FechaAlta,	

































                            FechaBaja)

































        VALUES( @idPersona,

































                pUsuario, 

































                pContrasenia, 

































                1,

































                CURDATE(),

































                null );

































                

































         SET pIdDuenio = (SELECT MAX(idDuenio) FROM Duenios);        

































        

































            

































       

































       INSERT INTO DueniosPendientes(IdDuenio,

































                                      nombreComplejo,    

































                                      NroTelef,          

































                                      Calle,	          

































                                      Altura,	         

































                                      IdLocalidad,

































                                      IdProvincia)

































        VALUES( pIdDuenio,

































                pNombreComplejo,

































                pNroTelef, 

































                pDireccion,

































                pNroCalle,

































                pIdLoc,

































                pIdProv);

































    

































				

































    ELSE

































        SET pIdDuenio = -1; 

































    END IF;

































    

































    

































    IF (Error=-1 OR pIdDuenio = -1) THEN

































        SET pIdDuenio = -1; 

































        

































    END IF;

































END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insertFixtureCopa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertFixtureCopa`(

  pIdTorneo	   INT,

  pLimite	   INT

)
BEGIN 

DECLARE done INT DEFAULT FALSE;
    DECLARE vidReserva INT;
    DECLARE vidEquipo INT;
    DECLARE i INT;
    DECLARE vFase INT;
    DECLARE vLimiteFase INT;
	
	DECLARE vIdReserva1 INT;
	DECLARE vIdReserva2 INT;
	DECLARE vContadorFase INT;
	
    
	
    DECLARE cur1 CURSOR FOR SELECT idreserva from tmpEquipos where pIdTorneo =pIdTorneo;
    DECLARE cur2 CURSOR FOR SELECT idequipo from torneosequipos where IdTorneo =pIdTorneo order by idequipo limit pLimite;
    DECLARE cur3 CURSOR FOR SELECT idequipo from torneosequipos where IdTorneo =pIdTorneo order by idequipo desc limit pLimite;


	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    /*Cantidad de */
    SET vFase = (select case CantEquipos when 32 then 1 
						when 16 then 2
                        when 8 then 3
                        when 4 then 4
						end
				from torneos where IdTorneo = pIdTorneo);



    /*Cargo la tabla de fixture con los datos que tengo*/

	INSERT INTO fixture( idTorneo,
						 idFecha,
						 idReserva,
						 IdEquipo1,
						 IdEquipo2,
                         jugado
						 )

	SELECT  t.idTorneo,
			vFase,
			R.idReserva,
			1,2,
            1
	FROM reservas as R
	INNER JOIN torneos as T on t.idTorneo = R.idTorneo
	WHERE T.idtorneo = pIdTorneo
	ORDER BY R.idReserva
	LIMIT pLimite;
    
    SET vFase = vFase +1;
    SET vLimiteFase = pLimite/2;
    
    /*Sigo llenando el fixture por fases*/
	WHILE vFase <= 5 DO /*5 es la fase de la final*/
		
		SET vContadorFase = 1;
		
		WHILE vContadorFase <= vLimiteFase DO
			SET vIdReserva1 = (select min(f.idreserva) 
								from fixture as F
								left join fixture as b on f.idreserva = b.idreserva1
								left join fixture as c on f.idreserva = c.idreserva2
								where f.idtorneo = pIdTorneo and f.idfecha = vFase-1  and  b.idreserva1 is null
																					  and  c.idreserva2 is null);
										
										
			SET vIdReserva2 = (select min(f.idreserva) 
								from fixture as F
								left join fixture as b on f.idreserva = b.idreserva1
								left join fixture as c on f.idreserva = c.idreserva2
								where f.idreserva!= vIdReserva1
								and f.idtorneo = pIdTorneo and f.idfecha = vFase-1  and  b.idreserva1 is null
																					and  c.idreserva2 is null);
								
			INSERT INTO fixture( idTorneo,
								 idFecha,
								 idReserva,
								 IdEquipo1,
								 IdEquipo2,
								 IdReserva1,
								 IdReserva2
								 )
			SELECT  t.idTorneo,
					vFase,
					R.idReserva,
					0,
					0,
					vIdReserva1,
					vIdReserva2
			FROM reservas as R
			INNER JOIN torneos as T on t.idTorneo = R.idTorneo
			WHERE T.idtorneo = pIdTorneo
			AND not exists(select res.idReserva
							from reservas res
							inner join fixture f on f.idreserva = res.idreserva
							where res.idtorneo =pIdTorneo and R.idReserva = res.idreserva)
			ORDER BY R.fecha
			LIMIT 1;
		 
			SET vContadorFase = vContadorFase + 1;
		
		END WHILE; 
		
		
		SET vFase = vFase +1;
        SET vLimiteFase = vLimiteFase/2;
      
	END WHILE;
    
    
    


	/*Cargo la temporal de trabajo*/

    INSERT INTO tmpEquipos (idtorneo , idReserva)

	SELECT  t.idTorneo,

			R.idReserva

	FROM reservas as R

	INNER JOIN torneos as T on t.idTorneo = R.idTorneo

	WHERE T.idtorneo = pIdTorneo

	ORDER BY R.fecha

	LIMIT pLimite;


    SET i =1;


    /*Cursor de posiciones*/ 

	OPEN cur1;

	read_loop: LOOP


		FETCH cur1 INTO vidReserva;

		IF done THEN

		  LEAVE read_loop;

		END IF;


		UPDATE tmpEquipos

        SET posicion = i

        WHERE idreserva = vidReserva;


         SET i =i + 1;

	END LOOP;


    CLOSE cur1;


	/*Cursor de equipo 1*/ 

    SET done = false;

    SET i =1;

	
    OPEN cur2;


	read_loop: LOOP

		FETCH cur2 INTO vidEquipo;

		
        IF done THEN

		  LEAVE read_loop;

		END IF;


		UPDATE tmpEquipos

        SET idequipo1 = vidEquipo

        WHERE posicion = i;

		SET i =i + 1;

	END LOOP;



	CLOSE cur2;


	/*Cursor de equipo 2*/ 

    SET done = false;

    SET i =1;


	OPEN cur3;

	read_loop: LOOP

		FETCH cur3 INTO vidEquipo;
        

		IF done THEN

		  LEAVE read_loop;

		END IF;


		UPDATE tmpEquipos

        SET idequipo2 = vidEquipo

        WHERE posicion = i;

		
        SET i =i + 1;

	END LOOP;


	CLOSE cur3;


    /*Finalizo el fixture*/
    UPDATE fixture as f
	INNER JOIN  tmpEquipos as t ON f.idTorneo = t.idtorneo AND f.idReserva = t.idReserva
	SET f.IdEquipo1 = t.IdEquipo1,
		f.IdEquipo2 = t.IdEquipo2;
    
	/*Borro la tabla temporal*/
    DELETE FROM tmpEquipos WHERE idTorneo = pIdTorneo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insertFixtureCopaIdayVuelta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertFixtureCopaIdayVuelta`(
  pIdTorneo	   INT,
  pLimite	   INT
)
BEGIN 
	DECLARE done INT DEFAULT FALSE;
    DECLARE vidReserva INT;
    DECLARE vidEquipo INT;
    DECLARE i INT;
    DECLARE vFase INT;
    DECLARE vLimiteFase INT;
	
	DECLARE vIdReserva1 INT;
	DECLARE vIdReserva2 INT;
	DECLARE vContadorFase INT;
	
    
	
    DECLARE cur1 CURSOR FOR SELECT idreserva from tmpEquipos where pIdTorneo =pIdTorneo;
    DECLARE cur2 CURSOR FOR SELECT idequipo from torneosequipos where IdTorneo =pIdTorneo order by idequipo limit pLimite;
    DECLARE cur3 CURSOR FOR SELECT idequipo from torneosequipos where IdTorneo =pIdTorneo order by idequipo desc limit pLimite;


	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    /*Cantidad de */
    SET vFase = (select case CantEquipos when 32 then 1 
						when 16 then 2
                        when 8 then 3
                        when 4 then 4
						end
				from torneos where IdTorneo = pIdTorneo);



    /*Cargo la tabla de fixture con los datos que tengo*/
	INSERT INTO fixture( idTorneo,
						 idFecha,
						 idReserva,
						 IdEquipo1,
						 IdEquipo2,
                         jugado
						 )

	SELECT  t.idTorneo,
			vFase,
			R.idReserva,
			1,2,
            1
	FROM reservas as R
	INNER JOIN torneos as T on t.idTorneo = R.idTorneo
	WHERE T.idtorneo = pIdTorneo
	ORDER BY R.idReserva
	LIMIT pLimite;
    
    SET vFase = vFase +1;
    SET vLimiteFase = pLimite/2;
    
    /*Sigo llenando el fixture por fases*/
	WHILE vFase <= 5 DO /*5 es la fase de la final*/
		
		SET vContadorFase = 1;
		
		WHILE vContadorFase <= vLimiteFase DO
			SET vIdReserva1 = (select min(f.idreserva) 
								from fixture as F
								left join fixture as b on f.idreserva = b.idreserva1
								left join fixture as c on f.idreserva = c.idreserva2
								where f.idtorneo = pIdTorneo and f.idfecha = vFase-1  and  b.idreserva1 is null
																					  and  c.idreserva2 is null);
										
										
			SET vIdReserva2 = (select min(f.idreserva) 
								from fixture as F
								left join fixture as b on f.idreserva = b.idreserva1
								left join fixture as c on f.idreserva = c.idreserva2
								where f.idreserva!= vIdReserva1
								and f.idtorneo = pIdTorneo and f.idfecha = vFase-1  and  b.idreserva1 is null
																					and  c.idreserva2 is null);
								
			INSERT INTO fixture( idTorneo,
								 idFecha,
								 idReserva,
								 IdEquipo1,
								 IdEquipo2,
								 IdReserva1,
								 IdReserva2
								 )
			SELECT  t.idTorneo,
					vFase,
					R.idReserva,
					0,
					0,
					vIdReserva1,
					vIdReserva2
			FROM reservas as R
			INNER JOIN torneos as T on t.idTorneo = R.idTorneo
			WHERE T.idtorneo = pIdTorneo
			AND not exists(select res.idReserva
							from reservas res
							inner join fixture f on f.idreserva = res.idreserva
							where res.idtorneo =pIdTorneo and R.idReserva = res.idreserva)
			ORDER BY R.fecha
			LIMIT 1;
		 
			SET vContadorFase = vContadorFase + 1;
		
		END WHILE; 
		
		
		SET vFase = vFase +1;
        SET vLimiteFase = vLimiteFase/2;
      
	END WHILE;
    
    
    


	/*Cargo la temporal de trabajo*/

    INSERT INTO tmpEquipos (idtorneo , idReserva)
	SELECT  t.idTorneo,
			R.idReserva
	FROM reservas as R
	INNER JOIN torneos as T on t.idTorneo = R.idTorneo
	WHERE T.idtorneo = pIdTorneo
	ORDER BY R.idReserva
	LIMIT pLimite;

    SET i =1;


    /*Cursor de posiciones*/ 

	OPEN cur1;

	read_loop: LOOP


		FETCH cur1 INTO vidReserva;

		IF done THEN

		  LEAVE read_loop;

		END IF;


		UPDATE tmpEquipos
        SET posicion = i
        WHERE idreserva = vidReserva;

         SET i =i + 1;

	END LOOP;


    CLOSE cur1;


	/*Cursor de equipo 1*/ 

    SET done = false;

    SET i =1;

	
    OPEN cur2;


	read_loop: LOOP

		FETCH cur2 INTO vidEquipo;

		
        IF done THEN

		  LEAVE read_loop;

		END IF;


		UPDATE tmpEquipos

        SET idequipo1 = vidEquipo

        WHERE posicion = i;

		SET i =i + 1;

	END LOOP;



	CLOSE cur2;


	/*Cursor de equipo 2*/ 

    SET done = false;

    SET i =1;


	OPEN cur3;

	read_loop: LOOP

		FETCH cur3 INTO vidEquipo;
        

		IF done THEN

		  LEAVE read_loop;

		END IF;


		UPDATE tmpEquipos

        SET idequipo2 = vidEquipo

        WHERE posicion = i;

		
        SET i =i + 1;

	END LOOP;


	CLOSE cur3;


    /*Finalizo el fixture*/
    UPDATE fixture as f
	INNER JOIN  tmpEquipos as t ON f.idTorneo = t.idtorneo AND f.idReserva = t.idReserva
	SET f.IdEquipo1 = t.IdEquipo1,
		f.IdEquipo2 = t.IdEquipo2;
    
	/*Borro la tabla temporal*/
    /*DELETE FROM tmpEquipos WHERE idTorneo = pIdTorneo;*/
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insertFixtureLiga` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertFixtureLiga`(







	pIdTorneo	   INT,







	pLimite	   INT







)
BEGIN







	DECLARE done INT DEFAULT FALSE;







	DECLARE vfecha INT;







    DECLARE vCantEquipos INT;







    DECLARE vCantPartFecha INT;







    DECLARE vCantFechas INT;







    DECLARE vIdayvuelta INT;







    DECLARE vidReserva INT;







	DECLARE vidEquipo INT;







	DECLARE i INT;







    DECLARE vPos INT;







	DECLARE vContFechas INT;







    DECLARE vContPartidos INT;







	DECLARE vEquipo1	INT;







    DECLARE vEquipo2	INT;







    







    







    







    







    







    DECLARE cur1 CURSOR FOR SELECT idreserva from tmpEquipos where pIdTorneo =pIdTorneo;







 







	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;







    







	SELECT CantEquipos, idayVuelta INTO vCantEquipos, vIdayvuelta FROM torneos WHERE idtorneo = pIdTorneo;







    SET vCantPartFecha = vCantEquipos/2 ;







    







    IF vIdayvuelta = 0 THEN







		  SET vCantFechas = vCantEquipos - 1;







    ELSE







		SET vCantFechas = (vCantEquipos - 1) * 2;







    END IF;







    







    SET vfecha = 1;















	/*Cargo la tabla de fixture con los datos que tengo*/







	INSERT INTO fixture( idTorneo,







						 idFecha,







						 idReserva,







						 IdEquipo1,







						 IdEquipo2,







                         gol1, 







                         gol2







						 )







	SELECT  t.idTorneo,







			R.idReserva,







			R.idReserva,







			0,0,0,0







	FROM reservas as R







	INNER JOIN torneos as T on t.idTorneo = R.idTorneo







	WHERE T.idtorneo = pIdTorneo







	ORDER BY R.fecha;







    















    







    /*Para las fechas*/







	WHILE vfecha <= vCantFechas DO







	







		INSERT INTO tmpEquipos ( idtorneo , idReserva, idFecha)







		SELECT  t.idTorneo,







				R.idReserva,







                vfecha







		FROM reservas as R







		INNER JOIN torneos as T on t.idTorneo = R.idTorneo







		WHERE T.idtorneo = pIdTorneo







		AND NOT EXISTS (select idTorneo,idReserva from tmpEquipos where idTorneo =t.idTorneo and idReserva = R.idReserva)







		ORDER BY R.idReserva







		LIMIT vCantPartFecha;







      







		SET vfecha =vfecha+1;







		







	END WHILE;







    















     







    /*Cursor de posiciones*/







	SET i =1;







	OPEN cur1;







       







	read_loop: LOOP







		FETCH cur1 INTO vidReserva;







		







		IF done THEN







		  LEAVE read_loop;







		END IF;















		UPDATE tmpEquipos







        SET posicion = i







        WHERE idreserva = vidReserva;







        







         SET i =i + 1;







	END LOOP;







	







    CLOSE cur1;







    







    







    /*Para la temporal de quipos*/







    SET vContFechas = 1;







    SET vContPartidos = 1;







    SET vPos = 1;







     















    WHILE vContFechas <= vCantFechas DO







		







        SET vContPartidos = 1;







        







        WHILE vContPartidos <= vCantPartFecha DO







	







            IF ((vIdayvuelta = 0) OR (vIdayvuelta = 1 and vContFechas <= vCantFechas/2)) THEN







		







				select a.IdEquipo, b.IdEquipo  INTO vEquipo1, vEquipo2







				from torneosequipos as a







				inner join torneosequipos as b on a.idtorneo = b.idTorneo and a.IdEquipo != b.IdEquipo







				where a.IdTorneo=pIdTorneo







				and not exists (select 1 







								from tmpEquipos 







								where (IdEquipo1 = a.IdEquipo AND IdEquipo2 = b.IdEquipo)







										OR







									  (IdEquipo1 = b.IdEquipo AND IdEquipo2 = a.IdEquipo)







								) 







				and not exists (select 1 







								from tmpEquipos 







								where ((IdEquipo1 = a.IdEquipo OR IdEquipo2 = b.IdEquipo)







										OR







									  (IdEquipo1 = b.IdEquipo OR IdEquipo2 = a.IdEquipo))







									  AND idfecha =vContFechas







								) 







				limit 1;







                







			ELSE







			







				select  a.IdEquipo2,  a.IdEquipo1 INTO vEquipo1, vEquipo2







				from tmpEquipos as a







				where a.idtorneo = pIdTorneo and a.posicion =  vPos - (vCantFechas * 2)







				limit 1;







            







            END IF;







            







            UPDATE tmpEquipos







			SET idequipo1 = vEquipo1 ,







				idequipo2 = vEquipo2







			WHERE posicion =vPos;







			







			SET vContPartidos =vContPartidos +1;







			SET vPos = vPos +1;







		END WHILE;







        







		set vContFechas = vContFechas +1;







    END WHILE;







    







     /*Finalizo el fixture*/







    UPDATE fixture as f







	INNER JOIN  tmpEquipos as t ON f.idTorneo = t.idtorneo AND f.idReserva = t.idReserva







	SET f.IdEquipo1 = t.IdEquipo1,







		f.IdEquipo2 = t.IdEquipo2,







        f.idfecha = t.idfecha;







        







    /*Borro la tabla temporal*/







    DELETE FROM tmpEquipos WHERE idTorneo = pIdTorneo;















END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insertImagen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertImagen`(OUT `pValor` INT(11), IN `pIdComplejo` INT(11), IN `pIdCancha` INT(11), IN `pIdImagen` INT(11), IN `pBytesArchivo` BLOB)
BEGIN 

































    DECLARE Error INT DEFAULT 0;

































    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;

































    

































        INSERT INTO canchasimagenes(IdComplejo,IdCancha,IdImagen,Imagen)

































        VALUES(pIdComplejo,

































                pIdCancha, 

































                pIdImagen, 

































                pBytesArchivo);

































    

































    IF Error=-1 THEN

































        SET pValor = -1; 

































    ELSE

































        SET pValor = (SELECT MAX(IdImagen) FROM canchasimagenes); 

































    END IF;



































































END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insertPersonas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertPersonas`(

































    pNombre	    VARCHAR(60),

































    pApellido	  VARCHAR(60),

































    pIdTipoDoc	INT        ,

































    pNroDoc	    INT        ,   

































    pEmail	    VARCHAR(60),

































    OUT pIdPersona  INT

































)
BEGIN 

































    DECLARE Error INT DEFAULT 0;

































    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;

































     

































    

































    

































    

































    INSERT INTO Personas(Nombre, 

































                        ApellidO,

































                        IdTipoDoc,

































                        NroDoc,

































                        Email)

































    VALUES( pNombre,

































            pApellido, 

































            pIdTipoDoc, 

































            pNroDoc,

































            pEmail);

































            

































    IF Error=-1 THEN

































        SET pIdPersona = -1; 

































    ELSE

































        SET pIdPersona = (SELECT MAX(IdPersona) FROM Personas); 

































    END IF;



































































END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insertPuntuacionCancha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertPuntuacionCancha`(IN `pIdCancha` INT(11), IN `pIdComplejo` INT(11), IN `pIdCliente` INT(11), IN `pPuntaje` INT(11), OUT `pValor` INT)
BEGIN



DECLARE Error INT DEFAULT 0;



DECLARE EXISTE INT DEFAULT 0;



DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;



set EXISTE = (SELECT count(*) FROM CanchasPuntuacion where IdCliente = pIdCliente and IdCancha = pIdCancha and IdComplejo = pIdComplejo);



	IF EXISTE = 0 THEN



        INSERT INTO CanchasPuntuacion(IdComplejo,

        						  IdCancha,

		                          IdCliente,

		                          Puntaje,

		                          Fecha)



        VALUES( pIdComplejo,

       		    pIdCancha,

                pIdCliente,

                pPuntaje,

                NOW());



	ELSE



    	UPDATE CanchasPuntuacion

        SET Puntaje = pPuntaje,

    	Fecha = NOW()

        WHERE IdComplejo = pIdComplejo and IdCancha = pIdCancha and IdCliente = pIdCliente;



    END IF;



    IF Error=-1 THEN



        SET pValor = -1; 



    ELSE



        SET pValor = 1; 



    END IF;

    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insertPuntuacionComplejo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertPuntuacionComplejo`(IN `pIdComplejo` INT(11), IN `pIdCliente` INT(11), IN `pPuntaje` INT(11), OUT `pValor` INT(11))
BEGIN



DECLARE Error INT DEFAULT 0;



DECLARE EXISTE INT DEFAULT 0;



DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;



set EXISTE = (SELECT count(*) FROM ComplejosPuntuacion where IdCliente = pIdCliente and IdComplejo = pIdComplejo);



	IF EXISTE = 0 THEN



        INSERT INTO ComplejosPuntuacion(IdComplejo,



		                          IdCliente,



		                          Puntaje,



		                          Fecha)

        VALUES( pIdComplejo,



                pIdCliente,



                pPuntaje,



                NOW());

	ELSE



    	UPDATE ComplejosPuntuacion



        SET Puntaje = pPuntaje,



    	Fecha = NOW()



        WHERE IdComplejo = pIdComplejo and IdCliente = pIdCliente;



    END IF;







    IF Error=-1 THEN



        SET pValor = -1; 



    ELSE



        SET pValor = 1; 



    END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insertReservasTorneo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertReservasTorneo`( 

    pIdTorneo	   INT

    )
BEGIN 


    DECLARE Error INT DEFAULT 0;

	DECLARE vCantDePartidos INT DEFAULT 0;
	DECLARE vCantDisponible INT DEFAULT 0;

    DECLARE vCantHorasReserva INT DEFAULT 0;

    DECLARE vTipoTorneo	INT;

    DECLARE vCantFixture INT;

    DECLARE vResultado	varchar(100);

    DECLARE vAux	varchar(100);


    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;


    START TRANSACTION;

	/*Obtengo la cantidad de partidos del torneo*/

    SET vTipoTorneo = (select idTipoTorneo from torneos where idTorneo = pIdTorneo);


    IF vTipoTorneo = 1 THEN /*Liga*/


		SET vCantDePartidos = (select  ((CantEquipos/2) * (CantEquipos-1)) * if(IdaYvuelta = 0, 1,2) 

								from torneos where idtorneo = pIdTorneo);

	ELSE

		SET vCantDePartidos = (select if(IdaYvuelta = 0, CantEquipos, (CantEquipos*2)) 

								from torneos where idtorneo = pIdTorneo);


		SET vCantFixture = (select if(IdaYvuelta = 0, (vCantDePartidos/2), (vCantDePartidos/4) ) 

								from torneos where idtorneo = pIdTorneo);

    END IF;
    

	/*Obtengo la cantidad de horas de reserva*/

    SET vCantHorasReserva = (select if(tiempoPartido <=60,1,2) from torneos where idtorneo = pIdTorneo);




	/*Obtengo la cantidad disponible*/

	SET vCantDisponible = (SELECT count(1)

							FROM torneos as t

							INNER JOIN complejos c ON c.idduenio = t.idDuenio

							INNER JOIN torneosdias as td ON td.idtorneo = t.idtorneo

							INNER JOIN torneoscanchas as tc ON tc.idtorneo = t.idtorneo

							INNER JOIN calendario as ca ON ca.idDia = td.IdDia

							INNER JOIN horas as H ON H.hora >= td.HoraDesde and H.hora < td.HoraHasta

							WHERE t.idtorneo= pIdTorneo

								AND ca.fecha between t.FechaInicio and t.FechaFin 

                                AND  MOD(hour(H.hora),vCantHorasReserva)  = MOD(hour(td.HoraDesde),vCantHorasReserva)

								AND not exists(select idcomplejo

												from reservas R

												where R.idcomplejo = c.IdComplejo

												and R.idCancha = tc.idcancha

												and R.fecha = ca.fecha

												and h.hora >= HoraInicio and h.hora < horafin));


   /*Si hay disponibles hago la reserva*/

   IF vCantDePartidos <= vCantDisponible THEN
   

		INSERT INTO reservas(IdCliente, 

                            IdComplejo,

                            IdCancha,	

                            Fecha,	

                            HoraInicio,	

                            HoraFin,

                            APagar,

                            Pagado, 

                            PorcentajePago,

                            IdEstado,

                            FechaReserva,

                            idTorneo)

		SELECT  32, /*cliente 32 es torneo*/

				c.IdComplejo,

                tc.IdCancha,
                ca.fecha, 

                h.hora,

                DATE_ADD(hora,INTERVAL vCantHorasReserva hour),

                0.0,

                0.0,

                0,

                1,

                CURDATE(),

                t.IdTorneo

		FROM torneos as t

		INNER JOIN complejos c ON c.idduenio = t.idDuenio

		INNER JOIN torneosdias as td on td.idtorneo = t.idtorneo

		INNER JOIN torneoscanchas as tc on tc.idtorneo = t.idtorneo

		INNER JOIN calendario as ca on ca.idDia = td.IdDia

		INNER JOIN horas as H on H.hora >= td.HoraDesde and H.hora < td.HoraHasta

		WHERE t.idtorneo= pIdTorneo

			AND ca.fecha between t.FechaInicio and t.FechaFin 

            AND  MOD(hour(H.hora),vCantHorasReserva)  = MOD(hour(td.HoraDesde),vCantHorasReserva)

			AND not exists(select idcomplejo

							from reservas R

							where R.idcomplejo = c.IdComplejo

							and R.idCancha = tc.idcancha

							and R.fecha = ca.fecha

							and h.hora >= HoraInicio and h.hora < horafin)

		ORDER BY ca.fecha,  tc.IdCancha, h.hora

		LIMIT vCantDePartidos;




        IF (Error = 0) THEN


			IF vTipoTorneo = 1 THEN /*Liga*/

				CALL SP_insertFixtureLiga(pIdTorneo,  vCantDePartidos/vCantFixture);

            ELSE
				/*CALL SP_insertFixtureCopa(pIdTorneo, vCantDePartidos/vCantFixture);*/

				CALL SP_insertFixtureCopa(pIdTorneo, vCantFixture); /*COPA*/

            END IF;    

		ELSE


			SET vResultado =(SELECT 'Se produjo un error.');

            ROLLBACK;

		END IF;


   ELSE

		SET vResultado =(SELECT 'No hay lugar disponible para armar el fixture. Cambie las fechas del torneo.');

        ROLLBACK;

   END IF;


	IF (Error = 0) THEN
		
        UPDATE torneos
        SET idEstado = 1
        WHERE idtorneo = pIdTorneo;
    

		SET vResultado =(SELECT 'El fixture se generó correctamente.');

        COMMIT;

    ELSE

		SET vResultado =(SELECT 'Se produjo un error.');

        ROLLBACK;

	END IF;


	SELECT vResultado as Res;


    /*SELECT vResultado as Res, vAux;*/

    /*SELECT vCantDePartidos as Res, vCantDisponible, vCantHorasReserva;*/

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_InsertReservaTemp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_InsertReservaTemp`(IN `pIdCancha` INT(11), IN `pIdComplejo` INT(11), OUT `pValor` INT)
BEGIN 









    DECLARE Error INT DEFAULT 0;




    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;









 









    









    














        INSERT INTO reservastemporal(idComplejo, idCancha)



















        VALUES( pIdComplejo, pIdCancha);









	









    IF Error=-1 THEN









        SET pValor = -1; 









    ELSE



















        SET pValor = 1; 



















    END IF;























































































































END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insertTarjeta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertTarjeta`(IN `pIdCliente` INT(11), IN `pNroTarjeta` VARCHAR(16), IN `pMes` INT(2), IN `pAnio` INT(2), IN `pCodigo` BLOB, OUT `pValor` INT)
BEGIN 

















    DECLARE Error INT DEFAULT 0;








	DECLARE EXISTE INT DEFAULT 0;

















    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;








	








    

















    set EXISTE = (SELECT count(*) FROM clientespagos where IdCliente = pIdCliente);








    








    








	IF EXISTE = 0 THEN








        INSERT INTO clientespagos(IdCliente, 








                            NroTarjeta,








                            Mes,	








                            Anio,	








                            Codigo)

















        VALUES( pIdCliente,








                pNroTarjeta, 








                pMes, 








                pAnio,








               	pCodigo);








	ELSE








    	UPDATE clientespagos








        SET NroTarjeta = pNroTarjeta,








        	Mes = pMes,








            Anio = pAnio,








            Codigo = pCodigo


            


            WHERE idcliente = pIdCliente;

















    END IF;








    	

















    IF Error=-1 THEN








        SET pValor = -1; 








    ELSE

















        SET pValor = 1; 

















    END IF;











































































































END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insertTorneos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertTorneos`(
    pIdDuenio	        INT          ,
	pIdTipoTorneo	    INT          ,
	pNombre	          	VARCHAR(30)  ,
	pCantEquipos	    INT          ,
	pCantJugadores	    INT          ,
	pIdSuperficie	    INT          ,
	pIdaYvuelta	      	BOOL         ,
    ptiempoPartido      INT          ,
	pPrecioInscripcion	DOUBLE(6,2)  ,
	pFecIniInscripcion	VARCHAR(10)  ,
	pFecFinInscripcion	VARCHAR(10)  ,
	pHorasCancelacion	INT          ,
	pFechaInicio	    VARCHAR(10)  ,
	pFechaFin	        VARCHAR(10)  ,
	pDescripcion	    VARCHAR(300) ,
	pReglas	          	VARCHAR(300) ,
	pIdEstado	        INT          ,
    OUT pIdTorneo   	INT
)
BEGIN 
    /*call SP_insertTorneos(1, 2, 'Libertadores',16,11,3, false,200.00,'20/05/2016', '30/05/2016', 24,'05/06/2016','05/09/2016','Este es el primer torneo', 'Reglas: las de un torneo de 11',3,  @du);
select @du;*/

    DECLARE Error INT DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;


	INSERT INTO Torneos	(IdDuenio	      ,
						 IdTipoTorneo	  ,
						 Nombre	          ,
						 CantEquipos	      ,
						 CantJugadores	  ,
						 IdSuperficie	  ,
						 IdaYvuelta	      ,
                         tiempoPartido,
						 PrecioInscripcion	,
						 FecIniInscripcion	,
						 FecFinInscripcion	,
						 HorasCancelacion	,
						 FechaInicio	      ,
						 FechaFin	      ,
						 Descripcion	      ,
						 Reglas	,          
						 IdEstado)
	VALUES( pIdDuenio	        ,
			pIdTipoTorneo	    ,
			pNombre	          	,
			pCantEquipos	    ,
			pCantJugadores	    ,
			pIdSuperficie	    ,
			pIdaYvuelta	      	,
            ptiempoPartido      ,
			pPrecioInscripcion	,
			STR_TO_DATE(pFecIniInscripcion, '%d/%m/%Y'),
            STR_TO_DATE(pFecFinInscripcion, '%d/%m/%Y'),
			pHorasCancelacion	,
            STR_TO_DATE(pFechaInicio, '%d/%m/%Y'),
            STR_TO_DATE(pFechaFin, '%d/%m/%Y'),
			pDescripcion	    ,
			pReglas	          	,
			pIdEstado	        
			);  

	SET pIdTorneo = (SELECT MAX(IdTorneo) FROM Torneos);  

	IF (Error=-1)  THEN
        SET pIdTorneo = -1; /*Devuelve -1 en caso de error*/
    END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insertTorneosCanchas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertTorneosCanchas`(

































    pIdTorneo	        INT          ,

































	pIdComplejo         INT          ,

































	pIdCancha      	    INT          ,

































    OUT vResultado       INT

































)
BEGIN 

































	

































    

































    DECLARE Error INT DEFAULT 0;

































    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;

































    

































    SET vResultado = 1;

































  

































	INSERT INTO TorneosCanchas	(IdTorneo	,

































                                 IdComplejo	,

































                                 IdCancha	          

































							     )	        

































	VALUES( pIdTorneo,

































			pIdComplejo,

































			pIdCancha	          	        

































			);  



































































	IF (Error=-1)  THEN

































        SET vResultado = -1; 

































    END IF;

































END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insertTorneosDias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertTorneosDias`(

































    pIdTorneo	        INT          ,

































	pIddia              INT          ,

































	pHoraDesde      	TIME         ,

































    pHoraHasta      	TIME         ,

































    OUT vResultado       INT

































)
BEGIN 

































	

































    

































    DECLARE Error INT DEFAULT 0;

































    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;

































    

































    SET vResultado = 1;

































  

































	INSERT INTO TorneosDias	(IdTorneo	,

































                             IdDia	,

































                             HoraDesde,

































                             HoraHasta

































							     )	        

































	VALUES( pIdTorneo,

































			pIddia,

































			pHoraDesde,

































            pHoraHasta

































			);  



































































	IF (Error=-1)  THEN

































        SET vResultado = -1; 

































    END IF;

































END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insertTorneosImagenes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertTorneosImagenes`(




















    pIdTorneo	        INT        ,




















	pUrl                VARCHAR(150),




















    OUT vResultado       INT




















)
BEGIN 




















    DECLARE Error INT DEFAULT 0;




















    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;




















    




















    SET vResultado = 1;




















  




















	INSERT INTO torneosimagenes	(IdTorneo,url,fechaAlta)	        




















	VALUES( pIdTorneo,




















			pUrl,




















            NOW());  









































	IF (Error=-1)  THEN




















        SET vResultado = -1; /*Devuelve -1 en caso de error*/




















    END IF;




















END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PRUEBA_DUMP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PRUEBA_DUMP`()
BEGIN




















select *




















from clientes;




















END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_reservar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_reservar`(IN `pIdCliente` INT(11), IN `pIdComplejo` INT(11), IN `pIdCancha` INT(11), IN `pFecha` VARCHAR(10), IN `pHDesde` TIME, IN `pHHasta` TIME, IN `pImporteAPagar` DOUBLE, IN `pPagado` DOUBLE, IN `pPorcentajePago` INT(11), IN `pIdEstado` INT(11), OUT `pIdReserva` INT(11))
    DETERMINISTIC
BEGIN 















































    DECLARE Error INT DEFAULT 0;























    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;















































   







































































        INSERT INTO reservas(IdCliente, 















































                            IdComplejo,















































                            IdCancha,	















































                            Fecha,	















































                            HoraInicio,	















































                            HoraFin,























                             























                            APagar,























                             























                            Pagado, 























                            























                            PorcentajePago,























                             























                            IdEstado,























                             























                            FechaReserva)















































        VALUES( pIdCliente,















































                pIdComplejo, 















































                pIdCancha, 















































                STR_TO_DATE(pFecha, '%d/%m/%Y'),























               	























               	pHDesde,























               























                pHHasta,























               























                pImporteAPagar,























               























                pPagado,























               























                pPorcentajePago,























               























                pIdEstado,















































                NOW());















































        















































    IF Error=-1 THEN















































        SET pIdReserva = -1; 















































    ELSE















































        SET pIdReserva = (SELECT MAX(idReserva) FROM reservas); 















































    END IF;































































































END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_setComplejosDias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_setComplejosDias`(IN `pIdComplejo` INT, IN `pIdDiaDesde` INT, IN `pIdDiaHasta` INT, IN `pHoraDesde` TIME, IN `pHoraHasta` TIME)
BEGIN 



	DECLARE EXISTE INT DEFAULT 0;

	SET EXISTE = (SELECT count(*) FROM complejosdireccion where IdComplejo = pIdComplejo);



	IF(EXISTE = 1) THEN



        INSERT INTO complejosdias 

        (

            IdComplejo

            ,IdDiaDesde

            ,IdDiaHasta

            ,HoraDesde

            ,HoraHasta

        ) 

        VALUES 

        (

            pIdComplejo

            ,pIdDiaDesde

            ,pIdDiaHasta

            ,pHoraDesde

            ,pHoraHasta

        );



	ELSE



        UPDATE complejosdias SET 

            HoraDesde = pHoraDesde

            ,HoraHasta = pHoraHasta

        WHERE IdComplejo = pIdComplejo

        AND IdDiaDesde = pIdDiaDesde

        AND IdDiaHasta = pIdDiaHasta;



    END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_setComplejosDireccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_setComplejosDireccion`(IN `pIdComplejoDireccion` INT, IN `pCalle` VARCHAR(40), IN `pAltura` INT, IN `pIdLocalidad` INT, IN `pIdProvincia` INT, IN `pX` INT, IN `pY` INT)
BEGIN



	DECLARE EXISTE INT DEFAULT 0;

	set EXISTE = (SELECT count(*) FROM complejosdireccion where IdComplejo = pIdComplejoDireccion);



	IF(EXISTE = 1) THEN



        UPDATE complejosdireccion SET 

            Calle = pCalle

            ,Altura = pAltura

            ,IdLocalidad = pIdLocalidad

            ,IdProvincia = pIdProvincia

            ,X = pX

            ,Y = pY

        WHERE 

            IdComplejo = pIdComplejoDireccion;



	ELSE



        INSERT INTO complejosdireccion 

        (

            IdComplejo

            ,Calle

            ,Altura

            ,IdLocalidad

            ,IdProvincia

            ,X

            ,Y

        ) 

        VALUES 

        (

            pIdComplejoDireccion

            ,pCalle

            ,pAltura

            ,pIdLocalidad

            ,pIdProvincia

            ,pX

            ,pY

        );



    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_setComplejosPagos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_setComplejosPagos`(IN `pIdComplejoPagos` INT, IN `pCBU` INT, IN `pNroCuenta` INT)
BEGIN 



	DECLARE EXISTE INT DEFAULT 0;

	set EXISTE = (SELECT count(*) FROM complejospagos where IdComplejo = pIdComplejoPagos);



	IF(EXISTE = 1) THEN

    

        UPDATE  complejospagos  SET 

        	CBU = pCBU

        	,NroCuenta = pNroCuenta 

        WHERE 

        	IdComplejo = pIdComplejoPagos;



	ELSE



        INSERT INTO complejospagos

        (

            IdComplejo

            ,CBU

            ,NroCuenta

        ) 

        VALUES 

        (

            pIdComplejoPagos

            ,pCBU

            ,pNroCuenta

        );

    END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_updateComplejo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_updateComplejo`(IN `pNombre` VARCHAR(60), IN `pDescripcion` VARCHAR(200), IN `pEstacionamiento` TINYINT, IN `pBuffet` TINYINT, IN `pDuchas` TINYINT, IN `pParrillas` TINYINT, IN `pWiFi` INT, IN `pHoraCobroLuz` TIME, IN `pPorcentajeSeña` INT, IN `pHorasCancelacion` INT, IN `pTiempoReserva` TIME, IN `pEmail` VARCHAR(60), IN `pIdEstado` INT, IN `pIdDuenio` INT, IN `pPorcentajeLuz` INT, IN `pnroCelular` INT, IN `pnroTelefono` INT, IN `pIdComplejo` INT)
BEGIN



	DECLARE Error INT DEFAULT 0;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;



UPDATE complejos SET 

	Nombre = pNombre

	,Descripcion = pDescripcion

	,Estacionamiento = pEstacionamiento

	,Buffet = pBuffet			

	,Duchas = pDuchas		

	,Parrillas = pParrillas			

	,WiFi =	pWiFi			

	,HoraCobroLuz =	pHoraCobroLuz	

	,PorcentajeSeña = pPorcentajeSeña

	,HorasCancelacion = pHorasCancelacion	

	,TiempoReserva = pTiempoReserva		

	,Email = pEmail			

	,IdEstado =	pIdEstado		

	,IdDuenio =	pIdDuenio	

	,PorcentajeLuz = pPorcentajeLuz	

	,nroCelular = pnroCelular	

	,nroTelefono = pnroTelefono	 

WHERE 

	IdComplejo = pIdComplejo;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_updateComplejoDireccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_updateComplejoDireccion`(IN `pCalle` VARCHAR(40), IN `pAltura` INT, IN `pIdLocalidad` INT, IN `pIdProvincia` INT, IN `pX` INT, IN `pY` INT, IN `pIdComplejo` INT, IN `vResultado` INT)
BEGIN 



	DECLARE Error INT DEFAULT 0;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;

    SET vResultado = 1;



UPDATE complejosdireccion SET 

	Calle = pCalle

	,Altura = pAltura

	,IdLocalidad = pIdLocalidad

	,IdProvincia = pIdProvincia

	,X = pX

	,Y = pY

WHERE 

	IdComplejo = pIdComplejo;



	IF (Error=-1)  THEN

        SET vResultado = -1; /*Devuelve -1 en caso de error*/

    END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_updateComplejosPagos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_updateComplejosPagos`(IN `pCBU` VARCHAR(22), IN `pNroCuenta` VARCHAR(18), IN `pIdComplejo` INT)
BEGIN



UPDATE  complejospagos  SET 

	CBU = pCBU

	,NroCuenta = pNroCuenta 

WHERE 

	IdComplejo = pIdComplejo;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_updateDuenio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_updateDuenio`(IN `pIdDuenio` INT, IN `pUsuario` VARCHAR(50), IN `pContrasenia` VARCHAR(50), OUT `pIdPersona` INT)
BEGIN



UPDATE duenios SET 

    Usuario = pUsuario

    ,Contrasenia = pContrasenia

    ,IdEstado = 3

WHERE

    IdDuenio=pIdDuenio;



    SET pIdPersona = (SELECT IdPersona FROM duenios where IdDuenio=pIdDuenio);



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_updateFixture` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_updateFixture`(


	pIdTorneo	INT,


    pIdFecha	INT,


    pIdReserva	INT,

    pEquipo1	INT,


    pGol1		INT,


    pEquipo2	INT,

    pGol2		INT,


    OUT pResultado   	INT


)
BEGIN


    /*Variables del partido*/

    DECLARE vPuntos1 INT DEFAULT 0;

    DECLARE vGanado1 INT DEFAULT 0;

    DECLARE vEmpatado1 INT DEFAULT 0;

    DECLARE vPerdido1 INT DEFAULT 0;

    DECLARE vPuntos2 INT DEFAULT 0;

    DECLARE vGanado2 INT DEFAULT 0;

    DECLARE vEmpatado2 INT DEFAULT 0;

    DECLARE vPerdido2 INT DEFAULT 0;


    DECLARE Error INT DEFAULT 0;


    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;

    

    


    


    SET pResultado = 1;


    

    /*Primero actualizo el fixture*/


	UPDATE fixture


    SET gol1 = pGol1,


    	gol2 = pGol2,

        jugado = 1


	WHERE idTorneo = pIdTorneo


    AND   idFecha =  pIdFecha


    AND   idreserva = pIdReserva;

    

    /*

    CALL SP_updatePuntajesporfechas(pIdTorneo, pIdFecha, pEquipo1);

    CALL SP_updatePuntajesporfechas(pIdTorneo, pIdFecha, pEquipo2);*/


    


    IF (Error=-1)  THEN


        SET pResultado = -1; /*Devuelve -1 en caso de error*/


    END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_updateFixtureCopaIda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_updateFixtureCopaIda`(
	pIdTorneo	INT,
    pIdFecha	INT,
    pIdReserva	INT,
    pGol1	INT,
    pGol2	INT,
    OUT pRes	INT
)
BEGIN
	
    DECLARE VIdReserva1 INT;
	DECLARE VIdReserva2 INT;
    DECLARE VIdEquipoGanador INT;
    DECLARE Error INT DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;
    
    
    SET pRes = 1;
    
    /*Actualizo el resultado del partido*/
    UPDATE fixture
    SET Gol1 = pGol1,
		Gol2 = pGol2,
        jugado =1
    WHERE IdTorneo=pIdTorneo
    AND IdFecha =pIdFecha
    AND IdReserva = pIdReserva;
    
    /*Obtengo el idEquipo ganador*/
    SET VIdEquipoGanador = (select if(gol1 > gol2,IdEquipo1,if(gol2>gol1,IdEquipo2,0) ) from fixture where idtorneo = pIdTorneo and idfecha = pIdFecha and IdReserva = pIdReserva);
    
	UPDATE fixture
	SET idequipo1 =VIdEquipoGanador
	WHERE idtorneo = pIdTorneo 
	AND idfecha = (pIdFecha+1)
	AND idreserva1 = pIdReserva;
	
	UPDATE fixture
	SET idequipo2 =VIdEquipoGanador
	WHERE idtorneo = pIdTorneo 
	AND idfecha = (pIdFecha+1)
	AND idreserva2 = pIdReserva;
    
    IF (Error=-1)  THEN
        SET pRes = -1; /*Devuelve -1 en caso de error*/
	END IF;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_updateFixtureCopaIdayVuelta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_updateFixtureCopaIdayVuelta`(
	pIdTorneo	INT,
    pIdFecha	INT,
    pIdReserva	INT,
    pGol1	INT,
    pGol2	INT,
	pvIdReserva	INT,
    pvGol1	INT,
    pvGol2	INT,
    OUT pRes	INT
)
BEGIN
	DECLARE VIdReserva1 INT;
	DECLARE VIdReserva2 INT;
    DECLARE VIdEquipoGanador INT;
    DECLARE vIdaJugado INT;
    DECLARE vVueltaJugado INT;
    DECLARE vGol1 INT;
    DECLARE vGol2 INT;
    DECLARE vGol1Ida INT;
    DECLARE vGol2Ida INT;
    DECLARE vGol1Vuelta INT;
    DECLARE vGol2Vuelta INT;
    DECLARE Error INT DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;
    
    
    SET pRes = 1;
        
   
    /*Actualizo el resultado del partido de ida*/
    UPDATE fixture
    SET Gol1 = pGol1,
		Gol2 = pGol2,
        jugado =1
    WHERE IdTorneo=pIdTorneo
    AND IdFecha =pIdFecha
    AND IdReserva = pIdReserva;
    
	/*Actualizo el resultado del partido de Vuelta*/
    UPDATE fixture
    SET Gol1 = pvGol2, /*Es confuso pero asi esta bien*/
		Gol2 = pvGol1,
        jugado =1
    WHERE IdTorneo=pIdTorneo
    AND IdFecha =pIdFecha
    AND IdReserva = pvIdReserva; 
    
    /*Si se jugaron los 2 partidos actualizo la siguiente llave*/
    SET vIdaJugado = (select jugado from fixture where idreserva = pIdReserva);
    SET vVueltaJugado = (select jugado from fixture where idreserva = pvIdReserva);
	
    IF (vIdaJugado = 1 AND vVueltaJugado = 1) THEN
		  
		/*Obtengo los goles de los equipos*/
		SELECT gol1, gol2 INTO vGol1Ida, vGol2Ida
        FROM fixture
        WHERE IdTorneo=pIdTorneo
		AND IdFecha =pIdFecha
		AND IdReserva = pIdReserva;
        
        SELECT gol2, gol1  INTO vGol1Vuelta, vGol2Vuelta
        FROM fixture
        WHERE IdTorneo=pIdTorneo
		AND IdFecha =pIdFecha
		AND IdReserva = pvIdReserva;
        
        SET vGol1 = ifnull(vGol1Ida,0) + ifnull(vGol1Vuelta,0);
        SET vGol2 = ifnull(vGol2Ida,0) + ifnull(vGol2Vuelta,0);
        

        
        SET VIdEquipoGanador = (select if(vGol1 > vGol2,IdEquipo1,if(vGol2>vGol1,IdEquipo2,0) ) 
								from fixture 
                                where idtorneo = pIdTorneo 
                                and idfecha = pIdFecha 
                                and IdReserva = pIdReserva);
		
		UPDATE fixture
		SET idequipo1 =VIdEquipoGanador
		WHERE idtorneo = pIdTorneo 
		AND idfecha = (pIdFecha+1)
		AND idreserva1 = pIdReserva;
		
		UPDATE fixture
		SET idequipo2 =VIdEquipoGanador
		WHERE idtorneo = pIdTorneo 
		AND idfecha = (pIdFecha+1)
		AND idreserva2 = pIdReserva;
        
        /*lo hago doble porque es ida y vuelta*/
		UPDATE fixture
		SET idequipo1 =VIdEquipoGanador
		WHERE idtorneo = pIdTorneo 
		AND idfecha = (pIdFecha+1)
		AND idreserva1= pvIdReserva;
		
		UPDATE fixture
		SET idequipo2 =VIdEquipoGanador
		WHERE idtorneo = pIdTorneo 
		AND idfecha = (pIdFecha+1)
		AND idreserva2 = pvIdReserva;
    END IF;
    
    
  
    
    IF (Error=-1)  THEN
        SET pRes = -1; /*Devuelve -1 en caso de error*/
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_updatePersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_updatePersona`(IN `pIdPersona` INT, IN `pNombre` VARCHAR(60), IN `pIdTipoDoc` INT, IN `pApellido` VARCHAR(60), IN `pNroDoc` VARCHAR(20), IN `pEmail` VARCHAR(60), IN `vResultado` INT)
BEGIN



	DECLARE Error INT DEFAULT 0;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;

    SET vResultado = 1;



UPDATE personas SET 

    Nombre = pNombre

    ,Apellido = pApellido

    ,IdTipoDoc = pIdTipoDoc

    ,NroDoc = pNroDoc

    ,Email = pEmail

WHERE 

    IdPersona = pIdPersona;



    IF (Error=-1)  THEN

        SET vResultado = -1; /*Devuelve -1 en caso de error*/

    END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_updatePuntajesporfechas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_updatePuntajesporfechas`(

	pIdTorneo	INT,

	pIdFecha	INT,

	pIdEquipo	INT

)
BEGIN



/*DE MOMEMNTO NO USO ESTE SP*/



    /*Variables del partido*/

    DECLARE vPuntos INT DEFAULT 0;

    DECLARE vJugados INT DEFAULT 0;

    DECLARE vGanado INT DEFAULT 0;

    DECLARE vEmpatado INT DEFAULT 0;

    DECLARE vPerdido INT DEFAULT 0;

   

    

    DECLARE vFechaMax INT DEFAULT 0;

	

    SET vFechaMax = (select max(idfecha) from puntajesporfechas porfecha 

										 where idTorneo = pIdTorneo and idequipo = pIdEquipo);

                                         

    /*OBTENGO LAS VARIABLES*/     

    

	SELECT 	sum(puntos) as puntos,

			sum(cant) as jugados,

            sum(ganados) as ganados, 

            sum(empatados) as empatados, 

            sum(perdidos) as perdidos

		INTO vPuntos, vJugados, vGanado, vEmpatado, vPerdido

    FROM (	

			select  count(1) as cant,

					sum(if(gol1 > gol2,1,0)) as ganados, 

					sum(if(gol1 = gol2,1,0)) as empatados,

					sum(if(gol1 < gol2,1,0)) as perdidos,

					sum(if(gol1 > gol2,1,0)) * 3 + sum(if(gol1 = gol2,1,0)) as puntos

			from fixture 

			where idtorneo= pIdTorneo  and idequipo1= pIdEquipo and jugado = 1



			union all



			select  count(1) as cant,

					sum(if(gol2 > gol1,1,0)) as ganados, 

					sum(if(gol2 = gol1,1,0)) as empatados,

					sum(if(gol2 < gol1,1,0)) as perdidos,

					sum(if(gol2 > gol1,1,0)) * 3 + sum(if(gol1 = gol2,1,0)) as puntos

			from fixture 

			where idtorneo= pIdTorneo  and idequipo2= pIdEquipo and jugado = 1

		 ) as res;

                                         

	IF (pIdFecha > vFechaMax) THEN

		INSERT INTO puntajesporfechas(idtorneo, IdFecha, idequipo, CantPuntos, jugados,ganados, empatados, perdidos)

		VALUES ( pIdTorneo, 

				pIdFecha, 

				pIdEquipo, 

				vPuntos, 

                vJugados, 

                vGanado, 

                vEmpatado, 

                vPerdido);

    ELSE

        UPDATE  puntajesporfechas 

		SET CantPuntos = vPuntos , 

			jugados = vJugados,

			ganados = vGanado, 

			empatados = vEmpatado, 

			perdidos = vPerdido

		WHERE idTorneo = pIdTorneo 

		AND idequipo = pIdEquipo

		AND idFecha = pIdFecha;

    END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_updateReservasAumento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_updateReservasAumento`(IN `pIdComplejo` INT, IN `pIdCancha` INT, IN `pPorcenjateAumento` DOUBLE, OUT `vResultado` INT)
BEGIN



	DECLARE Error INT DEFAULT 0;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;

    

    UPDATE reservas SET

    APagar = APagar + (APagar * (pPorcenjateAumento / 100))

    /*, PorcentajePago = ((Pagado / (APagar + (APagar * ( 20 / 100)))) * 100)*/

    , IdEstado = 1

    where IdComplejo = pIdComplejo

    and IdCancha = pIdCancha

    and Fecha > NOW()

    and IdEstado != 3;



    UPDATE reservas SET

    APagar = APagar + (APagar * (pPorcenjateAumento / 100)) 

    where IdComplejo = pIdComplejo

    and IdCancha = pIdCancha

    and Fecha > NOW()

	and IdEstado = 3;

    

    IF Error=-1 THEN

        SET vResultado = -1; 

    ELSE

		SET vResultado = 1;

    END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_updateTorneos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_updateTorneos`(
	pIdTorneo	INT,
	pIdDuenio	        INT          ,
	pIdTipoTorneo	    INT          ,
	pNombre	          	VARCHAR(30)  ,
	pCantEquipos	    INT          ,
	pCantJugadores	    INT          ,
	pIdSuperficie	    INT          ,
	pIdaYvuelta	      	BOOL         ,
    ptiempoPartido      INT          ,
	pPrecioInscripcion	DOUBLE(6,2)  ,
	pFecIniInscripcion	VARCHAR(10)  ,
	pFecFinInscripcion	VARCHAR(10)  ,
	pHorasCancelacion	INT          ,
	pFechaInicio	    VARCHAR(10)  ,
	pFechaFin	        VARCHAR(10)  ,
	pDescripcion	    VARCHAR(300) ,
	pReglas	          	VARCHAR(300) ,
	pIdEstado	        INT          ,
    OUT pOUTIdTorneo   	INT
)
BEGIN
	
    DECLARE Error INT DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;


	UPDATE Torneos	
    SET IdTipoTorneo = pIdTipoTorneo ,	
						 Nombre =pNombre	          ,
						 CantEquipos =pCantEquipos	      ,
						 CantJugadores =pCantJugadores	  ,
						 IdSuperficie =	pIdSuperficie  ,
						 IdaYvuelta =	pIdaYvuelta      ,
                         tiempoPartido =ptiempoPartido,
						 PrecioInscripcion =	pPrecioInscripcion,
						 FecIniInscripcion = STR_TO_DATE(pFecIniInscripcion, '%d/%m/%Y'),
						 FecFinInscripcion = STR_TO_DATE(pFecFinInscripcion, '%d/%m/%Y'),
						 HorasCancelacion =	pHorasCancelacion,
						 FechaInicio =	STR_TO_DATE(pFechaInicio, '%d/%m/%Y'),
						 FechaFin =	   STR_TO_DATE(pFechaFin, '%d/%m/%Y'),
						 Descripcion =	pDescripcion,
						 Reglas =	pReglas,          
						 IdEstado =pIdEstado
	WHERE idtorneo = pIdTorneo;
	
	SET pOUTIdTorneo = pIdTorneo;  

	IF (Error=-1)  THEN
        SET pOUTIdTorneo = -1; /*Devuelve -1 en caso de error*/
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_verificarClienteListaNegra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_verificarClienteListaNegra`(pIdCliente INT(11), pIdComplejo INT(11))
SELECT FechaIngreso


from listanegra


where IdCliente = pIdCliente


and IdComplejo = pIdComplejo ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-11  1:55:27
