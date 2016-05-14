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
INSERT INTO `canchas` VALUES (1,1,'Maracana',5,1,1,1,200.00,1),(1,2,'Monumental',11,2,0,1,300.00,1),(1,4,'Fortin',7,3,1,1,200.00,1),(1,5,'Fortaleza',11,4,1,0,200.00,1);
/*!40000 ALTER TABLE `canchas` ENABLE KEYS */;
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
