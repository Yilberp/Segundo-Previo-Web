-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.5.24-log - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para aseguradora
CREATE DATABASE IF NOT EXISTS `aseguradora` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `aseguradora`;

-- Volcando estructura para tabla aseguradora.corredor
CREATE TABLE IF NOT EXISTS `corredor` (
  `usuariocorredor` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `clave` varchar(50) NOT NULL,
  `comision` int(11) NOT NULL,
  PRIMARY KEY (`usuariocorredor`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla aseguradora.corredor: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `corredor` DISABLE KEYS */;
INSERT INTO `corredor` (`usuariocorredor`, `clave`, `comision`) VALUES
	('carlota', 'abcd', 2521500),
	('mary', '12345', 4209000);
/*!40000 ALTER TABLE `corredor` ENABLE KEYS */;

-- Volcando estructura para tabla aseguradora.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `cedula` varchar(15) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `edad` int(3) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `direccion` varchar(20) NOT NULL,
  `estadoCivil` varchar(10) NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aseguradora.persona: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` (`cedula`, `nombre`, `edad`, `telefono`, `direccion`, `estadoCivil`) VALUES
	('1090', 'Yilber Patiño', 21, '3046742777', 'Calle 23n #4-87', 'soltero/a');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;

-- Volcando estructura para tabla aseguradora.persona_poliza
CREATE TABLE IF NOT EXISTS `persona_poliza` (
  `fecha_compra` date NOT NULL,
  `id_persona` varchar(15) NOT NULL,
  `placaVehiculo` varchar(20) NOT NULL,
  `id_poliza` int(1) NOT NULL DEFAULT '0',
  `id_corredor` varchar(20) NOT NULL,
  `totalPagar` int(20) NOT NULL,
  PRIMARY KEY (`fecha_compra`,`id_persona`,`placaVehiculo`,`id_poliza`,`id_corredor`) USING BTREE,
  KEY `id_persona` (`id_persona`),
  KEY `placaVehiculo` (`placaVehiculo`),
  KEY `id_poliza` (`id_poliza`),
  KEY `id_corredor` (`id_corredor`),
  CONSTRAINT `persona_poliza_ibfk_1` FOREIGN KEY (`id_poliza`) REFERENCES `poliza` (`id_poliza`),
  CONSTRAINT `persona_poliza_ibfk_2` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`cedula`),
  CONSTRAINT `persona_poliza_ibfk_3` FOREIGN KEY (`placaVehiculo`) REFERENCES `vehiculo` (`placa`),
  CONSTRAINT `persona_poliza_ibfk_4` FOREIGN KEY (`id_corredor`) REFERENCES `corredor` (`usuariocorredor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aseguradora.persona_poliza: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `persona_poliza` DISABLE KEYS */;
INSERT INTO `persona_poliza` (`fecha_compra`, `id_persona`, `placaVehiculo`, `id_poliza`, `id_corredor`, `totalPagar`) VALUES
	('2020-05-28', '1090', 'ABC123', 2, 'mary', 289000),
	('2020-05-28', '1090', 'UFF420', 2, 'mary', 824000);
/*!40000 ALTER TABLE `persona_poliza` ENABLE KEYS */;

-- Volcando estructura para tabla aseguradora.poliza
CREATE TABLE IF NOT EXISTS `poliza` (
  `id_poliza` int(1) NOT NULL DEFAULT '0',
  `tipo_poliza` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_poliza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aseguradora.poliza: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `poliza` DISABLE KEYS */;
INSERT INTO `poliza` (`id_poliza`, `tipo_poliza`) VALUES
	(1, 'SOAT'),
	(2, 'TODORIESGO');
/*!40000 ALTER TABLE `poliza` ENABLE KEYS */;

-- Volcando estructura para tabla aseguradora.tabla
CREATE TABLE IF NOT EXISTS `tabla` (
  `COD` int(11) NOT NULL AUTO_INCREMENT,
  `MARCA` varchar(25) DEFAULT NULL,
  `MODELO` varchar(25) DEFAULT NULL,
  `AÑO` int(11) DEFAULT NULL,
  `VALOR_COMERCIAL` double DEFAULT NULL,
  `PORC_PERDIDA_TOTAL` double DEFAULT NULL,
  `PORC_TERCEROS` double DEFAULT NULL,
  `PORC_SALUD` double DEFAULT NULL,
  PRIMARY KEY (`COD`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla aseguradora.tabla: ~21 rows (aproximadamente)
/*!40000 ALTER TABLE `tabla` DISABLE KEYS */;
INSERT INTO `tabla` (`COD`, `MARCA`, `MODELO`, `AÑO`, `VALOR_COMERCIAL`, `PORC_PERDIDA_TOTAL`, `PORC_TERCEROS`, `PORC_SALUD`) VALUES
	(1, 'Toyota', '4Runner', 2003, 27900000, 80, 90, 60),
	(2, 'Toyota', 'Fortuner', 2008, 64400000, 80, 90, 60),
	(3, 'Toyota', 'Hilux', 2018, 107400000, 80, 90, 60),
	(4, 'Toyota', 'Sienna', 2019, 37400000, 80, 90, 60),
	(5, 'Toyota', 'Rav4', 2019, 87400000, 80, 90, 60),
	(6, 'Chevrolet', 'Aveo', 2010, 27400000, 80, 90, 60),
	(7, 'Chevrolet', 'Captiva', 2011, 72400000, 80, 90, 60),
	(8, 'Chevrolet', 'Corsa', 2012, 75400000, 80, 90, 60),
	(9, 'Chevrolet', 'Astra', 2015, 94400000, 80, 90, 60),
	(10, 'Chevrolet', 'Caprice', 2016, 68400000, 80, 90, 60),
	(11, 'Chevrolet', 'Camaro', 2019, 57400000, 80, 90, 60),
	(12, 'Honda', 'Accord', 2008, 64400000, 80, 90, 60),
	(13, 'Honda', 'Civic', 2018, 107400000, 80, 90, 60),
	(14, 'Honda', 'Shadaw', 2019, 37400000, 80, 90, 60),
	(15, 'Honda', 'Legend', 2019, 87400000, 80, 90, 60),
	(16, 'Kia', 'Cerato', 2010, 27400000, 80, 90, 60),
	(17, 'Kia', 'Sportage', 2011, 72400000, 80, 90, 60),
	(18, 'Kia', 'Picanto', 2012, 75400000, 80, 90, 60),
	(19, 'Kia', 'Rio', 2015, 94400000, 80, 90, 60),
	(20, 'Kia', 'Sorento', 2016, 68400000, 80, 90, 60),
	(21, 'Kia', 'Magentis', 2019, 57400000, 80, 90, 60);
/*!40000 ALTER TABLE `tabla` ENABLE KEYS */;

-- Volcando estructura para tabla aseguradora.vehiculo
CREATE TABLE IF NOT EXISTS `vehiculo` (
  `placa` varchar(20) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `serial` varchar(20) NOT NULL,
  `valor` int(20) NOT NULL,
  `id_persona` varchar(15) NOT NULL,
  PRIMARY KEY (`placa`),
  KEY `id_persona` (`id_persona`),
  CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`cedula`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aseguradora.vehiculo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` (`placa`, `modelo`, `marca`, `serial`, `valor`, `id_persona`) VALUES
	('ABC123', '4Runner', 'Toyota', 'akdj345', 27900000, '1090'),
	('UFF420', 'Captiva', 'Chevrolet', 'P7L4R', 72400000, '1090');
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
