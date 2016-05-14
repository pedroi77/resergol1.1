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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getCanchas`()
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
    WHERE ca.IdEstado = 1;
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
    SELECT d.iddia, d.nombre 
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
    AND D.idEstado = 1; 
    
   
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getDueniosPendientes`()
BEGIN 
select due.Usuario, due.FechaAlta, duep.nombreComplejo, duep.NroTelef, duep.Calle, duep.Altura,prov.Nombre as Provincia, loc.Nombre as Localidad
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
/*!50003 DROP PROCEDURE IF EXISTS `SP_insertClientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertClientes`(IN `pUsuario` VARCHAR(25), IN `pContrasenia` BLOB, IN `pNombre` VARCHAR(60), IN `pApellido` VARCHAR(60), IN `pIdTipoDoc` INT, IN `pNroDoc` INT, IN `pEmail` VARCHAR(60), OUT `pIdCliente` INT)
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-14 14:39:32
