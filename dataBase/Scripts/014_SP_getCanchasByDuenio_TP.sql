USE resergol;

DROP PROCEDURE IF EXISTS SP_getCanchasByDuenio; 

DELIMITER // 
CREATE PROCEDURE SP_getCanchasByDuenio 
(
    pIdDuenio  	  INT 
) 
/*CALL SP_getCanchasByDuenio (1);*/
BEGIN 
    SELECT CA.idcancha, CA.nombre, CA.CantJugadores, ts.descripcion, CA.techada, CA.luz, CA.precio
    FROM canchas      AS CA
    INNER JOIN complejos    AS c ON (c.idcomplejo = ca.idcomplejo)
    INNER JOIN tipossuperficie ts ON ts.IdSuperficie = ca.idSuperficie
    WHERE c.idduenio = pIdDuenio
        AND CA.idestado = 1
        AND C.idestado = 1
    ORDER BY 2;
END 




