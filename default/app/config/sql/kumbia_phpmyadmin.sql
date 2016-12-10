-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 10, 2016 at 06:13 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kumbia`
--

-- --------------------------------------------------------

--
-- Table structure for table `autor`
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
-- Dumping data for table `autor`
--

INSERT INTO `autor` (`id`, `nombre`, `email`, `pais`, `creado_at`, `actualizado_in`) VALUES
(4, 'Nelson Rojas', 'nelson.rojas.n@gmail.com', 'Chile', '2016-11-21 09:09:17', '2016-11-21 11:11:50'),
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
(28, 'Feli Pelotas', 'feli@pelotas.com', 'Australia', '2016-11-28 23:10:16', NULL),
(29, 'Manuel Araya', 'maraya@123.cl', 'Chile', '2016-12-08 12:22:52', NULL),
(30, 'Manuel Araya', 'maraya@123.cl', 'Chile', '2016-12-08 12:23:54', NULL),
(31, 'Manuel Araya', 'maraya@123.cl', 'Chile', '2016-12-08 12:24:47', NULL),
(32, 'Manuel Araya', 'maraya@123.cl', 'Chile', '2016-12-08 12:25:51', NULL),
(33, 'Manuel Araya', 'maraya@123.cl', 'Chile', '2016-12-08 12:26:50', NULL),
(34, 'Manuel Araya', 'maraya@123.cl', 'Chile', '2016-12-08 12:27:24', NULL),
(35, 'Manuel Araya', 'maraya@123.cl', 'Chile', '2016-12-08 12:29:31', NULL),
(36, 'Manuel Araya', 'maraya@123.cl', 'Chile', '2016-12-08 12:33:44', NULL),
(37, 'Manuel Araya', 'maraya@123.cl', 'Chile', '2016-12-08 12:34:14', NULL),
(38, 'Manuel Araya', 'maraya@123.cl', 'Chile', '2016-12-08 12:36:27', NULL),
(39, 'Manuel Araya', 'maraya@123.cl', 'Chile', '2016-12-08 12:36:46', NULL),
(40, 'Nelson Rojas', 'nelson.rojas.n@gmail.com', 'Chile', '2016-12-09 17:36:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `autor_social`
--

CREATE TABLE `autor_social` (
  `id` bigint(20) NOT NULL,
  `socialname` varchar(200) NOT NULL,
  `autor_id` bigint(20) NOT NULL,
  `cuenta` varchar(1000) NOT NULL,
  `creado_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `autor_social`
--

INSERT INTO `autor_social` (`id`, `socialname`, `autor_id`, `cuenta`, `creado_at`) VALUES
(3, 'Twitter', 4, '@nelsonrojas', '2016-11-21 11:11:50');

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `creado_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`, `creado_at`) VALUES
(1, 'Arte', '2016-12-08 12:13:13'),
(2, 'Automóviles', '2016-12-08 12:13:24'),
(3, 'Negocios', '2016-12-08 12:15:50'),
(4, 'Debates e interacción en línea', '2016-12-08 12:16:07'),
(5, 'Entretenimiento y música', '2016-12-08 12:16:24'),
(6, 'Uso compartido de archivos', '2016-12-08 12:16:33'),
(7, 'Juegos', '2016-12-08 12:16:39'),
(8, 'Gobierno', '2016-12-08 12:16:49'),
(9, 'Salud', '2016-12-08 12:16:52'),
(10, 'Búsqueda laboral', '2016-12-08 12:16:57'),
(11, 'Contenido para niños', '2016-12-08 12:17:16'),
(12, 'Vestuario', '2016-12-08 12:17:22'),
(13, 'Noticias', '2016-12-08 12:17:42'),
(14, 'Chat en línea', '2016-12-08 12:17:46'),
(15, 'Blog', '2016-12-08 12:17:54'),
(16, 'Política', '2016-12-08 12:18:06'),
(17, 'Referencia, educación', '2016-12-08 12:18:16'),
(18, 'Búsqueda', '2016-12-08 12:18:20'),
(19, 'Compras', '2016-12-08 12:18:26'),
(20, 'Redes sociales', '2016-12-08 12:18:30'),
(21, 'Deportes', '2016-12-08 12:18:33'),
(22, 'Tecnología', '2016-12-08 12:18:43'),
(23, 'Viajes', '2016-12-08 12:18:46'),
(24, 'Sin categoría', '2016-12-08 12:18:54'),
(25, 'Correo electrónico', '2016-12-08 12:19:03'),
(26, 'Servidores', '2016-12-08 12:19:08'),
(27, 'Hosting', '2016-12-08 12:19:13'),
(28, 'Diseño', '2016-12-08 12:19:21'),
(29, 'Gestor de contenido', '2016-12-08 12:19:37');

