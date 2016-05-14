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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (2,2,'cliente','cliente',1,'2016-05-02',NULL),(3,3,'aaa','asdasd',1,'2016-05-02',NULL),(5,5,'ccccc','asdasdddd',1,'2016-05-02',NULL),(6,6,'asdsadsa','sadsadsa',1,'2016-05-02',NULL),(7,7,'asdsa','',1,'2016-05-02',NULL),(11,11,'lean095','asdasd',1,'2016-05-02',NULL),(12,12,'asdasd','asdasdasd',1,'2016-05-03',NULL),(13,13,'enriquecito','atpatp',1,'2016-05-03',NULL),(14,14,'leocab','atpatp',1,'2016-05-04',NULL),(15,15,'pipa6','nn',1,'2016-05-04',NULL),(16,16,'banfield','banfield',1,'2016-05-04',NULL),(17,18,'tevez','tevez',1,'2016-05-06',NULL),(18,19,'pruebita','pruebita',1,'2016-05-07',NULL),(19,20,'lk','asd',1,'2016-05-08',NULL),(20,21,'cliented','asdasd',1,'2016-05-10',NULL),(21,22,'ivan','atpatp',1,'2016-05-10',NULL),(22,23,'maty123','123456',1,'2016-05-10',NULL),(23,24,'asdasdas','asdasd',1,'2016-05-10',NULL),(24,25,'asdsasadsad','asdasd',1,'2016-05-10',NULL),(25,26,'aaaaaa','asdasd',1,'2016-05-10',NULL),(26,27,'sadas','asdasd',1,'2016-05-10',NULL),(27,28,'asdasd3','asdasd',1,'2016-05-10',NULL),(28,29,'asdas','asdasd',1,'2016-05-10',NULL),(29,30,'asdsaddd','asdasd',1,'2016-05-10',NULL),(30,31,'pruebaaa','123456',1,'2016-05-10',NULL);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-14 14:39:28
