
use resergol;

CREATE TABLE DocEstados(	
IdEstado    INT     NOT NULL PRIMARY KEY AUTO_INCREMENT,
Descripcion	VARCHAR(30));



CREATE TABLE TiposDoc	(
IdTipoDoc	    INT         NOT NULL PRIMARY KEY AUTO_INCREMENT, 
Descripcion	  VARCHAR(30) NOT NULL,
IdEstado	    INT         NOT NULL,
FOREIGN KEY (IdEstado)
REFERENCES DocEstados(IdEstado) );




CREATE TABLE Personas(	
IdPersona	  INT           NOT NULL PRIMARY KEY AUTO_INCREMENT, 
Nombre	    VARCHAR(60)   NOT NULL,
Apellido	  VARCHAR(60)   NOT NULL,
IdTipoDoc	  INT           NOT NULL,
NroDoc	    INT           NOT NULL UNIQUE,   
Email	      VARCHAR(60)   NOT NULL UNIQUE,
FOREIGN KEY (IdTipoDoc)
REFERENCES TiposDoc(IdTipoDoc) );

CREATE TABLE DueniosEstados(	
IdEstado    INT           NOT NULL PRIMARY KEY AUTO_INCREMENT,  
Descripcion	VARCHAR(30)   NOT NULL );

CREATE TABLE Administradores(	 
Usuario	    VARCHAR(25) NOT NULL UNIQUE,
id          INT NOT NULL  PRIMARY KEY      AUTO_INCREMENT, 
Contrasenia   BLOB        NOT NULL);

CREATE TABLE ClientesEstados(	
IdEstado    INT           NOT NULL PRIMARY KEY AUTO_INCREMENT,  
Descripcion	VARCHAR(30)   NOT NULL );

	
CREATE TABLE Duenios(	
IdDuenio	    INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,  
IdPersona	    INT         NOT NULL,
Usuario	        VARCHAR(25) NOT NULL UNIQUE,
Contrasenia     BLOB        NOT NULL,
IdEstado	    INT         NOT NULL,
FechaAlta	    DATE        NOT NULL,
FechaBaja	    DATE        NULL,
FOREIGN KEY (IdPersona)
REFERENCES Personas(IdPersona),
FOREIGN KEY (IdEstado)
REFERENCES DueniosEstados(IdEstado) );




CREATE TABLE ComplejosEstados(	
IdEstado	  INT			    NOT NULL AUTO_INCREMENT,
Descripcion	VARCHAR(30) NOT NULL,
PRIMARY KEY (IdEstado)
);

CREATE TABLE Clientes (	
IdCliente	INT			NOT NULL AUTO_INCREMENT,
IdPersona	INT			NOT NULL,
Usuario	VARCHAR(25) NOT NULL UNIQUE,
Contrasenia	BLOB(30)	NOT NULL,
IdEstado	INT			NOT NULL,
FechaAlta	DATE		NOT NULL,	
FechaBaja	DATE		NULL,
PRIMARY KEY (IdCliente),
CONSTRAINT cliente_persona_fk FOREIGN KEY (IdPersona) REFERENCES Personas (IdPersona),
CONSTRAINT cliente_estado_fk  FOREIGN KEY (IdEstado) REFERENCES  ClientesEstados (IdEstado)
);

CREATE TABLE MarcasTarjetas	(
IdMarca	INT			NOT NULL AUTO_INCREMENT,
Nombre	VARCHAR(20) NOT NULL,
PRIMARY KEY (IdMarca)
);


CREATE TABLE ClientesPagos(	
IdCliente	INT			NOT NULL,
IdTarjeta	INT			NOT NULL, /*No me deja ponerla como autoincremental*/ 
IdMarca		INT			NOT NULL,
NroTarjeta	VARCHAR(16) NOT NULL,
PRIMARY KEY (IdCliente,IdTarjeta),
CONSTRAINT pagos_cliente_fk FOREIGN KEY (IdCliente) REFERENCES Clientes (IdCliente),
CONSTRAINT pagos_marca_fk FOREIGN KEY (IdMarca) REFERENCES MarcasTarjetas (IdMarca)
);



CREATE TABLE Complejos(	
IdComplejo			INT				NOT NULL AUTO_INCREMENT,
IdDuenio	    	INT 			NOT NULL,
Nombre				VARCHAR(60)		NOT NULL,
Descripcion			VARCHAR(200)	NOT NULL,
Estacionamiento		bool			NOT NULL,
Buffet				bool			NOT NULL,
Duchas				bool			NOT NULL,
Parrillas			bool			NOT NULL,
WiFi				bool			NOT NULL,
HoraCobroLuz		time			NOT NULL,
PorcentajeSeña		INT				NOT NULL,
HorasCancelacion	INT				NOT NULL,
TiempoReserva		time			NOT NULL,
Email				VARCHAR(60)		NOT NULL,
IdEstado			INT				NOT NULL,
PRIMARY KEY (IdComplejo),
CONSTRAINT complejos_estados_fk FOREIGN KEY (IdEstado) REFERENCES  ComplejosEstados(IdEstado),
CONSTRAINT duenio_com_fk FOREIGN KEY (IdDuenio) REFERENCES  duenios(IdDuenio)
);

CREATE TABLE ListaNegra(	
IdComplejo		INT		NOT NULL,		
IdCliente		INT		NOT NULL,
FechaIngreso	DATE	NOT NULL,
PRIMARY KEY (IdComplejo, IdCliente),
CONSTRAINT ListaNegra_complejo_fk FOREIGN KEY (IdComplejo) REFERENCES  Complejos(IdComplejo),
CONSTRAINT ListaNegra_Cliente_fk FOREIGN KEY (IdCliente) REFERENCES  Clientes(IdCliente)
);


