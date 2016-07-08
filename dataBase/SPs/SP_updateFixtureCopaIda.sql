DROP PROCEDURE IF EXISTS SP_updateFixtureCopaIda; 

DELIMITER // 
CREATE PROCEDURE SP_updateFixtureCopaIda 
(
    pIdTorneo	INT,
    pIdFecha	INT,
    pIdReserva	INT,
    pGol1	INT,
    pGol2	INT,
    OUT pRes	INT
) 

BEGIN
	
    DECLARE VIdReserva1 INT;
	DECLARE VIdReserva2 INT;
    DECLARE VIdEquipoGanador INT;
    DECLARE Error INT DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;
    
    
    SET pRes = 1;
    
    /*Actualizo el resultado del partido*/
    UPDATE fixture
    SET Gol1 = pGol1,
		Gol2 = pGol2,
        jugado =1
    WHERE IdTorneo=pIdTorneo
    AND IdFecha =pIdFecha
    AND IdReserva = pIdReserva;
    
    /*Obtengo el idEquipo ganador*/
    SET VIdEquipoGanador = (select if(gol1 > gol2,IdEquipo1,if(gol2>gol1,IdEquipo2,0) ) from fixture where idtorneo = pIdTorneo and idfecha = pIdFecha and IdReserva = pIdReserva);
    
    
    /*obtengo el id reserva para insertar el equipo que gano*/
    /*SET VIdReserva = (select IdReserva
						from fixture 
						where idtorneo = pIdTorneo 
						and idfecha = (pIdFecha+1)
						and (IdEquipo1 = 0 OR IdEquipo2 = 0)
						order by IdReserva
						LIMIT 1);*/
                        
						
	UPDATE fixture
	SET idequipo1 =VIdEquipoGanador
	WHERE idtorneo = pIdTorneo 
	AND idfecha = (pIdFecha+1)
	AND idreserva1 = pIdReserva;
	
	UPDATE fixture
	SET idequipo2 =VIdEquipoGanador
	WHERE idtorneo = pIdTorneo 
	AND idfecha = (pIdFecha+1)
	AND idreserva2 = pIdReserva;
	
	/*Actualizo el id equipo para el equipo vacio*/
    /*IF( exists (select 1 from fixture where idtorneo = pIdTorneo and idfecha = (pIdFecha+1) and idreserva1 =VIdReserva and IdEquipo1 = 0)) THEN
		UPDATE fixture
		SET idequipo1 =VIdEquipoGanador
		WHERE idtorneo = pIdTorneo 
		AND idfecha = (pIdFecha+1)
		AND idreserva = VIdReserva;
    ELSE
		UPDATE fixture
		SET idequipo2 =VIdEquipoGanador
		WHERE idtorneo = pIdTorneo 
		AND idfecha = (pIdFecha+1)
		AND idreserva = VIdReserva;
    END IF;*/
    

    
    IF (Error=-1)  THEN
        SET pRes = -1; /*Devuelve -1 en caso de error*/
	END IF;
END