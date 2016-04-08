DROP PROCEDURE IF EXISTS SP_existeDocumento; 

DELIMITER // 
CREATE PROCEDURE SP_existeDocumento( 
    pIdTipoDoc 	    INT,
    pNroDoc	        INT,
    pTipo           VARCHAR(1),
    OUT resultado   INT
)
BEGIN 

    /*Recibe tipo de doc, nro de documento y el tipo que quiere crear (D,C) 
    devuelve 1 ya existe caso contrario 0*/
    /*call SP_existeDocumento(1, 37444111 ,  'C', @res);
    select @res;*/
    
    DECLARE Aux   INT;
    
    SET resultado = 0;
    SET Aux = -1;
       
    IF pTipo = 'D' THEN
        
        SELECT IFNULL(D.idDuenio, -1) INTO Aux 
        FROM Duenios AS D
        INNER JOIN Personas AS p ON D.idPersona = P.idPersona
        WHERE P.IdTipoDoc = pIdTipoDoc 
            AND P.NroDoc  = pNroDoc
            AND D.FechaBaja IS NULL;
            
    ELSE

        SELECT IFNULL(C.idCliente, -1) INTO Aux 
        FROM Clientes AS C
        INNER JOIN Personas AS p ON C.idPersona = P.idPersona
        WHERE P.IdTipoDoc = pIdTipoDoc 
            AND P.NroDoc  = pNroDoc
            AND C.FechaBaja IS NULL;
            
    END IF;
         
    IF Aux > -1 THEN
        SET resultado = 1;
    END IF;
    
    
END
