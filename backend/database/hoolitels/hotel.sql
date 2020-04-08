-- --------------------------------------------------------
-- Värd:                         127.0.0.1
-- Serverversion:                10.4.11-MariaDB - mariadb.org binary distribution
-- Server-OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumpar struktur för tabell hoolitels.hotel
CREATE TABLE IF NOT EXISTS `hotel` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `address` varchar(50) NOT NULL DEFAULT '0',
  `zip` varchar(10) NOT NULL DEFAULT '0',
  `cityId` int(11) NOT NULL DEFAULT 0,
  `desc` varchar(500) DEFAULT '0',
  `email` varchar(50) NOT NULL DEFAULT '0',
  `phone` varchar(20) NOT NULL DEFAULT '0',
  `distanceToBeach` int(11) DEFAULT -1 COMMENT '-1, finns inte nära, 0 ligger precis vid',
  `distanceToTownCenter` int(11) DEFAULT -1 COMMENT '-1, finns inte nära, 0 ligger precis vid',
  `checkinTime` time NOT NULL,
  `checkoutTime` time NOT NULL DEFAULT '11:00:00',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `name_cityId` (`name`,`cityId`),
  KEY `FK_cityId` (`cityId`),
  CONSTRAINT `FK_cityId` FOREIGN KEY (`cityId`) REFERENCES `city` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell hoolitels.hotel: ~0 rows (ungefär)
DELETE FROM `hotel`;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
