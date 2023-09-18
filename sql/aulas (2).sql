-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 05-09-2023 a las 17:53:03
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

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
-- Estructura de tabla para la tabla `detalles_entrada_mercancia`
--

CREATE TABLE `detalles_entrada_mercancia` (
  `id_mercancia_detalle` int(11) NOT NULL,
  `id_producto_detalle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalles_entrada_mercancia`
--

INSERT INTO `detalles_entrada_mercancia` (`id_mercancia_detalle`, `id_producto_detalle`) VALUES
(1101, 901),
(1102, 902),
(1103, 903),
(1104, 904),
(1105, 905),
(1106, 906),
(1107, 907),
(1108, 908),
(1109, 909),
(1110, 910),
(1111, 911),
(1112, 912),
(1113, 913),
(1114, 914),
(1115, 915);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalles_factura`
--

INSERT INTO `detalles_factura` (`id_factura_detalle`, `id_producto_detalle`, `unidades`, `precio`, `precio_total`) VALUES
(1401, 901, 25, '27.000', '27.000'),
(1402, 902, 50, '28.000', '28.000'),
(1403, 903, 75, '11.500', '11.500'),
(1404, 904, 42, '24.000', '24.000'),
(1405, 905, 50, '69.000', '69.000'),
(1406, 906, 100, '7.500', '7.500'),
(1407, 907, 20, '49.000', '49.000'),
(1408, 908, 35, '122.000', '122.000'),
(1409, 909, 89, '110.000', '110.000'),
(1410, 910, 10, '18.500', '18.500'),
(1411, 911, 15, '64.000', '64.000'),
(1412, 912, 45, '9.800', '64.000'),
(1413, 913, 5, '97.000', '97.000'),
(1414, 914, 10, '6.100', '6.100'),
(1415, 915, 25, '79.000', '79.000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_pedido_productos`
--

CREATE TABLE `detalles_pedido_productos` (
  `id_pedido_detalle` int(11) NOT NULL,
  `id_producto_detalle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalles_pedido_productos`
--

INSERT INTO `detalles_pedido_productos` (`id_pedido_detalle`, `id_producto_detalle`) VALUES
(801, 901),
(802, 902),
(803, 903),
(804, 904),
(805, 905),
(806, 906),
(807, 907),
(808, 908),
(809, 909),
(810, 910),
(811, 911),
(812, 912),
(813, 913),
(814, 914),
(815, 915);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `devoluciones`
--

INSERT INTO `devoluciones` (`id_devolucion`, `nom_producto`, `unidades`, `detalle`, `id_entrada_devolucion`) VALUES
(1201, 'Borrador', 25, 'Borrador Pelikan miga de pan X 20 und MP-20', 1301),
(1202, 'Tajalapiz', 10, 'Tajalapiz electrico studmarkTajalapiz electri', 1302),
(1203, 'Tinta', 5, 'Tinta pelikan para sellos', 1303),
(1204, 'Corrector', 30, 'Cinta correctora faber castell', 1304);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entradas_mercacia`
--

INSERT INTO `entradas_mercacia` (`id_entrada`, `nom_producto`, `cantidad_unidades`, `precio_compra`, `detalles_descripcion`, `id_pedido_entrada`, `id_proveedor_entrada`) VALUES
(1001, 'Borrador', '20', '22.800', 'Borrador pelikan pz 60 caja X60 und', 801, 105),
(1002, 'Borrador', '10', '24.000', 'Caja borrador negro X20 und TK-20B', 802, 106),
(1003, 'Colores', '15', '11.500', 'Caja de Colores Metalizados Kiut Norma x 6', 803, 107),
(1004, 'Calculadora', '25', '76.000', 'Calculadora 252 Funciones Casio FX82LA PLUS', 804, 108),
(1005, 'Colores', '30', '19.200', 'Colores doblepunta Scribe InColors x15', 805, 105),
(1006, 'Colores', '35', '159.000', 'Colores Super Soft X 100 Faber Castell', 806, 106),
(1007, 'Combo teclado/mouse', '40', '119.000', 'Combo Teclado/Mouse Genius Inalámbricos KM810', 807, 107),
(1008, ' Mouse', '45', '21.000', 'Mouse Alambrico DX-120 Genius', 808, 108),
(1009, 'Grapadora', '50', '25.000', 'MoGrapadora', 809, 105),
(1010, 'Mouse', '55', '79.000', 'Mouse Inalámbrico Logitech M187', 810, 106),
(1011, 'Perforadora', '60', '25.000', 'Perforadora offiesco ref OE-350', 811, 107),
(1012, 'Rollo termico', '65', '3.200', 'Rollo termico para registradora 57X30 und', 812, 108),
(1013, 'Rollo tiqueteadora', '70', '19.000', 'Rollo tiqueteadora 11-15 pqt X10', 813, 105),
(1014, 'Tajalapiz', '75', '79.000', 'Tajalapiz electrico studmark', 814, 106),
(1015, 'Tinta', '80', '6.100', 'Tinta pelikan para sellos', 815, 107);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_factura`, `id_tdoc_vendedor_factura`, `id_vendedor_factura`, `precio_total`, `descripcion`, `fecha`) VALUES
(1501, 3, 109, '27.000', 'Báscula Digital', '2023-09-21 10:38:20'),
(1502, 1, 110, '28.000', 'Borrador Pelikan miga de pan X 20 und MP-20', '2023-09-18 10:42:17'),
(1503, 1, 111, '11.500', 'Caja de Colores Pastel Kiut Norma x 6', '2023-09-22 10:42:20'),
(1504, 2, 112, '24.000', 'Caja Borrador faber castell X 20 und TK-20F', '2023-09-26 10:42:22'),
(1505, 3, 113, '69.000', 'Calculadora 240 Funciones Casio FX82MS', '2023-09-01 10:42:24'),
(1506, 1, 114, '7.500', 'Cinta correctora faber castell', '2023-09-30 10:42:26'),
(1507, 1, 115, '49.000', 'Colores Norma Premium x 24', '2023-09-24 10:42:29');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `informes`
--

INSERT INTO `informes` (`id_informe`, `fecha_creacion`, `categoria`, `detalles_informe`, `archivo_pdf`, `id_vendedor_informe`) VALUES
(1701, '2023-09-07 10:41:47', 'Cuadernos', 'conjunto de hojas de papel', NULL, 109),
(1702, '2023-09-11 10:41:51', 'Lapiz', 'es un instrumento de escritura', NULL, 110),
(1703, '2023-09-22 10:42:03', 'Folder', 'eneralmente de cartón o plástico doblada', NULL, 111),
(1704, '2023-09-24 10:42:05', 'Papel', 'papel tamaño carta-oficio blanco', NULL, 112),
(1705, '2023-09-02 10:42:08', 'Marcadores', 'el marcador es un cilindro de plástico', NULL, 113);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `precio`, `unidades`, `detalles_descripcion`, `nom_producto`, `id_admin_pedido`, `id_proveedor_pedido`) VALUES
(801, '10.000', '10', 'Corrector De Postura Escritura Aprendizaje La', 'Correcto de postura', 201, 401),
(802, '20.000', '12', ' Lapiz Infinito O Eterno', 'Lapiz', 202, 402),
(803, '30.000', '20', ' Tinta Borrable Para Marcadores Ecomax * 120m', 'Tinta', 203, 403),
(804, '40.000', '60', ' Rollo Papel Kraft 20 Pulgadas -150 Mts - 60 ', 'Papel kraf', 204, 404),
(805, '50.000', '50', ' Huellero Dactilar Artline', 'Huellero', 205, 405),
(806, '60.000', '40', 'Portafolio, Carpeta Notas', 'Portafolio', 206, 406),
(807, '70.000', '23', ' 900 Piezas Wiggle Googly Eyes Manualidades A', 'Wiggle', 207, 407),
(808, '80.000', '40', 'Cinta Espuma Doble Adhesiva 18mm X 50mts', 'Cinta', 208, 408),
(809, '90.000', '65', 'Rollo Plastico Papel Burbuja 150cm X 50mts Em', 'Papel burbuja', 209, 409),
(810, '100.0000', '100', ' 50 Piezas De Accesorios Para Llavero Con Ani', 'Accesorio para anillo', 210, 410),
(811, '110.000', '15', 'Kits De Encuadernación, Suministros De Encuad', 'Encuadernacion', 211, 411),
(812, '111.000', '2', 'Recortes De Sandía 48 Piezas Actividades Educ', 'Recortes', 212, 412),
(813, '112.000', '1', 'Rollo Carton Corrugado X50 M2 Protección Piso', 'Carton corrugado', 213, 413),
(814, '113.000', '15', ' Set Marcador Punta Pincel Edding Colour Happ', 'Marcadores', 214, 414),
(815, '114.000', '56', ' Bisturi Punta De Lanza * 15 Unidades', 'Bisturi', 215, 415);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nom_producto`, `precio`, `unidades`, `detalles_descripcion`) VALUES
(901, 'Báscula Digital', '27.000', 25, 'Báscula Digital'),
(902, 'BorradorBáscula Digital', '28.000', 50, 'Borrador Pelikan miga de pan X 20 und MP-20'),
(903, 'Colores', '11.500', 75, 'Caja de Colores Pastel Kiut Norma x 6'),
(904, 'Borrador', '24.000', 42, 'Caja Borrador faber castell X 20 und TK-20F'),
(905, 'Calculadora', '69.000', 50, 'Calculadora 240 Funciones Casio FX82MS'),
(906, 'Corrector', '7.500', 100, 'Cinta correctora faber castell'),
(907, 'Colores', '49.000', 20, 'Colores Norma Premium x 24'),
(908, 'Combo teclado y mouse', '122.000', 35, 'Combo Teclado/Mouse Genius LuceMate Q8000'),
(909, 'Consola Retro', '110.000', 89, 'Consola Retro'),
(910, 'Grapadora', '18.500', 10, 'Grapadora offiesco ref. OE-320'),
(911, 'Mouse', '64.000', 15, 'Mouse Alambrico Logitech M185'),
(912, 'Perforadora', '9.800', 45, 'Perforadora offieco metalica 341'),
(913, 'Plancha', '97.000', 5, 'Plancha Gama'),
(914, 'Tinta', '6.100', 10, 'Tinta pelikan para sellos'),
(915, 'Tajalapiz', '79.000', 25, 'Tajalapiz electrico studmark');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `id_tdoc_proveedor` int(11) NOT NULL,
  `producto` varchar(45) NOT NULL,
  `detalles_productos` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `id_tdoc_proveedor`, `producto`, `detalles_productos`) VALUES
(105, 2, 'Plancha Gama', 'Plancha Gama'),
(106, 3, 'Colores', 'Colores Norma Premium'),
(107, 1, 'Borrador', 'Borrador nata pelikan pz-20'),
(108, 2, 'Cartilla ', 'Cartilla aprendiendo lettering 1.0 Artisan');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_salidas`
--