CREATE TABLE CanchasEstados(	
IdEstado	  INT           NOT NULL AUTO_INCREMENT,
Descripcion VARCHAR(30)   NOT NULL,  
PRIMARY KEY (IdEstado)
);

CREATE TABLE Canchas(	
IdComplejo	    INT          NOT NULL,
IdCancha	      INT          NOT NULL, 
nombre	        VARCHAR(30)  NOT NULL,
CantJugadores	  INT          NOT NULL,
IdSuperficie	  INT          NOT NULL,
Techada	        BOOL         NOT NULL,
Luz	            BOOL         NOT NULL,
Precio	        DECIMAL(6,2) NOT NULL,
IdEstado	      INT          NOT NULL,
PRIMARY KEY (IdComplejo,IdCancha),
CONSTRAINT Canchas_complejo_fk FOREIGN KEY (IdComplejo) REFERENCES  Complejos(IdComplejo),
CONSTRAINT Canchas_Estados_fk  FOREIGN KEY (IdEstado)   REFERENCES  CanchasEstados(IdEstado)
);


CREATE TABLE CanchasComentarios(	
IdComentario	INT             NOT NULL AUTO_INCREMENT,
IdComplejo	  INT             NOT NULL,
IdCancha	    INT             NOT NULL,
IdCliente	    INT             NOT NULL,
Comentario	  VARCHAR(300)    NOT NULL,  
Fecha	        DATETIME        NOT NULL,
PRIMARY KEY (IdComentario),
CONSTRAINT CanchasComentarios_Canchas_fk FOREIGN KEY (IdComplejo,IdCancha) REFERENCES  Canchas(IdComplejo,IdCancha),
CONSTRAINT CanchasComentarios_Clientes_fk  FOREIGN KEY (IdCliente)   REFERENCES  Clientes(IdCliente)
);


CREATE TABLE CanchasPuntuacion(	
IdPuntuacion	INT         NOT NULL AUTO_INCREMENT,
IdComplejo	  INT         NOT NULL,
IdCancha	    INT         NOT NULL,
IdCliente	    INT         NOT NULL,
Puntaje	      INT         NOT NULL,  
Fecha	        DATETIME    NOT NULL,
PRIMARY KEY (IdPuntuacion),
CONSTRAINT CanchassPuntuacion_Canchas_fk FOREIGN KEY (IdComplejo,IdCancha) REFERENCES  Canchas(IdComplejo,IdCancha),
CONSTRAINT CanchasPuntuacion_Clientes_fk  FOREIGN KEY (IdCliente)   REFERENCES  Clientes(IdCliente)
);

CREATE TABLE ReservasEstados(	
IdEstado	    INT          NOT NULL AUTO_INCREMENT,
Descripcion	  VARCHAR(30)  NOT NULL,
PRIMARY KEY (IdEstado)
);

CREATE TABLE Reservas(	
IdReserva	      INT     NOT NULL AUTO_INCREMENT,
IdComplejo	    INT     NOT NULL,
IdCancha	      INT     NOT NULL,
IdCliente	      INT     NOT NULL,
Fecha	          DATE    NOT NULL,
HoraInicio	    TIME    NOT NULL,
HoraFin	        TIME    NOT NULL,
Precio	        DOUBLE  NOT NULL,
PorcentajePago  INT     NOT NULL,
IdEstado	      INT     NOT NULL,
PRIMARY KEY (IdReserva),
CONSTRAINT Reservas_Canchas_fk   FOREIGN KEY (IdComplejo,IdCancha) REFERENCES  Canchas(IdComplejo,IdCancha),
CONSTRAINT Reservas_Clientes_fk  FOREIGN KEY (IdCliente)   REFERENCES  Clientes(IdCliente),
CONSTRAINT Reservas_Estados_fk   FOREIGN KEY (IdEstado)   REFERENCES  ReservasEstados(IdEstado)
);


CREATE TABLE Provincias	(
IdProvincia	INT         NOT NULL,
Nombre	    VARCHAR(30) NOT NULL,
PRIMARY KEY (IdProvincia)
);

CREATE TABLE Localidades(	
IdProvincia	INT         NOT NULL,
IdLocalidad	INT         NOT NULL,
Nombre	    VARCHAR(40) NOT NULL,
PRIMARY KEY (IdProvincia,IdLocalidad),
CONSTRAINT Localidades_Provincias_fk   FOREIGN KEY (IdProvincia) REFERENCES Provincias(IdProvincia)
);

CREATE TABLE DueniosPendientes(
IdDuenio   	      INT           NOT NULL,
nombreComplejo    VARCHAR(60)   NOT NULL,
NroTelef          VARCHAR(15)   NOT NULL, 
Calle	          VARCHAR(40)   NOT NULL,
Altura	          INT           NOT NULL,
IdLocalidad	      INT           NOT NULL,
IdProvincia	      INT           NOT NULL,
PRIMARY KEY (IdDuenio),
CONSTRAINT Duenio_ProvLoc_fk   FOREIGN KEY (IdProvincia,IdLocalidad) REFERENCES Localidades(IdProvincia,IdLocalidad),
CONSTRAINT Duenio_fk   FOREIGN KEY (IdDuenio) REFERENCES Duenios(IdDuenio)
);



CREATE TABLE ComplejosDireccion	(
IdComplejo	INT           NOT NULL,
Calle	      VARCHAR(40)   NOT NULL,
Altura	    INT           NOT NULL,
IdLocalidad	INT           NOT NULL,
IdProvincia	INT           NOT NULL,
CP	        INT           NOT NULL,
X	          INT           NOT NULL,
Y           INT           NOT NULL,
PRIMARY KEY (IdComplejo),
CONSTRAINT Direccion_ProvLoc_fk   FOREIGN KEY (IdProvincia,IdLocalidad) REFERENCES Localidades(IdProvincia,IdLocalidad)
);

