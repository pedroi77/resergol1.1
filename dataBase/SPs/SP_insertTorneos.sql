DROP PROCEDURE IF EXISTS SP_insertTorneos; 

DELIMITER // 
CREATE PROCEDURE SP_insertTorneos 
(
    pIdDuenio	        INT          ,
	pIdTipoTorneo	    INT          ,
	pNombre	          	VARCHAR(30)  ,
	pCantEquipos	    INT          ,
	pCantJugadores	    INT          ,
	pIdSuperficie	    INT          ,
	pIdaYvuelta	      	BOOL         ,
	pPrecioInscripcion	DOUBLE(6,2)  ,
	pFecIniInscripcion	DATE         ,
	pFecFinInscripcion	DATE         ,
	pHorasCancelacion	INT          ,
	pFechaInicio	    DATE         ,
	pFechaFin	        DATE         ,
	pDescripcion	    VARCHAR(300) ,
	pReglas	          	VARCHAR(300) ,
	pIdEstado	        INT          ,
    OUT pIdTorneo   	INT
) 

BEGIN 
	
    /*call SP_insertTorneos ('pepe', 'nn', 'cosme', 'fulanito', 1, 37444111,'fula@gmail.com','Open', '44442222',1,2,'lavalle',1450    ,@du);*/
    DECLARE Error INT DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;
  
	INSERT INTO Torneos	(IdDuenio	      ,
						 IdTipoTorneo	  ,
						 Nombre	          ,
						 CantEquipos	      ,
						 CantJugadores	  ,
						 IdSuperficie	  ,
						 IdaYvuelta	      ,
						 PrecioInscripcion	,
						 FecIniInscripcion	,
						 FecFinInscripcion	,
						 HorasCancelacion	,
						 FechaInicio	      ,
						 FechaFin	      ,
						 Descripcion	      ,
						 Reglas	,          
						 IdEstado
							)	        
	VALUES( pIdDuenio	        ,
			pIdTipoTorneo	    ,
			pNombre	          	,
			pCantEquipos	    ,
			pCantJugadores	    ,
			pIdSuperficie	    ,
			pIdaYvuelta	      	,
			pPrecioInscripcion	,
			pFecIniInscripcion	,
			pFecFinInscripcion	,
			pHorasCancelacion	,
			pFechaInicio	    ,
			pFechaFin	        ,
			pDescripcion	    ,
			pReglas	          	,
			pIdEstado	        
			);  
			
	SET pIdTorneo = (SELECT MAX(IdTorneo) FROM Torneos);  
	
	IF (Error=-1)  THEN
        SET pIdTorneo = -1; /*Devuelve -1 en caso de error*/
    END IF;
END 

// 
DELIMITER ; 
