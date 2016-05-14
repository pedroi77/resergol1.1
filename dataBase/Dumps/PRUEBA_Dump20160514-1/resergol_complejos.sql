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
  `TiempoReserva` time NOT NULL,
  `Email` varchar(60) NOT NULL,
  `IdEstado` int(11) NOT NULL,
  `IdDuenio` int(11) NOT NULL,
  PRIMARY KEY (`IdComplejo`),
  KEY `complejos_estados_fk` (`IdEstado`),
  CONSTRAINT `complejos_estados_fk` FOREIGN KEY (`IdEstado`) REFERENCES `complejosestados` (`IdEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complejos`
--

LOCK TABLES `complejos` WRITE;
/*!40000 ALTER TABLE `complejos` DISABLE KEYS */;
INSERT INTO `complejos` VALUES (1,'Open Gallo','primer complejo',1,1,1,1,1,'00:00:00',50,24,'00:00:05','open@gmail.com',1,2),(2,'Todo Fútbol','Excelente complejo con 3 canchas y un gran buffet!',0,1,1,1,1,'18:00:00',50,24,'01:00:00','todofutbol@hotmail.com',1,1);
/*!40000 ALTER TABLE `complejos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-14 14:39:31
