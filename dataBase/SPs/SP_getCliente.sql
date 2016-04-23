
DROP PROCEDURE IF EXISTS SP_getCliente; 

DELIMITER // 
CREATE PROCEDURE SP_getCliente( 
    pUsuario	    VARCHAR(25),
    pContrasenia  VARCHAR(20)   
    )
BEGIN 

    /*El SP devuelve el cliente para el usuario y contraseña ingresado*/
    /*call SP_getCliente('HOMERO'  , 1111);*/
    
    SELECT *
    FROM personas as P
    INNER JOIN clientes as C ON P.idPersona = C.idPersona
    WHERE C.usuario = pUsuario 
    AND C.contrasenia = pContrasenia
    AND C.idEstado = 1; /*Activo*/
    
   
END