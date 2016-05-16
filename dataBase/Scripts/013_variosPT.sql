drop TABLE TorneosDias;

CREATE TABLE TorneosDias(	
IdTorneo	  INT   NOT NULL,
IdDia       INT   NOT NULL,
HoraDesde	  TIME  NOT NULL,
HoraHasta	  TIME  NOT NULL,
PRIMARY KEY(IdTorneo,IdDia),
CONSTRAINT DiaDesde_TDias_fk  FOREIGN KEY (IdDia)   REFERENCES  Dias(IdDia),
CONSTRAINT Dias_Torneos_fk   FOREIGN KEY (IdTorneo) REFERENCES  Torneos(IdTorneo)
);
