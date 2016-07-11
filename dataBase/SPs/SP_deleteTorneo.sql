

DROP PROCEDURE IF EXISTS SP_deleteTorneo; 

DELIMITER // 
CREATE PROCEDURE SP_deleteTorneo( 
    pIdTorneo	    INT
    )
BEGIN 

	DELETE FROM torneosequipos WHERE idtorneo = pIdTorneo;
	DELETE FROM torneoscanchas WHERE idtorneo = pIdTorneo;
	DELETE FROM torneosdias WHERE idtorneo = pIdTorneo;
	DELETE FROM torneosimagenes WHERE idtorneo = pIdTorneo;
	DELETE FROM fixture WHERE idtorneo = pIdTorneo;
	DELETE FROM torneos WHERE idtorneo = pIdTorneo;
END