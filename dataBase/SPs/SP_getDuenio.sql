
DROP PROCEDURE IF EXISTS SP_getDuenio; 

DELIMITER // 
CREATE PROCEDURE SP_getDuenio( 
    pUsuario	    VARCHAR(25),
    pContrasenia  VARCHAR(20)   
    )
BEGIN 

    /*El SP devuelve el cliente para el usuario y contraseña ingresado*/
    /*call SP_getDuenio('CARMIE'  , 11);*/
    
    SELECT * , C.idComplejo
    FROM personas as P
    INNER JOIN duenios as D ON P.idPersona = D.idPersona
    INNER JOIN complejos as C ON D.idDuenio = C.idDuenio
    WHERE D.usuario = pUsuario 
    AND D.contrasenia = pContrasenia
    AND D.idEstado = 2; /*Aceptado*/
    
   
END