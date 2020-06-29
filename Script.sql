--creacion de las consultas
SET DATASTYLE TO 'European';


-- #2
ALTER TABLE Evento 
DROP COLUMN fecha;

ALTER TABLE Evento 
DROP COLUMN hora;

ALTER TABLE Evento 
ADD COLUMN fecha_hora TIMESTAMP;

-- #3
ALTER TABLE Evento 
ADD CONSTRAINT restriccion_fecha_hora 
CHECK ( fecha_hora >= '24/07/2020 09:00:00' AND fecha_hora <= '09/08/2020 20:00:00');

-- #4
CREATE TABLE Sede(
cod_sede	INTEGER,
sede 		VARCHAR(50) NOT NULL,
CONSTRAINT PK_cod_sede PRIMARY KEY (cod_sede)
);

ALTER TABLE Evento
ALTER COLUMN ubicacion TYPE INTEGER;

ALTER TABLE Evento
ADD CONSTRAINT FK_Ubicacion_Sede FOREIGN KEY (ubicacion) REFERENCES Sede(cod_sede);

-- #5
ALTER TABLE Miembro
ALTER COLUMN telefono
SET DEFAULT 0;

--#6
INSERT INTO Pais(cod_pais, nombre) VALUES (1,'Guatemala');
INSERT INTO Pais(cod_pais, nombre) VALUES (2,'Francia');
INSERT INTO Pais(cod_pais, nombre) VALUES (3,'Argentina');
INSERT INTO Pais(cod_pais, nombre) VALUES (4,'Alemania');
INSERT INTO Pais(cod_pais, nombre) VALUES (5,'Italia');
INSERT INTO Pais(cod_pais, nombre) VALUES (6,'Brasil');
INSERT INTO Pais(cod_pais, nombre) VALUES (7,'Estados Unidos');

INSERT INTO Profesion(cod_prof, nombre) VALUES (1,'Medico');
INSERT INTO Profesion(cod_prof, nombre) VALUES (2,'Arquitecto');
INSERT INTO Profesion(cod_prof, nombre) VALUES (3,'Ingeniero');
INSERT INTO Profesion(cod_prof, nombre) VALUES (4,'Secretaria');
INSERT INTO Profesion(cod_prof, nombre) VALUES (5,'Auditor');

INSERT INTO Miembro(cod_miembro, nombre, apellido, edad, residencia, PAIS_cod_pais, PROFESION_cod_prof) VALUES(1,'Scott','Mitchell', 32, '1092 Highland Drive Manitowoc, WI 54220', 7, 3);
INSERT INTO Miembro(cod_miembro, nombre, apellido, edad, telefono, residencia, PAIS_cod_pais, PROFESION_cod_prof) VALUES(2,'Fanette','Poulin', 25, 25075853 , '49, boulevard Aristide Briand 76120 LE GRAND-QUEVILLY', 2, 4);
INSERT INTO Miembro(cod_miembro, nombre, apellido, edad, residencia, PAIS_cod_pais, PROFESION_cod_prof) VALUES(3,'Laura','Cunha Silva', 55, 'Rua Onze, 85 Uberaba-MG', 6, 5);
INSERT INTO Miembro(cod_miembro, nombre, apellido, edad, telefono, residencia, PAIS_cod_pais, PROFESION_cod_prof) VALUES(4,'Juan Jose','Lopez', 38, 36985247, '26 calle 4-10 zona 11', 1, 2);
INSERT INTO Miembro(cod_miembro, nombre, apellido, edad, telefono, residencia, PAIS_cod_pais, PROFESION_cod_prof) VALUES(5,'Arcangela','Panicucci', 39, 391664921, 'Via Santa Teresa, 114 90010-Geraci Siculo PA', 5, 1);
INSERT INTO Miembro(cod_miembro, nombre, apellido, edad, residencia, PAIS_cod_pais, PROFESION_cod_prof) VALUES(6,'Jeule','Villalpando', 31, 'Acuña de Figeroa 6106 80101 Playa Pascual', 3, 5);

