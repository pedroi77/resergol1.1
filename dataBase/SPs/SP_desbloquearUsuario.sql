USE resergol;

DROP PROCEDURE IF EXISTS SP_desbloquearUsuario; 

DELIMITER // 
CREATE PROCEDURE SP_desbloquearUsuario( 
    pUsuario	    VARCHAR(25)
    )
BEGIN 

	
	UPDATE clientes
	SET contador = 0
	WHERE Usuario = pUsuario;
	
	
	UPDATE duenios
	SET contador = 0
	WHERE Usuario = pUsuario;
	
END 