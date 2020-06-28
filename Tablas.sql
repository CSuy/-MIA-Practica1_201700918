--Crearemos las tablas correspondientes
CREATE TABLE Profesion(
cod_prof	INTEGER NOT NULL PRIMARY KEY,
nombre		VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Pais(
cod_pais	INTEGER NOT NULL PRIMARY KEY,
nombre		VARCHAR(50) NOT NULL UNIQUE
);
--no
CREATE TABLE Puesto(
cod_puesto	INTEGER NOT NULL PRIMARY KEY,
nombre 		VARCHAR(50) NOT NULL UNIQUE
);
--no
CREATE TABLE Departamento(
cod_depto	INTEGER NOT NULL PRIMARY KEY,
nombre 		VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Miembro(
cod_miembro			INTEGER NOT NULL PRIMARY KEY,
nombre				VARCHAR(100) NOT NULL,
apellido			VARCHAR(100) NOT NULL,
edad				INTEGER NOT NULL,
telefono			INTEGER,
residencia			VARCHAR(100),
PAIS_cod_pais 		INTEGER,
PROFESION_cod_prof	INTEGER,
FOREIGN KEY (PAIS_cod_pais ) REFERENCES Pais(cod_pais),
FOREIGN KEY (PROFESION_cod_prof) REFERENCES Profesion(cod_prof)
);
--no
CREATE TABLE Puesto_Miembro(
MIEMBRO_cod_miembro 	INTEGER NOT NULL PRIMARY KEY,
PUESTO_cod_puesto 		INTEGER NOT NULL PRIMARY KEY,
DEPARTAMENTO_cod_depto 	INTEGER NOT NULL PRIMARY KEY,
fecha_inicio 			DATE NOT NULL,
fecha_fin 				DATE,
FOREIGN KEY (MIEMBRO_cod_miembro) REFERENCES Miembro(cod_miembro),
FOREIGN KEY (PUESTO_cod_puesto) REFERENCES Puesto(cod_puesto),
FOREIGN KEY (DEPARTAMENTO_cod_depto) REFERENCES Departamento(cod_depto)
);

CREATE TABLE Tipo_Medalla(
cod_tipo 	INTEGER NOT NULL PRIMARY KEY,
medalla 	VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Medallero(
PAIS_cod_pais 			INTEGER NOT NULL PRIMARY KEY,
cantidad_medallas 		INTEGER NOT NULL,
TIPO_MEDALLA_cod_tipo 	INTEGER NOT NULL PRIMARY KEY,
FOREIGN KEY (PAIS_cod_pais) REFERENCES Pais(cod_pais),
FOREIGN KEY (TIPO_MEDALLA_cod_tipo) REFERENCES Tipo_Medalla(cod_tipo)
);

CREATE TABLE Disciplina(
cod_disciplina 	INTEGER NOT NULL PRIMARY KEY,
nombre 			VARCHAR(50) NOT NULL,
descripcion 	VARCHAR(150)
);
--no
CREATE TABLE Atleta(
cod_atleta 					INTEGER NOT NULL PRIMARY KEY,
nombre 						VARCHAR(50) NOT NULL,
apellido 					VARCHAR(50) NOT NULL,
edad 						INTEGER NOT NULL,
participaciones 			VARCHAR(100) NOT NULL,
DISCIPLINA_cod_disciplina 	INTEGER NOT NULL,
PAIS_cod_pais 				INTEGER NOT NULL,
FOREIGN KEY (DISCIPLINA_cod_disciplina) REFERENCES Disciplina(cod_disciplina),
FOREIGN KEY (PAIS_cod_pais) REFERENCES Pais(cod_pais)
);

CREATE TABLE Categoria(
cod_categoria 	INTEGER NOT NULL PRIMARY KEY,
categoria 		VARCHAR(50) NOT NULL
);

CREATE TABLE Tipo_Participacion(
cod_participacion 	INTEGER NOT NULL PRIMARY KEY,
tipo_participacion 	VARCHAR(100)
);

CREATE TABLE Evento(
cod_evento 								INTEGER NOT NULL PRIMARY KEY,
fecha 									DATE NOT NULL,
ubicacion 								VARCHAR(50) NOT NULL,
hora 									TIME NOT NULL,
DISCIPLINA_cod_disciplina 				INTEGER NOT NULL,
TIPO_PARTICIPACION_cod_participacion 	INTEGER NOT NULL,
CATEGORIA_cod_categoria 				INTEGER NOT NULL,
FOREIGN KEY (DISCIPLINA_cod_disciplina) REFERENCES Disciplina(cod_disciplina),
FOREIGN KEY (TIPO_PARTICIPACION_cod_participacion) REFERENCES Tipo_Participacion(cod_participacion),
FOREIGN KEY (CATEGORIA_cod_categoria) REFERENCES Categoria(cod_categoria)
);

CREATE TABLE Evento_Atleta(
ATLETA_cod_atleta 	INTEGER NOT NULL PRIMARY KEY,
EVENTO_cod_evento 	INTEGER NOT NULL PRIMARY KEY,
FOREIGN KEY (ATLETA_cod_atleta) REFERENCES Atleta(cod_atleta),
FOREIGN KEY (EVENTO_cod_evento) REFERENCES Evento(cod_evento)
);

CREATE TABLE Televisora(
cod_televisora 	INTEGER NOT NULL PRIMARY KEY,
nombre 			VARCHAR(50) NOT NULL
);

CREATE TABLE Costo_Evento(
EVENTO_cod_evento 			INTEGER NOT NULL PRIMARY KEY,
TELEVISORA_cod_televisora 	INTEGER NOT NULL PRIMARY KEY,
tarifa 						INTEGER NOT NULL,
FOREIGN KEY (EVENTO_cod_evento) REFERENCES Evento(cod_evento),
FOREIGN KEY (TELEVISORA_cod_televisora) REFERENCES Televisora(cod_televisora)
);


