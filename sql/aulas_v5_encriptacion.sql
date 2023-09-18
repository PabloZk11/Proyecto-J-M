-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 08-09-2023 a las 02:33:34
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalles_entrada_mercancia`
--

INSERT INTO `detalles_entrada_mercancia` (`id_mercancia_detalle`, `id_producto_detalle`) VALUES
(1001, 901),
(1002, 902),
(1003, 903),
(1004, 904),
(1005, 905),
(1006, 906),
(1007, 907),
(1008, 908),
(1009, 909),
(1010, 910),
(1011, 911);

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

--
-- Volcado de datos para la tabla `detalles_factura`
--

INSERT INTO `detalles_factura` (`id_factura_detalle`, `id_producto_detalle`, `unidades`, `precio`, `precio_total`) VALUES
(1501, 901, 25, '27.000', '675.000'),
(1501, 902, 50, '28.000', '1.400.000'),
(1502, 903, 75, '11.500', '862.000'),
(1502, 904, 42, '24.000', '1.008.000'),
(1502, 911, 5, '97.000', '485.00'),
(1503, 905, 50, '69.000', '3.450.000'),
(1503, 906, 100, '7.500', '750.000'),
(1503, 914, 10, '6.100', '61'),
(1504, 906, 20, '49.000', '980.000'),
(1504, 907, 35, '122.000', '4.270.000'),
(1504, 911, 45, '9.800', '441.000'),
(1505, 908, 89, '110.000', '9.790.000'),
(1506, 909, 10, '18.500', '185.000'),
(1506, 915, 25, '79.000', '1.975.000'),
(1507, 910, 15, '64.000', '960.000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_pedido_productos`
--

