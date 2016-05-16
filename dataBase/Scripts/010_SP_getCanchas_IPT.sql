DROP PROCEDURE IF EXISTS SP_getCanchas;

DELIMITER // 
CREATE PROCEDURE SP_getCanchas()

  /*El SP devuelve todas las canchas para los filtros elegidos*/
  /*call SP_getCanchas*/

  BEGIN 
    SELECT ca.IdCancha, ca.IdComplejo, ca.nombre as NombreCancha, ca.CantJugadores, ca.Techada, ca.Luz, ca.Precio,
    co.Nombre as NombreComplejo, prov.Nombre as Provincia, loc.Nombre as Localidad, ts.Descripcion as Superficie, cd.Calle, cd.Altura
    FROM canchas ca
    INNER JOIN complejos co ON co.IdComplejo = ca.IdComplejo
    INNER JOIN duenios d ON d.IdDuenio = co.IdDuenio
    INNER JOIN personas p ON p.IdPersona = d.IdPersona
    INNER JOIN complejosdireccion cd ON cd.IdComplejo = co.IdComplejo
    INNER JOIN provincias prov ON prov.IdProvincia = cd.IdProvincia 
    INNER JOIN localidades loc ON loc.IdLocalidad = cd.IdLocalidad AND loc.IdProvincia = prov.IdProvincia
    INNER JOIN tipossuperficie ts ON ts.IdSuperficie = ca.IdSuperficie
    WHERE ca.IdEstado = 1;
  END

