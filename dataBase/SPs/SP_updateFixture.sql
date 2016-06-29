DELIMITER //
CREATE PROCEDURE SP_updateFixture(
	pIdTorneo	INT,
    pIdFecha	INT,
    pIdReserva	INT,
    pGol1		INT,
    pGol2		INT,
    OUT pResultado   	INT
)
BEGIN
    
    DECLARE Error INT DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;
    
    SET pResultado = 1;
    
	UPDATE fixture
    SET gol1 = pGol1,
    	gol2 = pGol2
	WHERE idTorneo = pIdTorneo
    AND   idFecha =  pIdFecha
    AND   idreserva = pIdReserva;
    
    IF (Error=-1)  THEN
        SET pResultado = -1; /*Devuelve -1 en caso de error*/
    END IF;
END