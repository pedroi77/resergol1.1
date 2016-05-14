-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: resergol
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.10-MariaDB

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
INSERT INTO `dueniospendientes` VALUES (3,'AlgunComplejo','2321312','CalleFalsa',123,1,1);
/*!40000 ALTER TABLE `dueniospendientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-14 14:39:27
