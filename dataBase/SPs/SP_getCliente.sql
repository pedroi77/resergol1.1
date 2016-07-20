USE resergol;

DROP PROCEDURE IF EXISTS SP_getCliente; 

DELIMITER // 
CREATE PROCEDURE SP_getCliente( 
    pUsuario	    VARCHAR(25),
    pContrasenia  VARCHAR(20)   
    )
BEGIN 
		
	DECLARE vContrasenia VARCHAR(20);
	DECLARE vContador  INT;
	
	SELECT CAST(contrasenia AS CHAR(10000) CHARACTER SET utf8), contador INTO vContrasenia ,vContador  
	FROM clientes 
	WHERE usuario = pUsuario;
	
	IF(vContador != 3 ) THEN
		IF(vContrasenia = pContrasenia) THEN
			
			UPDATE clientes
			SET contador = 0
			WHERE usuario = pUsuario;
			
			SELECT *
			FROM personas as P
			INNER JOIN clientes as C ON P.idPersona = C.idPersona
			WHERE C.usuario = pUsuario 
			AND C.contrasenia = pContrasenia
			AND C.idEstado = 1; 
			
		ELSE
		
			UPDATE clientes
			SET contador = vContador + 1
			WHERE usuario = pUsuario;
			
			IF((vContador + 1) = 3) THEN
				SELECT -3 AS IdCliente;
			ELSE 	
				SELECT -1 AS IdCliente;
			END IF;
			
		END IF;
	ELSE
		SELECT -3 AS IdCliente;
	END IF;

END 