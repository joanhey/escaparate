-- Adminer 4.2.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `autor`;
CREATE TABLE `autor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(1000) NOT NULL,
  `email` varchar(1000) NOT NULL,
  `pais` varchar(100) NOT NULL,
  `creado_at` timestamp NULL DEFAULT NULL,
  `actualizado_in` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `autor` (`id`, `nombre`, `email`, `pais`, `creado_at`, `actualizado_in`) VALUES
(4,	'Nelson Rojas',	'nelson.rojas.n@gmail.com',	'Chile',	'2016-11-21 09:09:17',	NULL),
(5,	'María Isabel Núñez',	'mariaisabelnunez@hotmail.com',	'Chile',	'2016-11-21 09:15:51',	NULL);

DROP TABLE IF EXISTS `autor_social`;
CREATE TABLE `autor_social` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `socialname` varchar(200) NOT NULL,
  `autor_id` bigint(20) NOT NULL,
  `cuenta` varchar(1000) NOT NULL,
  `creado_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_autor_a_autor_social` (`autor_id`),
  KEY `fk_social_a_autor_social` (`socialname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `autor_social` (`id`, `socialname`, `autor_id`, `cuenta`, `creado_at`) VALUES
(1,	'Twitter',	4,	'@nelsonrojas',	'2016-11-21 09:09:18');

DROP TABLE IF EXISTS `tagged`;
CREATE TABLE `tagged` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tags_id` bigint(20) NOT NULL,
  `web_id` bigint(20) NOT NULL,
  `tagged_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tag_a_tagged` (`tags_id`),
  KEY `fk_web_a_tagged` (`web_id`),
  CONSTRAINT `fk_tag_a_tagged` FOREIGN KEY (`tags_id`) REFERENCES `tags` (`id`),
  CONSTRAINT `fk_web_a_tagged` FOREIGN KEY (`web_id`) REFERENCES `web` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `creado_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `web`;
CREATE TABLE `web` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(1000) NOT NULL,
  `destacada` tinyint(4) DEFAULT NULL,
  `autor_id` bigint(20) NOT NULL,
  `pais` varchar(100) NOT NULL,
  `descripcion` tinytext,
  `activa` tinyint(4) DEFAULT '0',
  `creado_at` timestamp NULL DEFAULT NULL,
  `actualizado_in` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_autor_a_web` (`autor_id`),
  CONSTRAINT `fk_autor_a_web` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `web` (`id`, `url`, `destacada`, `autor_id`, `pais`, `descripcion`, `activa`, `creado_at`, `actualizado_in`) VALUES
(3,	'www.natures.cl',	1,	4,	'Chile',	'Sitio web dedicado a la venta de productos y servicios de área de la salud alternativa, incluyendo un blog',	1,	'2016-11-21 09:09:17',	'2016-11-21 09:11:25'),
(4,	'www.planetamamá.com',	NULL,	5,	'Chile',	'Sitio web dedicado a la información y venta de productos didácticos para niños',	1,	'2016-11-21 09:15:51',	'2016-11-21 09:16:16');

-- 2016-11-21 09:39:43