-- --------------------------------------------------------

--
-- Table structure for table `web`
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
  `actualizado_in` timestamp NULL DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `web`
--

INSERT INTO `web` (`id`, `url`, `grafico`, `destacada`, `autor_id`, `pais`, `descripcion`, `activa`, `creado_at`, `actualizado_in`, `categoria_id`) VALUES
(3, 'www.natures.cl', '', 1, 4, 'Chile', 'Sitio web dedicado a la venta de productos y servicios de área de la salud alternativa, incluyendo un blog', 1, '2016-11-21 09:09:17', '2016-11-21 09:11:25', NULL),
(4, 'www.planetamamá.com', '', NULL, 5, 'Chile', 'Sitio web dedicado a la información y venta de productos didácticos para niños', 1, '2016-11-21 09:15:51', '2016-11-21 09:16:16', NULL),
(5, 'www.isabilia.com', '', NULL, 4, 'Chile', 'Sitio de emprendimiento y contacto personal', 1, '2016-11-21 11:11:50', NULL, NULL),
(19, 'www.ovh.es', '44367847_Seleccion_004.jpg', NULL, 23, 'Andorra', 'Una web chula chuala', 1, '2016-11-28 22:03:48', NULL, NULL),
(20, 'www.1and1.com', '196573510_Seleccion_006.jpg', NULL, 24, 'Antillas Holandesas', 'Otra web chula chula', 1, '2016-11-28 22:04:36', NULL, NULL),
(21, 'www.strato.com', '384983494_Seleccion_005.jpg', NULL, 25, 'Australia', 'Mas chula que chula', 1, '2016-11-28 22:05:39', NULL, NULL),
(22, 'www.cerdito.es', '590232045_Selección_007.png', NULL, 26, 'Alemania', 'Esta si que es chula', 1, '2016-11-28 23:01:44', NULL, NULL),
(23, 'www.paraloscuriosos.com', '686560918_Selección_008.jpg', NULL, 27, 'Albania', 'Esta si que es chula', 1, '2016-11-28 23:06:08', NULL, NULL),
(24, 'www.paraloscuriosos.com', '686560918_Selección_008.jpg', NULL, 28, 'Afganistan', 'Esta si que está güapa', 0, '2016-11-28 23:10:16', NULL, NULL),
(25, 'www.micasabonita.cl', '', NULL, 4, 'Chile', 'productos para el hogar, jardín, terraza, etc', 1, '2016-12-09 19:07:53', '2016-12-09 19:58:07', 3),
(26, 'www.lawebmaslinda.com', '2029489326_portada.png', NULL, 4, 'Chile', 'Selección de sitios web con valoración por diseño', 0, '2016-12-09 20:06:06', NULL, 28),
(27, 'www.nuevoestilodebaile.com', '1037485817_portada.png', NULL, 4, 'Chile', 'nuevo estilo de baile', 1, '2016-12-10 02:25:42', '2016-12-10 02:26:33', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `autor_social`
--
ALTER TABLE `autor_social`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_autor_a_autor_social` (`autor_id`),
  ADD KEY `fk_social_a_autor_social` (`socialname`);

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web`
--
ALTER TABLE `web`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_autor_a_web` (`autor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `autor`
--
ALTER TABLE `autor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `autor_social`
--
ALTER TABLE `autor_social`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `web`
--
ALTER TABLE `web`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `web`
--
ALTER TABLE `web`
  ADD CONSTRAINT `fk_autor_a_web` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
