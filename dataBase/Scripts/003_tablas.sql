use resergol;

CREATE TABLE TorneosDias(	
IdTorneo	  INT   NOT NULL,
IdDiaDesde	INT   NOT NULL,
IdDiaHasta	INT   NOT NULL,
HoraDesde	  TIME  NOT NULL,
HoraHasta	  TIME  NOT NULL,
PRIMARY KEY(IdTorneo,IdDiaDesde,IdDiaHasta),
CONSTRAINT DiaDesde_TDias_fk  FOREIGN KEY (IdDiaDesde)   REFERENCES  Dias(IdDia),
CONSTRAINT DiaHasta_TDias_fk  FOREIGN KEY (IdDiaHasta)   REFERENCES  Dias(IdDia),
CONSTRAINT Dias_Torneos_fk   FOREIGN KEY (IdTorneo) REFERENCES  Torneos(IdTorneo)
);



CREATE TABLE TorneosCanchas(	
IdTorneo   	INT   NOT NULL, 
IdComplejo	INT   NOT NULL,
IdCancha	  INT   NOT NULL,
HoraDesde	  TIME  NOT NULL,
HoraHasta	  TIME  NOT NULL,
PRIMARY KEY(IdTorneo,IdComplejo,IdCancha),
CONSTRAINT canchas_Torneos_fk   FOREIGN KEY (IdTorneo) REFERENCES  Torneos(IdTorneo),
CONSTRAINT com_Torneos_fk   FOREIGN KEY (IdComplejo,IdCancha) REFERENCES  Canchas(IdComplejo,IdCancha)
);