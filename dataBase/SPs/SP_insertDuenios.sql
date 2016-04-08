

USE resergol;

DROP PROCEDURE IF EXISTS SP_insertDuenios; 

DELIMITER // 
CREATE PROCEDURE SP_insertDuenios 
(
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
	/*call SP_insertDuenios ('pepe', 'nn', 'cosme', 'fulanito', 1, 29456111,'fula@gmail.com', @du);*/
    /*call SP_insertDuenios ('pepe', 'nn', 'cosme', 'fulanito', 1, 37444111,'fula@gmail.com','Open', '44442222',1,2,'lavalle',1450    ,@du);*/
    DECLARE Error INT DEFAULT 0;
    DECLARE idPersonaAux INT DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;
    
      /*primero busco si ya existe la persona*/
      SELECT IFNULL(idPersona, 0) INTO idPersonaAux FROM personas WHERE idTipoDoc = pIdTipoDoc and nroDoc = pNroDoc;
      
      IF (idPersonaAux = 0) THEN /*NUEVO*/
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
        
        /*Grabo el registro en DueniosPendientes*/    
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
        SET pIdDuenio = -1; /*Devuelve -1 en caso de error*/
    END IF;
    
    
    IF (Error=-1 OR pIdDuenio = -1) THEN
        SET pIdDuenio = -1; /*Devuelve -1 en caso de error*/
        
    END IF;
END 

// 
DELIMITER ; 
