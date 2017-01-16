DROP PROCEDURE IF EXISTS SP_deleteTorneosImagenes; 

DELIMITER // 
CREATE PROCEDURE SP_deleteTorneosImagenes 
(
    pIdTorneo	        INT        ,
	pUrl                VARCHAR(150),
    OUT vResultado       INT
) 

BEGIN 
    DECLARE Error INT DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;
    
    SET vResultado = 1;
    
    DELETE FROM torneosimagenes
    WHERE IdTorneo =  pIdTorneo 
    AND   url = pUrl;

	IF (Error=-1)  THEN
        SET vResultado = -1; /*Devuelve -1 en caso de error*/
    END IF;
END 

// 
DELIMITER ; 



