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
  PRIMARY KEY (`IdTorneo`),
  KEY `Torneo_duenio_fk` (`IdDuenio`),
  KEY `Torneo_Tipos_fk` (`IdTipoTorneo`),
  KEY `Torneo_Superficie_fk` (`IdSuperficie`),
  KEY `Torneo_Estados_fk` (`IdEstado`),
  CONSTRAINT `Torneo_Estados_fk` FOREIGN KEY (`IdEstado`) REFERENCES `torneosestados` (`IdEstado`),
  CONSTRAINT `Torneo_Superficie_fk` FOREIGN KEY (`IdSuperficie`) REFERENCES `tipossuperficie` (`IdSuperficie`),
  CONSTRAINT `Torneo_Tipos_fk` FOREIGN KEY (`IdTipoTorneo`) REFERENCES `tipotorneos` (`IdTipoTorneo`),
  CONSTRAINT `Torneo_duenio_fk` FOREIGN KEY (`IdDuenio`) REFERENCES `duenios` (`IdDuenio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torneos`
--

LOCK TABLES `torneos` WRITE;
/*!40000 ALTER TABLE `torneos` DISABLE KEYS */;
/*!40000 ALTER TABLE `torneos` ENABLE KEYS */;
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
