-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8889
-- Tiempo de generación: 15-06-2023 a las 21:05:41
-- Versión del servidor: 5.7.39
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tp_integrador`
--
-- Estructura de tabla para la tabla `usuarios`
--
DROP schema tp_integrador;
Create schema tp_integrador;
  USE tp_integrador;
CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `foto_de_perfil` varchar(200) DEFAULT NULL,
  `dni` int(11) NOT NULL,
  `fecha_de_nac` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `username` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `foto_de_perfil`, `dni`, `fecha_de_nac`, `created_at`, `updated_at`, `deleted_at`, `username`) VALUES
(1, 'julia', 'julighio@gmail.com', '123', NULL, 44891513, '2003-07-11', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL, 'julighio'),
(2, 'benjamin', 'benjagrondona@gmail.com', '1234', NULL, 42671346, '2003-10-18', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL, 'benjagrondona'),
(3, 'tomas', 'tomasharten@gmail.com', '12345', NULL, 43630146, '2004-02-28', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL, 'tomasharten'),
(4, 'lucia', 'luliaurelio@gmail.com', '123456', NULL, 45233349, '2003-10-20', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL, 'luliaurelio'),
(5, 'mora', 'morirobredo@gmail.com', '1234567', NULL, 42335556, '2004-03-15', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL, 'morirobredo'),
(6, 'Otilia', 'otirivas4@gmail.com', '$2a$12$Jo51qrrY1A3Z9428HjHULOS7RYQ68kkwgcaZpphrZJnTM5YPSkqy6', NULL, 22205269, '2023-06-02', '2023-06-07 20:37:33', '2023-06-07 20:37:33', NULL, 'otiirivas4'),
(7, 'tom', 'thom@gmail.com', '$2a$12$ruQFOflbHUiuR3oJ68.Eq.Z416vmMDK8GERiI2OWGvFZcDzX4QOVW', NULL, 456282984, '2023-06-01', '2023-06-12 20:20:46', '2023-06-12 20:20:46', NULL, 'tomatel'),
(9, 'yas', 'yasr@gmail.com', '$2a$12$h8lqQOOhpFVmI55phoFpJONUceyPNaQez6aOz.wom28xsBIPAmdD.', NULL, 28748021, '2023-06-03', '2023-06-15 00:05:57', '2023-06-15 00:05:57', NULL, 'yayu'),
(14, 'martu', 'martughio@gmail.com', '$2a$12$Ir3xdI599r1faUZwDDcJdeCC8VeQ0SO0C/p0dUO823wWi2Y5tfHEy', NULL, 928390242, '2023-06-03', '2023-06-15 20:39:21', '2023-06-15 20:39:21', NULL, 'martugr');

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `img_url` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `usuario_id`, `created_at`, `updated_at`, `deleted_at`, `img_url`) VALUES
(1, 'Soda Estereo', 'Vinilo de Soda Estereo', 1, '2023-06-04 16:26:25', '2023-06-12 20:53:14', NULL, 'https://d22fxaf9t8d39k.cloudfront.net/34646c34bf1128ad5fc3669f9c4ca24703b3ba39e81743e5b7335f5d76723fdd8462.png'),
(2, 'The Beatles', 'Vinilo de The Beatles', 2, '2023-06-04 16:26:25', '2023-06-12 20:48:21', NULL, 'https://http2.mlstatic.com/D_NQ_NP_694433-MLA48853136433_012022-O.webp'),
(3, 'Coldplay', 'Vinilo de Coldplay', 3, '2023-06-04 16:26:25', '2023-06-12 20:48:21', NULL, 'https://http2.mlstatic.com/D_NQ_NP_948954-MLA52911316432_122022-O.webp'),
(4, 'C-Tangana', 'Vinilo de C-Tangana', 5, '2023-06-04 16:26:25', '2023-06-12 20:48:21', NULL, 'https://http2.mlstatic.com/D_NQ_NP_729238-MLA47556906748_092021-O.webp'),
(5, 'Julieta Venegas', 'Vinilo de Julieta Venegas', 7, '2023-06-04 16:26:25', '2023-06-12 22:48:21', NULL, 'https://http2.mlstatic.com/D_NQ_NP_667742-MLM54205492548_032023-O.webp'),
(6, 'Mana', 'Vinilo de Mana', 1, '2023-06-04 16:26:25', '2023-06-12 20:48:21', NULL, 'https://http2.mlstatic.com/D_NQ_NP_707203-MLA44261353869_122020-O.webp'),
(7, 'Maroon 5', 'Vinilo de Maroon 5', 2, '2023-06-04 16:26:25', '2023-06-12 20:53:14', NULL, 'https://http2.mlstatic.com/D_NQ_NP_899689-MLM69471412813_052023-O.webp'),
(8, 'Myke Towers', 'Vinilo de Myke Towers', 3, '2023-06-04 16:26:25', '2023-06-12 20:48:21', NULL, 'https://pro2-bar-s3-cdn-cf1.myportfolio.com/28930860-437c-4efa-9eef-fd179cd2dd47/2577db48-a608-47de-bda9-3460b7d4ee4c_rw_1920.jpg?h=785337145d4076bcdcf5405338caa8cc'),
(9, 'Rels B', 'Vinilo de Rels B', 5, '2023-06-04 16:26:25', '2023-06-12 20:53:14', NULL, 'https://mir-s3-cdn-cf.behance.net/projects/404/72affe112644465.Y3JvcCwyMTczLDE3MDAsMTEyLDA.jpg'),
(10, 'Wos', 'Vinilo de Wos', 4, '2023-06-04 16:26:25', '2023-06-12 20:48:21', NULL, 'https://d3ugyf2ht6aenh.cloudfront.net/stores/002/687/119/products/caravana-frente1-fdec812a6a2ea6217e16787309154897-480-0.webp'),
(15, 'Duki', 'Vinilo de duki', 14, '2023-06-15 20:40:05', '2023-06-15 20:40:05', NULL, 'https://http2.mlstatic.com/D_NQ_NP_735803-MLA48487747727_122021-W.jpg');

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id_comentario` int(10) UNSIGNED NOT NULL,
  `usuarios_id` int(10) UNSIGNED DEFAULT NULL,
  `productos_id` int(10) UNSIGNED DEFAULT NULL,
  `texto` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id_comentario`, `usuarios_id`, `productos_id`, `texto`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'Me encanto este album!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(2, 2, 1, 'Amo Soda!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(3, 3, 1, 'No es de mis preferidos', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(4, 5, 1, 'Mi banda preferida!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(5, 3, 2, 'Me encanto este album!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(6, 2, 2, 'Amo!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(7, 3, 2, 'No es de mis preferidos', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(8, 5, 2, 'Mi banda preferida!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(9, 1, 3, 'Me encanto este album!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(10, 2, 3, 'Amo Soda!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(11, 3, 3, 'No es de mis preferidos', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(12, 5, 3, 'Mi banda preferida!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(13, 1, 4, 'Me encanto este album!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(14, 2, 4, 'Amo!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(15, 3, 4, 'No es de mis preferidos', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(16, 5, 4, 'Mi banda preferida!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(17, 1, 5, 'Me encanto este album!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(18, 2, 5, 'Amo!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(19, 3, 5, 'No es de mis preferidos', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(20, 2, 5, 'Mi banda preferida!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(21, 1, 6, 'Me encanto este album!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(22, 4, 6, 'Amo!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(23, 5, 6, 'No es de mis preferidos', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(24, 2, 6, 'Mi banda preferida!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(25, 1, 7, 'Me encanto este album!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(26, 2, 7, 'Amo!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(27, 3, 7, 'No es de mis preferidos', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(28, 5, 7, 'Mi banda preferida!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(29, 4, 8, 'Me encanto este album!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(30, 2, 8, 'Amo!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(31, 3, 8, 'No es de mis preferidos', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(32, 5, 8, 'Mi banda preferida!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(33, 1, 9, 'Me encanto este album!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(34, 2, 9, 'Amo!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(35, 3, 9, 'No es de mis preferidos', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(36, 5, 9, 'Mi banda preferida!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(37, 1, 10, 'Me encanto este album!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(38, 3, 10, 'Amo!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(39, 2, 10, 'No es de mis preferidos', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(40, 4, 10, 'Mi banda preferida!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL),
(41, 7, 2, 'Amo', '2023-06-14 14:54:39', '2023-06-14 14:54:39', NULL),
(42, 7, 3, 'Tremendo show', '2023-06-14 14:57:36', '2023-06-14 14:57:36', NULL),
(43, 7, 2, 'no me gusta', '2023-06-14 15:09:24', '2023-06-14 15:09:24', NULL),
(44, 7, 15, 'Me encanto este album', '2023-06-15 20:40:27', '2023-06-15 20:40:27', NULL),
(45, 7, 15, 'Duki es mi cantante preferido', '2023-06-15 20:40:35', '2023-06-15 20:40:35', NULL);

-- --------------------------------------------------------


--

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `fk_usuarios_id` (`usuarios_id`),
  ADD KEY `fk_productos_id` (`productos_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario_id` (`usuario_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id_comentario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `fk_productos_id` FOREIGN KEY (`productos_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `fk_usuarios_id` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
