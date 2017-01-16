USE resergol;

DROP PROCEDURE IF EXISTS SP_deleteReserva; 

DELIMITER //
CREATE PROCEDURE SP_deleteReserva( 
    pIdReserva	   INT,
    OUT valor INT
    )
BEGIN 
    DECLARE horasCanc INT DEFAULT 0;
    DECLARE horasDif INT;
    DECLARE complejo INT DEFAULT 0;
    DECLARE cliente INT DEFAULT 0;
    DECLARE existeEnLista INT DEFAULT 0;
    DECLARE Error INT DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;


    select  com.HorasCancelacion , 
			/*cast(time_to_sec(timediff(CONCAT(res.fecha, ' ', res.HoraInicio), NOW() )) / 3600 as integer) as horasDif,*/
			cast(time_to_sec(timediff(CONCAT(res.fecha, ' ', res.HoraInicio), NOW() )) / 3600 as UNSIGNED) as horasDif,
			com.idComplejo, 
			res.idCliente

    into horasCanc, horasDif, complejo, cliente
	from complejos com
	inner join reservas res
	on com.IdComplejo = res.IdComplejo
	WHERE idReserva = pIdReserva;

   
    if(horasDif < horasCanc and cliente != 32) then /*32 es el idcliente TORNEO*/
		select count(1) into existeEnLista
		from listanegra
		where IdCliente = cliente;

    	if(existeEnLista = 0) then
            insert into listanegra 
            (
                IdComplejo
                ,IdCliente
                ,FechaIngreso
            )
            values
            (
                complejo
                ,cliente
                ,now()
            );
			
		end if;
    end if;

    
	DELETE FROM reservas
	WHERE idReserva = pIdReserva;

	IF Error=-1 THEN
        SET valor = -1; 
    ELSE
        SET valor = 1; 
    END IF;

END 