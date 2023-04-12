create schema tp_integrador;
use tp_integrador;
CREATE TABLE `usuarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `foto_de_perfil` varchar(200) DEFAULT NULL,
  `dni` int(11) NOT NULL,
  `fecha_de_nac` date NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `dni` (`dni`)
);
CREATE TABLE `productos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text NOT NULL,
  `usuario_id` int(10) unsigned NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletedAt` timestamp NULL DEFAULT NULL,
  `img_url` text,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_id` (`usuario_id`),
  CONSTRAINT `fk_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
);

CREATE TABLE `comentarios` (
  `id_comentario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuarios_id` int(10) unsigned DEFAULT NULL,
  `productos_id` int(10) unsigned DEFAULT NULL,
  `texto` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_comentario`),
  KEY `fk_usuarios_id` (`usuarios_id`),
  KEY `fk_productos_id` (`productos_id`),
  CONSTRAINT `fk_productos_id` FOREIGN KEY (`productos_id`) REFERENCES `productos` (`id`),
  CONSTRAINT `fk_usuarios_id` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`)
);
ALTER TABLE `tp_integrador`.`usuarios` 
ADD COLUMN `username` VARCHAR(45) NOT NULL AFTER `deletedAt`;

INSERT INTO usuarios (nombre, username, password, email, dni, fecha_de_nac)
	VALUES ("julia", "julighio", "123", "julighio@gmail.com", 44891513, "2003/07/11");

INSERT INTO usuarios (nombre, username, password, email, dni, fecha_de_nac)
	VALUES ("benjamin", "benjagrondona", "1234", "benjagrondona@gmail.com", 42671346, "2003/10/18");
    
INSERT INTO usuarios (nombre, username, password, email, dni, fecha_de_nac)
	VALUES ("tomas", "tomasharten", "12345", "tomasharten@gmail.com", 43630146, "2004/02/28");
    
INSERT INTO usuarios (nombre, username, password, email, dni, fecha_de_nac)
	VALUES ("lucia", "luliaurelio", "123456", "luliaurelio@gmail.com", 45233349, "2003/10/20");

INSERT INTO usuarios (nombre, username, password, email, dni, fecha_de_nac)
	VALUES ("mora", "morirobredo", "1234567", "morirobredo@gmail.com", 42335556, "2004/03/15");

INSERT INTO productos (usuario_id, nombre, descripcion)
	VALUES (1, "Soda Estereo", "Vinilo de Soda Estereo");

INSERT INTO productos (usuario_id, nombre, descripcion)
	VALUES (2, "The Beatles", "Vinilo de The Beatles");

INSERT INTO productos (usuario_id, nombre, descripcion)
	VALUES (3, "Coldplay", "Vinilo de Coldplay");

INSERT INTO productos (usuario_id, nombre, descripcion)
	VALUES (5, "C-Tangana", "Vinilo de C-Tangana");

INSERT INTO productos (usuario_id, nombre, descripcion)
	VALUES (6, "Julieta Venegas", "Vinilo de Julieta Venegas");

INSERT INTO productos (usuario_id, nombre, descripcion)
	VALUES (1, "Mana", "Vinilo de Mana");

INSERT INTO productos (usuario_id, nombre, descripcion)
	VALUES (2, "Maroon 5", "Vinilo de Maroon 5");

INSERT INTO productos (usuario_id, nombre, descripcion)
	VALUES (3, "Myke Towers", "Vinilo de Myke Towers");

INSERT INTO productos (usuario_id, nombre, descripcion)
	VALUES (5, "Rels B", "Vinilo de Rels B");

INSERT INTO productos (usuario_id, nombre, descripcion)
	VALUES (6, "Wos", "Vinilo de Wos");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (1,1, "Me encanto este album!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (2,1, "Amo Soda!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (3,1, "No es de mis preferidos");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (5,1, "Mi banda preferida!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (6,2, "Me encanto este album!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (2,2, "Amo!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (3,2, "No es de mis preferidos");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (5,2, "Mi banda preferida!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (1,3, "Me encanto este album!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (2,3, "Amo Soda!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (3,3, "No es de mis preferidos");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (5,3, "Mi banda preferida!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (6,4, "Me encanto este album!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (2,4, "Amo!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (3,4, "No es de mis preferidos");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (5,4, "Mi banda preferida!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (1,5, "Me encanto este album!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (2,5, "Amo!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (3,5, "No es de mis preferidos");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (6,5, "Mi banda preferida!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (1,6, "Me encanto este album!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (6,6, "Amo!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (5,6, "No es de mis preferidos");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (2,6, "Mi banda preferida!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (1,7, "Me encanto este album!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (2,7, "Amo!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (3,7, "No es de mis preferidos");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (5,7, "Mi banda preferida!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (6,8, "Me encanto este album!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (2,8, "Amo!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (3,8, "No es de mis preferidos");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (5,8, "Mi banda preferida!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (1,9, "Me encanto este album!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (2,9, "Amo!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (3,9, "No es de mis preferidos");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (5,9, "Mi banda preferida!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (1,10, "Me encanto este album!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (3,10, "Amo!");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (2,10, "No es de mis preferidos");

INSERT INTO comentarios  (usuarios_id, productos_id, texto)
	VALUES (6,10, "Mi banda preferida!");