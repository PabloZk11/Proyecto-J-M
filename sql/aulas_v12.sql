-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3307
-- Tiempo de generación: 08-03-2024 a las 13:47:07
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
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL,
  `id_tdoc_usuario` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contraseña` varbinary(45) NOT NULL,
  `id_rol` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `id_tdoc_usuario`, `nombre`, `email`, `contraseña`, `id_rol`) VALUES
(101, 1, 'Maria Mancera', 'mariamancera@gmail.com', 0xe398c74cb147501403161073a3e03e7d, 202),
(102, 2, 'Juan Zuluaga', 'juanzuluaga@gmail.com', 0x3630f4d144d894bba1aee2a21c3dd84e, 202),
(103, 3, 'Juan Robles', 'juanrobles@gmailcom', 0x7fdc4e5c0724c19bc5230117daf2424c, 202),
(104, 1, 'Michael Pachon', 'michaelpachon@gmail.com', 0xaf98329b97d6ccd807e76166e6c4183e, 202),
(105, 2, 'Michell Lopez', 'michelllopez@gmail.com', 0x2ebec0cac509eeeba634012c33e49aab, 202),
(106, 3, 'Carlos Monrroy', 'carlosmonrroy@gmail.com', 0x2e7418d88bd1c3704f67508aa2caff91, 202),
(107, 1, 'Valeria Lopez', 'valerialopez@gmail.com', 0xf54d46659ca2667f2c456ea36de84f88, 202),
(108, 2, 'alex', 'alexander@gmaik.com', 0x3136333133, 201),
(109, 3, 'Juan Rodriguez', 'juanrodriguez@gmail.com', 0x5a6ea657e7b4b825be6eaa2f8fa1e61e, 202),
(110, 1, 'Monserrat Guerrero', 'monserratguerrero@gmail.com', 0xca821c5758ba950f3f267ad633ca660e, 202),
(111, 1, 'Andres Castellanos', 'andrescastellanos@gmail.com', 0x08a4458656a782002768b6f6b94f92cc, 202),
(112, 2, 'Paola Tovar', 'paolatovar@gmail.com', 0xb836dbae33d87180ce13a3eb19195593, 202),
(113, 3, 'Graciela Espitia ', 'gracielaespitia@gmail.com', 0x162236002b6fe146aa81ecd6e958e44d, 202),
(114, 1, 'Abby Lopez', 'abbylopez@gmail.com', 0x8b15001ae75968eeeedf9448ce38a14c, 202),
(115, 1, 'Santiago Rodriguez', 'santiagorodriguez@gmail.com', 0x07ef265a5a75883b78717777d9b45663, 202),
(117, 2, 'Pachonsito', 'pachonsita@gmail.com', 0xd78277e048fee3c0c786857bc8a11cb6, 202),
(118, 2, 'Alex Moreno', 'alexmoren@gmail.com', 0x03005816ce4e61fcd48be1d6528573f9, 202),
(120, 3, 'mich', 'asdas@gmail.com', 0xfd52d0541e840db247a9991c98b9a116, 202),
(121, 2, 'Sole', 'sole@gmail.com', 0xfffc2e12cec90fc575a952ef5b1b22a0, 202),
(167, 3, 'alexander', 'salsqx@gmail.com', 0x043c167f6f0b76aa8aed0e8ae121fd2e, 201),
(168, 2, 'alexander', 'salsqx@gmail.com', 0x043c167f6f0b76aa8aed0e8ae121fd2e, 201);

--
-- Disparadores `usuario`
--
DELIMITER $$
CREATE TRIGGER `before_insert_encrypt_password` BEFORE INSERT ON `usuario` FOR EACH ROW BEGIN
    SET NEW.contraseña = encrypt_password(NEW.contraseña);
END
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`,`id_tdoc_usuario`),
  ADD KEY `id_tdoc_usuario` (`id_tdoc_usuario`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_tdoc_usuario`) REFERENCES `documento_identificacion` (`id_documento`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_tdoc_usuario`) REFERENCES `documento_identificacion` (`id_documento`),
  ADD CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
