USE resergol;

DROP PROCEDURE IF EXISTS SP_getTiposDoc; 

DELIMITER // 
CREATE PROCEDURE SP_getTiposDoc () 

BEGIN 
    SELECT IdTipoDoc,
           Descripcion 
    FROM TiposDoc
    WHERE IdEstado = 1; /*solo los activos*/
    
END 

// 
DELIMITER ; 





