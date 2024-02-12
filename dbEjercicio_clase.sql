CREATE DATABASE Act1_DOC;
USE Act1_DOC;

CREATE TABLE tb_generos(
	id_genero INT AUTO_INCREMENT PRIMARY KEY,
	nombre_genero VARCHAR(255)
);

CREATE TABLE tb_especialidades_veterianos(
	id_especialidad_veterinario INT AUTO_INCREMENT PRIMARY KEY,
	nombre_especialidad_veterinario VARCHAR(255)
);

CREATE TABLE tb_horarios_veterinarios(
	id_horario_veterinario INT AUTO_INCREMENT PRIMARY KEY,
	nombre_horario_veterinario VARCHAR(255)
);

CREATE TABLE tb_razas(
	id_raza INT AUTO_INCREMENT PRIMARY KEY,
	nombre_raza VARCHAR(255)
);

CREATE TABLE tb_tipos_animales(
	id_tipo_animal INT AUTO_INCREMENT PRIMARY KEY,
	nombre_tipo_animal VARCHAR(255)
);

CREATE TABLE tb_veterinarias(
	id_veterinaria INT AUTO_INCREMENT PRIMARY KEY,
	nombre_veterinaria VARCHAR(255),
	direccion_veterinaria VARCHAR(255)
);

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
);

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
);

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
);