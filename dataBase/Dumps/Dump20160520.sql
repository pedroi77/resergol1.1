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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canchascomentarios`
--

LOCK TABLES `canchascomentarios` WRITE;
/*!40000 ALTER TABLE `canchascomentarios` DISABLE KEYS */;
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
  `IdImagen` int(11) NOT NULL,
  `Imagen` blob NOT NULL,
  PRIMARY KEY (`IdComplejo`,`IdCancha`,`IdImagen`),
  CONSTRAINT `Imagenes_Canchas_fk` FOREIGN KEY (`IdComplejo`, `IdCancha`) REFERENCES `canchas` (`IdComplejo`, `IdCancha`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canchasimagenes`
--

LOCK TABLES `canchasimagenes` WRITE;
/*!40000 ALTER TABLE `canchasimagenes` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canchaspuntuacion`
--

LOCK TABLES `canchaspuntuacion` WRITE;
/*!40000 ALTER TABLE `canchaspuntuacion` DISABLE KEYS */;
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
  `IdTarjeta` int(11) NOT NULL,
  `IdMarca` int(11) NOT NULL,
  `NroTarjeta` varchar(16) NOT NULL,
  PRIMARY KEY (`IdCliente`,`IdTarjeta`),
  KEY `pagos_marca_fk` (`IdMarca`),
  CONSTRAINT `pagos_cliente_fk` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`),
  CONSTRAINT `pagos_marca_fk` FOREIGN KEY (`IdMarca`) REFERENCES `marcastarjetas` (`IdMarca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientespagos`
--

LOCK TABLES `clientespagos` WRITE;
/*!40000 ALTER TABLE `clientespagos` DISABLE KEYS */;
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
INSERT INTO `complejos` VALUES (1,'Open Gallo','primer complejo',1,1,1,1,1,'00:00:00',50,24,'00:00:05','open@gmail.com',1,1),(2,'Todo Fútbol','Excelente complejo con 3 canchas y un gran buffet!',0,1,1,1,1,'18:00:00',50,24,'01:00:00','todofutbol@hotmail.com',1,2);
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
  `Fecha` date NOT NULL,
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
INSERT INTO `complejosdias` VALUES (1,1,4,'10:00:00','22:00:00'),(1,6,7,'17:00:00','22:00:00');
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
  `CP` int(11) NOT NULL,
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
INSERT INTO `complejosdireccion` VALUES (1,'Calle Ejemplo',1334,2,2,1553,1,1),(2,'Laprida',950,2,1,1832,0,0);
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
  `IdImagen` int(11) NOT NULL,
  `Imagen` blob NOT NULL,
  PRIMARY KEY (`IdComplejo`,`IdImagen`),
  CONSTRAINT `Imagenes_Complejos_fk` FOREIGN KEY (`IdComplejo`) REFERENCES `complejos` (`IdComplejo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complejosimagenes`
--

LOCK TABLES `complejosimagenes` WRITE;
/*!40000 ALTER TABLE `complejosimagenes` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complejospuntuacion`
--

