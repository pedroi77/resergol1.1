USE resergol;

DROP PROCEDURE IF EXISTS SP_getTipoTorneos; 

DELIMITER // 
CREATE PROCEDURE SP_getTipoTorneos 
(
    pIdTipoTorneo  	  INT 
) 
/*CALL SP_getTipoTorneos (NULL);*/
BEGIN 
    SELECT *
    FROM TipoTorneos 
    WHERE idtipoTorneo  = IFNULL(pIdTipoTorneo,idtipoTorneo);
END 

// 
DELIMITER ; 

