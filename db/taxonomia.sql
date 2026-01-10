-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         11.8.2-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para taxonomia
CREATE DATABASE IF NOT EXISTS `taxonomia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;
USE `taxonomia`;

-- Volcando estructura para tabla taxonomia.dieta
CREATE TABLE IF NOT EXISTS `dieta` (
  `IDdieta` int(11) NOT NULL AUTO_INCREMENT,
  `dieta` varchar(50) NOT NULL DEFAULT '0',
  `habilitado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`IDdieta`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Volcando datos para la tabla taxonomia.dieta: ~3 rows (aproximadamente)
REPLACE INTO `dieta` (`IDdieta`, `dieta`, `habilitado`) VALUES
	(1, 'herbivoro', 1),
	(2, 'omnivoro', 1),
	(3, 'carnivoro', 1);

-- Volcando estructura para tabla taxonomia.eras
CREATE TABLE IF NOT EXISTS `eras` (
  `IDeras` int(11) NOT NULL AUTO_INCREMENT,
  `era geologica` varchar(50) NOT NULL DEFAULT '0',
  `habilitado` int(11) DEFAULT 1,
  PRIMARY KEY (`IDeras`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Volcando datos para la tabla taxonomia.eras: ~8 rows (aproximadamente)
REPLACE INTO `eras` (`IDeras`, `era geologica`, `habilitado`) VALUES
	(1, 'triásico inferior', 1),
	(2, 'triásico medio', 1),
	(3, 'triásico superior', 1),
	(4, 'jurásico inferior', 1),
	(5, 'jurásico medio', 1),
	(6, 'jurásico superior', 1),
	(7, 'cretáceo inferior', 1),
	(8, 'cretáceo superior', 1);

-- Volcando estructura para tabla taxonomia.especies
CREATE TABLE IF NOT EXISTS `especies` (
  `IDespecies` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '0',
  `genero` int(11) NOT NULL DEFAULT 0,
  `alimentacio` int(11) NOT NULL DEFAULT 0,
  `era geologica` int(11) NOT NULL DEFAULT 0,
  `habilitado` int(11) DEFAULT 1,
  PRIMARY KEY (`IDespecies`),
  KEY `genero` (`genero`),
  KEY `alimentacio` (`alimentacio`),
  KEY `era geologica` (`era geologica`),
  CONSTRAINT `FK_especies_dieta` FOREIGN KEY (`alimentacio`) REFERENCES `dieta` (`IDdieta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_especies_eras` FOREIGN KEY (`era geologica`) REFERENCES `eras` (`IDeras`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_especies_generos` FOREIGN KEY (`genero`) REFERENCES `generos` (`IDgeneros`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Volcando datos para la tabla taxonomia.especies: ~22 rows (aproximadamente)
REPLACE INTO `especies` (`IDespecies`, `nombre`, `genero`, `alimentacio`, `era geologica`, `habilitado`) VALUES
	(1, 'Aegyptiacus', 1, 3, 8, 1),
	(2, 'Rex', 2, 3, 8, 1),
	(3, 'Longipes', 3, 3, 6, 1),
	(4, 'Huinculensis', 4, 1, 8, 1),
	(5, 'Cheloniformis', 5, 1, 8, 1),
	(6, 'Supremus', 6, 1, 6, 1),
	(7, 'Carolinii', 7, 3, 8, 1),
	(8, 'Magniventris', 8, 1, 8, 1),
	(9, 'Downsi', 9, 1, 6, 1),
	(10, 'Ostrommaisi', 10, 3, 7, 1),
	(11, 'Mongoliensis', 11, 3, 8, 1),
	(12, 'Horridus', 12, 1, 8, 1),
	(13, 'Antarticus', 13, 1, 8, 1),
	(15, 'Bucklandii', 14, 3, 5, 1),
	(16, 'Ungulatus', 15, 1, 4, 1),
	(17, 'Taibaii', 16, 1, 5, 1),
	(18, 'Navajovious', 17, 1, 7, 1),
	(19, 'Fragilis', 18, 3, 6, 1),
	(20, 'Philoceratops', 19, 2, 8, 1),
	(21, 'Zoui', 20, 2, 7, 1),
	(22, 'Mirificus', 21, 2, 8, 1),
	(23, 'Velox', 22, 2, 8, 1);

-- Volcando estructura para tabla taxonomia.familia
CREATE TABLE IF NOT EXISTS `familia` (
  `IDfamilia` int(11) NOT NULL AUTO_INCREMENT,
  `familia` varchar(50) DEFAULT NULL,
  `superfamilia` int(11) DEFAULT NULL,
  `habilitado` int(11) DEFAULT 1,
  PRIMARY KEY (`IDfamilia`),
  KEY `superfamilia` (`superfamilia`),
  CONSTRAINT `FK_familia_superfamilia` FOREIGN KEY (`superfamilia`) REFERENCES `superfamilia` (`IDsuperfamilia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Volcando datos para la tabla taxonomia.familia: ~21 rows (aproximadamente)
REPLACE INTO `familia` (`IDfamilia`, `familia`, `superfamilia`, `habilitado`) VALUES
	(1, 'Spinosauridae', 1, 1),
	(2, 'Tyranosauridae', 2, 1),
	(3, 'Compsognathidae', 3, 1),
	(4, 'Longkosauria', 4, 1),
	(5, 'Therizinosauridae', 5, 1),
	(6, 'Camarasauridae', 6, 1),
	(7, 'Carchadontosauridae', 7, 1),
	(8, 'Ankylosauridae', 8, 1),
	(9, 'Chaoyangsauridae', 9, 1),
	(10, 'Dromaeosauridae', 10, 1),
	(11, 'Ceratopsidae', 11, 1),
	(12, 'Morrosaurus i.a.', 12, 1),
	(13, 'Megalosauridae', 1, 1),
	(14, 'Stegosauridae', 13, 1),
	(16, 'Huayangosauridae', 15, 1),
	(17, 'Hadrosauridae', 16, 1),
	(18, 'Allosauridae', 7, 1),
	(19, 'Oviraptoridae', 17, 1),
	(20, 'Caudipteridae', 18, 1),
	(21, 'Deinocheridae', 19, 1),
	(22, 'Ornithomimidae', 20, 1);

-- Volcando estructura para tabla taxonomia.generos
CREATE TABLE IF NOT EXISTS `generos` (
  `IDgeneros` int(11) NOT NULL AUTO_INCREMENT,
  `genero` varchar(50) NOT NULL DEFAULT '0',
  `familia` int(11) NOT NULL DEFAULT 0,
  `habilitado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`IDgeneros`),
  KEY `familia` (`familia`),
  CONSTRAINT `FK_generos_familia` FOREIGN KEY (`familia`) REFERENCES `familia` (`IDfamilia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Volcando datos para la tabla taxonomia.generos: ~22 rows (aproximadamente)
REPLACE INTO `generos` (`IDgeneros`, `genero`, `familia`, `habilitado`) VALUES
	(1, 'Spinosaurus', 1, 1),
	(2, 'Tyranosaurus', 2, 1),
	(3, 'Compsognathus', 3, 1),
	(4, 'Argentinosaurus', 4, 1),
	(5, 'Therizinosaurus', 5, 1),
	(6, 'Camarasaurus', 6, 1),
	(7, 'Ginanotosaurus', 7, 1),
	(8, 'Ankylosaurus', 8, 1),
	(9, 'Yinlong', 9, 1),
	(10, 'Utahraptor', 10, 1),
	(11, 'Velociraptor', 10, 1),
	(12, 'Triceratops', 11, 1),
	(13, 'Morrosaurus', 12, 1),
	(14, 'Megalosaurus', 13, 1),
	(15, 'Stegosaurus', 14, 1),
	(16, 'Huayangosaurus', 16, 1),
	(17, 'Kritosaurus', 17, 1),
	(18, 'Allosaurus', 18, 1),
	(19, 'Oviraptor', 19, 1),
	(20, 'Caudipteryx', 20, 1),
	(21, 'Deinocheirus', 21, 1),
	(22, 'Ornithomimus', 22, 1);

-- Volcando estructura para tabla taxonomia.infraorden
CREATE TABLE IF NOT EXISTS `infraorden` (
  `IDinfraorden` int(11) NOT NULL AUTO_INCREMENT,
  `infraorden` varchar(50) DEFAULT NULL,
  `suborden` int(11) DEFAULT NULL,
  `habilitado` int(11) DEFAULT 1,
  PRIMARY KEY (`IDinfraorden`),
  KEY `suborden` (`suborden`),
  CONSTRAINT `FK_infraorden_suborden` FOREIGN KEY (`suborden`) REFERENCES `suborden` (`IDsuborden`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Volcando datos para la tabla taxonomia.infraorden: ~11 rows (aproximadamente)
REPLACE INTO `infraorden` (`IDinfraorden`, `infraorden`, `suborden`, `habilitado`) VALUES
	(1, 'Tetanuare', 1, 1),
	(2, 'Coelurosauria', 1, 1),
	(3, 'Sauropoda', 2, 1),
	(4, 'Therizinosauria i.a.', 1, 1),
	(5, 'Carnosauria', 1, 1),
	(6, 'Ankylosauria', 4, 1),
	(7, 'Ceratopsia', 3, 1),
	(8, 'Ornithopoda', 3, 1),
	(9, 'Stegosauria', 4, 1),
	(11, 'Oviraptorosauria', 1, 1),
	(12, 'Ornithomimosauria', 1, 1);

-- Volcando estructura para tabla taxonomia.orden
CREATE TABLE IF NOT EXISTS `orden` (
  `IDorden` int(11) NOT NULL AUTO_INCREMENT,
  `orden` varchar(50) NOT NULL DEFAULT '0',
  `superorden` int(11) NOT NULL DEFAULT 0,
  `habilitado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`IDorden`),
  KEY `dominio` (`superorden`) USING BTREE,
  CONSTRAINT `FK_orden_superorden` FOREIGN KEY (`superorden`) REFERENCES `superorden` (`IDsuperorden`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Volcando datos para la tabla taxonomia.orden: ~2 rows (aproximadamente)
REPLACE INTO `orden` (`IDorden`, `orden`, `superorden`, `habilitado`) VALUES
	(1, 'Ornithisquia', 1, 1),
	(2, 'Saurischia', 1, 1);

-- Volcando estructura para tabla taxonomia.suborden
CREATE TABLE IF NOT EXISTS `suborden` (
  `IDsuborden` int(11) NOT NULL AUTO_INCREMENT,
  `suborden` varchar(50) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `habilitado` int(11) DEFAULT 1,
  PRIMARY KEY (`IDsuborden`),
  KEY `orden` (`orden`),
  CONSTRAINT `FK_suborden_orden` FOREIGN KEY (`orden`) REFERENCES `orden` (`IDorden`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Volcando datos para la tabla taxonomia.suborden: ~5 rows (aproximadamente)
REPLACE INTO `suborden` (`IDsuborden`, `suborden`, `orden`, `habilitado`) VALUES
	(1, 'Theropoda', 2, 1),
	(2, 'Sauropodomorpha', 2, 1),
	(3, 'Neornithischia', 1, 1),
	(4, 'Thyreophora', 1, 1),
	(5, 'Onrnithopoda', 1, 1);

-- Volcando estructura para tabla taxonomia.superfamilia
CREATE TABLE IF NOT EXISTS `superfamilia` (
  `IDsuperfamilia` int(11) NOT NULL AUTO_INCREMENT,
  `superfamilia` varchar(50) NOT NULL DEFAULT '0',
  `infraorden` int(11) NOT NULL DEFAULT 0,
  `habilitado` int(11) DEFAULT 1,
  PRIMARY KEY (`IDsuperfamilia`),
  KEY `infraorden` (`infraorden`),
  CONSTRAINT `FK_superfamilia_infraorden` FOREIGN KEY (`infraorden`) REFERENCES `infraorden` (`IDinfraorden`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Volcando datos para la tabla taxonomia.superfamilia: ~20 rows (aproximadamente)
REPLACE INTO `superfamilia` (`IDsuperfamilia`, `superfamilia`, `infraorden`, `habilitado`) VALUES
	(1, 'Megalosauroidea', 1, 1),
	(2, 'Tyranosauroidea', 2, 1),
	(3, 'Compsognathidae i.a.', 2, 1),
	(4, 'Longkosauria i.a.', 3, 1),
	(5, 'Therizinosauroidea', 4, 1),
	(6, 'Camarasauridae i.a.', 3, 1),
	(7, 'Allosauroidea', 5, 1),
	(8, 'Ankylosauroidae i.a.', 6, 1),
	(9, 'Chaoyangsauridae i.a.', 7, 1),
	(10, 'Deinonychosauria', 2, 1),
	(11, 'Ceratopsidae i.a.', 7, 1),
	(12, 'Iguanodontia', 8, 1),
	(13, 'Stegosauridae i.a.', 9, 1),
	(14, 'Parankylosauria i.a.', 6, 1),
	(15, 'Huayangosauridae i.a.', 9, 1),
	(16, 'Hadrosauroidea', 8, 1),
	(17, 'Caenagnathoidea', 11, 1),
	(18, 'Caupteridae i.a.', 11, 1),
	(19, 'Deinocheiridae i.a.', 2, 1),
	(20, 'Ornithomimidae i.a.', 12, 1);

-- Volcando estructura para tabla taxonomia.superorden
CREATE TABLE IF NOT EXISTS `superorden` (
  `IDsuperorden` int(11) NOT NULL AUTO_INCREMENT,
  `superorden` varchar(50) DEFAULT NULL,
  `habilitado` int(11) DEFAULT 1,
  PRIMARY KEY (`IDsuperorden`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Volcando datos para la tabla taxonomia.superorden: ~0 rows (aproximadamente)
REPLACE INTO `superorden` (`IDsuperorden`, `superorden`, `habilitado`) VALUES
	(1, 'Dinosauria', 1);

-- Volcando estructura para tabla taxonomia.ubicaciones
CREATE TABLE IF NOT EXISTS `ubicaciones` (
  `IDubicaciones` int(11) NOT NULL AUTO_INCREMENT,
  `ubicacion` enum('dman','dmca','dmac','dmmi','dmma','dmbr','dmro','dmsm','dmlc','dmln','dmbn','dmmn','dmsu','dmat','dmcf','dmch','dmas','dmaf','dmgu','dmpt','dmpm','dmns','dmao','dmnn','dmgm','dmnc','dmsn','dmgl','dmqb','dmtc','dmak','dmcs','dmec','dmsa','dmna','dmgr','dmmg','dmsk','dmtv','dmmc','dmgs','dmam','dmin','dmnh','dmhc','dmdc','dmgh','dmce','dmga','dmib','dmgb','dmir','dmgi','dmyu','dmti','dmsw','dmse','dmeo','dmko','dmjp','dmtr') DEFAULT NULL,
  `especie` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`IDubicaciones`),
  KEY `especie` (`especie`),
  CONSTRAINT `FK_ubicaciones_especies` FOREIGN KEY (`especie`) REFERENCES `especies` (`IDespecies`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Volcando datos para la tabla taxonomia.ubicaciones: ~27 rows (aproximadamente)
REPLACE INTO `ubicaciones` (`IDubicaciones`, `ubicacion`, `especie`) VALUES
	(2, 'dman', 13),
	(3, 'dmlc', 6),
	(5, 'dmln', 8),
	(6, 'dmbn', 1),
	(7, 'dmat', 1),
	(8, 'dmcs', 19),
	(9, 'dmlc', 19),
	(10, 'dmpt', 7),
	(11, 'dmlc', 12),
	(12, 'dmsk', 9),
	(14, 'dmce', 3),
	(15, 'dmga', 3),
	(16, 'dmlc', 10),
	(17, 'dmgi', 11),
	(18, 'dmlc', 2),
	(19, 'dmln', 2),
	(20, 'dmpt', 4),
	(21, 'dmlc', 16),
	(22, 'dmib', 16),
	(23, 'dmgb', 15),
	(24, 'dmyu', 17),
	(25, 'dmsm', 18),
	(26, 'dmgi', 5),
	(27, 'dmgi', 20),
	(28, 'dmmc', 21),
	(29, 'dmgi', 22),
	(30, 'dmlc', 23);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
