USE resergol;

DROP PROCEDURE IF EXISTS SP_getDiasByDuenio; 

DELIMITER // 
CREATE PROCEDURE SP_getDiasByDuenio 
(
    pIdDuenio  	  INT 
) 
/*CALL SP_getDiasByDuenio (2);*/
BEGIN 
    SELECT d.iddia, d.nombre 
    FROM complejosdias      AS cd
    INNER JOIN complejos    AS c ON (c.idcomplejo = cd.idcomplejo)
    INNER JOIN dias         AS d ON (d.iddia between cd.iddiadesde and cd.iddiahasta)
    WHERE c.idduenio = pIdDuenio
    AND C.idestado = 1
    ORDER BY 1;

END 


