-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 31-08-2023 a las 21:35:46
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

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
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id_admin` int(11) NOT NULL,
  `id_tdoc_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_entrada_mercancia`
--

CREATE TABLE `detalles_entrada_mercancia` (
  `id_mercancia_detalle` int(11) NOT NULL,
  `id_producto_detalle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_factura`
--

CREATE TABLE `detalles_factura` (
  `id_factura_detalle` int(11) NOT NULL,
  `id_producto_detalle` int(11) NOT NULL,
  `unidades` int(11) NOT NULL,
  `precio` varchar(45) NOT NULL,
  `precio_total` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_pedido_productos`
--

CREATE TABLE `detalles_pedido_productos` (
  `id_pedido_detalle` int(11) NOT NULL,
  `id_producto_detalle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devoluciones`
--

CREATE TABLE `devoluciones` (
  `id_devolucion` int(11) NOT NULL,
  `nom_producto` varchar(45) NOT NULL,
  `unidades` int(11) NOT NULL,
  `detalle` varchar(45) NOT NULL,
  `id_entrada_devolucion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas_mercacia`
--

CREATE TABLE `entradas_mercacia` (
  `id_entrada` int(11) NOT NULL,
  `nom_producto` varchar(45) NOT NULL,
  `cantidad_unidades` varchar(45) NOT NULL,
  `precio_compra` varchar(45) NOT NULL,
  `detalles_descripcion` varchar(45) NOT NULL,
  `id_pedido_entrada` int(11) NOT NULL,
  `id_proveedor_entrada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_factura` int(11) NOT NULL,
  `id_tdoc_vendedor_factura` int(11) NOT NULL,
  `id_vendedor_factura` int(11) NOT NULL,
  `precio_total` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informes`
--

CREATE TABLE `informes` (
  `id_informe` int(11) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `categoria` varchar(45) NOT NULL,
  `detalles_informe` varchar(45) NOT NULL,
  `archivo_pdf` varchar(45) DEFAULT NULL,
  `id_vendedor_informe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `precio` varchar(45) NOT NULL,
  `unidades` varchar(45) NOT NULL,
  `detalles_descripcion` varchar(45) NOT NULL,
  `nom_producto` varchar(45) NOT NULL,
  `id_admin_pedido` int(11) NOT NULL,
  `id_proveedor_pedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nom_producto` varchar(45) NOT NULL,
  `precio` varchar(45) NOT NULL,
  `unidades` int(11) NOT NULL,
  `detalles_descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `id_tdoc_proveedor` int(11) NOT NULL,
  `producto` varchar(45) NOT NULL,
  `detalles_productos` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_salidas`
--

CREATE TABLE `registro_salidas` (
  `id_salida` int(11) NOT NULL,
  `nom_producto` varchar(45) NOT NULL,
  `id_factura_salidas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `id_tdoc_usuario` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Contraseña` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `validacion_documento`
--

CREATE TABLE `validacion_documento` (
  `id_documento` int(11) NOT NULL,
  `tipo_documento` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedor`
--

CREATE TABLE `vendedor` (
  `id_usuario_papeleria` int(11) NOT NULL,
  `id_tdoc_vendedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_admin`,`id_tdoc_admin`);

--
-- Indices de la tabla `detalles_entrada_mercancia`
--
ALTER TABLE `detalles_entrada_mercancia`
  ADD PRIMARY KEY (`id_mercancia_detalle`,`id_producto_detalle`);

--
-- Indices de la tabla `detalles_factura`
--
ALTER TABLE `detalles_factura`
  ADD PRIMARY KEY (`id_factura_detalle`,`id_producto_detalle`);

--
-- Indices de la tabla `detalles_pedido_productos`
--
ALTER TABLE `detalles_pedido_productos`
  ADD PRIMARY KEY (`id_pedido_detalle`,`id_producto_detalle`);

--
-- Indices de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD PRIMARY KEY (`id_devolucion`);

--
-- Indices de la tabla `entradas_mercacia`
--
ALTER TABLE `entradas_mercacia`
  ADD PRIMARY KEY (`id_entrada`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`,`id_tdoc_vendedor_factura`);

--
-- Indices de la tabla `informes`
--
ALTER TABLE `informes`
  ADD PRIMARY KEY (`id_informe`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`,`id_tdoc_proveedor`);

--
-- Indices de la tabla `registro_salidas`
--
ALTER TABLE `registro_salidas`
  ADD PRIMARY KEY (`id_salida`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`,`id_tdoc_usuario`);

--
-- Indices de la tabla `validacion_documento`
--
ALTER TABLE `validacion_documento`
  ADD PRIMARY KEY (`id_documento`);

--
-- Indices de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`id_usuario_papeleria`,`id_tdoc_vendedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  MODIFY `id_devolucion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entradas_mercacia`
--
ALTER TABLE `entradas_mercacia`
  MODIFY `id_entrada` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registro_salidas`
--
ALTER TABLE `registro_salidas`
  MODIFY `id_salida` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
