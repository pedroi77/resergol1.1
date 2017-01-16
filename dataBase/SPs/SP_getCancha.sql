USE resergol;

DROP PROCEDURE IF EXISTS SP_getCancha; 

DELIMITER // 

CREATE PROCEDURE SP_getCancha(
	idCancha INT(11), 
	idComplejo INT(11)
	)
BEGIN 

SELECT CO.IdDuenio, CA.IdCancha, CA.nombre, CO.IdComplejo, CO.Nombre as Complejo, P.Nombre AS Provincia, L.Nombre as Localidad,
       CD.Calle, CD.Altura, CO.nroTelefono, CO.nroCelular, CA.CantJugadores, TS.Descripcion as Superficie, CA.Techada, CA.Luz,
       CA.Precio, CO.PorcentajeSeña as PorcentSenia, CO.Buffet, CO.Parrillas, CO.Duchas, CO.WiFi, CO.Estacionamiento, CO.HoraCobroLuz,
		CO.PorcentajeLuz, CO.HorasCancelacion, CD.X, CD.Y
FROM CANCHAS CA
INNER JOIN COMPLEJOS CO
	ON CA.IdComplejo = CO.IdComplejo
INNER JOIN complejosdireccion CD
	ON CD.IdComplejo = CO.IdComplejo
INNER JOIN provincias p
	ON P.IdProvincia = CD.IdProvincia
INNER JOIN localidades L
	ON L.IdProvincia = CD.IdProvincia AND L.IdLocalidad = CD.IdLocalidad
INNER JOIN tipossuperficie TS
	ON TS.IdSuperficie = CA.IdSuperficie
WHERE CA.IdEstado = 1 and CO.IdEstado = 1 AND
CA.IdCancha = idCancha AND CO.IdComplejo = idComplejo;

END 