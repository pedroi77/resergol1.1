USE resergol;

DROP PROCEDURE IF EXISTS SP_getSuperficiesByIdDuenio; 

DELIMITER // 
CREATE PROCEDURE SP_getSuperficiesByIdDuenio 
(
    pIdDuenio  	  INT 
) 
/*CALL SP_getSuperficiesByIdDuenio (2);*/
BEGIN 
    SELECT distinct S.* 
	FROM tipossuperficie AS S
	INNER JOIN canchas AS C ON C.idSuperficie = S.idSuperficie
	INNER JOIN complejos AS CO ON CO.idcomplejo = C.idcomplejo
	WHERE   C.idEstado = 1
		AND CO.idestado = 1 
		AND CO.idDuenio = pIdDuenio;
END 

// 
DELIMITER ; 




