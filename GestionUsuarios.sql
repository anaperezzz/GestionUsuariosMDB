create database GestionUsuarios
go

use GestionUsuarios

create table usuarios(
usr_id int identity(1,1) PRIMARY KEY,
usr_nombre varchar(45) NOT NULL,
usr_apellido varchar(45) NOT NULL,
usr_email varchar(150) NOT NULL,
usr_pais varchar(45) NOT NULL)

CREATE TABLE roles(
rl_id int identity(1,1) PRIMARY KEY,
rl_nombre varchar(45) NOT NULL)

CREATE TABLE roles_usuario(
rlu_id INT IDENTITY(1,1) PRIMARY KEY,
rlu_usr_id int,
rlu_rl_id int,
CONSTRAINT fk_Usuario FOREIGN KEY (rlu_usr_id) REFERENCES usuarios(usr_id),
constraint fk_Roles FOREIGN KEY (rlu_rl_id) REFERENCES roles(rl_id))

--INSERCIÓN DE DATOS
INSERT INTO usuarios(usr_nombre,usr_apellido,usr_email,usr_pais)
VALUES('Armando','NH','armandonh@gmail.com','El Salvador'),
('Carmen','Morales','carmen.morales@gmail.com','Guatemala'),
('Julio','Bernal','jbernal@outlook.com','Honduras'),
('Claudia','Pérez','cperez@gmail.com','Nicaragua'),
('Jorge','Alvarez','jalvarez@gmail.com','Costa Rica')

INSERT INTO roles(rl_nombre) VALUES('Administrador'),
('Editor'),('Publicador')

INSERT INTO roles_usuario(rlu_usr_id,rlu_rl_id) VALUES(1,1)

INSERT INTO roles_usuario(rlu_usr_id,rlu_rl_id) VALUES(1,2)

INSERT INTO roles_usuario(rlu_usr_id,rlu_rl_id) VALUES(2,1)

INSERT INTO roles_usuario(rlu_usr_id,rlu_rl_id) VALUES(2,2)

INSERT INTO roles_usuario(rlu_usr_id,rlu_rl_id) VALUES(3,2)

INSERT INTO roles_usuario(rlu_usr_id,rlu_rl_id) VALUES(4,2)

INSERT INTO roles_usuario(rlu_usr_id,rlu_rl_id) VALUES(4,3)

SELECT @@SERVERNAME AS '3375898HP'

SELECT * FROM usuarios;

--Insertar mas datos en cada tabla
INSERT INTO usuarios(usr_nombre, usr_apellido, usr_email, usr_pais)
VALUES
('Sofía', 'López', 'slopez@gmail.com', 'El Salvador'),
('Carlos', 'Mejía', 'cmejia@yahoo.com', 'Panamá'),
('Lucía', 'Rivas', 'lrivas@outlook.com', 'Costa Rica'),
('Fernando', 'Castro', 'fcastro@gmail.com', 'Guatemala'),
('Valeria', 'Gómez', 'vgomez@gmail.com', 'Honduras');

INSERT INTO roles(rl_nombre) 
VALUES
('Moderador'),
('Auditor'),
('Soporte'),
('Supervisor'),
('Invitado');

INSERT INTO roles_usuario(rlu_usr_id,rlu_rl_id) VALUES(5,3)
INSERT INTO roles_usuario(rlu_usr_id,rlu_rl_id) VALUES(8,6)
INSERT INTO roles_usuario(rlu_usr_id,rlu_rl_id) VALUES(9,7)
