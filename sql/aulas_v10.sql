-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-02-2024 a las 16:12:34
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aulas_v9`
--

DELIMITER $$
--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `encrypt_password` (`input_password` VARCHAR(255)) RETURNS VARBINARY(255)  BEGIN
    DECLARE encrypted_password VARBINARY(255);
    SET encrypted_password = AES_ENCRYPT(input_password, 'jmclave');
    RETURN encrypted_password;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id_admin` int(11) NOT NULL,
  `id_tdoc_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id_admin`, `id_tdoc_admin`) VALUES
(101, 1),
(102, 2),
(103, 3),
(104, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto`
--

CREATE TABLE `categoria_producto` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(20) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria_producto`
--

INSERT INTO `categoria_producto` (`id_categoria`, `nombre_categoria`, `descripcion`) VALUES
(301, 'Papeleria Basica', 'Materiales y productos basicos de una papeleria'),
(302, 'Joyeria', 'Un establecimiento que vende joyas y accesorios, a menudo hechos de materiales preciosos como oro, p'),
(303, 'Tecnologia', 'Una tienda especializada que ofrece una amplia variedad de juguetes y productos relacionados para mi'),
(304, 'Aseo y Limpieza', 'producto utilizados en aseo y limpieza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_entrada_mercancia`
--

CREATE TABLE `detalle_entrada_mercancia` (
  `id_mercancia_detalle` int(11) NOT NULL,
  `id_producto_detalle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_entrada_mercancia`
--

INSERT INTO `detalle_entrada_mercancia` (`id_mercancia_detalle`, `id_producto_detalle`) VALUES
(1002, 401),
(1003, 402),
(1004, 403),
(1005, 404),
(1006, 405),
(1007, 406),
(1008, 407),
(1009, 408),
(1009, 409);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `id_factura_detalle` int(11) NOT NULL,
  `id_producto_detalle` int(11) NOT NULL,
  `unidades` int(11) NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_factura`
--

INSERT INTO `detalle_factura` (`id_factura_detalle`, `id_producto_detalle`, `unidades`, `precio`) VALUES
(501, 401, 25, 27000),
(502, 402, 50, 28000),
(503, 403, 75, 11500),
(504, 404, 42, 24000),
(505, 405, 5, 97000),
(506, 406, 50, 69000),
(507, 407, 100, 7500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido_producto`
--

CREATE TABLE `detalle_pedido_producto` (
  `id_pedido_detalle` int(11) NOT NULL,
  `id_producto_detalle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_pedido_producto`
--

INSERT INTO `detalle_pedido_producto` (`id_pedido_detalle`, `id_producto_detalle`) VALUES
(801, 401),
(802, 402),
(803, 403),
(804, 404),
(805, 405),
(806, 406),
(807, 407),
(808, 408),
(809, 409),
(810, 410),
(811, 411),
(812, 412),
(813, 413),
(814, 414),
(815, 415);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devolucion`
--

CREATE TABLE `devolucion` (
  `id_devolucion` int(11) NOT NULL,
  `nom_producto` varchar(45) NOT NULL,
  `unidades` int(11) NOT NULL,
  `detalle` varchar(45) NOT NULL,
  `id_entrada_devolucion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `devolucion`
--

INSERT INTO `devolucion` (`id_devolucion`, `nom_producto`, `unidades`, `detalle`, `id_entrada_devolucion`) VALUES
(1201, 'Borrador', 25, 'Borrador Pelikan miga de pan X 20 und MP-20', 1002),
(1202, 'Tajalapiz', 10, 'Tajalapiz electrico studmarkTajalapiz electri', 1003),
(1203, 'Tinta', 5, 'Tinta pelikan para sellos', 1004),
(1204, 'Corrector', 30, 'Cinta Correcota faber castell', 1005);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento_identificacion`
--

CREATE TABLE `documento_identificacion` (
  `id_documento` int(11) NOT NULL,
  `tipo_documento` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `documento_identificacion`
--

INSERT INTO `documento_identificacion` (`id_documento`, `tipo_documento`) VALUES
(1, 'CC'),
(2, 'CE'),
(3, 'TI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada_mercancia`
--

CREATE TABLE `entrada_mercancia` (
  `id_entrada` int(11) NOT NULL,
  `nom_producto` varchar(45) NOT NULL,
  `cantidad_unidades` int(10) NOT NULL,
  `precio_compra` double NOT NULL,
  `detalles_descripcion` varchar(45) NOT NULL,
  `id_pedido_entrada` int(11) NOT NULL,
  `id_proveedor_entrada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entrada_mercancia`
--

INSERT INTO `entrada_mercancia` (`id_entrada`, `nom_producto`, `cantidad_unidades`, `precio_compra`, `detalles_descripcion`, `id_pedido_entrada`, `id_proveedor_entrada`) VALUES
(1002, 'Borrador', 10, 24000, 'Caja borrador negro X20 und TK-20B', 802, 106),
(1003, 'Colores', 15, 11500, 'Caja de Colores Metalizados Kiut Norma x 6', 803, 107),
(1004, 'Calculadora', 25, 76000, 'Calculadora 252 Funciones Casio FX82LA PLUS', 804, 108),
(1005, 'Colores', 30, 19200, 'Colores doblepunta Scribe InColors x15 ', 805, 105),
(1006, 'Colores', 35, 159000, 'Colores Super Soft X 100 Faber Castell', 806, 106),
(1007, 'Combo teclado/mouse', 40, 119000, 'Combo Teclado/Mouse Genius Inalámbricos KM810', 807, 107),
(1008, 'Mouse', 45, 21000, 'Mouse Alambrico DX-120 Genius', 808, 108),
(1009, 'Grapadora', 50, 25000, 'Grapadora', 809, 105),
(1010, 'Mouse', 55, 79000, 'Mouse Inalámbrico Logitech M187', 810, 106),
(1011, 'Perforadora', 60, 25000, 'Perforadora offiesco ref OE-350', 811, 107);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_entrada`
--

CREATE TABLE `factura_entrada` (
  `id_factura_entrada` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_salida`
--

CREATE TABLE `factura_salida` (
  `id_factura` int(11) NOT NULL,
  `id_vendedor_factura` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura_salida`
--

INSERT INTO `factura_salida` (`id_factura`, `id_vendedor_factura`, `descripcion`, `fecha`) VALUES
(501, 109, 'Bascula digital', '2023-09-11 15:28:30'),
(502, 110, 'Borrado Pelikan Miga de Pan', '2023-09-11 15:28:30'),
(503, 111, 'Caja de Colores Pastel Kiut Norma x 6', '2023-09-05 15:28:34'),
(504, 112, 'Caja Borrador faber castell X 20 und TK-20F', '2023-09-28 15:28:38'),
(505, 113, 'Calculadora 240 Funciones Casio FX82MS', '2023-09-17 15:28:46'),
(506, 114, 'Cinta correctora faber castell', '2023-09-25 15:28:42'),
(507, 115, 'Colores Norma Premium x 24(NULL)', '2023-09-21 15:28:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_informe`
--

CREATE TABLE `log_informe` (
  `id_informe` int(11) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `detalles_informe` varchar(45) NOT NULL,
  `id_vendedor_informe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `log_informe`
--

INSERT INTO `log_informe` (`id_informe`, `fecha_creacion`, `detalles_informe`, `id_vendedor_informe`) VALUES
(701, '2023-09-07 10:41:47', 'Conjunto de hojas de papel', 109),
(702, '2023-09-11 10:41:51', 'Es un instrumento de escritura', 110),
(703, '2023-09-22 10:42:03', 'Generalmente de cartón o plástico doblada', 111),
(704, '2023-09-22 10:42:03', 'Papel tamaño carta-oficio blanco ', 112),
(705, '2023-09-02 10:42:08', 'El marcador es un cilindro de plástico', 113);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `precio` double NOT NULL,
  `unidades` int(10) NOT NULL,
  `detalles_descripcion` varchar(100) NOT NULL,
  `nom_producto` varchar(45) NOT NULL,
  `id_admin_pedido` int(11) NOT NULL,
  `id_proveedor_pedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `precio`, `unidades`, `detalles_descripcion`, `nom_producto`, `id_admin_pedido`, `id_proveedor_pedido`) VALUES
(801, 10, 10, 'Corrector De Postura', 'Corrector de postura ', 101, 105),
(802, 20, 12, 'Lapiz Infinito', 'Lapiz', 102, 106),
(803, 30, 20, 'Tinta Borrable Para Marcadores Ecomax', 'Tinta borrable', 103, 107),
(804, 40, 60, 'Rollo Papel Kaft 20 Pulgadas-150', 'Papel kraft', 104, 108),
(805, 50, 50, 'Huellero Dactilar Artline', 'Huellero', 101, 105),
(806, 60, 40, 'Portafolio, Carpeta Notas', 'Portafolio', 102, 106),
(807, 70, 23, '900 Piezas Wiggle Googly Eyes', 'Wiggle', 103, 107),
(808, 80, 40, 'Cinta Espuma Doble Adhesiva 18mmX 50 mts ', 'Cinta', 104, 108),
(809, 90, 65, 'Rollo  Plastico  Papel Burbuja', 'Papel burbuja', 101, 105),
(810, 100, 100, '50 Piezas De Accesorios Para Llavera De Ani', 'Accesorios de llaveros', 102, 106),
(811, 110, 15, 'Kits De Encuadernacion, Sumimnistros De Encua', 'Encuadernacion', 103, 107),
(812, 111, 2, 'Recortes De Sandia 48 Piezas Actividades Educ', 'Recortes', 104, 108),
(813, 112, 1, 'Rollo Carrugado X50 m2 Proteccion Piso', 'Carton Corrugado', 101, 105),
(814, 113, 15, 'Set Marcador Punta Pincel Edding Colour Happ', 'Marcadores', 102, 106),
(815, 114, 56, 'Bisturi Punta De Lanza *15 und', 'Bisturi', 103, 107);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `id_categoria_producto` int(11) DEFAULT NULL,
  `nom_producto` varchar(45) NOT NULL,
  `precio` double NOT NULL,
  `unidades` int(11) NOT NULL,
  `detalles_descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `id_categoria_producto`, `nom_producto`, `precio`, `unidades`, `detalles_descripcion`) VALUES
(401, 304, 'Paquete jabon baño', 27000, 25, 'Bascula Digital '),
(402, 301, 'Borradores', 28000, 50, 'Borrador Pelican Miga de Pan X20 und'),
(403, 301, 'Colores', 11500, 75, 'Caja de colores Pastel Kiut Norma X6'),
(404, 301, 'Borrador', 24000, 42, 'Caja Borrador Faber-Castell X20 und'),
(405, 301, 'Calculadora', 69000, 50, 'Calculadora 240 Funciones Casio'),
(406, 301, 'Corrector', 7500, 100, 'Cinta Correctora Faber-Castell'),
(407, 301, 'Colores ', 49000, 20, 'Colores Norma Premium X24'),
(408, 303, 'Combo teclado y mouse', 122000, 35, 'Combo Teclado/Mouse Genius LuceMate'),
(409, 303, 'Consola Retro', 110000, 89, 'Consola Retro'),
(410, 301, 'Grapadora', 18500, 10, 'Grapadora Ofiesco'),
(411, 303, 'Mouse', 64000, 15, 'Mouse Inalambrico  Logitech'),
(412, 301, 'Perforadora', 9800, 45, 'Perforadora Ofiesco Metalica'),
(413, 302, 'Collar Ater 8 Auten', 97000, 5, 'Plancha Gama'),
(414, 301, 'Tinta', 6100, 10, 'Tinta pelikan Para Sellos'),
(415, 301, 'Tajalapiz', 2500, 25, 'Tajalapiz Electrico Studmarck'),
(416, 303, 'TarjetaGraficaRTX3060', 50000, 10, 'siuuu');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `id_tdoc_proveedor` int(11) NOT NULL,
  `producto` varchar(45) NOT NULL,
  `detalles_productos` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `id_tdoc_proveedor`, `producto`, `detalles_productos`) VALUES
(105, 2, 'Plancha Gama', 'Plancha Gama'),
(106, 3, 'Colores', 'Colores Norma Premium'),
(107, 1, 'Borrador', 'Borrador Nata Pelikan '),
(108, 2, 'Cartilla', 'Cartilla Aprendiendo Lettering 1.0 Aristan');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_salida`
--

CREATE TABLE `registro_salida` (
  `id_salida` int(11) NOT NULL,
  `nom_producto` varchar(45) NOT NULL,
  `id_factura_salidas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registro_salida`
--

INSERT INTO `registro_salida` (`id_salida`, `nom_producto`, `id_factura_salidas`) VALUES
(601, 'Bascula digital', 501),
(602, 'Borrador ', 502),
(603, 'Colores', 503),
(604, 'Borrador', 504),
(605, 'Calculadora', 505);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(15) NOT NULL,
  `descripcion_rol` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`, `descripcion_rol`) VALUES
(201, 'Administrador', 'Responsable de la gestión general del negocio, la '),
(202, 'Empleado de Ven', 'Se encarga de la promoción, la comercialización y '),
(203, 'Cajero', ' Maneja las transacciones de pago, registra las ve');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_usuario`
--

CREATE TABLE `rol_usuario` (
  `id_usuario_rol` int(11) NOT NULL,
  `id_rol_usuario` int(11) NOT NULL,
  `id_tdoc_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol_usuario`
--

INSERT INTO `rol_usuario` (`id_usuario_rol`, `id_rol_usuario`, `id_tdoc_usuario`) VALUES
(101, 201, 1),
(102, 202, 2),
(103, 203, 3),
(104, 201, 1),
(105, 202, 2),
(106, 203, 3),
(107, 201, 1),
(108, 202, 2),
(109, 203, 3),
(110, 201, 1),
(111, 202, 1),
(112, 203, 2),
(113, 201, 3),
(114, 202, 1),
(115, 201, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `id_tdoc_usuario` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contraseña` varbinary(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `id_tdoc_usuario`, `nombre`, `email`, `contraseña`) VALUES
(101, 1, 'Maria Mancera', 'mariamancera@gmail.com', 0xe398c74cb147501403161073a3e03e7d),
(102, 2, 'Juan Zuluaga', 'juanzuluaga@gmail.com', 0x3630f4d144d894bba1aee2a21c3dd84e),
(103, 3, 'Juan Robles', 'juanrobles@gmailcom', 0x7fdc4e5c0724c19bc5230117daf2424c),
(104, 1, 'Michael Pachon', 'michaelpachon@gmail.com', 0xaf98329b97d6ccd807e76166e6c4183e),
(105, 2, 'Michell Lopez', 'michelllopez@gmail.com', 0x2ebec0cac509eeeba634012c33e49aab),
(106, 3, 'Carlos Monrroy', 'carlosmonrroy@gmail.com', 0x2e7418d88bd1c3704f67508aa2caff91),
(107, 1, 'Valeria Lopez', 'valerialopez@gmail.com', 0xf54d46659ca2667f2c456ea36de84f88),
(108, 2, 'Ana Rodriguez', 'anarodriguez@gmail.com', 0x4d9908a656a5ecd9e854d0f31aec9912),
(109, 3, 'Juan Rodriguez', 'juanrodriguez@gmail.com', 0x5a6ea657e7b4b825be6eaa2f8fa1e61e),
(110, 1, 'Monserrat Guerrero', 'monserratguerrero@gmail.com', 0xca821c5758ba950f3f267ad633ca660e),
(111, 1, 'Andres Castellanos', 'andrescastellanos@gmail.com', 0x08a4458656a782002768b6f6b94f92cc),
(112, 2, 'Paola Tovar', 'paolatovar@gmail.com', 0xb836dbae33d87180ce13a3eb19195593),
(113, 3, 'Graciela Espitia ', 'gracielaespitia@gmail.com', 0x162236002b6fe146aa81ecd6e958e44d),
(114, 1, 'Abby Lopez', 'abbylopez@gmail.com', 0x8b15001ae75968eeeedf9448ce38a14c),
(115, 1, 'Santiago Rodriguez', 'santiagorodriguez@gmail.com', 0x07ef265a5a75883b78717777d9b45663),
(117, 2, 'Pachonsito', 'pachonsita@gmail.com', 0xd78277e048fee3c0c786857bc8a11cb6),
(118, 2, 'Alex Moreno', 'alexmoren@gmail.com', 0x03005816ce4e61fcd48be1d6528573f9),
(120, 3, 'mich', 'asdas@gmail.com', 0xfd52d0541e840db247a9991c98b9a116),
(121, 2, 'Sole', 'sole@gmail.com', 0xfffc2e12cec90fc575a952ef5b1b22a0);

--
-- Disparadores `usuario`
--
DELIMITER $$
CREATE TRIGGER `before_insert_encrypt_password` BEFORE INSERT ON `usuario` FOR EACH ROW BEGIN
    SET NEW.contraseña = encrypt_password(NEW.contraseña);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedor`
--

CREATE TABLE `vendedor` (
  `id_usuario_papeleria` int(11) NOT NULL,
  `id_tdoc_vendedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vendedor`
--

INSERT INTO `vendedor` (`id_usuario_papeleria`, `id_tdoc_vendedor`) VALUES
(109, 3),
(110, 1),
(111, 1),
(112, 2),
(113, 3),
(114, 1),
(115, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_admin`,`id_tdoc_admin`);

--
-- Indices de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `detalle_entrada_mercancia`
--
ALTER TABLE `detalle_entrada_mercancia`
  ADD PRIMARY KEY (`id_mercancia_detalle`,`id_producto_detalle`),
  ADD KEY `id_producto_detalle` (`id_producto_detalle`);

--
-- Indices de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`id_factura_detalle`,`id_producto_detalle`),
  ADD KEY `id_producto_detalle` (`id_producto_detalle`);

--
-- Indices de la tabla `detalle_pedido_producto`
--
ALTER TABLE `detalle_pedido_producto`
  ADD PRIMARY KEY (`id_pedido_detalle`,`id_producto_detalle`),
  ADD KEY `id_producto_detalle` (`id_producto_detalle`);

--
-- Indices de la tabla `devolucion`
--
ALTER TABLE `devolucion`
  ADD PRIMARY KEY (`id_devolucion`),
  ADD KEY `id_entrada_devolucion` (`id_entrada_devolucion`);

--
-- Indices de la tabla `documento_identificacion`
--
ALTER TABLE `documento_identificacion`
  ADD PRIMARY KEY (`id_documento`);

--
-- Indices de la tabla `entrada_mercancia`
--
ALTER TABLE `entrada_mercancia`
  ADD PRIMARY KEY (`id_entrada`),
  ADD KEY `id_pedido_entrada` (`id_pedido_entrada`),
  ADD KEY `id_proveedor_entrada` (`id_proveedor_entrada`);

--
-- Indices de la tabla `factura_entrada`
--
ALTER TABLE `factura_entrada`
  ADD PRIMARY KEY (`id_factura_entrada`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `factura_salida`
--
ALTER TABLE `factura_salida`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_vendedor_factura` (`id_vendedor_factura`);

--
-- Indices de la tabla `log_informe`
--
ALTER TABLE `log_informe`
  ADD PRIMARY KEY (`id_informe`),
  ADD KEY `id_vendedor_informe` (`id_vendedor_informe`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_admin_pedido` (`id_admin_pedido`),
  ADD KEY `id_proveedor_pedido` (`id_proveedor_pedido`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria_producto` (`id_categoria_producto`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`,`id_tdoc_proveedor`);

--
-- Indices de la tabla `registro_salida`
--
ALTER TABLE `registro_salida`
  ADD PRIMARY KEY (`id_salida`),
  ADD KEY `id_factura_salidas` (`id_factura_salidas`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `rol_usuario`
--
ALTER TABLE `rol_usuario`
  ADD PRIMARY KEY (`id_usuario_rol`,`id_rol_usuario`,`id_tdoc_usuario`),
  ADD KEY `id_tdoc_usuario` (`id_tdoc_usuario`),
  ADD KEY `id_rol_usuario` (`id_rol_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`,`id_tdoc_usuario`),
  ADD KEY `id_tdoc_usuario` (`id_tdoc_usuario`);

--
-- Indices de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`id_usuario_papeleria`,`id_tdoc_vendedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=305;

--
-- AUTO_INCREMENT de la tabla `devolucion`
--
ALTER TABLE `devolucion`
  MODIFY `id_devolucion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1205;

--
-- AUTO_INCREMENT de la tabla `entrada_mercancia`
--
ALTER TABLE `entrada_mercancia`
  MODIFY `id_entrada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10005;

--
-- AUTO_INCREMENT de la tabla `factura_entrada`
--
ALTER TABLE `factura_entrada`
  MODIFY `id_factura_entrada` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura_salida`
--
ALTER TABLE `factura_salida`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=508;

--
-- AUTO_INCREMENT de la tabla `log_informe`
--
ALTER TABLE `log_informe`
  MODIFY `id_informe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=706;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=816;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=417;

--
-- AUTO_INCREMENT de la tabla `registro_salida`
--
ALTER TABLE `registro_salida`
  MODIFY `id_salida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=606;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`id_admin`,`id_tdoc_admin`) REFERENCES `usuario` (`id_usuario`, `id_tdoc_usuario`),
  ADD CONSTRAINT `administrador_ibfk_2` FOREIGN KEY (`id_admin`,`id_tdoc_admin`) REFERENCES `usuario` (`id_usuario`, `id_tdoc_usuario`);

--
-- Filtros para la tabla `detalle_entrada_mercancia`
--
ALTER TABLE `detalle_entrada_mercancia`
  ADD CONSTRAINT `detalle_entrada_mercancia_ibfk_1` FOREIGN KEY (`id_mercancia_detalle`) REFERENCES `entrada_mercancia` (`id_entrada`),
  ADD CONSTRAINT `detalle_entrada_mercancia_ibfk_2` FOREIGN KEY (`id_producto_detalle`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD CONSTRAINT `detalle_factura_ibfk_1` FOREIGN KEY (`id_factura_detalle`) REFERENCES `factura_salida` (`id_factura`),
  ADD CONSTRAINT `detalle_factura_ibfk_2` FOREIGN KEY (`id_producto_detalle`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `detalle_factura_ibfk_3` FOREIGN KEY (`id_factura_detalle`) REFERENCES `factura_salida` (`id_factura`),
  ADD CONSTRAINT `detalle_factura_ibfk_4` FOREIGN KEY (`id_producto_detalle`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `detalle_pedido_producto`
--
ALTER TABLE `detalle_pedido_producto`
  ADD CONSTRAINT `detalle_pedido_producto_ibfk_1` FOREIGN KEY (`id_pedido_detalle`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `detalle_pedido_producto_ibfk_2` FOREIGN KEY (`id_producto_detalle`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `devolucion`
--
ALTER TABLE `devolucion`
  ADD CONSTRAINT `devolucion_ibfk_1` FOREIGN KEY (`id_entrada_devolucion`) REFERENCES `entrada_mercancia` (`id_entrada`);

--
-- Filtros para la tabla `entrada_mercancia`
--
ALTER TABLE `entrada_mercancia`
  ADD CONSTRAINT `entrada_mercancia_ibfk_1` FOREIGN KEY (`id_pedido_entrada`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `entrada_mercancia_ibfk_2` FOREIGN KEY (`id_proveedor_entrada`) REFERENCES `proveedor` (`id_proveedor`);

--
-- Filtros para la tabla `factura_entrada`
--
ALTER TABLE `factura_entrada`
  ADD CONSTRAINT `factura_entrada_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`);

--
-- Filtros para la tabla `factura_salida`
--
ALTER TABLE `factura_salida`
  ADD CONSTRAINT `factura_salida_ibfk_1` FOREIGN KEY (`id_vendedor_factura`) REFERENCES `vendedor` (`id_usuario_papeleria`),
  ADD CONSTRAINT `factura_salida_ibfk_2` FOREIGN KEY (`id_vendedor_factura`) REFERENCES `vendedor` (`id_usuario_papeleria`);

--
-- Filtros para la tabla `log_informe`
--
ALTER TABLE `log_informe`
  ADD CONSTRAINT `log_informe_ibfk_1` FOREIGN KEY (`id_vendedor_informe`) REFERENCES `vendedor` (`id_usuario_papeleria`),
  ADD CONSTRAINT `log_informe_ibfk_2` FOREIGN KEY (`id_vendedor_informe`) REFERENCES `vendedor` (`id_usuario_papeleria`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_admin_pedido`) REFERENCES `administrador` (`id_admin`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_proveedor_pedido`) REFERENCES `proveedor` (`id_proveedor`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria_producto`) REFERENCES `categoria_producto` (`id_categoria`);

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`id_proveedor`,`id_tdoc_proveedor`) REFERENCES `usuario` (`id_usuario`, `id_tdoc_usuario`),
  ADD CONSTRAINT `proveedor_ibfk_2` FOREIGN KEY (`id_proveedor`,`id_tdoc_proveedor`) REFERENCES `usuario` (`id_usuario`, `id_tdoc_usuario`);

--
-- Filtros para la tabla `registro_salida`
--
ALTER TABLE `registro_salida`
  ADD CONSTRAINT `registro_salida_ibfk_1` FOREIGN KEY (`id_factura_salidas`) REFERENCES `factura_salida` (`id_factura`);

--
-- Filtros para la tabla `rol_usuario`
--
ALTER TABLE `rol_usuario`
  ADD CONSTRAINT `rol_usuario_ibfk_1` FOREIGN KEY (`id_usuario_rol`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `rol_usuario_ibfk_2` FOREIGN KEY (`id_tdoc_usuario`) REFERENCES `usuario` (`id_tdoc_usuario`),
  ADD CONSTRAINT `rol_usuario_ibfk_3` FOREIGN KEY (`id_rol_usuario`) REFERENCES `roles` (`id_rol`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_tdoc_usuario`) REFERENCES `documento_identificacion` (`id_documento`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_tdoc_usuario`) REFERENCES `documento_identificacion` (`id_documento`);

--
-- Filtros para la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD CONSTRAINT `vendedor_ibfk_1` FOREIGN KEY (`id_usuario_papeleria`,`id_tdoc_vendedor`) REFERENCES `usuario` (`id_usuario`, `id_tdoc_usuario`),
  ADD CONSTRAINT `vendedor_ibfk_2` FOREIGN KEY (`id_usuario_papeleria`,`id_tdoc_vendedor`) REFERENCES `usuario` (`id_usuario`, `id_tdoc_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
