

USE resergol;

DROP PROCEDURE IF EXISTS SP_insertClientes; 

DELIMITER // 
CREATE PROCEDURE SP_insertClientes 
(
    pUsusario	    VARCHAR(25),
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
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;
    
    

     /*primero creo la persona*/
    CALL SP_insertPersonas (pNombre, pApellido, pIdTipoDoc, pNroDoc,pEmail, @idPersona);
     
    IF Error = 0 THEN
        
        INSERT INTO Clientes(IdPersona, 
                            Ususario,
                            Contrasenia,	
                            IdEstado,	
                            FechaAlta,	
                            FechaBaja)
        VALUES( @idPersona,
                pUsusario, 
                pContrasenia, 
                1,
                now(),
                null );
        
    ELSE
        SET pIdCliente = -1; /*Devuelve -1 en caso de error*/
    END IF;
    
    
    IF Error=-1 THEN
        SET pIdCliente = -1; /*Devuelve -1 en caso de error*/
    ELSE
        SET pIdCliente = (SELECT MAX(idCliente) FROM Clientes); 
    END IF;

END 

// 
DELIMITER ; 
