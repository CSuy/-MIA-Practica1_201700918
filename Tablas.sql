--Crearemos las tablas correspondientes
CREATE TABLE Profesion(
cod_prof	INTEGER NOT NULL,
nombre		VARCHAR(50) NOT NULL,
CONSTRAINT PK_cod_prof PRIMARY KEY (cod_prof),
CONSTRAINT UQ_nombre UNIQUE (nombre)
);

CREATE TABLE Pais(
cod_pais	INTEGER NOT NULL,
nombre		VARCHAR(50) NOT NULL,
CONSTRAINT PK_cod_pais PRIMARY KEY (cod_pais),
CONSTRAINT UQ_nombre UNIQUE (nombre)
);
--no
CREATE TABLE Puesto(
cod_puesto	INTEGER NOT NULL,
nombre 		VARCHAR(50) NOT NULL,
CONSTRAINT PK_cod_puesto PRIMARY KEY (cod_puesto),
CONSTRAINT UQ_nombre UNIQUE (nombre)
);
--no
CREATE TABLE Departamento(
cod_depto	INTEGER NOT NULL,
nombre 		VARCHAR(50) NOT NULL,
CONSTRAINT PK_cod_depto PRIMARY KEY (cod_depto),
CONSTRAINT UQ_nombre UNIQUE (nombre)
);

CREATE TABLE Miembro(
cod_miembro			INTEGER NOT NULL,
nombre				VARCHAR(100) NOT NULL,
apellido			VARCHAR(100) NOT NULL,
edad				INTEGER NOT NULL,
telefono			INTEGER,
residencia			VARCHAR(100),
PAIS_cod_pais 		INTEGER,
PROFESION_cod_prof	INTEGER,
CONSTRAINT PK_cod_miembro PRIMARY KEY (cod_miembro),
CONSTRAINT FK_miembro_pais FOREIGN KEY (PAIS_cod_pais ) REFERENCES Pais(cod_pais),
CONSTRAINT FK_miembro_profesion FOREIGN KEY (PROFESION_cod_prof) REFERENCES Profesion(cod_prof)
);
--no
CREATE TABLE Puesto_Miembro(
MIEMBRO_cod_miembro 	INTEGER NOT NULL,
PUESTO_cod_puesto 		INTEGER NOT NULL,
DEPARTAMENTO_cod_depto 	INTEGER NOT NULL,
fecha_inicio 			DATE NOT NULL,
fecha_fin 				DATE,
CONSTRAINT FK_puesto_miembro FOREIGN KEY (MIEMBRO_cod_miembro) REFERENCES Miembro(cod_miembro),
CONSTRAINT FK_puesto_puesto FOREIGN KEY (PUESTO_cod_puesto) REFERENCES Puesto(cod_puesto),
CONSTRAINT FK_puesto_departamento FOREIGN KEY (DEPARTAMENTO_cod_depto) REFERENCES Departamento(cod_depto),
CONSTRAINT PK_miembro_puesto_departamento PRIMARY KEY (MIEMBRO_cod_miembro, PUESTO_cod_puesto, DEPARTAMENTO_cod_depto)
);

CREATE TABLE Tipo_Medalla(
cod_tipo 	INTEGER NOT NULL,
medalla 	VARCHAR(20) NOT NULL,
CONSTRAINT PK_cod_tipo PRIMARY KEY (cod_tipo),
CONSTRAINT UQ_medalla UNIQUE (medalla)
);

CREATE TABLE Medallero(
PAIS_cod_pais 			INTEGER NOT NULL,
cantidad_medallas 		INTEGER NOT NULL,
TIPO_MEDALLA_cod_tipo 	INTEGER NOT NULL,
CONSTRAINT FK_medallero_pais FOREIGN KEY (PAIS_cod_pais) REFERENCES Pais(cod_pais),
CONSTRAINT FK_medallero_tipo FOREIGN KEY (TIPO_MEDALLA_cod_tipo) REFERENCES Tipo_Medalla(cod_tipo),
CONSTRAINT PK_pais_tipo_medalla PRIMARY KEY (PAIS_cod_pais, TIPO_MEDALLA_cod_tipo)
);

