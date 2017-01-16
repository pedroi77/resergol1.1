
DROP PROCEDURE IF EXISTS SP_getAdministrador; 

DELIMITER // 
CREATE PROCEDURE SP_getAdministrador( 
    pUsuario	    VARCHAR(25),
    pContrasenia  VARCHAR(20)   
    )
BEGIN 
    
   
    /*El SP devuelve el cliente para el usuario y contraseña ingresado*/
    /*call SP_getAdministrador('HOMERO'  , 1111);*/
    
    SELECT *
    FROM administradores as Adm
    WHERE Adm.Usuario = pUsuario 
    AND Adm.Contrasenia = pContrasenia;
    
    
   
END