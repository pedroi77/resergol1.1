DROP PROCEDURE IF EXISTS SP_insertFixtureCopa; 

DELIMITER // 
CREATE PROCEDURE SP_insertFixtureCopa 
(
    pIdTorneo	    INT,
    pLimite	  		INT
) 

BEGIN 


	DECLARE done INT DEFAULT FALSE;
    DECLARE vidReserva INT;
    DECLARE vidEquipo INT;
    DECLARE i INT;
    DECLARE vFase INT;
    DECLARE vLimiteFase INT;
	
	DECLARE vIdReserva1 INT;
	DECLARE vIdReserva2 INT;
	DECLARE vContadorFase INT;
	
    
	
    DECLARE cur1 CURSOR FOR SELECT idreserva from tmpEquipos where pIdTorneo =pIdTorneo;
    DECLARE cur2 CURSOR FOR SELECT idequipo from torneosequipos where IdTorneo =pIdTorneo order by idequipo limit pLimite;
    DECLARE cur3 CURSOR FOR SELECT idequipo from torneosequipos where IdTorneo =pIdTorneo order by idequipo desc limit pLimite;


	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    /*Cantidad de */
    SET vFase = (select case CantEquipos when 32 then 1 
						when 16 then 2
                        when 8 then 3
                        when 4 then 4
						end
				from torneos where IdTorneo = pIdTorneo);



    /*Cargo la tabla de fixture con los datos que tengo*/

	INSERT INTO fixture( idTorneo,
						 idFecha,
						 idReserva,
						 IdEquipo1,
						 IdEquipo2,
                         jugado
						 )

	SELECT  t.idTorneo,
			vFase,
			R.idReserva,
			1,2,
            1
	FROM reservas as R
	INNER JOIN torneos as T on t.idTorneo = R.idTorneo
	WHERE T.idtorneo = pIdTorneo
	ORDER BY R.idReserva
	LIMIT pLimite;
    
    SET vFase = vFase +1;
    SET vLimiteFase = pLimite/2;
    
    /*Sigo llenando el fixture por fases*/
	WHILE vFase <= 5 DO /*5 es la fase de la final*/
		
		SET vContadorFase = 1;
		
		WHILE vContadorFase <= vLimiteFase DO
			SET vIdReserva1 = (select min(f.idreserva) 
								from fixture as F
								left join fixture as b on f.idreserva = b.idreserva1
								left join fixture as c on f.idreserva = c.idreserva2
								where f.idtorneo = pIdTorneo and f.idfecha = vFase-1  and  b.idreserva1 is null
																					  and  c.idreserva2 is null);
										
										
			SET vIdReserva2 = (select min(f.idreserva) 
								from fixture as F
								left join fixture as b on f.idreserva = b.idreserva1
								left join fixture as c on f.idreserva = c.idreserva2
								where f.idreserva!= vIdReserva1
								and f.idtorneo = pIdTorneo and f.idfecha = vFase-1  and  b.idreserva1 is null
																					and  c.idreserva2 is null);
								
			INSERT INTO fixture( idTorneo,
								 idFecha,
								 idReserva,
								 IdEquipo1,
								 IdEquipo2,
								 IdReserva1,
								 IdReserva2
								 )
			SELECT  t.idTorneo,
					vFase,
					R.idReserva,
					0,
					0,
					vIdReserva1,
					vIdReserva2
			FROM reservas as R
			INNER JOIN torneos as T on t.idTorneo = R.idTorneo
			WHERE T.idtorneo = pIdTorneo
			AND not exists(select res.idReserva
							from reservas res
							inner join fixture f on f.idreserva = res.idreserva
							where res.idtorneo =pIdTorneo and R.idReserva = res.idreserva)
			ORDER BY R.fecha
			LIMIT 1;
		 
			SET vContadorFase = vContadorFase + 1;
		
		END WHILE; 
		
		
		SET vFase = vFase +1;
        SET vLimiteFase = vLimiteFase/2;
      
	END WHILE;
    
    
    


	/*Cargo la temporal de trabajo*/

    INSERT INTO tmpEquipos (idtorneo , idReserva)

	SELECT  t.idTorneo,

			R.idReserva

	FROM reservas as R

	INNER JOIN torneos as T on t.idTorneo = R.idTorneo

	WHERE T.idtorneo = pIdTorneo

	ORDER BY R.fecha

	LIMIT pLimite;


    SET i =1;


    /*Cursor de posiciones*/ 

	OPEN cur1;

	read_loop: LOOP


		FETCH cur1 INTO vidReserva;

		IF done THEN

		  LEAVE read_loop;

		END IF;


		UPDATE tmpEquipos

        SET posicion = i

        WHERE idreserva = vidReserva;


         SET i =i + 1;

	END LOOP;


    CLOSE cur1;


	/*Cursor de equipo 1*/ 

    SET done = false;

    SET i =1;

	
    OPEN cur2;


	read_loop: LOOP

		FETCH cur2 INTO vidEquipo;

		
        IF done THEN

		  LEAVE read_loop;

		END IF;


		UPDATE tmpEquipos

        SET idequipo1 = vidEquipo

        WHERE posicion = i;

		SET i =i + 1;

	END LOOP;



	CLOSE cur2;


	/*Cursor de equipo 2*/ 

    SET done = false;

    SET i =1;


	OPEN cur3;

	read_loop: LOOP

		FETCH cur3 INTO vidEquipo;
        

		IF done THEN

		  LEAVE read_loop;

		END IF;


		UPDATE tmpEquipos

        SET idequipo2 = vidEquipo

        WHERE posicion = i;

		
        SET i =i + 1;

	END LOOP;


	CLOSE cur3;


    /*Finalizo el fixture*/


    UPDATE fixture as f

	INNER JOIN  tmpEquipos as t ON f.idTorneo = t.idtorneo AND f.idReserva = t.idReserva

	SET f.IdEquipo1 = t.IdEquipo1,

		f.IdEquipo2 = t.IdEquipo2;

    /*Borro la tabla temporal*/


    DELETE FROM tmpEquipos WHERE idTorneo = pIdTorneo;

END