LOCK TABLES `complejospuntuacion` WRITE;
/*!40000 ALTER TABLE `complejospuntuacion` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devoluciones`
--

LOCK TABLES `devoluciones` WRITE;
/*!40000 ALTER TABLE `devoluciones` DISABLE KEYS */;
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
  PRIMARY KEY (`IdDia`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dias`
--

LOCK TABLES `dias` WRITE;
/*!40000 ALTER TABLE `dias` DISABLE KEYS */;
INSERT INTO `dias` VALUES (1,'Lunes'),(2,'Martes'),(3,'Miercoles'),(4,'Jueves'),(5,'Viernes'),(6,'Sabado'),(7,'Domingo');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duenios`
--

LOCK TABLES `duenios` WRITE;
/*!40000 ALTER TABLE `duenios` DISABLE KEYS */;
INSERT INTO `duenios` VALUES (1,2,'duenio','duenio',2,'0000-00-00',NULL),(3,32,'unopendiente','123456',2,'2016-05-14',NULL);
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
INSERT INTO `dueniospendientes` VALUES (3,'AlgunComplejo','2321312','CalleFalsa',123,1,1);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
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
  PRIMARY KEY (`IdTorneo`,`IdFecha`),
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
/*!40000 ALTER TABLE `fixture` ENABLE KEYS */;
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
  PRIMARY KEY (`IdProvincia`,`IdLocalidad`),
  CONSTRAINT `Localidades_Provincias_fk` FOREIGN KEY (`IdProvincia`) REFERENCES `provincias` (`IdProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidades`
--

LOCK TABLES `localidades` WRITE;
/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
INSERT INTO `localidades` VALUES (1,1,'Avellaneda'),(1,2,'Lomas de Zamora'),(1,3,'Adrogue'),(2,1,'La falda'),(2,2,'La cumbresita');
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
INSERT INTO `provincias` VALUES (1,'Buenos Aires'),(2,'Cordoba');
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
  PRIMARY KEY (`IdTorneo`,`IdFecha`),
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
  `Precio` double NOT NULL,
  `PorcentajePago` int(11) NOT NULL,
  `IdEstado` int(11) NOT NULL,
  PRIMARY KEY (`IdReserva`),
  KEY `Reservas_Canchas_fk` (`IdComplejo`,`IdCancha`),
  KEY `Reservas_Clientes_fk` (`IdCliente`),
  KEY `Reservas_Estados_fk` (`IdEstado`),
  CONSTRAINT `Reservas_Canchas_fk` FOREIGN KEY (`IdComplejo`, `IdCancha`) REFERENCES `canchas` (`IdComplejo`, `IdCancha`),
  CONSTRAINT `Reservas_Clientes_fk` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`),
  CONSTRAINT `Reservas_Estados_fk` FOREIGN KEY (`IdEstado`) REFERENCES `reservasestados` (`IdEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservasestados`
--

LOCK TABLES `reservasestados` WRITE;
/*!40000 ALTER TABLE `reservasestados` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservasestados` ENABLE KEYS */;
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
INSERT INTO `tipotorneos` VALUES (1,'Liga'),(2,'Torneo');
/*!40000 ALTER TABLE `tipotorneos` ENABLE KEYS */;
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
  `HoraDesde` time NOT NULL,
  `HoraHasta` time NOT NULL,
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
INSERT INTO `torneosestados` VALUES (1,'Activo'),(2,'Inscripción'),(3,'Finalizado');
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
  `IdImagen` int(11) NOT NULL,
  `Imagen` blob NOT NULL,
  PRIMARY KEY (`IdTorneo`,`IdImagen`),
  CONSTRAINT `Imagenes_Torneos_fk` FOREIGN KEY (`IdTorneo`) REFERENCES `torneos` (`IdTorneo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torneosimagenes`
--

LOCK TABLES `torneosimagenes` WRITE;
/*!40000 ALTER TABLE `torneosimagenes` DISABLE KEYS */;
/*!40000 ALTER TABLE `torneosimagenes` ENABLE KEYS */;
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
/*!50003 DROP PROCEDURE IF EXISTS `SP_getCanchas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getCanchas`(IN `pIdProv` INT(11), IN `pIdLoc` INT(11), IN `pCantJug` INT(11), IN `pIdSuperficie` INT(11), IN `pPrecioMax` DECIMAL(6,2), IN `pTechada` TINYINT(1), IN `pConLuz` TINYINT(1), IN `pConEstac` TINYINT(1), IN `pConDuchas` TINYINT(1), IN `pConBuffet` TINYINT(1), IN `pConParrilla` TINYINT(1), IN `pConWifi` TINYINT(1))
BEGIN 
     SELECT ca.IdCancha, ca.IdComplejo, ca.nombre as NombreCancha, ca.CantJugadores, ca.Techada, ca.Luz, ca.Precio,
    co.Nombre as NombreComplejo, prov.Nombre as Provincia, loc.Nombre as Localidad, ts.Descripcion as Superficie, cd.Calle, cd.Altura
    FROM canchas ca
    INNER JOIN complejos co ON co.IdComplejo = ca.IdComplejo
    INNER JOIN duenios d ON d.IdDuenio = co.IdDuenio
    INNER JOIN personas p ON p.IdPersona = d.IdPersona
    INNER JOIN complejosdireccion cd ON cd.IdComplejo = co.IdComplejo
    INNER JOIN provincias prov ON prov.IdProvincia = cd.IdProvincia 
    INNER JOIN localidades loc ON loc.IdLocalidad = cd.IdLocalidad AND loc.IdProvincia = prov.IdProvincia
    INNER JOIN tipossuperficie ts ON ts.IdSuperficie = ca.IdSuperficie
    WHERE ca.IdEstado = 1 
    AND (cd.IdProvincia = pIdProv AND cd.IdLocalidad = pIdLoc)    
    AND (ca.CantJugadores = pCantJug OR pCantJug = -1)
    AND (ca.IdSuperficie = pIdSuperficie OR pIdSuperficie = -1)
    AND (ca.Precio <= pPrecioMax OR pPrecioMax = -1)
    AND (ca.Techada = pTechada OR pTechada = 0)
    AND (ca.Luz = pConLuz OR pConLuz = 0)
    AND (co.Estacionamiento = pConEstac OR pConEstac = 0)
    AND (co.Duchas = pConDuchas OR pConDuchas = 0)
    AND (co.Buffet = pConBuffet OR pConBuffet = 0)
    AND (co.Parrillas = pConParrilla OR pConParrilla = 0)
    AND (co.WiFi = pConWifi OR pConWifi = 0);
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
/*!50003 DROP PROCEDURE IF EXISTS `SP_getDiasByDuenio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
/*!50003 DROP PROCEDURE IF EXISTS `SP_getDuenio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getDuenio`( 
    pUsuario	    VARCHAR(25),
    pContrasenia  VARCHAR(20)   
    )
BEGIN 

    
    
    
    SELECT *
    FROM personas as P
    INNER JOIN duenios as D ON P.idPersona = D.idPersona
    WHERE D.usuario = pUsuario 
    AND D.contrasenia = pContrasenia
    AND D.idEstado = 2; 
    
   
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
/*!50003 DROP PROCEDURE IF EXISTS `SP_insertTorneos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertTorneos`(
    pIdDuenio	        INT          ,
	pIdTipoTorneo	    INT          ,
	pNombre	          	VARCHAR(30)  ,
	pCantEquipos	    INT          ,
	pCantJugadores	    INT          ,
	pIdSuperficie	    INT          ,
	pIdaYvuelta	      	BOOL         ,
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
	
    
    DECLARE Error INT DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;
  
	INSERT INTO Torneos	(IdDuenio	      ,
						 IdTipoTorneo	  ,
						 Nombre	          ,
						 CantEquipos	      ,
						 CantJugadores	  ,
						 IdSuperficie	  ,
						 IdaYvuelta	      ,
						 PrecioInscripcion	,
						 FecIniInscripcion	,
						 FecFinInscripcion	,
						 HorasCancelacion	,
						 FechaInicio	      ,
						 FechaFin	      ,
						 Descripcion	      ,
						 Reglas	,          
						 IdEstado
							)	        
	VALUES( pIdDuenio	        ,
			pIdTipoTorneo	    ,
			pNombre	          	,
			pCantEquipos	    ,
			pCantJugadores	    ,
			pIdSuperficie	    ,
			pIdaYvuelta	      	,
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
        SET pIdTorneo = -1; 
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-20  0:44:19
