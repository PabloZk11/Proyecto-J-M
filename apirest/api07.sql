-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-12-2023 a las 01:04:16
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
-- Base de datos: `api07`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `CitaId` int(11) NOT NULL,
  `PacienteId` varchar(45) DEFAULT NULL,
  `Fecha` varchar(45) DEFAULT NULL,
  `HoraInicio` varchar(45) DEFAULT NULL,
  `HoraFIn` varchar(45) DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  `Motivo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`CitaId`, `PacienteId`, `Fecha`, `HoraInicio`, `HoraFIn`, `Estado`, `Motivo`) VALUES
(1, '1', '2020-06-09', '08:30:00', '09:00:00', 'Confirmada', 'El paciente presenta un leve dolor de espalda'),
(2, '2', '2020-06-10', '08:30:00', '09:00:00', 'Confirmada', 'Dolor en la zona lumbar '),
(3, '3', '2020-06-18', '09:00:00', '09:30:00', 'Confirmada', 'Dolor en el cuello');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `PacienteId` int(11) NOT NULL,
  `DNI` varchar(45) DEFAULT NULL,
  `Nombre` varchar(150) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `CodigoPostal` varchar(45) DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `Genero` varchar(45) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Correo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`PacienteId`, `DNI`, `Nombre`, `Direccion`, `CodigoPostal`, `Telefono`, `Genero`, `FechaNacimiento`, `Correo`) VALUES
(1, 'A000000001', 'Juan Carlos Medina', 'Calle de pruebas 1', '20001', '633281515', 'M', '1989-03-02', 'Paciente1@gmail.com'),
(2, 'B000000002', 'Daniel Rios', 'Calle de pruebas 2', '20002', '633281512', 'M', '1990-05-11', 'Paciente2@gmail.com'),
(3, 'C000000003', 'Marcela Dubon', 'Calle de pruebas 3', '20003', '633281511', 'F', '2000-07-22', 'Paciente3@gmail.com'),
(4, 'D000000004', 'Maria Mendez', 'Calle de pruebas 4', '20004', '633281516', 'F', '1980-01-01', 'Paciente4@gmail.com'),
(5, 'E000000005', 'Zamuel Valladares', 'Calle de pruebas 5', '20006', '633281519', 'M', '1985-12-15', 'Paciente5@gmail.com'),
(6, 'F000000006', 'Angel Rios', 'Calle de pruebas 6', '20005', '633281510', 'M', '1988-11-30', 'Paciente6@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `Contrasena` varchar(45) DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `Contrasena`, `Estado`) VALUES
(1, 'juan', 'e10adc3949ba59abbe56e057f20f883e', 'Activo'),
(2, 'andres', 'e10adc3949ba59abbe56e057f20f883e', 'Activo'),
(3, 'maria', 'e10adc3949ba59abbe56e057f20f883e', 'Activo'),
(4, 'samantha', 'e10adc3949ba59abbe56e057f20f883e', 'Activo'),
(5, 'camilo', 'e10adc3949ba59abbe56e057f20f883e', 'Activo'),
(6, 'natali', 'e10adc3949ba59abbe56e057f20f883e', 'Activo'),
(7, 'carlos', 'e10adc3949ba59abbe56e057f20f883e', 'Inactivo'),
(8, 'manuel', 'e10adc3949ba59abbe56e057f20f883e', 'Inactivo'),
(9, 'danna', 'e10adc3949ba59abbe56e057f20f883e', 'Inactivo'),
(14, 'oscar', 'hola', 'Activo'),
(15, 'Danna', NULL, NULL),
(16, 'daniel', '', ''),
(17, 'daniel', '', 'Activo'),
(18, 'daniel', '', 'Activo'),
(19, 'daniel', '', 'Activo'),
(20, 'daniel', 'hola', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_token`
--

CREATE TABLE `usuarios_token` (
  `TokenId` int(11) NOT NULL,
  `UsuarioId` varchar(45) DEFAULT NULL,
  `Token` varchar(45) DEFAULT NULL,
  `Estado` varchar(45) CHARACTER SET armscii8 COLLATE armscii8_general_ci DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`CitaId`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`PacienteId`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios_token`
--
ALTER TABLE `usuarios_token`
  ADD PRIMARY KEY (`TokenId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `CitaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `PacienteId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `usuarios_token`
--
ALTER TABLE `usuarios_token`
  MODIFY `TokenId` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
