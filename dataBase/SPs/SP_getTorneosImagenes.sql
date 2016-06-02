DROP PROCEDURE IF EXISTS SP_getTorneosImagenes; 

DELIMITER // 
CREATE PROCEDURE SP_getTorneosImagenes(
    pIdTorneo  	  INT 
) 

BEGIN 
    SELECT t.idtorneo, t.nombre, TI.url,  
    concat('http://localhost:8080/resergol1.1/api/Imagenes/torneos/',TI.url) as imagen, TI.fechaalta
    FROM torneosimagenes AS TI
    INNER JOIN torneos as T ON T.idtorneo = TI.idtorneo
    WHERE T.idtorneo = pIdTorneo
    ORDER BY 5;
END 

// 
DELIMITER ; 
