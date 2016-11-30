-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
<<<<<<< HEAD:default/app/config/sql/kumbia_phpmyadmin.sql
-- Host: localhost
-- Generation Time: Nov 21, 2016 at 04:36 PM
-- Server version: 5.7.16-0ubuntu0.16.04.1
-- PHP Version: 7.0.8-0ubuntu0.16.04.3
=======
-- Servidor: localhost
-- Tiempo de generación: 29-11-2016 a las 00:39:38
-- Versión del servidor: 5.7.16-0ubuntu0.16.04.1
-- Versión de PHP: 7.0.8-0ubuntu0.16.04.3
>>>>>>> e5285d6c16bce5fd9fcbf3ea712f61b06c6d732e:default/app/config/sql/kumbia.sql

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
<<<<<<< HEAD:default/app/config/sql/kumbia_phpmyadmin.sql
-- Database: `kumbia`
=======
-- Base de datos: `escaparate`
>>>>>>> e5285d6c16bce5fd9fcbf3ea712f61b06c6d732e:default/app/config/sql/kumbia.sql
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(1000) NOT NULL,
  `email` varchar(1000) NOT NULL,
  `pais` varchar(100) NOT NULL,
  `creado_at` timestamp NULL DEFAULT NULL,
  `actualizado_in` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`id`, `nombre`, `email`, `pais`, `creado_at`, `actualizado_in`) VALUES
(4, 'Nelson Rojas', 'nelson.rojas.n@gmail.com', 'Chile', '2016-11-21 09:09:17', '2016-11-21 11:11:50'),
<<<<<<< HEAD:default/app/config/sql/kumbia_phpmyadmin.sql
(5, 'María Isabel Núñez', 'mariaisabelnunez@hotmail.com', 'Chile', '2016-11-21 09:15:51', NULL);
=======
(5, 'María Isabel Núñez', 'mariaisabelnunez@hotmail.com', 'Chile', '2016-11-21 09:15:51', NULL),
(15, 'Pepe Conserva', 'pepe@conserva.com', 'Australia', '2016-11-22 23:50:20', NULL),
(16, 'Antonio López', 'antonio@lopez', 'Australia', '2016-11-22 23:54:54', NULL),
(17, 'Perico de los palotes', 'lolailo@lolailo.es', 'Aruba', '2016-11-22 23:57:59', NULL),
(18, 'Perico de los palotes', 'lolailo@lolailo.es', 'Aruba', '2016-11-23 00:01:05', NULL),
(19, 'El ultimo autor', 'elultimo@zaska.com', 'Australia', '2016-11-23 00:04:05', NULL),
(20, 'Otro autor', 'zaska@zaska.com', 'Bahamas', '2016-11-23 00:07:01', NULL),
(21, 'sdasdasda', 'dadsdd', 'Australia', '2016-11-23 00:09:13', NULL),
(22, 'zxczxc', 'zxczxc', 'Austria', '2016-11-23 00:10:21', NULL),
(23, 'Pepe Conserva', 'pepe@conserva.com', 'Armenia', '2016-11-28 22:03:47', NULL),
(24, 'Perico de los palotes', 'perico@perico.com', 'Australia', '2016-11-28 22:04:36', NULL),
(25, 'Antonio López', 'antonio@lopez.ras', 'Azerbaijan', '2016-11-28 22:05:39', NULL),
(26, 'Alber Tortilla', 'alber@tortilla.com', 'Australia', '2016-11-28 23:01:43', NULL),
(27, 'Alber Tortilla', 'alber@tortilla.com', 'Australia', '2016-11-28 23:06:08', NULL),
(28, 'Feli Pelotas', 'feli@pelotas.com', 'Australia', '2016-11-28 23:10:16', NULL);
>>>>>>> e5285d6c16bce5fd9fcbf3ea712f61b06c6d732e:default/app/config/sql/kumbia.sql

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor_social`
--

CREATE TABLE `autor_social` (
  `id` bigint(20) NOT NULL,
  `socialname` varchar(200) NOT NULL,
  `autor_id` bigint(20) NOT NULL,
  `cuenta` varchar(1000) NOT NULL,
  `creado_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `autor_social`
