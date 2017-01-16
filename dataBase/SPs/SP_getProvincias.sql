USE resergol;

DROP PROCEDURE IF EXISTS SP_getProvincias; 

DELIMITER // 
CREATE PROCEDURE SP_getProvincias () 

BEGIN 
    SELECT IdProvincia,
           Nombre 
    FROM Provincias
    ORDER BY Nombre;
END 

// 
DELIMITER ; 
