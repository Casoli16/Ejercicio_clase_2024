DROP DATABASE Act2_Will

CREATE DATABASE Act2_Will
USE Act2_Will

CREATE TABLE tb_generos(
	id_genero INT AUTO_INCREMENT PRIMARY KEY,
	nombre_genero VARCHAR(255)
)

INSERT INTO tb_generos(nombre_genero) VALUES ("Masculino");
INSERT INTO tb_generos(nombre_genero) VALUES ("Femenino");

CREATE TABLE tb_especialidades_veterianos(
	id_especialidad_veterinario INT AUTO_INCREMENT PRIMARY KEY,
	nombre_especialidad_veterinario VARCHAR(255)
)

INSERT INTO tb_especialidades_veterianos(nombre_especialidad_veterinario) VALUES ("General");

CREATE TABLE tb_horarios_veterinarios(
	id_horario_veterinario INT AUTO_INCREMENT PRIMARY KEY,
	nombre_horario_veterinario VARCHAR(255)
)

INSERT INTO tb_horarios_veterinarios(nombre_horario_veterinario) VALUES ("Matutino");

CREATE TABLE tb_razas(
	id_raza INT AUTO_INCREMENT PRIMARY KEY,
	nombre_raza VARCHAR(255)
)

INSERT INTO tb_razas(nombre_raza) VALUES ("Aguacatero");

CREATE TABLE tb_tipos_animales(
	id_tipo_animal INT AUTO_INCREMENT PRIMARY KEY,
	nombre_tipo_animal VARCHAR(255)
)

INSERT INTO tb_tipos_animales(nombre_tipo_animal) VALUES ("Perro");

CREATE TABLE tb_veterinarias(
	id_veterinaria INT AUTO_INCREMENT PRIMARY KEY,
	nombre_veterinaria VARCHAR(255),
	direccion_veterinaria VARCHAR(255)
)

INSERT INTO tb_veterinarias(nombre_veterinaria, direccion_veterinaria) VALUES ("Huellitas", "San Luis");

CREATE TABLE tb_veterinarios(
	id_veterinario INT AUTO_INCREMENT PRIMARY KEY,
	nombre_veterinario VARCHAR(255),
	apellido_veterinario VARCHAR(255),
	edad_veterinario INT,
	fecha_inicio_veterinario DATE,
	id_genero INT,
	CONSTRAINT fk_veterinarios_genero 
	FOREIGN KEY(id_genero) 
	REFERENCES tb_generos(id_genero),
	id_especialidad_veterinario INT,
	CONSTRAINT fk_veterinarios_especialidades_veterianos 
	FOREIGN KEY(id_especialidad_veterinario) 
	REFERENCES tb_especialidades_veterianos(id_especialidad_veterinario),
	id_veterinaria INT,
	CONSTRAINT fk_veterinarios_veterinarias 
	FOREIGN KEY(id_veterinaria) 
	REFERENCES tb_veterinarias(id_veterinaria),
	id_horario_veterinario INT,
	CONSTRAINT fk_veterinarios_horarios_veterinarios 
	FOREIGN KEY(id_horario_veterinario) 
	REFERENCES tb_horarios_veterinarios(id_horario_veterinario)
)

INSERT INTO tb_veterinarios(nombre_veterinario, apellido_veterinario, edad_veterinario, fecha_inicio_veterinario, id_genero, id_especialidad_veterinario, id_veterinaria, id_horario_veterinario) VALUES ("Pedro", "Poca Sangre", 20, '2024-03-12', 1, 1, 1, 1);
INSERT INTO tb_veterinarios(nombre_veterinario, apellido_veterinario, edad_veterinario, fecha_inicio_veterinario, id_genero, id_especialidad_veterinario, id_veterinaria, id_horario_veterinario) VALUES ("Juan", "Velsaques", 31, '2024-03-12', 1, 1, 1, 1);
INSERT INTO tb_veterinarios(nombre_veterinario, apellido_veterinario, edad_veterinario, fecha_inicio_veterinario, id_genero, id_especialidad_veterinario, id_veterinaria, id_horario_veterinario) VALUES ("Luis", "Cordoba", 44, '2024-03-12', 1, 1, 1, 1);
INSERT INTO tb_veterinarios(nombre_veterinario, apellido_veterinario, edad_veterinario, fecha_inicio_veterinario, id_genero, id_especialidad_veterinario, id_veterinaria, id_horario_veterinario) VALUES ("Carlos", "Belen", 18, '2024-03-12', 1, 1, 1, 1);
INSERT INTO tb_veterinarios(nombre_veterinario, apellido_veterinario, edad_veterinario, fecha_inicio_veterinario, id_genero, id_especialidad_veterinario, id_veterinaria, id_horario_veterinario) VALUES ("Will", "Guadalupe", 45, '2024-03-12', 1, 1, 1, 1);
INSERT INTO tb_veterinarios(nombre_veterinario, apellido_veterinario, edad_veterinario, fecha_inicio_veterinario, id_genero, id_especialidad_veterinario, id_veterinaria, id_horario_veterinario) VALUES ("Allan", "Capos", 63, '2024-03-12', 1, 1, 1, 1);
INSERT INTO tb_veterinarios(nombre_veterinario, apellido_veterinario, edad_veterinario, fecha_inicio_veterinario, id_genero, id_especialidad_veterinario, id_veterinaria, id_horario_veterinario) VALUES ("DK", "Fuentes", 25, '2024-03-12', 1, 1, 1, 1);
INSERT INTO tb_veterinarios(nombre_veterinario, apellido_veterinario, edad_veterinario, fecha_inicio_veterinario, id_genero, id_especialidad_veterinario, id_veterinaria, id_horario_veterinario) VALUES ("Julio", "Sanchez", 18, '2024-03-12', 1, 1, 1, 1);

