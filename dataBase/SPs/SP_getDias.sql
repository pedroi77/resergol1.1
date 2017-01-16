USE resergol;

DROP PROCEDURE IF EXISTS SP_getDias; 

DELIMITER // 
CREATE PROCEDURE SP_getDias () 

BEGIN 
select 
	idDia
	,Nombre 
from dias;
    
END 

// 
DELIMITER ; 