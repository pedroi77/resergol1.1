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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (2,'unCliente','unApellido',2,99999999,'cliente@hotmail.com'),(3,'asdasd','sadsadsa',1,1342131,'sadas@sada.com'),(4,'asdasdas','sadsadsa',1,2312321,'bbbb@asdas.com'),(5,'asdasd','asdasd',1,222453,'dddddd@sad.com'),(6,'asdsad','sadsad',1,4444343,'sadsadsa@asd.com'),(7,'Pepeee','asdsadsa',1,0,'asdsadas@asdsa.com'),(11,'asdasd','sadsada',1,56595653,'asdas@sadas.com'),(12,'asdasdsad','sadsadsa',1,23423,'asdsa@dasda.com'),(13,'Enrique','Cito',1,99885653,'enri@yahoo.com.ar'),(14,'leonardo','gomez',1,99896223,'atpatp@hotmail.com'),(15,'diego','forlan',1,23232221,'loffdso@gmail.com'),(16,'taladro','del sur',1,899983423,'banfield@hotmail.com'),(17,'Leonardo','Fernandez',1,988532221,'leocab@hotmail.com'),(18,'carlos','tevez',1,30565995,'tevez@hotmail.com'),(19,'pruebitaaa','pruebon',1,234337786,'pruebita@hotmail.com'),(20,'asdasd','asdsad',1,34343,'czx@sdsa.com'),(21,'jhhj','23',1,2132,'adsadasdsadsadsadasdsa@sad.com'),(22,'ivancito','fernandito',1,123454,'ivan@hotmail.com'),(23,'matiii','fumacooooo',1,1321222225,'sadsad@dsadas.com'),(24,'asdasdsa','sadsadsa',1,32432437,'asdsa@sadas.com'),(25,'asdsad','asdasdas',1,343333331,'asdsa@sasdas.com'),(26,'asdasd','dasdsa',1,2223988,'bb@sdas.com'),(27,'asdasda','sadasdas',1,3434,'asdsa@dsadas.com'),(28,'asdasd','asdsada',1,3434333,'sad3as@sadas.com'),(29,'asdasd','sadf',1,9983632,'dsad@hmail.casom'),(30,'asdsadsa','asdsad',2,3334331,'sss@sasss.com'),(31,'asdasd','3434asdas',1,33314,'asdas@sadsada.com'),(32,'pendientee','apependiente',2,2223232,'pendiente@hotmail.com');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-14 14:39:29