CREATE TABLE ComplejosPagos(	
IdComplejo	INT             NOT NULL,
CBU	        VARCHAR(22)     NOT NULL,
NroCuenta	  VARCHAR(18)     NOT NULL,
PRIMARY KEY(IdComplejo)
);


CREATE TABLE ComplejosComentarios(	
IdComentario	INT             NOT NULL AUTO_INCREMENT,
IdComplejo	  INT             NOT NULL,
IdCliente	    INT             NOT NULL,
Comentario 	  VARCHAR(300)    NOT NULL,
Fecha	        DATE            NOT NULL,
PRIMARY KEY(IdComentario),
CONSTRAINT ComplejosComentarios_Complejo_fk FOREIGN KEY (IdComplejo) REFERENCES  Complejos(IdComplejo),
CONSTRAINT ComplejosComentarios_Clientes_fk  FOREIGN KEY (IdCliente)   REFERENCES  Clientes(IdCliente)
);

CREATE TABLE ComplejosPuntuacion(	
IdPuntuacion	  INT       NOT NULL AUTO_INCREMENT,
IdComplejo	    INT       NOT NULL,  
IdCliente	      INT       NOT NULL,
Puntaje	        INT       NOT NULL,
Fecha	          DATETIME  NOT NULL,
PRIMARY KEY(IdPuntuacion),
CONSTRAINT ComplejosPuntuacion_Complejo_fk FOREIGN KEY (IdComplejo) REFERENCES  Complejos(IdComplejo),
CONSTRAINT ComplejosPuntuacion_Clientes_fk  FOREIGN KEY (IdCliente)   REFERENCES  Clientes(IdCliente)
);


CREATE TABLE ComplejosTelefonos(	
IdComplejo	INT         NOT NULL,
IdTelef	INT         NOT NULL,
NroTelef	  VARCHAR(15) NOT NULL,
PRIMARY KEY(IdComplejo,IdTelef),
CONSTRAINT Telefono_Complejo_fk FOREIGN KEY (IdComplejo) REFERENCES  Complejos(IdComplejo)
);

CREATE TABLE TipoTorneos(	
IdTipoTorneo	INT         NOT NULL AUTO_INCREMENT,
Nombre	      VARCHAR(30) NOT NULL,
PRIMARY KEY(IdTipoTorneo)
);


CREATE TABLE Puntuaciones(	
IdPuntuacion	INT         NOT NULL AUTO_INCREMENT,
Puntos	      INT         NOT NULL,
Descripcion	  VARCHAR(30) NOT NULL,
PRIMARY KEY(IdPuntuacion)
);


CREATE TABLE Dias(	
IdDia	  INT           NOT NULL AUTO_INCREMENT,
Nombre	VARCHAR(10)   NOT NULL,
idDiaEquivalente INT,
PRIMARY KEY(IdDia)
);


CREATE TABLE ComplejosDias(	
IdComplejo	INT   NOT NULL,
IdDiaDesde	INT   NOT NULL,
IdDiaHasta	INT   NOT NULL,
HoraDesde	  TIME  NOT NULL,
HoraHasta	  TIME  NOT NULL,
PRIMARY KEY(IdComplejo,IdDiaDesde,IdDiaHasta),
CONSTRAINT DiaDesde_Dias_fk  FOREIGN KEY (IdDiaDesde)   REFERENCES  Dias(IdDia),
CONSTRAINT DiaHasta_Dias_fk  FOREIGN KEY (IdDiaHasta)   REFERENCES  Dias(IdDia)
);


CREATE TABLE TiposSuperficie(	
IdSuperficie	INT         NOT NULL AUTO_INCREMENT,
Descripcion	  VARCHAR(30) NOT NULL,
PRIMARY KEY(IdSuperficie)
);

CREATE TABLE TorneosEstados	(
IdEstado	  INT           NOT NULL AUTO_INCREMENT,
Descripcion	VARCHAR(30)   NOT NULL,
PRIMARY KEY(IdEstado)
);
	
    
CREATE TABLE EquiposEstados	(
IdEstado	  INT           NOT NULL AUTO_INCREMENT,
Descripcion	VARCHAR(30)   NOT NULL,
PRIMARY KEY(IdEstado)
);


CREATE TABLE Torneos(	
IdTorneo	        INT          NOT NULL AUTO_INCREMENT,
IdDuenio	        INT          NOT NULL,
IdTipoTorneo	    INT          NOT NULL,
Nombre	          VARCHAR(30)  NOT NULL,
CantEquipos	      INT          NOT NULL,
CantJugadores	    INT          NOT NULL,
IdSuperficie	    INT          NOT NULL,
IdaYvuelta	      BOOL         NOT NULL,
tiempoPartido       INT         NOT NULL,
PrecioInscripcion	DOUBLE(6,2)  NOT NULL,
FecIniInscripcion	DATE         NOT NULL,
FecFinInscripcion	DATE         NOT NULL,
HorasCancelacion	INT          NOT NULL,
FechaInicio	      DATE         NOT NULL,
FechaFin	        DATE         NOT NULL,
Descripcion	      VARCHAR(300) NOT NULL,
Reglas	          VARCHAR(300) NOT NULL,
IdEstado	        INT          NOT NULL,
PRIMARY KEY(IdTorneo),
CONSTRAINT Torneo_duenio_fk FOREIGN KEY (IdDuenio) REFERENCES  Duenios(IdDuenio),
CONSTRAINT Torneo_Tipos_fk FOREIGN KEY (IdTipoTorneo) REFERENCES  TipoTorneos(IdTipoTorneo),
CONSTRAINT Torneo_Superficie_fk FOREIGN KEY (IdSuperficie) REFERENCES  TiposSuperficie(IdSuperficie),
CONSTRAINT Torneo_Estados_fk FOREIGN KEY (IdEstado) REFERENCES  TorneosEstados(IdEstado)
);



