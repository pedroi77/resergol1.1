DROP PROCEDURE IF EXISTS SP_getSuperficies;

DELIMITER // 
CREATE PROCEDURE SP_getSuperficies()

  /*El SP devuelve todos los distintos tipos de superficies de canchas*/
  /*call SP_getSuperficies*/

  BEGIN 
    SELECT IdSuperficie,
    	   Descripcion
    FROM tipossuperficie
    ORDER BY Descripcion;
  END

// 