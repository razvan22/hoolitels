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

-- Dumpar struktur för tabell hoolitels.roombooking
CREATE TABLE IF NOT EXISTS `roombooking` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `bookingId` int(11) NOT NULL DEFAULT 0,
  `roomId` int(11) NOT NULL DEFAULT 0,
  `extraBed` bit(1) DEFAULT b'0',
  `foodCost` int(11) DEFAULT 0,
  PRIMARY KEY (`Id`),
  KEY `FK__booking` (`bookingId`),
  KEY `FK__room` (`roomId`),
  CONSTRAINT `FK__booking` FOREIGN KEY (`bookingId`) REFERENCES `booking` (`Id`),
  CONSTRAINT `FK__room` FOREIGN KEY (`roomId`) REFERENCES `room` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dataexport var bortvalt.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