CREATE TABLE `detalles_pedido_productos` (
  `id_pedido_detalle` int(11) NOT NULL,
  `id_producto_detalle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `devoluciones`
--

INSERT INTO `devoluciones` (`id_devolucion`, `nom_producto`, `unidades`, `detalle`, `id_entrada_devolucion`) VALUES
(1201, 'Borrador', 25, 'Borrador Pelikan miga de pan X 20 und MP-20', 1001),
(1202, 'Tajalapiz', 10, 'Tajalapiz electrico studmarkTajalapiz electri', 1002),
(1203, 'Tinta', 5, 'Tinta pelikan para sellos', 1003),
(1204, 'Corrector', 30, 'Cinta Correcota faber castell', 1004);

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
(1008, 'Mouse', '45', '21.000', 'Mouse Alambrico DX-120 Genius', 808, 108),
(1009, 'Grapadora', '50', '25.000', 'MoGrapadora', 809, 105),
(1010, 'Mouse', '55', '79.000', 'Mouse Inalámbrico Logitech M187', 810, 106),
(1011, 'Perforadora', '60', '25.000', 'Perforadora offiesco ref OE-350', 811, 107);

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

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_factura`, `id_tdoc_vendedor_factura`, `id_vendedor_factura`, `precio_total`, `descripcion`, `fecha`) VALUES
(1501, 3, 109, '27.000', 'Bascula Dijital', '2023-09-11 15:28:27'),
(1502, 1, 110, '28.000', 'Borrado Pelikan Miga de Pan', '2023-09-11 15:28:30'),
(1503, 1, 111, '11.500', 'Caja de Colores Pastel Kiut Norma x 6', '2023-09-05 15:28:34'),
(1504, 2, 112, '24.000', 'Caja Borrador faber castell X 20 und TK-20F', '2023-09-28 15:28:38'),
(1505, 3, 113, '69.000', 'Calculadora 240 Funciones Casio FX82MS', '2023-09-17 15:28:46'),
(1506, 1, 114, '7.500', 'Cinta correctora faber castell', '2023-09-25 15:28:42'),
(1507, 1, 115, '48.000', 'Colores Norma Premium x 24', '2023-09-21 15:28:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informes`
--

CREATE TABLE `informes` (
  `id_informe` int(11) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `categoria` varchar(45) NOT NULL,
  `detalles_informe` varchar(45) NOT NULL,
  `archivo_pdf` varchar(45) NOT NULL,
  `id_vendedor_informe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `informes`
--

INSERT INTO `informes` (`id_informe`, `fecha_creacion`, `categoria`, `detalles_informe`, `archivo_pdf`, `id_vendedor_informe`) VALUES
(1701, '2023-09-07 10:41:47', 'Cuadernos', 'Conjunto de hojas de papel', '', 109),
(1702, '2023-09-11 10:41:51', 'Lapices', 'Es un instrumento de escritura', '', 110),
(1703, '2023-09-22 10:42:03', 'Folder', 'Generalmente de cartón o plástico doblada', '', 111),
(1704, '2023-09-24 10:42:05', 'Papel', 'Papel tamaño carta-oficio blanco', '', 112),
(1705, '2023-09-02 10:42:08', 'Marcadores', 'El marcador es un cilindro de plástico', '', 113);

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

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `precio`, `unidades`, `detalles_descripcion`, `nom_producto`, `id_admin_pedido`, `id_proveedor_pedido`) VALUES
(801, '10.000', '10', 'Corrector de postura ', 'Corrector_de_postura', 101, 105),
(802, '20.000', '12', 'Lapiz Infinito', 'Lapiz', 102, 106),
(803, '30.000', '20', 'Tinta Borrable Para Marcadores ecomax', 'Tinta Borrable', 103, 107),
(804, '40.000', '60', 'Rollo Papel Kaft 20 Pulgadas-150', 'Papel Kaft', 104, 108),
(805, '50.000', '50', 'Huellero Dactilar Artline', 'Huellero', 101, 105),
(806, '60.000', '40', 'Portafolio , Carpeta Notas0', 'Portafolio', 102, 106),
(807, '70.000', '23', '900 Piezas Wiggle Googly Eyes', 'Wiggle', 103, 107),
(808, '80.000', '40', 'Cinta Espuma Doble Adhesiva 18mmX 50mts em', 'Cinta ', 104, 108),
(809, '90.000', '65', 'Rollo Plastico Papel Burbuja', 'Papel Burbuja ', 101, 105),
(810, '100.000', '100', '50 Piezas de Accesorios para llavero de ani', 'Accesorios de llaveros', 102, 106),
(811, '110.000', '15', 'Kits de Encuadernacion, Suministros De Encuad', 'Encuadernacion', 103, 107),
(812, '111.000', '2', 'Recortes De Sandia 48 Piezas Actividades Educ', 'Recortes', 104, 108),
(813, '112.000', '1', 'Rollo Corrugado X50 M2 Proteccion Piso', 'Carton Corrugado', 101, 105),
(814, '113.000', '15', ' Set Marcador Punta Pincel Edding Colour Happ', 'Marcadores', 102, 106),
(815, '114.000', '56', 'Bisturi Punta De Lanza * 15 Und', 'Bisturi', 103, 107);

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

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nom_producto`, `precio`, `unidades`, `detalles_descripcion`) VALUES
(901, 'Bascula Djital ', '27.000', 25, 'Bascula Dijital '),
(902, 'Borradores Bascula Dijital', '28.000', 50, 'Borrador Pelican Miga de Pan X20 und'),
(903, 'Colores', '11.500', 75, 'Caja de colores Pastel Kiut Norma X6'),
(904, 'Borrador', '24.000', 42, 'Caja Borrador Faber-Castell X20 und'),
(905, 'Calculadora', '69.000', 50, 'Calculadora 240 Funciones Casio'),
(906, 'Corrector', '7.500', 100, 'Cinta Correctora Faber-Castell'),
(907, 'Colores', '49.000', 20, 'Colores Norma Premium X24'),
(908, 'Combo Teclado y Mouse', '122.000', 35, 'Combo Teclado/Mouse Genius LuceMate'),
(909, 'Consola Retro', '110.000', 89, 'Consola Retro'),
(910, 'Grapadora', '18.500', 10, 'Grapadora Ofiesco'),
(911, 'Mouse', '64.000', 15, 'Mouse Inalambrico  Logitech'),
(912, 'Perforadora', '9.800', 45, 'Perforadora Ofiesco Metalica'),
(913, 'Plancha', '97.000', 5, 'Plancha Gama'),
(914, 'Tinta ', '6.100', 10, 'Tinta pelikan Para Sellos'),
(915, 'Tajalapiz', '79.000', 25, 'Tajalapiz Electrico Studmarck');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `Contraseña` varbinary(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `id_tdoc_usuario`, `Nombre`, `Email`, `Contraseña`) VALUES
(101, 1, 'Maria Mancera', 'Maris5@gamil.com', 0xe398c74cb147501403161073a3e03e7d),
(102, 2, 'Juan Zuluaga', 'juanzuluaga@gmail.com', 0x3630f4d144d894bba1aee2a21c3dd84e),
(103, 3, 'Juan Robles', 'juanrobles@gmail.com', 0x7fdc4e5c0724c19bc5230117daf2424c),
(104, 1, 'Michael Pachon', 'michaelpachon@gmail.com', 0xaf98329b97d6ccd807e76166e6c4183e),
(105, 2, 'Michell Lopez', 'michelllopez@gmail.com', 0x2ebec0cac509eeeba634012c33e49aab),
(106, 3, 'Carlos Monrroy', 'carlosmonrroy@gmail.com', 0xbcd5a608b4fc63581e7c41b05024f445),
(107, 1, 'Valeria Lopez', 'Valerialopez@gmail.com', 0x95a1046d025959276c43da8af9f44059),
(108, 2, 'Ana Rodriguez', 'anarodriguez@gmail.com', 0x555a9bbf0585ab4c08654a798702d064),
(109, 3, 'Juan Rodriguez', 'juanrodriguez@gmail.com', 0xf92465d6b999223c81c55edeb1ae44ca),
(110, 1, 'Monserrat Guerrero', 'monserratguerrero@gmail.com', 0x36aee9431ccbd7a51e703a3425262dcc),
(111, 1, 'Andres Castellanos', 'andrescastellanos@gmail.com', 0x44bf42d694b7011292f1907cedaa4f4d),
(112, 2, 'Paola Tovar', 'paolatovar@gmail.com', 0xf92465d6b999223c81c55edeb1ae44ca),
(113, 3, 'Graciela Espitia', 'gracielaespitia@gmail.com', 0x52bce79a337e9312b421535ff9ab4fd0),
(114, 1, 'Abby Lopez ', 'abbylopez@gmail.com', 0xb22cee093c0ec474271f3f7e0373c009),
(115, 1, 'Santiago Rodriguez', 'santiagorodriguez@gmail.com', 0x3982376fd1e24ba98de1a9bbcc2a8d6f);

--
-- Disparadores `usuario`
--
DELIMITER $$
CREATE TRIGGER `before_insert_encrypt_password` BEFORE INSERT ON `usuario` FOR EACH ROW BEGIN
    SET NEW.Contraseña = encrypt_password(NEW.Contraseña);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `validacion_documento`
--

CREATE TABLE `validacion_documento` (
  `id_documento` int(11) NOT NULL,
  `tipo_documento` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  ADD PRIMARY KEY (`id_mercancia_detalle`,`id_producto_detalle`),
  ADD KEY `id_producto_detalle` (`id_producto_detalle`);

--
-- Indices de la tabla `detalles_factura`
--
ALTER TABLE `detalles_factura`
  ADD PRIMARY KEY (`id_factura_detalle`,`id_producto_detalle`),
  ADD KEY `id_producto_detalle` (`id_producto_detalle`);

--
-- Indices de la tabla `detalles_pedido_productos`
--
ALTER TABLE `detalles_pedido_productos`
  ADD PRIMARY KEY (`id_pedido_detalle`,`id_producto_detalle`),
  ADD KEY `id_producto_detalle` (`id_producto_detalle`);

--
-- Indices de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD PRIMARY KEY (`id_devolucion`),
  ADD KEY `id_entrada_devolucion` (`id_entrada_devolucion`);

--
-- Indices de la tabla `entradas_mercacia`
--
ALTER TABLE `entradas_mercacia`
  ADD PRIMARY KEY (`id_entrada`),
  ADD KEY `id_pedido_entrada` (`id_pedido_entrada`),
  ADD KEY `id_proveedor_entrada` (`id_proveedor_entrada`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`,`id_tdoc_vendedor_factura`),
  ADD KEY `id_vendedor_factura` (`id_vendedor_factura`,`id_tdoc_vendedor_factura`);

--
-- Indices de la tabla `informes`
--
ALTER TABLE `informes`
  ADD PRIMARY KEY (`id_informe`),
  ADD KEY `id_vendedor_informe` (`id_vendedor_informe`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_admin_pedido` (`id_admin_pedido`),
  ADD KEY `id_proveedor_pedido` (`id_proveedor_pedido`);

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
  ADD PRIMARY KEY (`id_salida`),
  ADD KEY `id_factura_salidas` (`id_factura_salidas`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`,`id_tdoc_usuario`),
  ADD KEY `id_tdoc_usuario` (`id_tdoc_usuario`);

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
  MODIFY `id_devolucion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1205;

--
-- AUTO_INCREMENT de la tabla `entradas_mercacia`
--
ALTER TABLE `entradas_mercacia`
  MODIFY `id_entrada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21004;

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

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`id_admin`,`id_tdoc_admin`) REFERENCES `usuario` (`id_usuario`, `id_tdoc_usuario`);

--
-- Filtros para la tabla `detalles_entrada_mercancia`
--
ALTER TABLE `detalles_entrada_mercancia`
  ADD CONSTRAINT `detalles_entrada_mercancia_ibfk_1` FOREIGN KEY (`id_mercancia_detalle`) REFERENCES `entradas_mercacia` (`id_entrada`),
  ADD CONSTRAINT `detalles_entrada_mercancia_ibfk_2` FOREIGN KEY (`id_producto_detalle`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `detalles_factura`
--
ALTER TABLE `detalles_factura`
  ADD CONSTRAINT `detalles_factura_ibfk_1` FOREIGN KEY (`id_factura_detalle`) REFERENCES `factura` (`id_factura`),
  ADD CONSTRAINT `detalles_factura_ibfk_2` FOREIGN KEY (`id_producto_detalle`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `detalles_pedido_productos`
--
ALTER TABLE `detalles_pedido_productos`
  ADD CONSTRAINT `detalles_pedido_productos_ibfk_1` FOREIGN KEY (`id_pedido_detalle`) REFERENCES `pedidos` (`id_pedido`),
  ADD CONSTRAINT `detalles_pedido_productos_ibfk_2` FOREIGN KEY (`id_producto_detalle`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD CONSTRAINT `devoluciones_ibfk_1` FOREIGN KEY (`id_entrada_devolucion`) REFERENCES `entradas_mercacia` (`id_entrada`);

--
-- Filtros para la tabla `entradas_mercacia`
--
ALTER TABLE `entradas_mercacia`
  ADD CONSTRAINT `entradas_mercacia_ibfk_1` FOREIGN KEY (`id_pedido_entrada`) REFERENCES `pedidos` (`id_pedido`),
  ADD CONSTRAINT `entradas_mercacia_ibfk_2` FOREIGN KEY (`id_proveedor_entrada`) REFERENCES `proveedores` (`id_proveedor`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_vendedor_factura`,`id_tdoc_vendedor_factura`) REFERENCES `vendedor` (`id_usuario_papeleria`, `id_tdoc_vendedor`);

--
-- Filtros para la tabla `informes`
--
ALTER TABLE `informes`
  ADD CONSTRAINT `informes_ibfk_1` FOREIGN KEY (`id_vendedor_informe`) REFERENCES `vendedor` (`id_usuario_papeleria`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_admin_pedido`) REFERENCES `administrador` (`id_admin`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_proveedor_pedido`) REFERENCES `proveedores` (`id_proveedor`);

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`id_proveedor`,`id_tdoc_proveedor`) REFERENCES `usuario` (`id_usuario`, `id_tdoc_usuario`);

--
-- Filtros para la tabla `registro_salidas`
--
ALTER TABLE `registro_salidas`
  ADD CONSTRAINT `registro_salidas_ibfk_1` FOREIGN KEY (`id_factura_salidas`) REFERENCES `factura` (`id_factura`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_tdoc_usuario`) REFERENCES `validacion_documento` (`id_documento`);

--
-- Filtros para la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD CONSTRAINT `vendedor_ibfk_1` FOREIGN KEY (`id_usuario_papeleria`,`id_tdoc_vendedor`) REFERENCES `usuario` (`id_usuario`, `id_tdoc_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