INSERT INTO tb_veterinarios(nombre_veterinario, apellido_veterinario, edad_veterinario, id_especialidad_veterinario)
VALUES('Daniela', 'Ramirez', 25, 1); 

INSERT INTO tb_veterinarios(nombre_veterinario, apellido_veterinario, edad_veterinario, id_especialidad_veterinario)
VALUES('Eduardo', 'Sosa', 25, 1); 

INSERT INTO tb_veterinarios(nombre_veterinario, apellido_veterinario, edad_veterinario, id_especialidad_veterinario)
VALUES('Alexandra', 'Chavez', 25, 1); 

SELECT * FROM tb_veterinarios


-- funcion MIN 

SELECT MIN(`edad_veterinario`) AS EdadVeterinario FROM `tb_veterinarios`;

CREATE TABLE tb_mascotas(
	id_mascota INT AUTO_INCREMENT PRIMARY KEY,
	nombre_mascota VARCHAR(255),
	edad_mascota VARCHAR(255),
	peso_mascota FLOAT,
	numero_duenio_mascota INT,
	tamanio_mascota FLOAT,
	id_genero INT,
	CONSTRAINT fk_mascotas_razas
	FOREIGN KEY(id_genero) 
	REFERENCES tb_generos(id_genero),
	id_raza INT,
	CONSTRAINT fk_mascotas_genero 
	FOREIGN KEY(id_raza) 
	REFERENCES tb_razas(id_raza),
	id_tipo_animal INT,
	CONSTRAINT fk_mascotas_tipos_animales 
	FOREIGN KEY(id_tipo_animal) 
	REFERENCES tb_tipos_animales(id_tipo_animal)
)

CREATE TABLE tb_citas(
	id_cita INT AUTO_INCREMENT PRIMARY KEY,
	causa_cita VARCHAR(255),
	observaciones_cita VARCHAR(255),
	medicasion_cita VARCHAR(255),
	fecha_cita DATE,
	id_mascota INT,
	CONSTRAINT fk_cita_mascotas
	FOREIGN KEY(id_mascota) 
	REFERENCES tb_mascotas(id_mascota),
	id_veterinario INT,
	CONSTRAINT fk_cita_veterinarios
	FOREIGN KEY(id_veterinario) 
	REFERENCES tb_veterinarios(id_veterinario)
)

SELECT * FROM tb_citas

-- agregar campos a la tabla para realizar las funciones de SUM y AVG 
ALTER TABLE tb_citas ADD COLUMN  precio_cita NUMERIC(3,2);
ALTER TABLE tb_citas ADD COLUMN  cantidad_citas INT; 

-- inserts en tb_citas con los campos agregados 

INSERT INTO tb_citas (causa_cita, observaciones_cita, fecha_cita, cantidad_citas, precio_cita) 
VALUES ('Vomito', 'Presenta vomitas al comer', '2024-07-12', 3, 5.50); 

INSERT INTO tb_citas (causa_cita, observaciones_cita, fecha_cita, cantidad_citas, precio_cita) 
VALUES ('Sed excesiva', 'Bulldog prsenta sed excesiva por intoxicación', '2024-2-20', 5, 25.00);

INSERT INTO tb_citas (causa_cita, observaciones_cita, fecha_cita, cantidad_citas, precio_cita) 
VALUES ('Problemas digestivos', 'Prsenta malestar en estomago', '2024-01-29', 7, 15.99);

INSERT INTO tb_citas (causa_cita, observaciones_cita, fecha_cita, cantidad_citas, precio_cita) 
VALUES ('Pelaje seco', 'Presenta pelaje reseco a falta de vitaminas', '2024-03-18', 5, 7.99);   


-- funcion SUM 

SELECT SUM(cantidad_citas) FROM tb_citas; 

SELECT SUM(precio_cita) FROM tb_citas; 


-- funcion AVG 
SELECT AVG(precio_cita) 
AS porcentaje_precio 
FROM tb_citas 


-- funcion COUNT 
SELECT COUNT(*) FROM tb_veterinarios

SELECT COUNT(*) FROM tb_veterinarios
WHERE edad_veterinario = 25

