--creacion de las consultas

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
cod_sede	INTEGER PRIMARY KEY,
sede 		VARCHAR(50) NOT NULL
);

ALTER TABLE Evento
ALTER COLUMN ubicacion TYPE INTEGER;

ALTER TABLE Evento
ADD CONSTRAINT FK_Ubicacion_Sede FOREIGN KEY (ubicacion) REFERENCES Sede(cod_sede);

-- #5
ALTER TABLE Miembro
ALTER COLUMN telefono
SET DEFAULT 0;


