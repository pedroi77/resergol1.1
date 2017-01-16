DROP PROCEDURE IF EXISTS SP_insertTorneosCanchas; 

DELIMITER // 
CREATE PROCEDURE SP_insertTorneosCanchas 
(
    pIdTorneo	        INT          ,
	pIdComplejo         INT          ,
	pIdCancha      	    INT          ,
    OUT vResultado       INT
) 

BEGIN 
	
    /*
call  SP_insertTorneosCanchas (8,1,2,@res);
select @res;*/
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
        SET vResultado = -1; /*Devuelve -1 en caso de error*/
    END IF;
END 

// 
DELIMITER ; 


