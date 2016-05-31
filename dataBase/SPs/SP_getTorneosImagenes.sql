DROP PROCEDURE IF EXISTS SP_getTorneosImagenes; 

DELIMITER // 
CREATE PROCEDURE SP_getTorneosImagenes(
    pIdTorneo  	  INT 
) 

BEGIN 
    SELECT t.idtorneo, t.nombre, concat('C:\\xampp\\htdocs\\resergol1.1\\api\\Imagenes\\torneos\\',TI.url)
    FROM torneosimagenes AS TI
    INNER JOIN torneos as T ON T.idtorneo = TI.idtorneo
    WHERE T.idtorneo = pIdTorneo;
END 

// 
DELIMITER ; 
