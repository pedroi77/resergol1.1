

DROP PROCEDURE IF EXISTS SP_getMailsTorneo; 

DELIMITER // 
CREATE PROCEDURE SP_getMailsTorneo( 
    pIdTorneo	    INT
    )
BEGIN 

	SELECT 	te.IdTorneo , 
			c.usuario, 
			p.Email, 
			com.Nombre as 'complejo', 
			t.Nombre as 'nomTorneo'
	FROM torneosequipos AS te
	INNER JOIN equipos 	AS e ON te.IdEquipo = e.idEquipo
	INNER JOIN clientes AS c ON c.idcliente = e.idcliente
	INNER JOIN personas AS p ON p.IdPersona = c.idpersona
	INNER JOIN torneos 	AS t ON t.idtorneo = te.IdTorneo
	INNER JOIN complejos AS com ON com.IdDuenio = t.IdDuenio
	WHERE te.idtorneo = pIdTorneo;

END