CREATE TABLE Disciplina(
cod_disciplina 	INTEGER NOT NULL,
nombre 			VARCHAR(50) NOT NULL,
descripcion 	VARCHAR(150),
CONSTRAINT PK_cod_disciplina PRIMARY KEY (cod_disciplina)
);
--no
CREATE TABLE Atleta(
cod_atleta 					INTEGER NOT NULL,
nombre 						VARCHAR(50) NOT NULL,
apellido 					VARCHAR(50) NOT NULL,
edad 						INTEGER NOT NULL,
participaciones 			VARCHAR(100) NOT NULL,
DISCIPLINA_cod_disciplina 	INTEGER NOT NULL,
PAIS_cod_pais 				INTEGER NOT NULL,
CONSTRAINT PK_cod_atleta PRIMARY KEY (cod_atleta),
CONSTRAINT FK_atleta_disciplina FOREIGN KEY (DISCIPLINA_cod_disciplina) REFERENCES Disciplina(cod_disciplina),
CONSTRAINT FK_atleta_pais FOREIGN KEY (PAIS_cod_pais) REFERENCES Pais(cod_pais)
);

CREATE TABLE Categoria(
cod_categoria 	INTEGER NOT NULL,
categoria 		VARCHAR(50) NOT NULL,
CONSTRAINT PK_cod_categoria PRIMARY KEY (cod_categoria)
);

CREATE TABLE Tipo_Participacion(
cod_participacion 	INTEGER NOT NULL,
tipo_participacion 	VARCHAR(100),
CONSTRAINT PK_cod_participacion PRIMARY KEY (cod_participacion)
);

CREATE TABLE Evento(
cod_evento 								INTEGER NOT NULL,
fecha 									DATE NOT NULL,
ubicacion 								VARCHAR(50) NOT NULL,
hora 									TIME NOT NULL,
DISCIPLINA_cod_disciplina 				INTEGER NOT NULL,
TIPO_PARTICIPACION_cod_participacion 	INTEGER NOT NULL,
CATEGORIA_cod_categoria 				INTEGER NOT NULL,
CONSTRAINT PK_cod_evento PRIMARY KEY (cod_evento),
CONSTRAINT FK_evento_disciplina FOREIGN KEY (DISCIPLINA_cod_disciplina) REFERENCES Disciplina(cod_disciplina),
CONSTRAINT FK_evento_participacion FOREIGN KEY (TIPO_PARTICIPACION_cod_participacion) REFERENCES Tipo_Participacion(cod_participacion),
CONSTRAINT FK_evento_categoria FOREIGN KEY (CATEGORIA_cod_categoria) REFERENCES Categoria(cod_categoria)
);

CREATE TABLE Evento_Atleta(
ATLETA_cod_atleta 	INTEGER NOT NULL,
EVENTO_cod_evento 	INTEGER NOT NULL,
CONSTRAINT FK_evento_atleta FOREIGN KEY (ATLETA_cod_atleta) REFERENCES Atleta(cod_atleta),
CONSTRAINT FK_evento_evento FOREIGN KEY (EVENTO_cod_evento) REFERENCES Evento(cod_evento),
CONSTRAINT PK_atleta_evento PRIMARY KEY (ATLETA_cod_atleta, EVENTO_cod_evento)
);

CREATE TABLE Televisora(
cod_televisora 	INTEGER NOT NULL PRIMARY KEY,
nombre 			VARCHAR(50) NOT NULL,
CONSTRAINT PK_cod_televisora PRIMARY KEY (cod_televisora),
);

CREATE TABLE Costo_Evento(
EVENTO_cod_evento 			INTEGER NOT NULL PRIMARY KEY,
TELEVISORA_cod_televisora 	INTEGER NOT NULL PRIMARY KEY,
tarifa 						INTEGER NOT NULL,
CONSTRAINT FK_costo_evento FOREIGN KEY (EVENTO_cod_evento) REFERENCES Evento(cod_evento),
CONSTRAINT FK_costo_televisora FOREIGN KEY (TELEVISORA_cod_televisora) REFERENCES Televisora(cod_televisora),
CONSTRAINT PK_evento_televisora PRIMARY KEY (EVENTO_cod_evento, TELEVISORA_cod_televisora)
);