CREATE TABLE Equipos(	
IdEquipo	INT         NOT NULL AUTO_INCREMENT,
IdCliente	INT         NOT NULL,
Nombre	VARCHAR(30)   NOT NULL,
imagen	BLOB          NULL,
PRIMARY KEY(IdEquipo),
CONSTRAINT Equipo_Cliente_fk FOREIGN KEY (IdCliente) REFERENCES  Clientes(IdCliente)
);


CREATE TABLE TorneosEquipos(	
IdTorneo	INT     NOT NULL,
IdEquipo	INT     NOT NULL,
IdEstado	INT     NOT NULL,
PRIMARY KEY(IdTorneo,IdEquipo),
CONSTRAINT TorneoEquipo_Torneo_fk FOREIGN KEY (IdTorneo) REFERENCES  Torneos(IdTorneo),
CONSTRAINT TorneoEquipo_Equipo_fk FOREIGN KEY (IdEquipo) REFERENCES  Equipos(IdEquipo),
CONSTRAINT TorneoEquipo_Estado_fk FOREIGN KEY (IdEstado) REFERENCES  TorneosEstados(IdEstado)
);


CREATE TABLE Fixture (	
IdTorneo	INT NOT NULL,
IdFecha	  INT NOT NULL,
IdReserva	INT NOT NULL,
IdEquipo1	INT NOT NULL,
IdEquipo2	INT NOT NULL,
Gol1	    INT NOT NULL,
Gol2	    INT NOT NULL,
PRIMARY KEY(IdTorneo,IdFecha),
CONSTRAINT Fixture_Torneo_fk FOREIGN KEY (IdTorneo) REFERENCES  Torneos(IdTorneo),
CONSTRAINT Fixture_Equipo1_fk FOREIGN KEY (IdEquipo1) REFERENCES  Equipos(IdEquipo),
CONSTRAINT Fixture_Equipo2_fk FOREIGN KEY (IdEquipo2) REFERENCES  Equipos(IdEquipo)
);


CREATE TABLE PuntajesPorFechas	(
IdTorneo	  INT NOT NULL,
IdFecha	    INT NOT NULL,
IdEquipo	  INT NOT NULL,
CantPuntos	INT NOT NULL,
Jugados	    INT NOT NULL,
Ganados	    INT NOT NULL,
Empatados	  INT NOT NULL,
Perdidos	  INT NOT NULL,
PRIMARY KEY(IdTorneo,IdFecha),
CONSTRAINT PuntajesPorFechas_Torneo_fk FOREIGN KEY (IdTorneo) REFERENCES  Torneos(IdTorneo),
CONSTRAINT PuntajesPorFechas_Equipo_fk FOREIGN KEY (IdEquipo) REFERENCES  Equipos(IdEquipo)
);


CREATE TABLE Devoluciones(	
IdDevolucion	INT         NOT NULL AUTO_INCREMENT,
IdDuenio	    INT         NOT NULL, 
IdCliente	    INT         NOT NULL ,
Monto	        DOUBLE(6,2) NOT NULL,
PRIMARY KEY(IdDevolucion),
CONSTRAINT Devoluciones_Duenio_fk FOREIGN KEY (IdDuenio) REFERENCES  Duenios(IdDuenio),
CONSTRAINT Devoluciones_Cliente_fk FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente)
);


CREATE TABLE CanchasImagenes(	
IdComplejo	INT     NOT NULL, 
IdCancha	  INT     NOT NULL,   
IdImagen	  INT     NOT NULL, 
Imagen	    VARCHAR(150)    NOT NULL, 
PRIMARY KEY(IdComplejo,IdCancha,IdImagen),
CONSTRAINT Imagenes_Canchas_fk   FOREIGN KEY (IdComplejo,IdCancha) REFERENCES  Canchas(IdComplejo,IdCancha)
);

CREATE TABLE ComplejosImagenes(	
IdComplejo	INT     NOT NULL, 
IdImagen	  INT     NOT NULL, 
Imagen	    BLOB    NOT NULL, 
PRIMARY KEY(IdComplejo,IdImagen),
CONSTRAINT Imagenes_Complejos_fk   FOREIGN KEY (IdComplejo) REFERENCES  Complejos(IdComplejo)
);



CREATE TABLE TorneosImagenes(	
IdTorneo   	INT     NOT NULL, 
url	    VARCHAR(150)    NOT NULL,
fechaAlta DATE NOT NULL,
PRIMARY KEY(IdTorneo,url),
CONSTRAINT Imagenes_Torneos_fk   FOREIGN KEY (IdTorneo) REFERENCES  Torneos(IdTorneo)
);



use resergol;

CREATE TABLE DocEstados(	
IdEstado    INT     NOT NULL PRIMARY KEY AUTO_INCREMENT,
Descripcion	VARCHAR(30));



CREATE TABLE TiposDoc	(
IdTipoDoc	    INT         NOT NULL PRIMARY KEY AUTO_INCREMENT, 
Descripcion	  VARCHAR(30) NOT NULL,
IdEstado	    INT         NOT NULL,
FOREIGN KEY (IdEstado)
REFERENCES DocEstados(IdEstado) );




