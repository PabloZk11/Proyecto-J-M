-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 13-06-2024 a las 18:06:34
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aulas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_productos`
--

CREATE TABLE `categoria_productos` (
  `id_categoria` int NOT NULL,
  `nombre_categoria` varchar(20) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `categoria_productos`
--

INSERT INTO `categoria_productos` (`id_categoria`, `nombre_categoria`, `descripcion`) VALUES
(1, 'Papeleria', 'Cuadernos ahí xd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devolucion`
--

CREATE TABLE `devolucion` (
  `id_devolucion` int NOT NULL,
  `id_producto` int NOT NULL,
  `unidades` int NOT NULL,
  `id_entrada` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `devolucion`
--

INSERT INTO `devolucion` (`id_devolucion`, `id_producto`, `unidades`, `id_entrada`) VALUES
(1, 1, 10, 2),
(2, 2, 5, 2),
(3, 2, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento_identificacion`
--

CREATE TABLE `documento_identificacion` (
  `id_documento` int NOT NULL,
  `tipo_documento` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `documento_identificacion`
--

INSERT INTO `documento_identificacion` (`id_documento`, `tipo_documento`) VALUES
(1, 'CC'),
(2, 'TI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada_mercancias`
--

CREATE TABLE `entrada_mercancias` (
  `id_entrada` int NOT NULL,
  `cantidad_unidades` int NOT NULL,
  `id_producto` int NOT NULL,
  `id_pedido` int NOT NULL,
  `id_proveedor` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `entrada_mercancias`
--

INSERT INTO `entrada_mercancias` (`id_entrada`, `cantidad_unidades`, `id_producto`, `id_pedido`, `id_proveedor`) VALUES
(2, 20, 1, 2, 1),
(3, 20, 1, 2, 1),
(4, 15, 2, 2, 1),
(5, 1, 2, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_entradas`
--

CREATE TABLE `factura_entradas` (
  `id_factura_entrada` int NOT NULL,
  `unidades` bigint NOT NULL,
  `precio_unitario` float NOT NULL,
  `precio_total` float NOT NULL,
  `fecha` datetime NOT NULL,
  `id_proveedor` int NOT NULL,
  `producto_id_producto` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `factura_entradas`
--

INSERT INTO `factura_entradas` (`id_factura_entrada`, `unidades`, `precio_unitario`, `precio_total`, `fecha`, `id_proveedor`, `producto_id_producto`) VALUES
(1, 10, 1000, 10000, '2024-03-14 12:34:56', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_salida`
--

CREATE TABLE `factura_salida` (
  `Id_factura_salida` int NOT NULL,
  `Cantidad` bigint NOT NULL,
  `Precio_unitario` double NOT NULL,
  `Precio_total` double NOT NULL,
  `Fecha` datetime NOT NULL,
  `id_producto` int NOT NULL,
  `id_vendedor` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `factura_salida`
--

INSERT INTO `factura_salida` (`Id_factura_salida`, `Cantidad`, `Precio_unitario`, `Precio_total`, `Fecha`, `id_producto`, `id_vendedor`) VALUES
(2, 10, 1000, 10000, '2024-03-14 12:34:56', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_informe`
--

CREATE TABLE `log_informe` (
  `id_informe` int NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `detalles_informe` varchar(45) NOT NULL,
  `id_vendedor` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2024_05_03_150127_create_categoria_productos_table', 0),
(2, '2024_05_03_150127_create_devolucion_table', 0),
(3, '2024_05_03_150127_create_documento_identificacion_table', 0),
(4, '2024_05_03_150127_create_entrada_mercancias_table', 0),
(5, '2024_05_03_150127_create_factura_entradas_table', 0),
(6, '2024_05_03_150127_create_factura_salida_table', 0),
(7, '2024_05_03_150127_create_log_informe_table', 0),
(8, '2024_05_03_150127_create_pedido_table', 0),
(9, '2024_05_03_150127_create_productos_table', 0),
(10, '2024_05_03_150127_create_proveedors_table', 0),
(11, '2024_05_03_150127_create_registro_salida_table', 0),
(12, '2024_05_03_150127_create_roles_table', 0),
(13, '2024_05_03_150127_create_usuario_table', 0),
(14, '2024_05_03_150130_add_foreign_keys_to_devolucion_table', 0),
(15, '2024_05_03_150130_add_foreign_keys_to_entrada_mercancias_table', 0),
(16, '2024_05_03_150130_add_foreign_keys_to_factura_entradas_table', 0),
(17, '2024_05_03_150130_add_foreign_keys_to_factura_salida_table', 0),
(18, '2024_05_03_150130_add_foreign_keys_to_log_informe_table', 0),
(19, '2024_05_03_150130_add_foreign_keys_to_pedido_table', 0),
(20, '2024_05_03_150130_add_foreign_keys_to_productos_table', 0),
(21, '2024_05_03_150130_add_foreign_keys_to_proveedors_table', 0),
(22, '2024_05_03_150130_add_foreign_keys_to_registro_salida_table', 0),
(23, '2024_05_03_150130_add_foreign_keys_to_usuario_table', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL,
  `unidades` int NOT NULL,
  `id_producto` int NOT NULL,
  `id_usuario` int NOT NULL,
  `id_proveedor` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `unidades`, `id_producto`, `id_usuario`, `id_proveedor`) VALUES
(2, 20, 1, 2, 1),
(3, 20, 1, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int NOT NULL,
  `nom_producto` varchar(45) NOT NULL,
  `precio_unitario` double NOT NULL,
  `unidades_disponibles` int NOT NULL,
  `marca` varchar(30) NOT NULL,
  `id_proveedor` int NOT NULL,
  `id_categoria` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nom_producto`, `precio_unitario`, `unidades_disponibles`, `marca`, `id_proveedor`, `id_categoria`) VALUES
(1, 'Cuaderno', 1000, 10, 'prisma', 1, 1),
(2, 'auida', 15000, 20, 'ELBICHOOOO', 1, 1),
(3, 'Lapiz Enma', 1500, 150, 'Enma', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedors`
--

CREATE TABLE `proveedors` (
  `id_proveedor` int NOT NULL,
  `nom_proveedor` varchar(500) NOT NULL,
  `productos` varchar(45) NOT NULL,
  `doc_proveedor` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `proveedors`
--

INSERT INTO `proveedors` (`id_proveedor`, `nom_proveedor`, `productos`, `doc_proveedor`) VALUES
(1, 'Alexander', 'Cuadernos, lápices, etc.', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_salida`
--

CREATE TABLE `registro_salida` (
  `id_salida` int NOT NULL,
  `unidades` int NOT NULL,
  `id_factura_salida` int NOT NULL,
  `id_producto` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `registro_salida`
--

INSERT INTO `registro_salida` (`id_salida`, `unidades`, `id_factura_salida`, `id_producto`) VALUES
(1, 20, 2, 2),
(2, 1, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int NOT NULL,
  `nombre_rol` varchar(15) NOT NULL,
  `descripcion_rol` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`, `descripcion_rol`) VALUES
(1, 'Admin', 'Administrador power'),
(2, 'Vendedor', 'Efectua y registra las ventas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contraseña` varchar(200) NOT NULL,
  `id_rol` int NOT NULL,
  `id_documento` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `email`, `contraseña`, `id_rol`, `id_documento`) VALUES
(2, 'Oscar', 'Oscar', 'Oscar', 2, 2),
(3, 'este', 'este@este.com', '$2y$10$EOJBnPXEDEmKRCoVdgfPzOzlCx0wHHgKLY63C3G4bxc0j6wGoIPSe', 2, 1),
(4, 'esteban', 'esteban@esteban.com', '$2y$10$3NMIhBzbbUbqs4kdYBCsX..RosHlrl3NcZW695uc7iriO1ULbxTky', 1, 1),
(5, 'siuu', 'siu@gmail.com', '$2y$10$GJyGObd07CsBTZsO.Amo.uqGdWYPWZlleEitwOASiiaK9leoNIr0G', 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria_productos`
--
ALTER TABLE `categoria_productos`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `devolucion`
--
ALTER TABLE `devolucion`
  ADD PRIMARY KEY (`id_devolucion`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_entrada_devolucion` (`id_entrada`);

--
-- Indices de la tabla `documento_identificacion`
--
ALTER TABLE `documento_identificacion`
  ADD PRIMARY KEY (`id_documento`);

--
-- Indices de la tabla `entrada_mercancias`
--
ALTER TABLE `entrada_mercancias`
  ADD PRIMARY KEY (`id_entrada`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `factura_entradas`
--
ALTER TABLE `factura_entradas`
  ADD PRIMARY KEY (`id_factura_entrada`,`id_proveedor`),
  ADD KEY `fk_factura_entrada_proveedor1` (`id_proveedor`),
  ADD KEY `fk_factura_entrada_producto1` (`producto_id_producto`);

--
-- Indices de la tabla `factura_salida`
--
ALTER TABLE `factura_salida`
  ADD PRIMARY KEY (`Id_factura_salida`),
  ADD KEY `id_vendedor` (`id_vendedor`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `log_informe`
--
ALTER TABLE `log_informe`
  ADD PRIMARY KEY (`id_informe`),
  ADD KEY `id_vendedor` (`id_vendedor`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `fk_pedido_usuario1` (`id_usuario`),
  ADD KEY `fk_pedido_proveedor1` (`id_proveedor`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `fk_producto_proveedor1` (`id_proveedor`),
  ADD KEY `fk_producto_categoria_producto1` (`id_categoria`);

--
-- Indices de la tabla `proveedors`
--
ALTER TABLE `proveedors`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD KEY `fk_proveedor_documento_identificacion1` (`doc_proveedor`);

--
-- Indices de la tabla `registro_salida`
--
ALTER TABLE `registro_salida`
  ADD PRIMARY KEY (`id_salida`),
  ADD KEY `fk_registro_salida_factura_salida1` (`id_factura_salida`),
  ADD KEY `fk_registro_salida_producto1` (`id_producto`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_usuario_roles` (`id_rol`),
  ADD KEY `fk_usuario_documento_identificacion1` (`id_documento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria_productos`
--
ALTER TABLE `categoria_productos`
  MODIFY `id_categoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `devolucion`
--
ALTER TABLE `devolucion`
  MODIFY `id_devolucion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `entrada_mercancias`
--
ALTER TABLE `entrada_mercancias`
  MODIFY `id_entrada` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `factura_entradas`
--
ALTER TABLE `factura_entradas`
  MODIFY `id_factura_entrada` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `factura_salida`
--
ALTER TABLE `factura_salida`
  MODIFY `Id_factura_salida` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `proveedors`
--
ALTER TABLE `proveedors`
  MODIFY `id_proveedor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `registro_salida`
--
ALTER TABLE `registro_salida`
  MODIFY `id_salida` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `devolucion`
--
ALTER TABLE `devolucion`
  ADD CONSTRAINT `devolucion_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  ADD CONSTRAINT `devolucion_ibfk_2` FOREIGN KEY (`id_entrada`) REFERENCES `entrada_mercancias` (`id_entrada`);

--
-- Filtros para la tabla `entrada_mercancias`
--
ALTER TABLE `entrada_mercancias`
  ADD CONSTRAINT `entrada_mercancias_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  ADD CONSTRAINT `entrada_mercancias_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `entrada_mercancias_ibfk_3` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedors` (`id_proveedor`);

--
-- Filtros para la tabla `factura_entradas`
--
ALTER TABLE `factura_entradas`
  ADD CONSTRAINT `fk_factura_entrada_producto1` FOREIGN KEY (`producto_id_producto`) REFERENCES `productos` (`id_producto`),
  ADD CONSTRAINT `fk_factura_entrada_proveedor1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedors` (`id_proveedor`);

--
-- Filtros para la tabla `factura_salida`
--
ALTER TABLE `factura_salida`
  ADD CONSTRAINT `factura_salida_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  ADD CONSTRAINT `factura_salida_ibfk_2` FOREIGN KEY (`id_vendedor`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `factura_salida_ibfk_3` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `log_informe`
--
ALTER TABLE `log_informe`
  ADD CONSTRAINT `log_informe_ibfk_1` FOREIGN KEY (`id_vendedor`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_proveedor1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedors` (`id_proveedor`),
  ADD CONSTRAINT `fk_pedido_usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_producto_categoria_producto1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_productos` (`id_categoria`),
  ADD CONSTRAINT `fk_producto_proveedor1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedors` (`id_proveedor`);

--
-- Filtros para la tabla `proveedors`
--
ALTER TABLE `proveedors`
  ADD CONSTRAINT `fk_proveedor_documento_identificacion1` FOREIGN KEY (`doc_proveedor`) REFERENCES `documento_identificacion` (`id_documento`);

--
-- Filtros para la tabla `registro_salida`
--
ALTER TABLE `registro_salida`
  ADD CONSTRAINT `fk_registro_salida_factura_salida1` FOREIGN KEY (`id_factura_salida`) REFERENCES `factura_salida` (`Id_factura_salida`),
  ADD CONSTRAINT `fk_registro_salida_producto1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_documento_identificacion1` FOREIGN KEY (`id_documento`) REFERENCES `documento_identificacion` (`id_documento`),
  ADD CONSTRAINT `fk_usuario_roles` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
