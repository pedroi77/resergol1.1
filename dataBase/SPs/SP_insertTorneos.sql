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
    ptiempoPartido      INT          ,
	pPrecioInscripcion	DOUBLE(6,2)  ,
	pFecIniInscripcion	VARCHAR(10)  ,
	pFecFinInscripcion	VARCHAR(10)  ,
	pHorasCancelacion	INT          ,
	pFechaInicio	    VARCHAR(10)  ,
	pFechaFin	        VARCHAR(10)  ,
	pDescripcion	    VARCHAR(300) ,
	pReglas	          	VARCHAR(300) ,
	pIdEstado	        INT          ,
    OUT pIdTorneo   	INT
) 

BEGIN 
	
    /*call SP_insertTorneos(1, 2, 'Libertadores',16,11,3, false,200.00,'20/05/2016', '30/05/2016', 24,'05/06/2016','05/09/2016','Este es el primer torneo', 'Reglas: las de un torneo de 11',3,  @du);

select @du;*/
    DECLARE Error INT DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;
  
	INSERT INTO Torneos	(IdDuenio	      ,
						 IdTipoTorneo	  ,
						 Nombre	          ,
						 CantEquipos	      ,
						 CantJugadores	  ,
						 IdSuperficie	  ,
						 IdaYvuelta	      ,
                         tiempoPartido,
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
            ptiempoPartido      ,
			pPrecioInscripcion	,
			STR_TO_DATE(pFecIniInscripcion, '%d/%m/%Y'),
            STR_TO_DATE(pFecFinInscripcion, '%d/%m/%Y'),
			pHorasCancelacion	,
            STR_TO_DATE(pFechaInicio, '%d/%m/%Y'),
            STR_TO_DATE(pFechaFin, '%d/%m/%Y'),
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