CREATE TABLE Personas(	
IdPersona	  INT           NOT NULL PRIMARY KEY AUTO_INCREMENT, 
Nombre	    VARCHAR(60)   NOT NULL,
Apellido	  VARCHAR(60)   NOT NULL,
IdTipoDoc	  INT           NOT NULL,
NroDoc	    INT           NOT NULL UNIQUE,   
Email	      VARCHAR(60)   NOT NULL UNIQUE,
FOREIGN KEY (IdTipoDoc)
REFERENCES TiposDoc(IdTipoDoc) );

CREATE TABLE DueniosEstados(	
IdEstado    INT           NOT NULL PRIMARY KEY AUTO_INCREMENT,  
Descripcion	VARCHAR(30)   NOT NULL );

CREATE TABLE Administradores(	 
Usuario	    VARCHAR(25) NOT NULL UNIQUE,
id          INT NOT NULL  PRIMARY KEY      AUTO_INCREMENT, 
Contrasenia   BLOB        NOT NULL);

CREATE TABLE ClientesEstados(	
IdEstado    INT           NOT NULL PRIMARY KEY AUTO_INCREMENT,  
Descripcion	VARCHAR(30)   NOT NULL );

	
CREATE TABLE Duenios(	
IdDuenio	    INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,  
IdPersona	    INT         NOT NULL,
Usuario	        VARCHAR(25) NOT NULL UNIQUE,
Contrasenia     BLOB        NOT NULL,
IdEstado	    INT         NOT NULL,
FechaAlta	    DATE        NOT NULL,
FechaBaja	    DATE        NULL,
FOREIGN KEY (IdPersona)
REFERENCES Personas(IdPersona),
FOREIGN KEY (IdEstado)
REFERENCES DueniosEstados(IdEstado) );




CREATE TABLE ComplejosEstados(	
IdEstado	  INT			    NOT NULL AUTO_INCREMENT,
Descripcion	VARCHAR(30) NOT NULL,
PRIMARY KEY (IdEstado)
);

CREATE TABLE Clientes (	
IdCliente	INT			NOT NULL AUTO_INCREMENT,
IdPersona	INT			NOT NULL,
Usuario	VARCHAR(25) NOT NULL UNIQUE,
Contrasenia	BLOB(30)	NOT NULL,
IdEstado	INT			NOT NULL,
FechaAlta	DATE		NOT NULL,	
FechaBaja	DATE		NULL,
PRIMARY KEY (IdCliente),
CONSTRAINT cliente_persona_fk FOREIGN KEY (IdPersona) REFERENCES Personas (IdPersona),
CONSTRAINT cliente_estado_fk  FOREIGN KEY (IdEstado) REFERENCES  ClientesEstados (IdEstado)
);

CREATE TABLE MarcasTarjetas	(
IdMarca	INT			NOT NULL AUTO_INCREMENT,
Nombre	VARCHAR(20) NOT NULL,
PRIMARY KEY (IdMarca)
);


CREATE TABLE ClientesPagos(	
IdCliente	INT			NOT NULL,
IdTarjeta	INT			NOT NULL, /*No me deja ponerla como autoincremental*/ 
IdMarca		INT			NOT NULL,
NroTarjeta	VARCHAR(16) NOT NULL,
PRIMARY KEY (IdCliente,IdTarjeta),
CONSTRAINT pagos_cliente_fk FOREIGN KEY (IdCliente) REFERENCES Clientes (IdCliente),
CONSTRAINT pagos_marca_fk FOREIGN KEY (IdMarca) REFERENCES MarcasTarjetas (IdMarca)
);



CREATE TABLE Complejos(	
IdComplejo			INT				NOT NULL AUTO_INCREMENT,
Nombre				VARCHAR(60)		NOT NULL,
Descripcion			VARCHAR(200)	NOT NULL,
Estacionamiento		bool			NOT NULL,
Buffet				bool			NOT NULL,
Duchas				bool			NOT NULL,
Parrillas			bool			NOT NULL,
WiFi				bool			NOT NULL,
HoraCobroLuz		time			NOT NULL,
PorcentajeSeña		INT				NOT NULL,
HorasCancelacion	INT				NOT NULL,
TiempoReserva		time			NOT NULL,
Email				VARCHAR(60)		NOT NULL,
IdEstado			INT				NOT NULL,
PRIMARY KEY (IdComplejo),
CONSTRAINT complejos_estados_fk FOREIGN KEY (IdEstado) REFERENCES  ComplejosEstados(IdEstado)
);

CREATE TABLE ListaNegra(	
IdComplejo		INT		NOT NULL,		
IdCliente		INT		NOT NULL,
FechaIngreso	DATE	NOT NULL,
PRIMARY KEY (IdComplejo, IdCliente),
CONSTRAINT ListaNegra_complejo_fk FOREIGN KEY (IdComplejo) REFERENCES  Complejos(IdComplejo),
CONSTRAINT ListaNegra_Cliente_fk FOREIGN KEY (IdCliente) REFERENCES  Clientes(IdCliente)
);


CREATE TABLE CanchasEstados(	
IdEstado	  INT           NOT NULL AUTO_INCREMENT,
Descripcion VARCHAR(30)   NOT NULL,  
PRIMARY KEY (IdEstado)
);

CREATE TABLE Canchas(	
IdComplejo	    INT          NOT NULL,
IdCancha	      INT          NOT NULL, 
nombre	        VARCHAR(30)  NOT NULL,
CantJugadores	  INT          NOT NULL,
IdSuperficie	  INT          NOT NULL,
Techada	        BOOL         NOT NULL,
Luz	            BOOL         NOT NULL,
Precio	        DECIMAL(6,2) NOT NULL,
IdEstado	      INT          NOT NULL,
PRIMARY KEY (IdComplejo,IdCancha),
CONSTRAINT Canchas_complejo_fk FOREIGN KEY (IdComplejo) REFERENCES  Complejos(IdComplejo),
CONSTRAINT Canchas_Estados_fk  FOREIGN KEY (IdEstado)   REFERENCES  CanchasEstados(IdEstado)
);


