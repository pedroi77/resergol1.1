DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_updatePersona`(IN `pIdPersona` INT, IN `pNombre` VARCHAR(60), IN `pIdTipoDoc` INT, IN `pApellido` VARCHAR(60), IN `pNroDoc` VARCHAR(20), IN `pEmail` VARCHAR(60), IN `vResultado` INT)
    NO SQL
BEGIN

	DECLARE Error INT DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;
    
    SET vResultado = 1;

UPDATE personas SET 
    Nombre = pNombre
    ,Apellido = pApellido
    ,IdTipoDoc = pIdTipoDoc
    ,NroDoc = pNroDoc
    ,Email = pEmail
WHERE 
    IdPersona = pIdPersona;
    
    IF (Error=-1)  THEN
        SET vResultado = -1; /*Devuelve -1 en caso de error*/
    END IF;
    
END ;;
DELIMITER ;



DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_updateDuenio`(IN `pIdDuenio` INT, IN `pUsuario` VARCHAR(50), IN `pContrasenia` VARCHAR(50), OUT `pIdPersona` INT)
    NO SQL
BEGIN

UPDATE duenios SET 
    Usuario = pUsuario
    ,Contrasenia = pContrasenia
    ,IdEstado = 3
WHERE
    IdDuenio=pIdDuenio;
    
    SET pIdPersona = (SELECT IdPersona FROM duenios where IdDuenio=pIdDuenio);
    
END ;;
DELIMITER ;


DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_updateComplejosPagos`(IN `pCBU` VARCHAR(22), IN `pNroCuenta` VARCHAR(18), IN `pIdComplejo` INT)
    NO SQL
BEGIN

UPDATE  complejospagos  SET 
	CBU = pCBU
	,NroCuenta = pNroCuenta 
WHERE 
	IdComplejo = pIdComplejo;

END ;;
DELIMITER ;


DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_updateComplejoDireccion`(IN `pCalle` VARCHAR(40), IN `pAltura` INT, IN `pIdLocalidad` INT, IN `pIdProvincia` INT, IN `pX` INT, IN `pY` INT, IN `pIdComplejo` INT, IN `vResultado` INT)
    NO SQL
BEGIN 

	DECLARE Error INT DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;
    
    SET vResultado = 1;

UPDATE complejosdireccion SET 
	Calle = pCalle
	,Altura = pAltura
	,IdLocalidad = pIdLocalidad
	,IdProvincia = pIdProvincia
	,X = pX
	,Y = pY
WHERE 
	IdComplejo = pIdComplejo;

	IF (Error=-1)  THEN
        SET vResultado = -1; /*Devuelve -1 en caso de error*/
    END IF;
    
END ;;
DELIMITER ;


DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_updateComplejo`(IN `pNombre` VARCHAR(60), IN `pDescripcion` VARCHAR(200), IN `pEstacionamiento` TINYINT, IN `pBuffet` TINYINT, IN `pDuchas` TINYINT, IN `pParrillas` TINYINT, IN `pWiFi` INT, IN `pHoraCobroLuz` TIME, IN `pPorcentajeSeña` INT, IN `pHorasCancelacion` INT, IN `pTiempoReserva` TIME, IN `pEmail` VARCHAR(60), IN `pIdEstado` INT, IN `pIdDuenio` INT, IN `pPorcentajeLuz` INT, IN `pnroCelular` INT, IN `pnroTelefono` INT, IN `pIdComplejo` INT)
    NO SQL
BEGIN

	DECLARE Error INT DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;

UPDATE complejos SET 
	Nombre = pNombre
	,Descripcion = pDescripcion
	,Estacionamiento = pEstacionamiento
	,Buffet = pBuffet			
	,Duchas = pDuchas		
	,Parrillas = pParrillas			
	,WiFi =	pWiFi			
	,HoraCobroLuz =	pHoraCobroLuz	
	,PorcentajeSeña = pPorcentajeSeña
	,HorasCancelacion = pHorasCancelacion	
	,TiempoReserva = pTiempoReserva		
	,Email = pEmail			
	,IdEstado =	pIdEstado		
	,IdDuenio =	pIdDuenio	
	,PorcentajeLuz = pPorcentajeLuz	
	,nroCelular = pnroCelular	
	,nroTelefono = pnroTelefono	 
WHERE 
	IdComplejo = pIdComplejo;


END ;;
DELIMITER ;


DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertDiasComplejos`(IN `pIdComplejo` INT, IN `pIdDiaDesde` INT, IN `pIdDiaHasta` INT, IN `pHoraDesde` TIME, IN `pHoraHasta` TIME)
    NO SQL
BEGIN

	DECLARE Error INT DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;
    
    INSERT INTO complejosdias 
    (
        IdComplejo
        ,IdDiaDesde
        ,IdDiaHasta
        ,HoraDesde
        ,HoraHasta
    ) 
    VALUES 
    (
        pIdComplejo
        ,pIdDiaDesde
        ,pIdDiaHasta
        ,pHoraDesde
        ,pHoraHasta
    );
    
