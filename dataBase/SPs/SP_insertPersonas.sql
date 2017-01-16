USE resergol;

DROP PROCEDURE IF EXISTS SP_insertPersonas; 

DELIMITER // 
CREATE PROCEDURE SP_insertPersonas (
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
        SET pIdPersona = -1; /*Devuelve -1 en caso de error*/
    ELSE
        SET pIdPersona = (SELECT MAX(IdPersona) FROM Personas); 
    END IF;

END 

// 
DELIMITER ; 