CREATE TABLE CanchasComentarios(	
IdComentario	INT             NOT NULL AUTO_INCREMENT,
IdComplejo	  INT             NOT NULL,
IdCancha	    INT             NOT NULL,
IdCliente	    INT             NOT NULL,
Comentario	  VARCHAR(300)    NOT NULL,  
Fecha	        DATETIME        NOT NULL,
PRIMARY KEY (IdComentario),
CONSTRAINT CanchasComentarios_Canchas_fk FOREIGN KEY (IdComplejo,IdCancha) REFERENCES  Canchas(IdComplejo,IdCancha),
CONSTRAINT CanchasComentarios_Clientes_fk  FOREIGN KEY (IdCliente)   REFERENCES  Clientes(IdCliente)
);


CREATE TABLE CanchasPuntuacion(	
IdPuntuacion	INT         NOT NULL AUTO_INCREMENT,
IdComplejo	  INT         NOT NULL,
IdCancha	    INT         NOT NULL,
IdCliente	    INT         NOT NULL,
Puntaje	      INT         NOT NULL,  
Fecha	        DATETIME    NOT NULL,
PRIMARY KEY (IdPuntuacion),
CONSTRAINT CanchassPuntuacion_Canchas_fk FOREIGN KEY (IdComplejo,IdCancha) REFERENCES  Canchas(IdComplejo,IdCancha),
CONSTRAINT CanchasPuntuacion_Clientes_fk  FOREIGN KEY (IdCliente)   REFERENCES  Clientes(IdCliente)
);

CREATE TABLE ReservasEstados(	
IdEstado	    INT          NOT NULL AUTO_INCREMENT,
Descripcion	  VARCHAR(30)  NOT NULL,
PRIMARY KEY (IdEstado)
);

CREATE TABLE Reservas(	
IdReserva	      INT     NOT NULL AUTO_INCREMENT,
IdComplejo	    INT     NOT NULL,
IdCancha	      INT     NOT NULL,
IdCliente	      INT     NOT NULL,
Fecha	          DATE    NOT NULL,
HoraInicio	    TIME    NOT NULL,
HoraFin	        TIME    NOT NULL,
Precio	        DOUBLE  NOT NULL,
PorcentajePago  INT     NOT NULL,
IdEstado	      INT     NOT NULL,
PRIMARY KEY (IdReserva),
CONSTRAINT Reservas_Canchas_fk   FOREIGN KEY (IdComplejo,IdCancha) REFERENCES  Canchas(IdComplejo,IdCancha),
CONSTRAINT Reservas_Clientes_fk  FOREIGN KEY (IdCliente)   REFERENCES  Clientes(IdCliente),
CONSTRAINT Reservas_Estados_fk   FOREIGN KEY (IdEstado)   REFERENCES  ReservasEstados(IdEstado)
);


CREATE TABLE Provincias	(
IdProvincia	INT         NOT NULL,
Nombre	    VARCHAR(30) NOT NULL,
PRIMARY KEY (IdProvincia)
);

CREATE TABLE Localidades(	
IdProvincia	INT         NOT NULL,
IdLocalidad	INT         NOT NULL,
Nombre	    VARCHAR(40) NOT NULL,
PRIMARY KEY (IdProvincia,IdLocalidad),
CONSTRAINT Localidades_Provincias_fk   FOREIGN KEY (IdProvincia) REFERENCES Provincias(IdProvincia)
);

CREATE TABLE DueniosPendientes(
IdDuenio   	      INT           NOT NULL,
nombreComplejo    VARCHAR(60)   NOT NULL,
NroTelef          VARCHAR(15)   NOT NULL, 
Calle	          VARCHAR(40)   NOT NULL,
Altura	          INT           NOT NULL,
IdLocalidad	      INT           NOT NULL,
IdProvincia	      INT           NOT NULL,
PRIMARY KEY (IdDuenio),
CONSTRAINT Duenio_ProvLoc_fk   FOREIGN KEY (IdProvincia,IdLocalidad) REFERENCES Localidades(IdProvincia,IdLocalidad),
CONSTRAINT Duenio_fk   FOREIGN KEY (IdDuenio) REFERENCES Duenios(IdDuenio)
);



CREATE TABLE ComplejosDireccion	(
IdComplejo	INT           NOT NULL,
Calle	      VARCHAR(40)   NOT NULL,
Altura	    INT           NOT NULL,
IdLocalidad	INT           NOT NULL,
IdProvincia	INT           NOT NULL,
CP	        INT           NOT NULL,
X	          INT           NOT NULL,
Y           INT           NOT NULL,
PRIMARY KEY (IdComplejo),
CONSTRAINT Direccion_ProvLoc_fk   FOREIGN KEY (IdProvincia,IdLocalidad) REFERENCES Localidades(IdProvincia,IdLocalidad)
);

CREATE TABLE ComplejosPagos(	
IdComplejo	INT             NOT NULL,
CBU	        VARCHAR(22)     NOT NULL,
NroCuenta	  VARCHAR(18)     NOT NULL,
PRIMARY KEY(IdComplejo)
);


