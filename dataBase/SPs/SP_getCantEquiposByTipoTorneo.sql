USE resergol;

DROP PROCEDURE IF EXISTS SP_getCantEquiposByTipoTorneo; 

DELIMITER // 
CREATE PROCEDURE SP_getCantEquiposByTipoTorneo 
(
    pIdTipo 	  INT 
) 

BEGIN 
    SELECT cantidad 
    FROM tipotorneosEquipos 
    WHERE IdTipoTorneo =pIdTipo;
END 

// 
DELIMITER ; 