--

INSERT INTO `autor_social` (`id`, `socialname`, `autor_id`, `cuenta`, `creado_at`) VALUES
(3, 'Twitter', 4, '@nelsonrojas', '2016-11-21 11:11:50');

-- --------------------------------------------------------

--
<<<<<<< HEAD:default/app/config/sql/kumbia_phpmyadmin.sql
-- Table structure for table `tags`
=======
-- Estructura de tabla para la tabla `tagged`
>>>>>>> e5285d6c16bce5fd9fcbf3ea712f61b06c6d732e:default/app/config/sql/kumbia.sql
--

CREATE TABLE `tags` (
  `id` bigint(20) NOT NULL,
  `tag` varchar(200) NOT NULL,
  `web_id` bigint(20) DEFAULT NULL,
  `creado_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
<<<<<<< HEAD:default/app/config/sql/kumbia_phpmyadmin.sql
-- Dumping data for table `tags`
=======
-- Estructura de tabla para la tabla `tags`
>>>>>>> e5285d6c16bce5fd9fcbf3ea712f61b06c6d732e:default/app/config/sql/kumbia.sql
--

INSERT INTO `tags` (`id`, `tag`, `web_id`, `creado_at`) VALUES
(1, 'CMS', NULL, '2016-11-21 19:34:23'),
(2, 'Personal', NULL, '2016-11-21 19:34:39'),
(3, 'Educación', NULL, '2016-11-21 19:34:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `web`
--

CREATE TABLE `web` (
  `id` bigint(20) NOT NULL,
  `url` varchar(1000) NOT NULL,
  `grafico` varchar(256) NOT NULL,
  `destacada` tinyint(4) DEFAULT NULL,
  `autor_id` bigint(20) NOT NULL,
  `pais` varchar(100) NOT NULL,
  `descripcion` tinytext,
  `activa` tinyint(4) DEFAULT '0',
  `creado_at` timestamp NULL DEFAULT NULL,
  `actualizado_in` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `web`
--

<<<<<<< HEAD:default/app/config/sql/kumbia_phpmyadmin.sql
INSERT INTO `web` (`id`, `url`, `destacada`, `autor_id`, `pais`, `descripcion`, `activa`, `creado_at`, `actualizado_in`) VALUES
(3, 'www.natures.cl', 1, 4, 'Chile', 'Sitio web dedicado a la venta de productos y servicios de área de la salud alternativa, incluyendo un blog', 1, '2016-11-21 09:09:17', '2016-11-21 09:11:25'),
(4, 'www.planetamamá.com', NULL, 5, 'Chile', 'Sitio web dedicado a la información y venta de productos didácticos para niños', 1, '2016-11-21 09:15:51', '2016-11-21 09:16:16'),
(5, 'www.isabilia.com', NULL, 4, 'Chile', 'Sitio de emprendimiento y contacto personal', 0, '2016-11-21 11:11:50', NULL);
=======
INSERT INTO `web` (`id`, `url`, `grafico`, `destacada`, `autor_id`, `pais`, `descripcion`, `activa`, `creado_at`, `actualizado_in`) VALUES
(3, 'www.natures.cl', '', 1, 4, 'Chile', 'Sitio web dedicado a la venta de productos y servicios de área de la salud alternativa, incluyendo un blog', 1, '2016-11-21 09:09:17', '2016-11-21 09:11:25'),
(4, 'www.planetamamá.com', '', NULL, 5, 'Chile', 'Sitio web dedicado a la información y venta de productos didácticos para niños', 1, '2016-11-21 09:15:51', '2016-11-21 09:16:16'),
(5, 'www.isabilia.com', '', NULL, 4, 'Chile', 'Sitio de emprendimiento y contacto personal', 1, '2016-11-21 11:11:50', NULL),
(19, 'www.ovh.es', '44367847_Seleccion_004.jpg', NULL, 23, 'Andorra', 'Una web chula chuala', 1, '2016-11-28 22:03:48', NULL),
(20, 'www.1and1.com', '196573510_Seleccion_006.jpg', NULL, 24, 'Antillas Holandesas', 'Otra web chula chula', 1, '2016-11-28 22:04:36', NULL),
(21, 'www.strato.com', '384983494_Seleccion_005.jpg', NULL, 25, 'Australia', 'Mas chula que chula', 1, '2016-11-28 22:05:39', NULL),
(22, 'www.cerdito.es', '590232045_Selección_007.png', NULL, 26, 'Alemania', 'Esta si que es chula', 1, '2016-11-28 23:01:44', NULL),
(23, 'www.paraloscuriosos.com', '686560918_Selección_008.jpg', NULL, 27, 'Albania', 'Esta si que es chula', 1, '2016-11-28 23:06:08', NULL),
(24, 'www.paraloscuriosos.com', '686560918_Selección_008.jpg', NULL, 28, 'Afganistan', 'Esta si que está güapa', 0, '2016-11-28 23:10:16', NULL);
>>>>>>> e5285d6c16bce5fd9fcbf3ea712f61b06c6d732e:default/app/config/sql/kumbia.sql

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `autor_social`
--
ALTER TABLE `autor_social`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_autor_a_autor_social` (`autor_id`),
  ADD KEY `fk_social_a_autor_social` (`socialname`);

--
<<<<<<< HEAD:default/app/config/sql/kumbia_phpmyadmin.sql
-- Indexes for table `tags`
=======
-- Indices de la tabla `tagged`
--
ALTER TABLE `tagged`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tag_a_tagged` (`tags_id`),
  ADD KEY `fk_web_a_tagged` (`web_id`);

--
-- Indices de la tabla `tags`
>>>>>>> e5285d6c16bce5fd9fcbf3ea712f61b06c6d732e:default/app/config/sql/kumbia.sql
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `web`
--
ALTER TABLE `web`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_autor_a_web` (`autor_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
<<<<<<< HEAD:default/app/config/sql/kumbia_phpmyadmin.sql
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
=======
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
>>>>>>> e5285d6c16bce5fd9fcbf3ea712f61b06c6d732e:default/app/config/sql/kumbia.sql
--
-- AUTO_INCREMENT de la tabla `autor_social`
--
ALTER TABLE `autor_social`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
<<<<<<< HEAD:default/app/config/sql/kumbia_phpmyadmin.sql
=======
--
-- AUTO_INCREMENT de la tabla `tagged`
--
ALTER TABLE `tagged`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
>>>>>>> e5285d6c16bce5fd9fcbf3ea712f61b06c6d732e:default/app/config/sql/kumbia.sql
--
-- AUTO_INCREMENT de la tabla `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `web`
--
ALTER TABLE `web`
<<<<<<< HEAD:default/app/config/sql/kumbia_phpmyadmin.sql
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
=======
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
>>>>>>> e5285d6c16bce5fd9fcbf3ea712f61b06c6d732e:default/app/config/sql/kumbia.sql
--
-- Restricciones para tablas volcadas
--

--
<<<<<<< HEAD:default/app/config/sql/kumbia_phpmyadmin.sql
-- Constraints for table `web`
=======
-- Filtros para la tabla `tagged`
--
ALTER TABLE `tagged`
  ADD CONSTRAINT `fk_tag_a_tagged` FOREIGN KEY (`tags_id`) REFERENCES `tags` (`id`),
  ADD CONSTRAINT `fk_web_a_tagged` FOREIGN KEY (`web_id`) REFERENCES `web` (`id`);

--
-- Filtros para la tabla `web`
>>>>>>> e5285d6c16bce5fd9fcbf3ea712f61b06c6d732e:default/app/config/sql/kumbia.sql
--
ALTER TABLE `web`
  ADD CONSTRAINT `fk_autor_a_web` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
