-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-11-2021 a las 18:43:28
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hotel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria`
--

CREATE TABLE `auditoria` (
  `cod` int(20) NOT NULL,
  `id_user` int(20) NOT NULL,
  `fecha` date NOT NULL,
  `tabla` varchar(50) NOT NULL,
  `transaccion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(20) NOT NULL,
  `id_user` int(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `apellido` int(200) NOT NULL,
  `nacionalidad` varchar(200) NOT NULL,
  `estado` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config_hotel`
--

CREATE TABLE `config_hotel` (
  `id` int(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `logo` text NOT NULL,
  `mision` text NOT NULL,
  `vision` text NOT NULL,
  `historia` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto_cl`
--

CREATE TABLE `contacto_cl` (
  `id_ctCl` int(20) NOT NULL,
  `id_tipocont` int(20) NOT NULL,
  `id_cliente` int(20) NOT NULL,
  `contacto` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto_p`
--

CREATE TABLE `contacto_p` (
  `id_ctP` int(20) NOT NULL,
  `id_tipocont` int(20) NOT NULL,
  `id_per` int(20) NOT NULL,
  `contacto` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto_suc`
--

CREATE TABLE `contacto_suc` (
  `id_ctSuc` int(20) NOT NULL,
  `id_tipocont` int(20) NOT NULL,
  `id_sucursal` int(20) NOT NULL,
  `contacto` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuento`
--

CREATE TABLE `descuento` (
  `id_descu` int(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `cant` double NOT NULL,
  `baja` tinyint(1) NOT NULL,
  `id_tDesc` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_fact` int(20) NOT NULL,
  `id_sucursal` int(20) NOT NULL,
  `id_reserva` int(20) NOT NULL,
  `id_hist` int(20) NOT NULL,
  `id_cliente` int(20) NOT NULL,
  `id_descu` int(20) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `sutotal` double NOT NULL,
  `total` double NOT NULL,
  `baja` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitaciones`
--

CREATE TABLE `habitaciones` (
  `id_habitacion` int(20) NOT NULL,
  `id_tHabi` int(20) NOT NULL,
  `observaciones` text NOT NULL,
  `baja` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_servi`
--

CREATE TABLE `historial_servi` (
  `id_hist` int(20) NOT NULL,
  `id_user` int(20) NOT NULL,
  `id_servicio` int(20) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `baja` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `img_habit`
--

CREATE TABLE `img_habit` (
  `id_imgHabit` int(20) NOT NULL,
  `id_habitacion` int(20) NOT NULL,
  `url` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `img_sucursal`
--

CREATE TABLE `img_sucursal` (
  `id_imgSuc` int(20) NOT NULL,
  `id_sucursal` int(20) NOT NULL,
  `url` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `id_per` int(20) NOT NULL,
  `id_user` int(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `apellido` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte`
--

CREATE TABLE `reporte` (
  `id_reporte` int(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `url` varchar(200) NOT NULL,
  `baja` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `id_reserva` int(20) NOT NULL,
  `id_user` int(20) NOT NULL,
  `id_tHabi` int(20) NOT NULL,
  `fecha_ini` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `hora` time NOT NULL,
  `id_tarjeta` int(20) NOT NULL,
  `id_estado` int(20) NOT NULL,
  `baja` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_servicio` int(20) NOT NULL,
  `id_tSer` int(20) NOT NULL,
  `costo` double NOT NULL,
  `baja` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `id_sucursal` int(20) NOT NULL,
  `id` int(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `lat` varchar(200) NOT NULL,
  `lng` varchar(200) NOT NULL,
  `id_estado` int(20) NOT NULL,
  `baja` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjetas`
--

CREATE TABLE `tarjetas` (
  `id_tarjeta` int(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `numero` varchar(200) NOT NULL,
  `CVV` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo usuario`
--

CREATE TABLE `tipo usuario` (
  `id_tipo2` int(20) NOT NULL,
  `tipo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_contacto`
--

CREATE TABLE `tipo_contacto` (
  `id_tipocont` int(20) NOT NULL,
  `tipo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_descuento`
--

CREATE TABLE `tipo_descuento` (
  `id_tDesc` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_estado`
--

CREATE TABLE `tipo_estado` (
  `id_estado` int(20) NOT NULL,
  `estado` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_habitacion`
--

CREATE TABLE `tipo_habitacion` (
  `id_tHabi` int(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `costo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_servicio`
--

CREATE TABLE `tipo_servicio` (
  `id_tSer` int(20) NOT NULL,
  `nombre` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_user` int(20) NOT NULL,
  `user` varchar(50) NOT NULL,
  `pass` varchar(200) NOT NULL,
  `fecha` date NOT NULL,
  `id_tipo` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`cod`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `config_hotel`
--
ALTER TABLE `config_hotel`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contacto_cl`
--
ALTER TABLE `contacto_cl`
  ADD PRIMARY KEY (`id_ctCl`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_tipocont` (`id_tipocont`);

--
-- Indices de la tabla `contacto_p`
--
ALTER TABLE `contacto_p`
  ADD PRIMARY KEY (`id_ctP`),
  ADD KEY `id_tipocont` (`id_tipocont`),
  ADD KEY `id_per` (`id_per`);

--
-- Indices de la tabla `contacto_suc`
--
ALTER TABLE `contacto_suc`
  ADD PRIMARY KEY (`id_ctSuc`),
  ADD KEY `id_tipocont` (`id_tipocont`),
  ADD KEY `id_sucursal` (`id_sucursal`);

--
-- Indices de la tabla `descuento`
--
ALTER TABLE `descuento`
  ADD PRIMARY KEY (`id_descu`),
  ADD KEY `id_tDesc` (`id_tDesc`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_fact`),
  ADD KEY `id_sucursal` (`id_sucursal`),
  ADD KEY `id_reserva` (`id_reserva`),
  ADD KEY `id_hist` (`id_hist`),
  ADD KEY `id_descu` (`id_descu`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  ADD PRIMARY KEY (`id_habitacion`),
  ADD KEY `id_tHabi` (`id_tHabi`);

--
-- Indices de la tabla `historial_servi`
--
ALTER TABLE `historial_servi`
  ADD PRIMARY KEY (`id_hist`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `img_habit`
--
ALTER TABLE `img_habit`
  ADD PRIMARY KEY (`id_imgHabit`),
  ADD KEY `id_habitacion` (`id_habitacion`);

--
-- Indices de la tabla `img_sucursal`
--
ALTER TABLE `img_sucursal`
  ADD PRIMARY KEY (`id_imgSuc`),
  ADD KEY `id_sucursal` (`id_sucursal`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id_per`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD PRIMARY KEY (`id_reporte`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_tHabi` (`id_tHabi`),
  ADD KEY `id_tarjeta` (`id_tarjeta`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_servicio`),
  ADD KEY `id_tSer` (`id_tSer`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`id_sucursal`),
  ADD KEY `id` (`id`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  ADD PRIMARY KEY (`id_tarjeta`);

--
-- Indices de la tabla `tipo usuario`
--
ALTER TABLE `tipo usuario`
  ADD PRIMARY KEY (`id_tipo2`);

--
-- Indices de la tabla `tipo_contacto`
--
ALTER TABLE `tipo_contacto`
  ADD PRIMARY KEY (`id_tipocont`);

--
-- Indices de la tabla `tipo_descuento`
--
ALTER TABLE `tipo_descuento`
  ADD PRIMARY KEY (`id_tDesc`);

--
-- Indices de la tabla `tipo_estado`
--
ALTER TABLE `tipo_estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `tipo_habitacion`
--
ALTER TABLE `tipo_habitacion`
  ADD PRIMARY KEY (`id_tHabi`);

--
-- Indices de la tabla `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  ADD PRIMARY KEY (`id_tSer`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  MODIFY `cod` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `config_hotel`
--
ALTER TABLE `config_hotel`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contacto_cl`
--
ALTER TABLE `contacto_cl`
  MODIFY `id_ctCl` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contacto_p`
--
ALTER TABLE `contacto_p`
  MODIFY `id_ctP` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contacto_suc`
--
ALTER TABLE `contacto_suc`
  MODIFY `id_ctSuc` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `descuento`
--
ALTER TABLE `descuento`
  MODIFY `id_descu` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_fact` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  MODIFY `id_habitacion` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_servi`
--
ALTER TABLE `historial_servi`
  MODIFY `id_hist` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `img_habit`
--
ALTER TABLE `img_habit`
  MODIFY `id_imgHabit` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `img_sucursal`
--
ALTER TABLE `img_sucursal`
  MODIFY `id_imgSuc` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `id_per` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reporte`
--
ALTER TABLE `reporte`
  MODIFY `id_reporte` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id_reserva` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id_servicio` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `id_sucursal` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  MODIFY `id_tarjeta` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo usuario`
--
ALTER TABLE `tipo usuario`
  MODIFY `id_tipo2` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_contacto`
--
ALTER TABLE `tipo_contacto`
  MODIFY `id_tipocont` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_descuento`
--
ALTER TABLE `tipo_descuento`
  MODIFY `id_tDesc` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_estado`
--
ALTER TABLE `tipo_estado`
  MODIFY `id_estado` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_habitacion`
--
ALTER TABLE `tipo_habitacion`
  MODIFY `id_tHabi` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  MODIFY `id_tSer` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_user` int(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD CONSTRAINT `auditoria_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `usuario` (`id_user`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `usuario` (`id_user`);

--
-- Filtros para la tabla `contacto_cl`
--
ALTER TABLE `contacto_cl`
  ADD CONSTRAINT `contacto_cl_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `contacto_cl_ibfk_2` FOREIGN KEY (`id_tipocont`) REFERENCES `tipo_contacto` (`id_tipocont`);

--
-- Filtros para la tabla `contacto_p`
--
ALTER TABLE `contacto_p`
  ADD CONSTRAINT `contacto_p_ibfk_1` FOREIGN KEY (`id_tipocont`) REFERENCES `tipo_contacto` (`id_tipocont`),
  ADD CONSTRAINT `contacto_p_ibfk_2` FOREIGN KEY (`id_per`) REFERENCES `personal` (`id_per`);

--
-- Filtros para la tabla `contacto_suc`
--
ALTER TABLE `contacto_suc`
  ADD CONSTRAINT `contacto_suc_ibfk_1` FOREIGN KEY (`id_tipocont`) REFERENCES `tipo_contacto` (`id_tipocont`),
  ADD CONSTRAINT `contacto_suc_ibfk_2` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursales` (`id_sucursal`);

--
-- Filtros para la tabla `descuento`
--
ALTER TABLE `descuento`
  ADD CONSTRAINT `descuento_ibfk_1` FOREIGN KEY (`id_tDesc`) REFERENCES `tipo_descuento` (`id_tDesc`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursales` (`id_sucursal`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`id_reserva`),
  ADD CONSTRAINT `factura_ibfk_3` FOREIGN KEY (`id_hist`) REFERENCES `historial_servi` (`id_hist`),
  ADD CONSTRAINT `factura_ibfk_4` FOREIGN KEY (`id_descu`) REFERENCES `descuento` (`id_descu`),
  ADD CONSTRAINT `factura_ibfk_5` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Filtros para la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  ADD CONSTRAINT `habitaciones_ibfk_1` FOREIGN KEY (`id_tHabi`) REFERENCES `tipo_habitacion` (`id_tHabi`);

--
-- Filtros para la tabla `historial_servi`
--
ALTER TABLE `historial_servi`
  ADD CONSTRAINT `historial_servi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `usuario` (`id_user`),
  ADD CONSTRAINT `historial_servi_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`);

--
-- Filtros para la tabla `img_habit`
--
ALTER TABLE `img_habit`
  ADD CONSTRAINT `img_habit_ibfk_1` FOREIGN KEY (`id_habitacion`) REFERENCES `habitaciones` (`id_habitacion`);

--
-- Filtros para la tabla `img_sucursal`
--
ALTER TABLE `img_sucursal`
  ADD CONSTRAINT `img_sucursal_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursales` (`id_sucursal`);

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `usuario` (`id_user`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `usuario` (`id_user`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`id_tHabi`) REFERENCES `habitaciones` (`id_habitacion`),
  ADD CONSTRAINT `reserva_ibfk_3` FOREIGN KEY (`id_tarjeta`) REFERENCES `tarjetas` (`id_tarjeta`),
  ADD CONSTRAINT `reserva_ibfk_4` FOREIGN KEY (`id_estado`) REFERENCES `tipo_estado` (`id_estado`);

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`id_tSer`) REFERENCES `tipo_servicio` (`id_tSer`);

--
-- Filtros para la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD CONSTRAINT `sucursales_ibfk_1` FOREIGN KEY (`id`) REFERENCES `config_hotel` (`id`),
  ADD CONSTRAINT `sucursales_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `tipo_estado` (`id_estado`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tipo usuario` (`id_tipo2`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
