
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