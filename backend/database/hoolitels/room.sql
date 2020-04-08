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

-- Dumpar struktur för tabell hoolitels.room
CREATE TABLE IF NOT EXISTS `room` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` enum('Single','Double','Triple','Family') NOT NULL,
  `floor` int(11) NOT NULL DEFAULT 0,
  `number` int(10) unsigned NOT NULL DEFAULT 0,
  `hotelId` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `maxOccupancy` int(11) NOT NULL DEFAULT 0,
  `costExtraBed` int(11) NOT NULL DEFAULT 0,
  `costHalfBoard` int(11) NOT NULL DEFAULT 0,
  `costFullBoard` int(11) NOT NULL DEFAULT 0,
  `costAllInclusive` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `number` (`number`),
  KEY `FK__hotel` (`hotelId`),
  CONSTRAINT `FK__hotel` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell hoolitels.room: ~0 rows (ungefär)
DELETE FROM `room`;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
/*!40000 ALTER TABLE `room` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
