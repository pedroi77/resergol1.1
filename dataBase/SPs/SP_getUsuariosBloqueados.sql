USE resergol;

DROP PROCEDURE IF EXISTS SP_getUsuariosBloqueados; 

DELIMITER // 
CREATE PROCEDURE SP_getUsuariosBloqueados( 
    pUsuario	    VARCHAR(25)
    )
BEGIN 

	/*esto tmb lo hago asi por tiempo....*/
	IF(pUsuario = 'A') THEN
		SET pUsuario = null;
	END IF;
	
	/*En ves de usar contador 3 queda mas lindo por estado pero x tiempo lo hago asi*/ 
	SELECT c.Usuario, c.IdCliente as 'id' ,CAST(c.contrasenia AS CHAR(10000) CHARACTER SET utf8) as 'contrasenia', p.Email, 'Cliente' as tipo
	FROM clientes as c
	INNER JOIN personas as p ON p.idpersona = c.idpersona
	WHERE contador = 3
	AND c.Usuario = IFNULL(pUsuario,c.Usuario)

	UNION

	SELECT d.Usuario, d.IdDuenio as 'id' ,CAST(d.contrasenia AS CHAR(10000) CHARACTER SET utf8) as 'contrasenia', p.Email, 'Duenio' as tipo
	FROM duenios as d
	INNER JOIN personas as p ON p.idpersona = d.idpersona
	WHERE contador = 3
	AND d.Usuario = IFNULL(pUsuario,d.Usuario);
END 