CREATE TABLE `registro_salidas` (
  `id_salida` int(11) NOT NULL,
  `nom_producto` varchar(45) NOT NULL,
  `id_factura_salidas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registro_salidas`
--

INSERT INTO `registro_salidas` (`id_salida`, `nom_producto`, `id_factura_salidas`) VALUES
(1601, 'Báscula Digital', 1501),
(1602, 'BorradorBáscula Digital', 1502),
(1603, 'Colores', 1503),
(1604, 'Borrador', 1504),
(1605, 'Calculadora', 1505);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `id_tdoc_usuario`, `Nombre`, `Email`, `Contraseña`) VALUES
(101, 1, 'Maria Mancera', 'mariamancera@gmail.com', '12345'),
(102, 2, 'Juan Zuluaga', 'juanzuluaga@gmail.com', '23456'),
(103, 3, 'Juan Robles', 'juanrobles@gmail.com', '74123'),
(104, 1, 'Michael Pachon', 'michaelpachon@gmail.com', '54123'),
(105, 2, 'Michell Lopez', 'michlopez@gmail.com', '54321'),
(106, 3, 'Carlos Monrroy', 'carlosmonrroy@gmail.com', '78965'),
(107, 1, 'Valeria Lopez', 'valerialopez@gmail.com', '45236'),
(108, 2, 'Ana Rodriguez', 'anarodriguez@gmail.com', '78965'),
(109, 3, 'Juan Rodriguez', 'juanrodriguez@gmail.com', '58678'),
(110, 1, 'Monserrat Guerrero', 'monserratguerrero@gmail.com', '369524'),
(111, 1, 'Andres Castellanos', 'andrescastellanos@gmail.com', '769626'),
(112, 2, 'Paola Tovar', 'paolatovar@gmail.com', '357245'),
(113, 3, 'Graciela Espitian', 'gracielaespitian@gmail.com', '578955'),
(114, 1, 'Abby lopez', 'abbylopez@gmail.com', '467511'),
(115, 1, 'Santiago Rodriguez', 'santirodriguez@gmail.com', '648675');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `validacion_documento`
--

CREATE TABLE `validacion_documento` (
  `id_documento` int(11) NOT NULL,
  `tipo_documento` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `validacion_documento`
--

INSERT INTO `validacion_documento` (`id_documento`, `tipo_documento`) VALUES
(1, 'CC'),
(2, 'CE'),
(3, 'TI');

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
  MODIFY `id_devolucion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1206;

--
-- AUTO_INCREMENT de la tabla `entradas_mercacia`
--
ALTER TABLE `entradas_mercacia`
  MODIFY `id_entrada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1017;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=816;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=916;

--
-- AUTO_INCREMENT de la tabla `registro_salidas`
--
ALTER TABLE `registro_salidas`
  MODIFY `id_salida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1606;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
