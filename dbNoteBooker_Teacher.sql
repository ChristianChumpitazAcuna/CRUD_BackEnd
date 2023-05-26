CREATE DATABASE dbNoteBooker1;
USE dbNoteBooker1;

-- Configurar el idioma español el motor de base de datos.
SET LANGUAGE Español
GO
SELECT @@language AS 'Idioma'
GO

-- Configurar el formato de fecha en dmy (dia, mes y año) en el motor de base de datos.
SET DATEFORMAT dmy
GO

-- Table: teacher
CREATE TABLE teacher (
    id int  NOT NULL IDENTITY(1,1),
    name varchar(70)  NOT NULL,
    last_name varchar(70)  NOT NULL,
    document_type char(3)  NOT NULL,
    document_number varchar(15)  NOT NULL,
    adress varchar(70)  NOT NULL,
    district varchar(70)  NOT NULL,
    birthdate date  NOT NULL,
    cell_phone char(9)  NOT NULL,
    email varchar(70)  NOT NULL,
	status char(1) NOT NULL DEFAULT('A'),
    CONSTRAINT teacher_pk PRIMARY KEY  (id)
);

-- Restrictions: teacher

/* document_type solo puede ser: DNI ó CNE */
ALTER TABLE teacher 
	ADD CONSTRAINT document_type_teacher 
	CHECK(document_type ='DNI' OR document_type ='CNE');

/* Eliminar columna number_document tabla teacher */
ALTER TABLE teacher
	DROP COLUMN document_number;

/* document_number solo permite 8 o 9 digitos entre 0 - 9, dependiendo si es DNI o CNE*/
ALTER TABLE teacher
	ADD document_number char(9)
	CONSTRAINT document_number_teacher
	CHECK (document_number like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][^A-Z]');

/* cell_phone solo permite 9 digitos entre 0 - 9 */
ALTER TABLE teacher
	ADD CONSTRAINT cellphone_teacher
	CHECK (cell_phone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]');

/* email válido */
ALTER TABLE teacher
	ADD CONSTRAINT email_teacher
	CHECK(email LIKE '%@%._%');

/* Solo permitir registro de profesores mayores de edad */
ALTER TABLE teacher
	ADD CONSTRAINT birthdate_teacher
	CHECK((YEAR(GETDATE())- YEAR(birthdate )) >= 18);

/* Valores unicos */
ALTER TABLE teacher
	ADD CONSTRAINT document_number_teacher_unique UNIQUE (number_document);

ALTER TABLE teacher
	ADD CONSTRAINT email_teacher_unique UNIQUE (email);

ALTER TABLE teacher
	ADD CONSTRAINT cell_phone_teacher_unique UNIQUE(cell_phone);


-- Insert records: teacher
INSERT INTO teacher (name, last_name, document_type, document_number, adress, district, birthdate, cell_phone, email)
VALUES
('Maria','Ramos Rojas', 'DNI','76542899', 'Av.Los Prados', 'San Vicente', '10/12/1990', '987965423', 'maria.ramos@gmail.com')

INSERT INTO teacher (name, last_name, document_type, document_number, adress, district, birthdate, cell_phone, email)
VALUES
('Lucia','Silvia Acuña', 'DNI','45542843', 'Av.Las Palmeras', 'San Vicente', '23/10/1999', '997565123', 'lucia.silvia@gmail.com')

INSERT INTO teacher (name, last_name, document_type, document_number, adress, district, birthdate, cell_phone, email)
VALUES
('Luis','Alvares García', 'DNI','45428772', 'Av.Los Reyes', 'San Vicente', '14/02/1980', '990333231', 'luis.alvares@gmail.com')

INSERT INTO teacher (name, last_name, document_type, document_number, adress, district, birthdate, cell_phone, email)
VALUES
('Juan','Sanchez Perez', 'DNI','82033201', 'Av.Campos', 'San Vicente', '01/01/1988', '991433210', 'juan.sanchez@gmail.com')

INSERT INTO teacher (name, last_name, document_type, document_number, adress, district, birthdate, cell_phone, email)
VALUES
('Xiomara','Avila Bravo', 'DNI','82033203', 'Av.Los Incas', 'San Vicente', '12/12/1999', '991433215', 'xiomara.avila@gmail.com')

