USE resergol;

DROP PROCEDURE IF EXISTS SP_getLocalidadesByProvincia; 

DELIMITER // 
CREATE PROCEDURE SP_getLocalidadesByProvincia 
(
    pIdProvincia 	  INT 
) 

BEGIN 
    SELECT l.IdLocalidad,
           l.Nombre 
    FROM Localidades as l
    INNER JOIN Provincias as p ON l.IdProvincia = p.IdProvincia
    WHERE p.IdProvincia = pIdProvincia;
END 

// 
DELIMITER ; 

