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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canchaspuntuacion`
--

LOCK TABLES `canchaspuntuacion` WRITE;
/*!40000 ALTER TABLE `canchaspuntuacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `canchaspuntuacion` ENABLE KEYS */;
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
