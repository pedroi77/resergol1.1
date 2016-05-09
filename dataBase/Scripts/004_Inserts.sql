INSERT INTO `complejosestados`( `Descripcion`) VALUES ('Activo');
INSERT INTO `complejosestados`( `Descripcion`) VALUES ('Baja');

alter table complejos add column IdDuenio	    	INT 			NOT NULL;

INSERT INTO `complejos`( `Nombre`, `Descripcion`, `Estacionamiento`, `Buffet`, `Duchas`, `Parrillas`, `WiFi`, `HoraCobroLuz`, `PorcentajeSeña`, `HorasCancelacion`, `TiempoReserva`, `Email`, `IdEstado`, `IdDuenio` ) 
VALUES ('Open Gallo', 'primer complejo',1,1,1,1,1,80,50,24,5,'open@gmail.com',1, 2);


INSERT INTO `canchasestados`( `Descripcion`) VALUES ('Activo');
INSERT INTO `canchasestados`( `Descripcion`) VALUES ('Baja');




INSERT INTO `canchas`(`IdComplejo`, `IdCancha`, `nombre`, `CantJugadores`, `IdSuperficie`, `Techada`, `Luz`, `Precio`, `IdEstado`) 
VALUES (1,1, 'Maracana',5,1,1,1,200,1);



INSERT INTO `canchas`(`IdComplejo`, `IdCancha`, `nombre`, `CantJugadores`, `IdSuperficie`, `Techada`, `Luz`, `Precio`, `IdEstado`) 
VALUES (1,2, 'Monumental',11,2,1,1,300,1);



INSERT INTO `canchas`(`IdComplejo`, `IdCancha`, `nombre`, `CantJugadores`, `IdSuperficie`, `Techada`, `Luz`, `Precio`, `IdEstado`) 
VALUES (1,4, 'Fortin',7,3,1,1,200,1);



INSERT INTO `canchas`(`IdComplejo`, `IdCancha`, `nombre`, `CantJugadores`, `IdSuperficie`, `Techada`, `Luz`, `Precio`, `IdEstado`) 
VALUES (1,5, 'Fortaleza',11,4,1,1,200,1);



