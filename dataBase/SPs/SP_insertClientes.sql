

USE resergol;

DROP PROCEDURE IF EXISTS SP_insertClientes; 

DELIMITER // 
CREATE PROCEDURE SP_insertClientes 
(
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

END

// 
DELIMITER ; 




