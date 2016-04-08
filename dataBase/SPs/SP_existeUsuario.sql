DROP PROCEDURE IF EXISTS SP_existeUsuario; 

DELIMITER // 
CREATE PROCEDURE SP_existeUsuario( 
    pUsuario	VARCHAR(25),
    OUT Id      INT,
    OUT tipo	VARCHAR(1)
)
BEGIN 

    /*El SP debe recibir el usuario y devolver -1 
    si no existe en ninguna de las tablas (administradores, dueños o usuario). 
    Si existe devuelve el ID y el tipo (A, D o C).*/
    
    /*call SP_existeUsuario('ADMIN',  @ids,  @tipo);
    select @ids , @tipo;*/
    DECLARE IdAux   INT;
    
    SET IdAux = -1;
    SET tipo = 'A';     
         
    SELECT IFNULL(a.id, -1) INTO IdAux
    FROM Administradores as a
    WHERE a.Usuario = pUsuario;
    
    IF (IdAux = -1) THEN
    
        SET tipo = 'D';     
        
        SELECT IFNULL(idDuenio, -1) INTO IdAux 
        FROM Duenios 
        WHERE Usuario = pUsuario AND FechaBaja IS NULL;
        
        IF (IdAux = -1) THEN
        
            SET tipo = 'C';     
            
            SELECT IFNULL(idCliente,-1) INTO IdAux 
            FROM Clientes 
            WHERE Usuario = pUsuario AND FechaBaja IS NULL;
        END IF;
        
    END IF;
    
    SET Id = IdAux;
END