CREATE TABLE ComplejosComentarios(	
IdComentario	INT             NOT NULL AUTO_INCREMENT,
IdComplejo	  INT             NOT NULL,
IdCliente	    INT             NOT NULL,
Comentario 	  VARCHAR(300)    NOT NULL,
Fecha	        DATE            NOT NULL,
PRIMARY KEY(IdComentario),
CONSTRAINT ComplejosComentarios_Complejo_fk FOREIGN KEY (IdComplejo) REFERENCES  Complejos(IdComplejo),
CONSTRAINT ComplejosComentarios_Clientes_fk  FOREIGN KEY (IdCliente)   REFERENCES  Clientes(IdCliente)
);

CREATE TABLE ComplejosPuntuacion(	
IdPuntuacion	  INT       NOT NULL AUTO_INCREMENT,
IdComplejo	    INT       NOT NULL,  
IdCliente	      INT       NOT NULL,
Puntaje	        INT       NOT NULL,
Fecha	          DATETIME  NOT NULL,
PRIMARY KEY(IdPuntuacion),
CONSTRAINT ComplejosPuntuacion_Complejo_fk FOREIGN KEY (IdComplejo) REFERENCES  Complejos(IdComplejo),
CONSTRAINT ComplejosPuntuacion_Clientes_fk  FOREIGN KEY (IdCliente)   REFERENCES  Clientes(IdCliente)
);


CREATE TABLE ComplejosTelefonos(	
IdComplejo	INT         NOT NULL,
IdTelef	INT         NOT NULL,
NroTelef	  VARCHAR(15) NOT NULL,
PRIMARY KEY(IdComplejo,IdTelef),
CONSTRAINT Telefono_Complejo_fk FOREIGN KEY (IdComplejo) REFERENCES  Complejos(IdComplejo)
);

CREATE TABLE TipoTorneos(	
IdTipoTorneo	INT         NOT NULL AUTO_INCREMENT,
Nombre	      VARCHAR(30) NOT NULL,
PRIMARY KEY(IdTipoTorneo)
);


CREATE TABLE Puntuaciones(	
IdPuntuacion	INT         NOT NULL AUTO_INCREMENT,
Puntos	      INT         NOT NULL,
Descripcion	  VARCHAR(30) NOT NULL,
PRIMARY KEY(IdPuntuacion)
);


CREATE TABLE Dias(	
IdDia	  INT           NOT NULL AUTO_INCREMENT,
Nombre	VARCHAR(10)   NOT NULL,
PRIMARY KEY(IdDia)
);


CREATE TABLE ComplejosDias(	
IdComplejo	INT   NOT NULL,
IdDiaDesde	INT   NOT NULL,
IdDiaHasta	INT   NOT NULL,
HoraDesde	  TIME  NOT NULL,
HoraHasta	  TIME  NOT NULL,
PRIMARY KEY(IdComplejo,IdDiaDesde,IdDiaHasta),
CONSTRAINT DiaDesde_Dias_fk  FOREIGN KEY (IdDiaDesde)   REFERENCES  Dias(IdDia),
CONSTRAINT DiaHasta_Dias_fk  FOREIGN KEY (IdDiaHasta)   REFERENCES  Dias(IdDia)
);


CREATE TABLE TiposSuperficie(	
IdSuperficie	INT         NOT NULL AUTO_INCREMENT,
Descripcion	  VARCHAR(30) NOT NULL,
PRIMARY KEY(IdSuperficie)
);

CREATE TABLE TorneosEstados	(
IdEstado	  INT           NOT NULL AUTO_INCREMENT,
Descripcion	VARCHAR(30)   NOT NULL,
PRIMARY KEY(IdEstado)
);
	
    
CREATE TABLE EquiposEstados	(
IdEstado	  INT           NOT NULL AUTO_INCREMENT,
Descripcion	VARCHAR(30)   NOT NULL,
PRIMARY KEY(IdEstado)
);


CREATE TABLE Torneos(	
IdTorneo	        INT          NOT NULL AUTO_INCREMENT,
IdDuenio	        INT          NOT NULL,
IdTipoTorneo	    INT          NOT NULL,
Nombre	          VARCHAR(30)  NOT NULL,
CantEquipos	      INT          NOT NULL,
CantJugadores	    INT          NOT NULL,
IdSuperficie	    INT          NOT NULL,
IdaYvuelta	      BOOL         NOT NULL,
PrecioInscripcion	DOUBLE(6,2)  NOT NULL,
FecIniInscripcion	DATE         NOT NULL,
FecFinInscripcion	DATE         NOT NULL,
HorasCancelacion	INT          NOT NULL,
FechaInicio	      DATE         NOT NULL,
FechaFin	        DATE         NOT NULL,
Descripcion	      VARCHAR(300) NOT NULL,
Reglas	          VARCHAR(300) NOT NULL,
IdEstado	        INT          NOT NULL,
PRIMARY KEY(IdTorneo),
CONSTRAINT Torneo_duenio_fk FOREIGN KEY (IdDuenio) REFERENCES  Duenios(IdDuenio),
CONSTRAINT Torneo_Tipos_fk FOREIGN KEY (IdTipoTorneo) REFERENCES  TipoTorneos(IdTipoTorneo),
CONSTRAINT Torneo_Superficie_fk FOREIGN KEY (IdSuperficie) REFERENCES  TiposSuperficie(IdSuperficie),
CONSTRAINT Torneo_Estados_fk FOREIGN KEY (IdEstado) REFERENCES  TorneosEstados(IdEstado)
);



CREATE TABLE Equipos(	
IdEquipo	INT         NOT NULL AUTO_INCREMENT,
IdCliente	INT         NOT NULL,
Nombre	VARCHAR(30)   NOT NULL,
imagen	BLOB          NULL,
PRIMARY KEY(IdEquipo),
CONSTRAINT Equipo_Cliente_fk FOREIGN KEY (IdCliente) REFERENCES  Clientes(IdCliente)
);