-- Listar Registros : teacher
SELECT * FROM teacher;

-- Probar Restricciones : teacher

/* number_document repetido*/
INSERT INTO teacher (name, last_name, document_type, document_number, adress, district, birthdate, cell_phone, email)
VALUES
('Melisa','Ramos Rojas', 'DNI','76542893', 'Av.Los Prados', 'San Vicente', '12/11/1980', '990965423', 'melisa.ramos@gmail.com')

/* cell_phone repetido */
INSERT INTO teacher (name, last_name, document_type, document_number, adress, district, birthdate, cell_phone, email)
VALUES
('Jose','Silvia Ramos', 'DNI','33189922', 'Av.Las Palmeras', 'San Vicente', '02/02/1970', '997565123', 'jose.silvia@gmail.com')

/* email repetido */
INSERT INTO teacher (name, last_name, document_type, document_number, adress, district, birthdate, cell_phone, email)
VALUES
('Luis','Alvarado García', 'DNI','66242827', 'Av.Los Reyes', 'San Vicente', '12/12/1988', '995333230', 'luis.alvares@gmail.com')


-- CRUD: teacher

-- CREATE
INSERT INTO teacher(name, last_name, document_type, document_number, adress, district, birthdate, cell_phone, email)
VALUES
('Jose','Campos Santos', 'DNI','15361382', 'Av.Los Incas', 'San Vicente', '02/02/1989', '985407527', 'jose.campos@gmail.com'),
('Ana','Salazar Alvarez', 'DNI','15371099', 'Av.Libertadores', 'San Vicente', '12/10/1977', '988332232', 'ana.salazar@gmail.com'),
('Diana','Chumpitaz Malásquez', 'DNI','16372912', 'Av.Las Palmeras', 'San Vicente', '20/01/1989', '954320660', 'diana.chumpitaz@gmail.com'),
('Daniel','Acuña Palomino', 'DNI','16349912', 'Av.Los Arcos', 'San Vicente', '18/03/1986', '920331829', 'daniel.acuña@gmail.com'),
('Rosa','Villabos Cardenas', 'DNI','15444475', 'Av.Independencia', 'San Vicente', '02/11/1975', '960654320', 'rosa.villalobos@gmail.com')
GO


--	READ
/* Listar registros */
SELECT * FROM teacher;

/* Listar: apellidos, nombres, celular y fecha de nacimiento */
SELECT
	last_name as 'APELLIDOS',
	name as 'NOMBRES',
	cell_phone as 'CELULAR',
	format(birthdate, 'd', 'es-ES') as 'FEC. NACIMIENTO'
FROM
	teacher
GO

/* Listar: apellidos, nombres, email y celular de teacher que tienen DNI y su respectivo número*/
SELECT
	last_name as 'APELLIDOS',
	name as 'NOMBRE',
	email as 'EMAIL',
	document_type as 'DOCUMENTO',
	document_number as '# DOC.'
FROM
	teacher
WHERE
	document_type = 'DNI'
GO


-- UPDATE

/* La fecha de nacimiento de ALVARES GARCÍA LUIS es el 16/06/1980 */
UPDATE teacher 
SET birthdate = '16/06/1989'
WHERE name = 'Luis' and last_name = 'Alvares García'
GO

/* Listar los nuevos datos de Marcos Dávila Palomino */
SELECT * FROM teacher
WHERE name = 'Luis' AND last_name = 'Alvares García'
GO

/* El nuevo número de celular del teacher de DNI # 76542893  es 977815352 */
UPDATE teacher
SET cell_phone = '977815352'
WHERE document_type = 'DNI' AND document_number = '76542893'
GO

/* Verificar que el cambio de celular se ha realizado */
SELECT * FROM teacher
WHERE cell_phone = '977815352'
GO


-- DELETE

/* Eliminar físicamente los teachers nacidos en el año 1989 */
 DELETE FROM teacher 
 WHERE YEAR (birthdate) = '1989'
 GO

/* Listar y verificar */
 SELECT * FROM teacher
 GO

/* Eliminar teacher de número de celular 988332232 */
DELETE FROM teacher
WHERE cell_phone = '988332232'
GO

/* Verificar la eliminación listando los registros */
SELECT * FROM teacher
GO

--------------------------------------------------------------------------------