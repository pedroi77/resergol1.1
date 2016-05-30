DROP PROCEDURE IF EXISTS SP_insertTorneosImagenes; 

DELIMITER // 
CREATE PROCEDURE SP_insertTorneosImagenes 
(
    pIdTorneo	        INT        ,
	pUrl                VARCHAR(150),
    OUT vResultado       INT
) 

BEGIN 
    DECLARE Error INT DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;
    
    SET vResultado = 1;
  
	INSERT INTO torneosimagenes	(IdTorneo,url)	        
	VALUES( pIdTorneo,
			pUrl);  

	IF (Error=-1)  THEN
        SET vResultado = -1; /*Devuelve -1 en caso de error*/
    END IF;
END 

// 
DELIMITER ; 



