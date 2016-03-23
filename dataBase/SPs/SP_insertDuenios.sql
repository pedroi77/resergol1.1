

USE resergol;

DROP PROCEDURE IF EXISTS SP_insertDuenios; 

DELIMITER // 
CREATE PROCEDURE SP_insertDuenios 
(
    pUsuario	    VARCHAR(25),
    pContrasenia	BLOB(30),
    pNombre	      VARCHAR(60),
    pApellido	    VARCHAR(60),
    pIdTipoDoc 	  INT        ,
    pNroDoc	      INT        ,   
    pEmail	      VARCHAR(60),
    OUT pIdDuenio  INT
) 

BEGIN 
	/*call SP_insertDuenios ('pepe', 'nn', 'cosme', 'fulanito', 1, 29456111,'fula@gmail.com', @du);*/
    DECLARE Error INT DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;
    
    

     /*primero creo la persona*/
    CALL SP_insertPersonas (pNombre, pApellido, pIdTipoDoc, pNroDoc,pEmail, @idPersona);
     
    IF Error = 0 THEN
        
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
                now(),
                null );
				
    ELSE
        SET pIdDuenio = -1; /*Devuelve -1 en caso de error*/
    END IF;
    
    
    IF Error=-1 THEN
        SET pIdDuenio = -1; /*Devuelve -1 en caso de error*/
    ELSE
        SET pIdDuenio = (SELECT MAX(idDuenio) FROM Duenios); 
    END IF;

END 

// 
DELIMITER ; 
