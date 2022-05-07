-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-05-2022 a las 19:10:10
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `cedula` int(15) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `codigo_postal` int(6) NOT NULL,
  `ciudad` varchar(30) NOT NULL,
  `localidad` varchar(30) NOT NULL,
  `barrio` varchar(30) NOT NULL,
  `factura_cli` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cedula`, `nombres`, `apellidos`, `direccion`, `codigo_postal`, `ciudad`, `localidad`, `barrio`, `factura_cli`) VALUES
(123456, 'Juan', 'Rincon Gutierrez', 'Cra 80 #71-56', 154263, 'Bogota DC', 'Usaquen', 'Cedritos', 1),
(645198, 'Cristiano', 'Ronaldo aveiro', 'Cra 21 #78-01', 456891, 'Bogota DC', 'Kennedy', 'Roma', 3),
(789456, 'Lionel', 'Messi Pescculini', 'Cra 96 #11-45', 235478, 'Bogota DC', 'Engativa', 'La europa', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id_producto` int(30) NOT NULL,
  `costo` int(30) NOT NULL,
  `stock` varchar(10) NOT NULL,
  `cantidad` int(10) NOT NULL,
  `disponibilidad` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id_producto`, `costo`, `stock`, `cantidad`, `disponibilidad`) VALUES
(1, 21000, 'En descuen', 150, 'Disponible'),
(2, 55000, 'Sin mercan', 0, 'No disponible'),
(3, 110000, 'Sin descue', 100, 'Disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiaprima`
--

CREATE TABLE `materiaprima` (
  `factura` int(30) NOT NULL,
  `fecha` date NOT NULL,
  `cantidad` int(30) NOT NULL,
  `color` varchar(30) NOT NULL,
  `tipo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `materiaprima`
--

INSERT INTO `materiaprima` (`factura`, `fecha`, `cantidad`, `color`, `tipo`) VALUES
(1, '2021-12-01', 250, 'rojo', 'algodon'),
(2, '2020-08-20', 150, 'amarillo', 'poliester'),
(3, '2019-02-15', 50, 'azul', 'lino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_factura` int(30) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `fecha_venta` date NOT NULL,
  `numero_compra` int(30) NOT NULL,
  `id_producto_disponibilidad` int(11) NOT NULL,
  `id_cedula_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_factura`, `tipo`, `fecha_venta`, `numero_compra`, `id_producto_disponibilidad`, `id_cedula_cliente`) VALUES
(1, 'Camiseta tipo polo de algodon', '2021-05-16', 1, 1, 123456),
(2, 'Pantalon licrado negro', '2019-07-28', 2, 2, 645198),
(3, 'Pantalona gris cortavientos', '2020-06-17', 3, 3, 789456);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_entidad` int(30) NOT NULL,
  `sede` varchar(30) NOT NULL,
  `residencia` varchar(30) NOT NULL,
  `telefono` int(10) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(30) NOT NULL,
  `reporte` int(11) NOT NULL,
  `usuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_entidad`, `sede`, `residencia`, `telefono`, `correo`, `contraseña`, `reporte`, `usuario`) VALUES
(1, 'Bogota DC', 'Cra 70a #23-56', 2147483647, 'correo1@gamil.com', 'correo1contraseña', 1, 'usuario1'),
(2, 'Bogota DC', 'Cra 65 Bis #21-49', 2147483647, 'correo2@gamil.com', 'correo2contraseña', 2, 'usuario2'),
(3, 'Bogota DC', 'Cra 22 #47-12', 2147483647, 'correo3@gamil.com', 'correo3contraseña', 3, 'usuario3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajadores`
--

CREATE TABLE `trabajadores` (
  `id` int(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `salario` int(10) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `usuario_traba` text NOT NULL,
  `contraseña_trabajador` text NOT NULL,
  `reporte_ventas` int(11) NOT NULL,
  `repote_materiaprima` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `trabajadores`
--

INSERT INTO `trabajadores` (`id`, `nombre`, `apellidos`, `salario`, `cargo`, `usuario_traba`, `contraseña_trabajador`, `reporte_ventas`, `repote_materiaprima`) VALUES
(1, 'Neymar', 'Santos Junior', 1200000, 'administrador', 'contratrabajador1', 'usutrabajador1', 1, 1),
(2, 'Frank', 'Lampard', 1250000, 'Contador y gestion', 'contratrabajador2', 'usutrabajador2', 2, 2),
(3, 'Pedri', 'Gonzales', 1250000, 'Contador y gestion', 'contratrabajador3', 'usutrabajador3', 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `usuario` text COLLATE utf8_spanish_ci NOT NULL,
  `password` text COLLATE utf8_spanish_ci NOT NULL,
  `perfil` text COLLATE utf8_spanish_ci NOT NULL,
  `foto` text COLLATE utf8_spanish_ci NOT NULL,
  `estado` int(11) NOT NULL,
  `ultimo_login` datetime NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `password`, `perfil`, `foto`, `estado`, `ultimo_login`, `fecha`) VALUES
(1, 'usuario administrador', 'admin', 'admin123', 'Administrador', '', 1, '0000-00-00 00:00:00', '2022-05-07 00:39:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(15) NOT NULL,
  `cantidad_vendidos` int(30) NOT NULL,
  `producto` varchar(50) NOT NULL,
  `id_producto_vendido` int(11) NOT NULL,
  `id_cliente_compra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `cantidad_vendidos`, `producto`, `id_producto_vendido`, `id_cliente_compra`) VALUES
(1, 150, 'Camiseta tipo polo de algodon', 1, 123456),
(2, 450, 'Pantalon licrado negro', 2, 645198),
(3, 231, 'Pantalona gris cortavientos', 3, 789456);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cedula`),
  ADD KEY `factura_cli` (`factura_cli`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `materiaprima`
--
ALTER TABLE `materiaprima`
  ADD PRIMARY KEY (`factura`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD KEY `id_producto_disponibilidad` (`id_producto_disponibilidad`),
  ADD KEY `id_cedula_cliente` (`id_cedula_cliente`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_entidad`),
  ADD KEY `reporte` (`reporte`);

--
-- Indices de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reporte_ventas` (`reporte_ventas`),
  ADD KEY `repote_materiaprima` (`repote_materiaprima`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_producto_vendido` (`id_producto_vendido`),
  ADD KEY `id_cliente_compra` (`id_cliente_compra`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`factura_cli`) REFERENCES `materiaprima` (`factura`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_producto_disponibilidad`) REFERENCES `empresa` (`id_producto`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`id_cedula_cliente`) REFERENCES `cliente` (`cedula`);

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`reporte`) REFERENCES `materiaprima` (`factura`);

--
-- Filtros para la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  ADD CONSTRAINT `trabajadores_ibfk_1` FOREIGN KEY (`reporte_ventas`) REFERENCES `ventas` (`id_venta`),
  ADD CONSTRAINT `trabajadores_ibfk_2` FOREIGN KEY (`repote_materiaprima`) REFERENCES `materiaprima` (`factura`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_producto_vendido`) REFERENCES `empresa` (`id_producto`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_cliente_compra`) REFERENCES `cliente` (`cedula`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