END ;;
DELIMITER ;



DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertComplejosPagos`(IN `pIdComplejo` INT, IN `pCBU` VARCHAR(22), IN `pNroCuenta` VARCHAR(18))
    NO SQL
BEGIN 
    DECLARE Error INT DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;

INSERT INTO complejospagos
(
    IdComplejo
    ,CBU
    ,NroCuenta
) 
VALUES 
(
    pIdComplejo
    ,pCBU
    ,pNroCuenta
);

END ;;
DELIMITER ;



DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertComplejosDireccion`(IN `pIdComplejo` INT, IN `pCalle` VARCHAR(40), IN `pAltura` INT, IN `pIdLocalidad` INT, IN `pIdProvincia` INT, IN `pX` INT, IN `pY` INT, OUT `vResultado` INT)
    NO SQL
BEGIN

    DECLARE Error INT DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;

INSERT INTO complejosdireccion 
(
    IdComplejo
    ,Calle
    ,Altura
    ,IdLocalidad
    ,IdProvincia
    ,X
    ,Y
) 
VALUES 
(
    pIdComplejo
    ,pCalle
    ,pAltura
    ,pIdLocalidad
    ,pIdProvincia
    ,pX
    ,pY
);

    IF Error=-1 THEN
        SET vResultado = -1; 
    END IF;
    
END ;;
DELIMITER ;



DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertComplejo`(OUT `pIdComplejo` INT, IN `pNombre` VARCHAR(60), IN `pDescripcion` VARCHAR(200), IN `pEstacionamiento` TINYINT, IN `pBuffet` TINYINT, IN `pDuchas` TINYINT, IN `pParrillas` TINYINT, IN `pWiFi` TINYINT, IN `pHoraCobroLuz` TIME, IN `pPorcentajeSeña` INT, IN `pHorasCancelacion` INT, IN `pTiempoReserva` TIME, IN `pEmail` VARCHAR(60), IN `pIdEstado` INT, IN `pIdDuenio` INT, IN `pPorcentajeLuz` INT, IN `pNroCelular` INT, IN `pNroTelefono` INT)
    NO SQL
BEGIN

	DECLARE Error INT DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;

INSERT INTO Complejos 
(
	Nombre
	, Descripcion
	, Estacionamiento
	, Buffet
	, Duchas
    , Parrillas
    , WiFi
    , HoraCobroLuz
    , PorcentajeSeña
    , HorasCancelacion
    , Email
    , IdEstado
    , IdDuenio
    , PorcentajeLuz
    , nroCelular
    , nroTelefono
)
VALUES 
(
	pNombre
    , pDescripcion
    , pEstacionamiento
    , pBuffet
    , pDuchas
    , pParrillas
    , pWiFi
    , pHoraCobroLuz
    , pPorcentajeSeña
    , pHorasCancelacion
    , pEmail
    , pIdEstado
    , pIdDuenio
    , pPorcentajeLuz
    , pNroCelular
    , pNroTelefono
);

    IF Error=-1 THEN
        SET pIdComplejo = -1; 
    ELSE
		SET pIdComplejo = (SELECT MAX(IdComplejo) FROM Complejos);
    END IF;

END ;;
DELIMITER ;




DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getDuenio`(IN `pUsuario` VARCHAR(25), IN `pContrasenia` VARCHAR(20))
BEGIN 

    /*El SP devuelve el cliente para el usuario y contraseña ingresado*/
    /*call SP_getDuenio('CARMIE'  , 11);*/
    
    /*SELECT * , C.idComplejo*/
    SELECT C.idComplejo, P.*, C.*, d.*
    FROM personas as P
    INNER JOIN duenios as D ON P.idPersona = D.idPersona
    LEFT JOIN complejos as C ON D.idDuenio = C.idDuenio
    WHERE D.usuario = pUsuario 
    AND D.contrasenia = pContrasenia
    AND (D.idEstado = 2 or D.idEstado = 3); /*Aceptado*/
    
   
END ;;
DELIMITER ;



DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_getComplejoByIdDuenio`(IN `pIdDuenio` INT)
    NO SQL
BEGIN

DECLARE estadoDuenio INT;
    
set estadoDuenio = -1;

select IdEstado into estadoDuenio
from duenios
where IdDuenio = pIdDuenio;

if estadoDuenio = 2 THEN

SELECT *
FROM duenios DUE 
INNER JOIN dueniospendientes duepen
on due.IdDuenio = duepen.IdDuenio
inner join personas per 
on due.IdPersona = per.IdPersona
where due.IdDuenio = pIdDuenio;

ELSE 

select * 
from duenios due
inner join complejos com 
on due.IdDuenio = com.IdDuenio
inner join personas per 
on due.IdPersona = per.IdPersona
left join complejospagos cp
on com.IdComplejo = cp.IdComplejo
left join complejosdireccion cd
on com.IdComplejo = cd.IdComplejo
where due.IdDuenio = pIdDuenio;

end if;
END ;;
DELIMITER ;





















