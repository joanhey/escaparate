-- phpMyAdmin SQL Dump
-- version 4.6.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 24, 2016 at 05:49 PM
-- Server version: 5.7.16-0ubuntu0.16.04.1
-- PHP Version: 7.0.8-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `escaparate`
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
(16, 'Pepe Conserva', 'pepe@pepe.com', 'Argentina', '2016-11-24 16:43:28', NULL);

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
(3, 'Twitter', 4, '@nelsonrojas', '2016-11-21 11:11:50'),
(4, 'Facebook', 16, 'https://www.facebook.com/groups/90246423597/', '2016-11-24 16:43:28');

-- --------------------------------------------------------

--
-- Table structure for table `tagged`
--

CREATE TABLE `tagged` (
  `id` bigint(20) NOT NULL,
  `tags_id` bigint(20) NOT NULL,
  `web_id` bigint(20) NOT NULL,
  `tagged_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `creado_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `web`
--

CREATE TABLE `web` (
  `id` bigint(20) NOT NULL,
  `url` varchar(1000) NOT NULL,
  `destacada` tinyint(4) DEFAULT NULL,
  `autor_id` bigint(20) NOT NULL,
  `pais` varchar(100) NOT NULL,
  `descripcion` tinytext,
  `activa` tinyint(4) DEFAULT '0',
  `creado_at` timestamp NULL DEFAULT NULL,
  `actualizado_in` timestamp NULL DEFAULT NULL,
  `grafico` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `web`
--

INSERT INTO `web` (`id`, `url`, `destacada`, `autor_id`, `pais`, `descripcion`, `activa`, `creado_at`, `actualizado_in`, `grafico`) VALUES
(3, 'www.natures.cl', 1, 4, 'Chile', 'Sitio web dedicado a la venta de productos y servicios de área de la salud alternativa, incluyendo un blog', 1, '2016-11-21 09:09:17', '2016-11-21 09:11:25', ''),
(4, 'www.planetamamá.com', NULL, 5, 'Chile', 'Sitio web dedicado a la información y venta de productos didácticos para niños', 1, '2016-11-21 09:15:51', '2016-11-21 09:16:16', ''),
(5, 'www.isabilia.com', NULL, 4, 'Chile', 'Sitio de emprendimiento y contacto personal', 0, '2016-11-21 11:11:50', NULL, ''),
(9, 'www.webdepruebas.com', NULL, 16, 'Africa del Sur', 'Esta es una web muy chula, que todabía no está hecha, pero estará.', 0, '2016-11-24 16:43:28', NULL, '1803398829_aaa.png');

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
-- Indexes for table `tagged`
--
ALTER TABLE `tagged`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tag_a_tagged` (`tags_id`),
  ADD KEY `fk_web_a_tagged` (`web_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `autor_social`
--
ALTER TABLE `autor_social`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tagged`
--
ALTER TABLE `tagged`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `web`
--
ALTER TABLE `web`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tagged`
--
ALTER TABLE `tagged`
  ADD CONSTRAINT `fk_tag_a_tagged` FOREIGN KEY (`tags_id`) REFERENCES `tags` (`id`),
  ADD CONSTRAINT `fk_web_a_tagged` FOREIGN KEY (`web_id`) REFERENCES `web` (`id`);

--
-- Constraints for table `web`
--
ALTER TABLE `web`
  ADD CONSTRAINT `fk_autor_a_web` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
