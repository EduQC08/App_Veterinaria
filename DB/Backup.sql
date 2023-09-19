/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.28-MariaDB : Database - veterinaria
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`veterinaria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `veterinaria`;

/*Table structure for table `animales` */

DROP TABLE IF EXISTS `animales`;

CREATE TABLE `animales` (
  `idanimal` int(11) NOT NULL AUTO_INCREMENT,
  `nombreanimal` varchar(30) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idanimal`),
  UNIQUE KEY `uk1` (`nombreanimal`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `animales` */

insert  into `animales`(`idanimal`,`nombreanimal`,`create_at`,`update_at`,`inactive_at`) values 
(1,'Perro','2023-09-19 15:14:13',NULL,NULL),
(2,'Gato','2023-09-19 15:14:13',NULL,NULL),
(3,'Iguana','2023-09-19 15:14:13',NULL,NULL),
(4,'Cerdo','2023-09-19 15:14:13',NULL,NULL);

/*Table structure for table `clientes` */

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `apellidos` varchar(50) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `dni` char(9) NOT NULL,
  `claveacceso` varchar(100) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idcliente`),
  UNIQUE KEY `uk3` (`dni`),
  UNIQUE KEY `uk4` (`dni`,`claveacceso`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `clientes` */

insert  into `clientes`(`idcliente`,`apellidos`,`nombres`,`dni`,`claveacceso`,`create_at`,`update_at`,`inactive_at`) values 
(1,'Quiroz Ccaulla','Alex Edú','72680725','tMEChynHz9MY3fSbO6VNy0WKtYJZl1vX5nI6BRjJ4K8','2023-09-19 15:14:36',NULL,NULL),
(2,'Mateo Quispe','Jean Luis','76542123','tMEChynHz9MY3fSbO6VNy0WKtYJZl1vX5nI6BRjJ4K8','2023-09-19 15:14:36',NULL,NULL),
(3,'Cusi Gonzales','Luis David','76859845','tMEChynHz9MY3fSbO6VNy0WKtYJZl1vX5nI6BRjJ4K8','2023-09-19 15:30:04',NULL,NULL);

/*Table structure for table `mascotas` */

DROP TABLE IF EXISTS `mascotas`;

CREATE TABLE `mascotas` (
  `idmascota` int(11) NOT NULL AUTO_INCREMENT,
  `idcliente` int(11) NOT NULL,
  `idraza` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fotografia` varchar(200) DEFAULT NULL,
  `color` varchar(30) NOT NULL,
  `genero` varchar(10) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idmascota`),
  KEY `fk2` (`idraza`),
  KEY `fk3` (`idcliente`),
  CONSTRAINT `fk2` FOREIGN KEY (`idraza`) REFERENCES `razas` (`idraza`),
  CONSTRAINT `fk3` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `mascotas` */

insert  into `mascotas`(`idmascota`,`idcliente`,`idraza`,`nombre`,`fotografia`,`color`,`genero`,`create_at`,`update_at`,`inactive_at`) values 
(1,1,2,'Scoby',NULL,'Marron','Macho','2023-09-19 15:18:54',NULL,NULL),
(2,1,4,'Chock',NULL,'Negro','Macho','2023-09-19 15:18:54',NULL,NULL),
(3,2,8,'Tom',NULL,'Gris','Hembra','2023-09-19 15:18:54',NULL,NULL),
(4,3,3,'Firulais',NULL,'Negro','Macho','2023-09-19 15:42:45',NULL,NULL);

/*Table structure for table `razas` */

DROP TABLE IF EXISTS `razas`;

CREATE TABLE `razas` (
  `idraza` int(11) NOT NULL AUTO_INCREMENT,
  `idanimal` int(11) NOT NULL,
  `nombreraza` varchar(30) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idraza`),
  UNIQUE KEY `uk2` (`idanimal`,`nombreraza`),
  CONSTRAINT `fk1` FOREIGN KEY (`idanimal`) REFERENCES `animales` (`idanimal`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `razas` */

insert  into `razas`(`idraza`,`idanimal`,`nombreraza`,`create_at`,`update_at`,`inactive_at`) values 
(1,1,'Chihuahua','2023-09-19 15:14:21',NULL,NULL),
(2,1,'Gran Danés','2023-09-19 15:14:21',NULL,NULL),
(3,1,'Bichón maltés','2023-09-19 15:14:21',NULL,NULL),
(4,1,'Caniche','2023-09-19 15:14:21',NULL,NULL),
(5,1,'Shar Pei','2023-09-19 15:14:21',NULL,NULL),
(6,1,'Dalmata','2023-09-19 15:14:21',NULL,NULL),
(7,2,'Abisinio','2023-09-19 15:14:21',NULL,NULL),
(8,2,'Asiático','2023-09-19 15:14:21',NULL,NULL),
(9,2,'Azul ruso','2023-09-19 15:14:21',NULL,NULL),
(10,2,'Balinés','2023-09-19 15:14:21',NULL,NULL),
(11,2,'Bengalí','2023-09-19 15:14:21',NULL,NULL),
(12,2,'Birmano','2023-09-19 15:14:21',NULL,NULL),
(13,2,'Bombay','2023-09-19 15:14:21',NULL,NULL),
(14,2,'Bosque de Noruega','2023-09-19 15:14:21',NULL,NULL),
(15,3,'Conolophus pallidus','2023-09-19 15:14:21',NULL,NULL),
(16,3,'Del Caribe','2023-09-19 15:14:21',NULL,NULL),
(17,3,'Crestada de Fiyi','2023-09-19 15:14:21',NULL,NULL),
(18,3,'Bulabula','2023-09-19 15:14:21',NULL,NULL),
(19,3,'Negra de cola espinosa','2023-09-19 15:14:21',NULL,NULL),
(20,4,'Poland China','2023-09-19 15:14:21',NULL,NULL),
(21,4,'Hampshire','2023-09-19 15:14:21',NULL,NULL),
(22,4,'Duroc','2023-09-19 15:14:21',NULL,NULL),
(23,4,'Pietrain','2023-09-19 15:14:21',NULL,NULL),
(24,4,'Landrace','2023-09-19 15:14:21',NULL,NULL),
(25,4,'Chester white','2023-09-19 15:14:21',NULL,NULL);

/* Procedure structure for procedure `spu_clientes_buscar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_clientes_buscar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_clientes_buscar`(in _dni char(9))
begin 
		select  concat(apellidos, ' ' , nombres )as Cliente, nombre as Nombre, animales.nombreanimal as Animal, razas.nombreraza as Raza, color as Color, genero as Genero, fotografia as Fotografia
		from mascotas
		inner join clientes on clientes.idcliente = mascotas.idcliente
		inner join razas on razas.idraza = mascotas.idraza
		inner join animales on animales.idanimal = razas.idanimal
		where dni = _dni
		order by idmascota;
	end */$$
DELIMITER ;

/* Procedure structure for procedure `spu_clientes_registrar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_clientes_registrar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_clientes_registrar`(in _apellidos varchar(50),
in _nombres varchar(50),
in _dni	char(9),
in _claveacceso varchar(100))
begin 
	insert into clientes (apellidos, nombres, dni, claveacceso)values
	(_apellidos, _nombres, _dni, _claveacceso);
	end */$$
DELIMITER ;

/* Procedure structure for procedure `spu_mascotas_registrar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_mascotas_registrar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_mascotas_registrar`(
in _idcliente int,
in _idraza int,
in _nombre varchar(50),
in _fotografia varchar(200),
in _color varchar(30),
in _genero varchar(10)
)
begin
	IF _fotografia= '' THEN SET _fotografia = NULL; END IF;
	
	insert into mascotas(idcliente, idraza, nombre, fotografia, color, genero)values
	(_idcliente, _idraza, _nombre, _fotografia, _color, _genero);
	end */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
