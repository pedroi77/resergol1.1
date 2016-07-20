USE resergol;

DROP PROCEDURE IF EXISTS SP_getDuenio; 

DELIMITER // 
CREATE PROCEDURE SP_getDuenio( 
    pUsuario	    VARCHAR(25),
    pContrasenia  VARCHAR(20)   
    )
BEGIN 

    /*El SP devuelve el cliente para el usuario y contraseña ingresado*/
    /*call SP_getDuenio('CARMIE'  , 11);*/

	DECLARE vContrasenia VARCHAR(20);
	DECLARE vContador  INT;
	
	SELECT CAST(contrasenia AS CHAR(10000) CHARACTER SET utf8), contador INTO vContrasenia ,vContador  
	FROM duenios 
	WHERE usuario = pUsuario;
	
	IF(vContador != 3 ) THEN
		IF(vContrasenia = pContrasenia) THEN
			
			UPDATE duenios
			SET contador = 0
			WHERE usuario = pUsuario;
			
			SELECT C.idComplejo, P.*, C.*, d.*
			FROM personas as P
			INNER JOIN duenios as D ON P.idPersona = D.idPersona
			LEFT JOIN complejos as C ON D.idDuenio = C.idDuenio
			WHERE D.usuario = pUsuario 
			AND D.contrasenia = pContrasenia
			AND (D.idEstado = 2 or D.idEstado = 3); /*Aceptado*/
			
		ELSE
		
			UPDATE duenios
			SET contador = vContador + 1
			WHERE usuario = pUsuario;
			
			IF((vContador + 1) = 3) THEN
				SELECT -3 AS IdDuenio;
			ELSE 	
				SELECT -1 AS IdDuenio;
			END IF;
			
		END IF;
	ELSE
		SELECT -3 AS IdDuenio;
	END IF;
	
 
END