INSERT INTO Disciplina(cod_disciplina, nombre, descripcion) VALUES (1, 'Atletismo', 'Saltos de longitud y triples, de altura y con pértiga o garrocha; las pruebas de lanzamiento de martillo, jabalina y disco');
INSERT INTO Disciplina(cod_disciplina, nombre) VALUES (2, 'Badminton');
INSERT INTO Disciplina(cod_disciplina, nombre) VALUES (3, 'Ciclismo');
INSERT INTO Disciplina(cod_disciplina, nombre, descripcion) VALUES (4, 'Judo', 'Es un arte marcial que se originó en Japón alrededor de 1880');
INSERT INTO Disciplina(cod_disciplina, nombre) VALUES (5, 'Lucha');
INSERT INTO Disciplina(cod_disciplina, nombre) VALUES (6, 'Tenis de Mesa');
INSERT INTO Disciplina(cod_disciplina, nombre) VALUES (7, 'Boxeo');
INSERT INTO Disciplina(cod_disciplina, nombre, descripcion) VALUES (8, 'Natacion', 'Está presente como deporte en los Juegos desde la primera edición de la era moderna, en Atenas, Grecia, en 1896, donde se disputo en aguas abiertas.');
INSERT INTO Disciplina(cod_disciplina, nombre) VALUES (9, 'Esgrima');
INSERT INTO Disciplina(cod_disciplina, nombre) VALUES (10, 'Vela');

INSERT INTO Tipo_Medalla(cod_tipo, medalla) VALUES (1,'Oro');
INSERT INTO Tipo_Medalla(cod_tipo, medalla) VALUES (2,'Plata');
INSERT INTO Tipo_Medalla(cod_tipo, medalla) VALUES (3,'Bronce');
INSERT INTO Tipo_Medalla(cod_tipo, medalla) VALUES (4,'Platino');

INSERT INTO Categoria(cod_categoria, categoria) VALUES (1,'Clasificatorio');
INSERT INTO Categoria(cod_categoria, categoria) VALUES (2,'Elimnatorio');
INSERT INTO Categoria(cod_categoria, categoria) VALUES (3,'Final');

INSERT INTO Tipo_Participacion(cod_participacion, tipo_participacion) VALUES (1,'Individual');
INSERT INTO Tipo_Participacion(cod_participacion, tipo_participacion) VALUES (2,'Parejas');
INSERT INTO Tipo_Participacion(cod_participacion, tipo_participacion) VALUES (3,'Equipos');

INSERT INTO Medallero(PAIS_cod_pais, cantidad_medallas, TIPO_MEDALLA_cod_tipo) VALUES (5, 3, 1);
INSERT INTO Medallero(PAIS_cod_pais, cantidad_medallas, TIPO_MEDALLA_cod_tipo) VALUES (2, 5, 1);
INSERT INTO Medallero(PAIS_cod_pais, cantidad_medallas, TIPO_MEDALLA_cod_tipo) VALUES (6, 4, 3);
INSERT INTO Medallero(PAIS_cod_pais, cantidad_medallas, TIPO_MEDALLA_cod_tipo) VALUES (4, 3, 4);
INSERT INTO Medallero(PAIS_cod_pais, cantidad_medallas, TIPO_MEDALLA_cod_tipo) VALUES (7, 10, 3);
INSERT INTO Medallero(PAIS_cod_pais, cantidad_medallas, TIPO_MEDALLA_cod_tipo) VALUES (3, 8, 2);
INSERT INTO Medallero(PAIS_cod_pais, cantidad_medallas, TIPO_MEDALLA_cod_tipo) VALUES (1, 2, 1);
INSERT INTO Medallero(PAIS_cod_pais, cantidad_medallas, TIPO_MEDALLA_cod_tipo) VALUES (1, 5, 4);
INSERT INTO Medallero(PAIS_cod_pais, cantidad_medallas, TIPO_MEDALLA_cod_tipo) VALUES (5, 7, 2);

