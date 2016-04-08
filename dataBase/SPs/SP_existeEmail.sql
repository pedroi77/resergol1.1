DROP PROCEDURE IF EXISTS SP_existeEmail; 

DELIMITER // 
CREATE PROCEDURE SP_existeEmail( 
    pEmail  		VARCHAR(60),
    OUT resultado   INT
)
BEGIN 

    /*Recibe mail devuelve 1 si ya existe caso contrario 0*/
    /*call SP_existeEmail('pepe@gmail.com', @res);
    select @res;*/
    
    DECLARE Aux   INT;
    
    SET resultado = 0;
    SET Aux = -1;
        
	SELECT IFNULL(IdPersona, -1) INTO Aux 
	FROM Personas 
	WHERE Email = pEmail;
		
	
    IF Aux > -1 THEN
        SET resultado = 1;
    END IF;
END