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

-- Dumpar struktur för tabell hoolitels.hotelamenity
CREATE TABLE IF NOT EXISTS `hotelamenity` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `hotelId` int(11) NOT NULL,
  `amenityId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `hotelId_amenityId` (`hotelId`,`amenityId`),
  KEY `FK_hotelamenity_amenity` (`amenityId`),
  CONSTRAINT `FK_hotelamenity_amenity` FOREIGN KEY (`amenityId`) REFERENCES `amenity` (`Id`),
  CONSTRAINT `FK_hotelamenity_hotel` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell hoolitels.hotelamenity: ~0 rows (ungefär)
DELETE FROM `hotelamenity`;
/*!40000 ALTER TABLE `hotelamenity` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotelamenity` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