INSERT INTO Sede(cod_sede, sede) VALUES (1,'Gimnasion Metropolitano de Tokio');
INSERT INTO Sede(cod_sede, sede) VALUES (2,'Jardin del Palacio Imperial de Tokio');
INSERT INTO Sede(cod_sede, sede) VALUES (3,'Gimnasion Nacional Yoyogi');
INSERT INTO Sede(cod_sede, sede) VALUES (4,'Nippon Budokan');
INSERT INTO Sede(cod_sede, sede) VALUES (5,'Estadio Olimpico');

INSERT INTO Evento(cod_evento, fecha_hora, ubicacion, DISCIPLINA_cod_disciplina, TIPO_PARTICIPACION_cod_participacion, CATEGORIA_cod_categoria) VALUES (1, '24/07/2020 11:00:00', 3, 2, 2, 1);
INSERT INTO Evento(cod_evento, fecha_hora, ubicacion, DISCIPLINA_cod_disciplina, TIPO_PARTICIPACION_cod_participacion, CATEGORIA_cod_categoria) VALUES (2, '26/07/2020 10:30:00', 1, 6, 1, 3);
INSERT INTO Evento(cod_evento, fecha_hora, ubicacion, DISCIPLINA_cod_disciplina, TIPO_PARTICIPACION_cod_participacion, CATEGORIA_cod_categoria) VALUES (3, '30/07/2020 18:45:00', 5, 7, 1, 2);
INSERT INTO Evento(cod_evento, fecha_hora, ubicacion, DISCIPLINA_cod_disciplina, TIPO_PARTICIPACION_cod_participacion, CATEGORIA_cod_categoria) VALUES (4, '01/08/2020 12:15:00', 3, 2, 1, 1);
INSERT INTO Evento(cod_evento, fecha_hora, ubicacion, DISCIPLINA_cod_disciplina, TIPO_PARTICIPACION_cod_participacion, CATEGORIA_cod_categoria) VALUES (5, '24/07/2020 19:35:00', 3, 2, 3, 1);

-- #7
ALTER TABLE Pais 
DROP CONSTRAINT UQ_nombre;

ALTER TABLE Tipo_Medalla
DROP CONSTRAINT UQ_medalla;

ALTER TABLE Departamento
DROP CONSTRAINT UQ_nombre;

-- #8
ALTER TABLE Atleta
DROP COLUMN DISCIPLINA_cod_disciplina;

CREATE TABLE Disciplina_Atleta(
ATLETA_cod_atleta INTEGER,
DISCIPLINA_cod_disciplina INTEGER,
CONSTRAINT FK_disciplina_atleta FOREIGN KEY (ATLETA_cod_atleta) REFERENCES Atleta(cod_atleta),
CONSTRAINT FK_disciplina_disciplina FOREIGN KEY (DISCIPLINA_cod_disciplina) REFERENCES Disciplina(cod_disciplina),
CONSTRAINT PK_atleta_disciplina PRIMARY KEY (ATLETA_cod_atleta, DISCIPLINA_cod_disciplina)
);

-- #9
ALTER TABLE Costo_Evento
ALTER COLUMN tarifa TYPE NUMERIC(2);

-- #10
DELETE FROM Medallero
WHERE TIPO_MEDALLA_cod_tipo = 4;

DELETE FROM Tipo_Medalla
WHERE cod_tipo = 4;

-- #11
DROP TABLE Costo_Evento;
DROP TABLE Televisoras;

-- #12
DELETE FROM Disciplina;

-- #13
UPDATE Miembro SET telefono = 55464601
WHERE nombre = 'Laura' AND apellido = 'Cunha Silva';

UPDATE Miembro SET telefono = 91514243
WHERE nombre = 'Jeule' AND apellido = 'Villalpando';

UPDATE Miembro SET telefono = 920686670
WHERE nombre = 'Scott' AND apellido = 'Mitchell';

-- #14
ALTER TABLE Atleta
ADD COLUMN Fotografia VARCHAR(150);

--#15
ALTER TABLE Atleta
ADD CONSTRAINT restriccion_edad 
CHECK (edad < 25);