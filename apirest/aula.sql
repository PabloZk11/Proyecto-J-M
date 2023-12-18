-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-12-2023 a las 05:17:39
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aula`
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
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `id_tdoc_usuario` int(10) NOT NULL,
  `nombre` varchar(35) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contrasena` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `id_tdoc_usuario`, `nombre`, `email`, `contrasena`) VALUES
(101, 1, 'Maria Mancera', 'mariamancera@gmail.com', '?\"Af?C?k>[A4'),
(102, 2, 'Juan Zuluaga', 'juanzuluaga@gmail.com', '??YN]??\n?ܨDя'),
(103, 3, 'Juan Robles', 'juanrobles@gmailcom', 'd;?ڊ?????<???K'),
(104, 1, 'Michael Pachon', 'michaelpachon@gmail.com', '??NB[U??[?@??(??'),
(105, 2, 'Michell Lopez', 'michelllopez@gmail.com', 'Q??ҹ?4?v?3??.Ư'),
(106, 3, 'Carlos Monrroy', 'carlosmonrroy@gmail.com', '???8?3T?v??b??V\n??9?????].яL?q'),
(107, 1, 'Valeria Lopez', 'valerialopez@gmail.com', 'ܔlez\0r?$d????'),
(108, 2, 'Ana Rodriguez', 'anarodriguez@gmail.com', '?W???#?q?n??u;'),
(109, 3, 'Juan Rodriguez', 'juanrodriguez@gmail.com', '+\n#??$??W?y_'),
(110, 1, 'Monserrat Guerrero', 'monserratguerrero@gmail.com', '`?%???\0?a\r???Fe'),
(111, 1, 'Andres Castellanos', 'andrescastellanos@gmail.com', '??>t?S??o?:J?'),
(112, 2, 'Paola Tovar', 'paolatovar@gmail.com', '?K~?<?k??MνY'),
(113, 3, 'Graciela Espitia ', 'gracielaespitia@gmail.com', '??sE-?pRR#)???'),
(114, 1, 'Abby Lopez', 'abbylopez@gmail.com', '~p?M؈-?Ep?D?/y'),
(115, 1, 'Santiago Rodriguez', 'santiagorodriguez@gmail.com', ',???_??????F)y'),
(117, 2, 'Pachonsito', 'pachonsita@gmail.com', 'J?????N`?/gSHG');

--
-- Disparadores `usuarios`
--
DELIMITER $$
CREATE TRIGGER `before_insert_encrypt_password` BEFORE INSERT ON `usuarios` FOR EACH ROW BEGIN
    SET NEW.contrasena = encrypt_password(NEW.contrasena);
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
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`,`id_tdoc_proveedor`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_tdoc_usuario` (`id_tdoc_usuario`);

--
-- Indices de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`id_usuario_papeleria`,`id_tdoc_vendedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
