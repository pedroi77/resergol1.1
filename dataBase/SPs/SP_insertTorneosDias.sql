DROP PROCEDURE IF EXISTS SP_insertTorneosDias; 

DELIMITER // 
CREATE PROCEDURE SP_insertTorneosDias 
(
    pIdTorneo	        INT          ,
	pIddia              INT          ,
	pHoraDesde      	TIME         ,
    pHoraHasta      	TIME         ,
    OUT vResultado       INT
) 

BEGIN 
	
    /*call SP_insertTorneosDias (8,1,'15:00:00','22:00:00',@res);
select @res;*/
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
        SET vResultado = -1; /*Devuelve -1 en caso de error*/
    END IF;
END 

// 
DELIMITER ; 



