--Crearemos las tablas correspondientes
CREATE TABLE Profesion(
cod_prof	INTEGER NOT NULL PRIMARY KEY,
nombre		VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Pais(
cod_pais	INTEGER NOT NULL PRIMARY KEY,
nombre		VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Puesto(
cod_puesto	INTEGER NOT NULL PRIMARY KEY,
nombre 		VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Departamento(
cod_depto	INTEGER NOT NULL PRIMARY KEY,
nombre 		VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Miembro(
cod_miembro	I		NTEGER NOT NULL PRIMARY KEY,
nombre				VARCHAR(100) NOT NULL,
apellido			VARCHAR(100) NOT NULL,
edad				INTEGER NOT NULL,
telefono			INTEGER,
residencia			VARCHAR(100),
PAIS_cod_pais 		INTEGER,
PROFESION_cod_prof	INTEGER
);

CREATE TABLE Puesto_Miembro(
MIEMBRO_cod_miembro 	INTEGER NOT NULL PRIMARY KEY,
PUESTO_cod_puesto 		INTEGER NOT NULL PRIMARY KEY,
DEPARTAMENTO_cod_depto 	INTEGER NOT NULL PRIMARY KEY,
fecha_inicio 			DATE NOT NULL,
fecha_fin 				DATE
);

CREATE TABLE Tipo_Medalla(
cod_tipo 	INTEGER NOT NULL PRIMARY KEY,
medalla 	VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Medallero(
PAIS_cod_pais 			INTEGER NOT NULL PRIMARY KEY,
cantidad_medallas 		INTEGER NOT NULL,
TIPO_MEDALLA_cod_tipo 	INTEGER NOT NULL
);

CREATE TABLE Disciplina(
cod_disciplina 	INTEGER NOT NULL PRIMARY KEY,
nombre 			VARCHAR(50) NOT NULL,
descripcion 	VARCHAR(150)
);

CREATE TABLE Atleta(
cod_atleta 					INTEGER NOT NULL PRIMARY KEY,
nombre 						VARCHAR(50) NOT NULL,
apellido 					VARCHAR(50) NOT NULL,
edad 						INTEGER NOT NULL,
participaciones 			VARCHAR(100) NOT NULL,
DISCIPLINA_cod_disciplina 	INTEGER NOT NULL,
PAIS_cod_pais 				INTEGER NOT NULL
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
hora 									DATE NOT NULL,
DISCIPLINA_cod_disciplina 				INTEGER NOT NULL,
TIPO_PARTICIPACION_cod_participacion 	INTEGER NOT NULL,
CATEGORIA_cod_categoria 				INTEGER NOT NULL
);

CREATE TABLE Evento_Atleta(
ATLETA_cod_atleta 	INTEGER NOT NULL,
EVENTO_cod_evento 	INTEGER NOT NULL
);

CREATE TABLE Televisora(
cod_televisora 	INTEGER NOT NULL PRIMARY KEY,
nombre 			VARCHAR(50) NOT NULL
);

CREATE TABLE Costo_Evento(
EVENTO_cod_evento 			INTEGER NOT NULL,
TELEVISORA_cod_televisora 	INTEGER NOT NULL,
tarifa 						INTEGER NOT NULL
);