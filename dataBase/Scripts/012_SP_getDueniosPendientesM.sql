DROP PROCEDURE IF EXISTS SP_getDueniosPendientes

DELIMITER // 
CREATE PROCEDURE SP_getDueniosPendientes()

  /*El SP devuelve todos los dueños pendientes de aprobación*/
  /*call SP_getDueniosPendientes*/
  
BEGIN 
select due.Usuario, due.FechaAlta, duep.nombreComplejo, duep.NroTelef, duep.Calle, duep.Altura,prov.Nombre as Provincia, loc.Nombre as Localidad
    from duenios due
    inner join dueniospendientes duep
    on due.IdDuenio = duep.IdDuenio
    inner join localidades loc 
    on duep.IdLocalidad = loc.IdLocalidad
    and duep.IdProvincia = loc.IdProvincia
    inner join provincias prov
    on duep.IdProvincia = prov.IdProvincia
    where due.IdEstado = 1;
  END