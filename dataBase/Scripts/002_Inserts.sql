
use resergol;
/*estados de documentos*/
INSERT INTO DocEstados(Descripcion) VALUES('Activo');
INSERT INTO DocEstados(Descripcion) VALUES('Inactivo');
/*select * from DocEstados;*/

/*Tipos de documentos*/
INSERT INTO TiposDoc(Descripcion, IdEstado) VALUES('DNI', 1);
INSERT INTO TiposDoc(Descripcion, IdEstado) VALUES('CUIL', 1);
/*select * from TiposDoc;*/


/*estados del dueño*/
INSERT INTO DueniosEstados(Descripcion) VALUES('Pendiente');
INSERT INTO DueniosEstados(Descripcion) VALUES('Aceptado');
INSERT INTO DueniosEstados(Descripcion) VALUES('Activo');
INSERT INTO DueniosEstados(Descripcion) VALUES('Inactivo');
/*select * from DueniosEstados;*/

/*Estados del cliente*/
INSERT INTO clientesestados(Descripcion) VALUES('Activo');
INSERT INTO clientesestados(Descripcion) VALUES('Inactivo');




insert into Provincias values(1, 'Buenos Aires');
insert into Provincias values(2, 'Cordoba');

insert into Localidades values(1,1, 'Avellaneda');
insert into Localidades values(1,2, 'Lomas de Zamora');
insert into Localidades values(1,3, 'Adrogue');
insert into Localidades values(2,1, 'La falda');
insert into Localidades values(2,2, 'La cumbresita');

insert into administradores(Usuario, Contrasenia) values('ADMIN', '454545');


/*select CAST(contrasenia AS CHAR(10000) CHARACTER SET utf8)  from duenios;*/

/*Tipos de torneos*/
insert into tipotorneos (nombre) values ('Liga');
insert into tipotorneos (nombre) values ('Torneo');
 
/*Tipos de superficies*/
insert into TiposSuperficie(Descripcion) values('Alfombra');
insert into TiposSuperficie(Descripcion) values('Baldosa');
insert into TiposSuperficie(Descripcion) values('Cemento');
insert into TiposSuperficie(Descripcion) values('Césped');
insert into TiposSuperficie(Descripcion) values('Cesped sintético');
insert into TiposSuperficie(Descripcion) values('Tierra');

/*Torneos estados*/
insert into TorneosEstados(Descripcion) values ('Activo');
insert into TorneosEstados(Descripcion) values ('Inscripción');
insert into TorneosEstados(Descripcion) values ('Finalizado');

/*Dias*/
insert dias(Nombre) values ('Lunes');
insert dias(Nombre) values ('Martes');
insert dias(Nombre) values ('Miercoles');
insert dias(Nombre) values ('Jueves');
insert dias(Nombre) values ('Viernes');
insert dias(Nombre) values ('Sabado');
insert dias(Nombre) values ('Domingo');




insert into tipotorneosEquipos values(1,4);
insert into tipotorneosEquipos values(1,5);
insert into tipotorneosEquipos values(1,6);
insert into tipotorneosEquipos values(1,7);
insert into tipotorneosEquipos values(1,8);
insert into tipotorneosEquipos values(1,9);
insert into tipotorneosEquipos values(1,10);
insert into tipotorneosEquipos values(1,11);
insert into tipotorneosEquipos values(1,12);
insert into tipotorneosEquipos values(1,13);
insert into tipotorneosEquipos values(1,14);
insert into tipotorneosEquipos values(1,15);
insert into tipotorneosEquipos values(1,16);
insert into tipotorneosEquipos values(1,17);
insert into tipotorneosEquipos values(1,18);
insert into tipotorneosEquipos values(1,19);
insert into tipotorneosEquipos values(1,20);
insert into tipotorneosEquipos values(1,21);
insert into tipotorneosEquipos values(1,22);
insert into tipotorneosEquipos values(1,23);
insert into tipotorneosEquipos values(1,24);
insert into tipotorneosEquipos values(1,25);
insert into tipotorneosEquipos values(1,26);
insert into tipotorneosEquipos values(1,27);
insert into tipotorneosEquipos values(1,28);
insert into tipotorneosEquipos values(1,29);
insert into tipotorneosEquipos values(1,30);

insert into tipotorneosEquipos values(2,4);
insert into tipotorneosEquipos values(2,8);
insert into tipotorneosEquipos values(2,16);
insert into tipotorneosEquipos values(2,32);







