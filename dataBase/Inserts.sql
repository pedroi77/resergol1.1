
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




insert into Provincias values(1, 'Buenos Aires');
insert into Provincias values(2, 'Cordoba');

insert into Localidades values(1,1, 'Avellaneda');
insert into Localidades values(1,2, 'Lomas de Zamora');
insert into Localidades values(1,3, 'Adrogue');
insert into Localidades values(2,1, 'La falda');
insert into Localidades values(2,2, 'La cumbresita');

insert into administradores(Usuario, Contrasenia) values('ADMIN', '454545');