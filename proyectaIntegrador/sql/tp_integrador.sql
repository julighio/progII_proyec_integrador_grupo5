
--
DROP schema tp_integrador;
Create schema tp_integrador;
--

-- --------------------------------------------------------

--

--

-- --------------------------------------------------------
--

--
USE tp_integrador;
--
-- Estructura de tabla para la tabla `usuarios`
--

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
(6, 'Otilia', 'otirivas4@gmail.com', '$2a$12$Jo51qrrY1A3Z9428HjHULOS7RYQ68kkwgcaZpphrZJnTM5YPSkqy6', NULL, 22205269, '2023-06-02', '2023-06-07 20:37:33', '2023-06-07 20:37:33', NULL, 'otiirivas4');

--
-- --------------------------------------------------------
CREATE TABLE `productos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `img_url` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `usuario_id`, `created_at`, `updated_at`, `deleted_at`, `img_url`) VALUES
(1, 'Soda Estereo', 'Vinilo de Soda Estereo', 1, '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL, NULL),
(2, 'The Beatles', 'Vinilo de The Beatles', 2, '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL, NULL),
(3, 'Coldplay', 'Vinilo de Coldplay', 3, '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL, NULL),
(4, 'C-Tangana', 'Vinilo de C-Tangana', 5, '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL, NULL),
(5, 'Julieta Venegas', 'Vinilo de Julieta Venegas', 5, '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL, NULL),
(6, 'Mana', 'Vinilo de Mana', 1, '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL, NULL),
(7, 'Maroon 5', 'Vinilo de Maroon 5', 2, '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL, NULL),
(8, 'Myke Towers', 'Vinilo de Myke Towers', 3, '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL, NULL),
(9, 'Rels B', 'Vinilo de Rels B', 5, '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL, NULL),
(10, 'Wos', 'Vinilo de Wos', 4, '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL, NULL);

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
(40, 4, 10, 'Mi banda preferida!', '2023-06-04 16:26:25', '2023-06-04 16:26:25', NULL);

-- --------------------------------------------------------

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
  MODIFY `id_comentario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