CREATE TABLE TorneosEquipos(	
IdTorneo	INT     NOT NULL,
IdEquipo	INT     NOT NULL,
IdEstado	INT     NOT NULL,
PRIMARY KEY(IdTorneo,IdEquipo),
CONSTRAINT TorneoEquipo_Torneo_fk FOREIGN KEY (IdTorneo) REFERENCES  Torneos(IdTorneo),
CONSTRAINT TorneoEquipo_Equipo_fk FOREIGN KEY (IdEquipo) REFERENCES  Equipos(IdEquipo),
CONSTRAINT TorneoEquipo_Estado_fk FOREIGN KEY (IdEstado) REFERENCES  TorneosEstados(IdEstado)
);


CREATE TABLE Fixture (	
IdTorneo	INT NOT NULL,
IdFecha	  INT NOT NULL,
IdReserva	INT NOT NULL,
IdEquipo1	INT NOT NULL,
IdEquipo2	INT NOT NULL,
Gol1	    INT NOT NULL,
Gol2	    INT NOT NULL,
PRIMARY KEY(IdTorneo,IdFecha),
CONSTRAINT Fixture_Torneo_fk FOREIGN KEY (IdTorneo) REFERENCES  Torneos(IdTorneo),
CONSTRAINT Fixture_Equipo1_fk FOREIGN KEY (IdEquipo1) REFERENCES  Equipos(IdEquipo),
CONSTRAINT Fixture_Equipo2_fk FOREIGN KEY (IdEquipo2) REFERENCES  Equipos(IdEquipo)
);


CREATE TABLE PuntajesPorFechas	(
IdTorneo	  INT NOT NULL,
IdFecha	    INT NOT NULL,
IdEquipo	  INT NOT NULL,
CantPuntos	INT NOT NULL,
Jugados	    INT NOT NULL,
Ganados	    INT NOT NULL,
Empatados	  INT NOT NULL,
Perdidos	  INT NOT NULL,
PRIMARY KEY(IdTorneo,IdFecha),
CONSTRAINT PuntajesPorFechas_Torneo_fk FOREIGN KEY (IdTorneo) REFERENCES  Torneos(IdTorneo),
CONSTRAINT PuntajesPorFechas_Equipo_fk FOREIGN KEY (IdEquipo) REFERENCES  Equipos(IdEquipo)
);


CREATE TABLE Devoluciones(	
IdDevolucion	INT         NOT NULL AUTO_INCREMENT,
IdDuenio	    INT         NOT NULL, 
IdCliente	    INT         NOT NULL ,
Monto	        DOUBLE(6,2) NOT NULL,
PRIMARY KEY(IdDevolucion),
CONSTRAINT Devoluciones_Duenio_fk FOREIGN KEY (IdDuenio) REFERENCES  Duenios(IdDuenio),
CONSTRAINT Devoluciones_Cliente_fk FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente)
);


CREATE TABLE CanchasImagenes(	
IdComplejo	INT     NOT NULL, 
IdCancha	  INT     NOT NULL,   
IdImagen	  INT     NOT NULL, 
Imagen	    BLOB    NOT NULL, 
PRIMARY KEY(IdComplejo,IdCancha,IdImagen),
CONSTRAINT Imagenes_Canchas_fk   FOREIGN KEY (IdComplejo,IdCancha) REFERENCES  Canchas(IdComplejo,IdCancha)
);

CREATE TABLE ComplejosImagenes(	
IdComplejo	INT     NOT NULL, 
IdImagen	  INT     NOT NULL, 
Imagen	    BLOB    NOT NULL, 
PRIMARY KEY(IdComplejo,IdImagen),
CONSTRAINT Imagenes_Complejos_fk   FOREIGN KEY (IdComplejo) REFERENCES  Complejos(IdComplejo)
);



CREATE TABLE TorneosImagenes(	
IdTorneo   	INT     NOT NULL, 
IdImagen	  INT     NOT NULL, 
Imagen	    BLOB    NOT NULL, 
PRIMARY KEY(IdTorneo,IdImagen),
CONSTRAINT Imagenes_Torneos_fk   FOREIGN KEY (IdTorneo) REFERENCES  Torneos(IdTorneo)
);



CREATE TABLE TorneosDias(	
IdTorneo	  INT   NOT NULL,
IdDia       INT   NOT NULL,
HoraDesde	  TIME  NOT NULL,
HoraHasta	  TIME  NOT NULL,
PRIMARY KEY(IdTorneo,IdDia),
CONSTRAINT DiaDesde_TDias_fk  FOREIGN KEY (IdDia)   REFERENCES  Dias(IdDia),
CONSTRAINT Dias_Torneos_fk   FOREIGN KEY (IdTorneo) REFERENCES  Torneos(IdTorneo)
);



CREATE TABLE TorneosCanchas(	
IdTorneo   	INT   NOT NULL, 
IdComplejo	INT   NOT NULL,
IdCancha	  INT   NOT NULL,
PRIMARY KEY(IdTorneo,IdComplejo,IdCancha),
CONSTRAINT canchas_Torneos_fk   FOREIGN KEY (IdTorneo) REFERENCES  Torneos(IdTorneo),
CONSTRAINT com_Torneos_fk   FOREIGN KEY (IdComplejo,IdCancha) REFERENCES  Canchas(IdComplejo,IdCancha)
);


CREATE TABLE tipotorneosEquipos(	
IdTipoTorneo	INT  NOT NULL,
cantidad	    INT  NOT NULL,
PRIMARY KEY (IdTipoTorneo,cantidad)
);

