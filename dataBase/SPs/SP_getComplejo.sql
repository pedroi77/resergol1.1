USE resergol;

DROP PROCEDURE IF EXISTS SP_getComplejo; 

DELIMITER // 
CREATE PROCEDURE SP_getComplejo(
	pIdComplejo INT(11)
	)
BEGIN 

	SELECT CO.IdDuenio, CO.IdComplejo, CO.Nombre as nombreComplejo, P.Nombre AS Provincia, L.Nombre as Localidad,
	CD.Calle, CD.Altura, CO.nroTelefono, CO.nroCelular, CO.PorcentajeSeña as PorcentSenia, CO.Buffet, CO.Parrillas, CO.Duchas, CO.WiFi, CO.Estacionamiento,
	CO.HoraCobroLuz, CO.PorcentajeLuz, CO.HorasCancelacion, CO.Descripcion, COUNT(CA.IdCancha) as CantidadCanchas, CD.X, CD.Y
	FROM COMPLEJOS CO
	INNER JOIN CANCHAS CA
	ON CA.IdComplejo = CO.IdComplejo
	INNER JOIN complejosdireccion CD
	ON CD.IdComplejo = CO.IdComplejo
	INNER JOIN provincias p
	ON P.IdProvincia = CD.IdProvincia
	INNER JOIN localidades L
	ON L.IdProvincia = CD.IdProvincia AND L.IdLocalidad = CD.IdLocalidad
	WHERE CO.IdEstado = 1
	AND CO.IdComplejo = pIdComplejo
	GROUP BY CO.IdDuenio, CO.IdComplejo, CO.Nombre, P.Nombre, L.Nombre,
	CD.Calle, CD.Altura, CO.nroTelefono, CO.nroCelular, CO.PorcentajeSeña, CO.Buffet, CO.Parrillas, CO.Duchas, CO.WiFi, CO.Estacionamiento,
	CO.HoraCobroLuz, CO.PorcentajeLuz, CO.HorasCancelacion, CO.Descripcion, CD.X, CD.Y;

END 