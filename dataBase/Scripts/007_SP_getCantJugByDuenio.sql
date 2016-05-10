USE resergol;

DROP PROCEDURE IF EXISTS SP_getCantJugByDuenio; 

DELIMITER // 
CREATE PROCEDURE SP_getCantJugByDuenio 
(
    pIdDuenio  	  INT 
) 
/*CALL SP_getCantJugByDuenio (2);*/
BEGIN 
     SELECT distinct C.CantJugadores
	FROM  canchas AS C 
	INNER JOIN complejos AS CO ON CO.idcomplejo = C.idcomplejo
	WHERE   C.idEstado = 1
		AND CO.idestado = 1 
		AND CO.idDuenio = pIdDuenio
    ORDER BY 1;;
		
END 

// 
DELIMITER ; 

