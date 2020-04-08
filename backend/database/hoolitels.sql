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


-- Dumpar databasstruktur för hoolitels
CREATE DATABASE IF NOT EXISTS `hoolitels` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `hoolitels`;

-- Dumpar struktur för tabell hoolitels.amenity
CREATE TABLE IF NOT EXISTS `amenity` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell hoolitels.amenity: ~4 rows (ungefär)
DELETE FROM `amenity`;
/*!40000 ALTER TABLE `amenity` DISABLE KEYS */;
INSERT INTO `amenity` (`Id`, `name`) VALUES
	(3, 'Barnklubb'),
	(2, 'Kvällsunderhållning'),
	(1, 'Pool'),
	(4, 'Restaurang');
/*!40000 ALTER TABLE `amenity` ENABLE KEYS */;

-- Dumpar struktur för tabell hoolitels.booking
CREATE TABLE IF NOT EXISTS `booking` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT 0,
  `numAdults` int(11) NOT NULL DEFAULT 0,
  `numChildren` int(11) NOT NULL DEFAULT 0,
  `numInfants` int(11) NOT NULL DEFAULT 0,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `Comment` varchar(500) DEFAULT '0',
  `Paid` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_booking_user` (`userId`),
  CONSTRAINT `FK_booking_user` FOREIGN KEY (`userId`) REFERENCES `user` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell hoolitels.booking: ~0 rows (ungefär)
DELETE FROM `booking`;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;

-- Dumpar struktur för tabell hoolitels.city
CREATE TABLE IF NOT EXISTS `city` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell hoolitels.city: ~5 rows (ungefär)
DELETE FROM `city`;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` (`Id`, `name`) VALUES
	(1, 'Helsingborg'),
	(2, 'Kristiansstad'),
	(4, 'Malmö'),
	(5, 'Stockholm'),
	(3, 'Vånga');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;

-- Dumpar struktur för tabell hoolitels.country
CREATE TABLE IF NOT EXISTS `country` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumpar data för tabell hoolitels.country: ~5 rows (ungefär)
DELETE FROM `country`;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` (`Id`, `name`) VALUES
	(1, 'Helsingborg'),
	(2, 'Kristiansstad'),
	(4, 'Malmö'),
	(5, 'Stockholm'),
	(3, 'Vånga');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;

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

-- Dumpar struktur för tabell hoolitels.image
CREATE TABLE IF NOT EXISTS `image` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(500) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `desc` varchar(500) NOT NULL DEFAULT '0',
  `hotelId` int(11) DEFAULT 0,
  `roomId` int(11) DEFAULT 0,
  PRIMARY KEY (`Id`),
  KEY `FK_image_hotel` (`hotelId`),
  KEY `FK_image_room` (`roomId`),
  CONSTRAINT `FK_image_hotel` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`Id`),
  CONSTRAINT `FK_image_room` FOREIGN KEY (`roomId`) REFERENCES `room` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell hoolitels.image: ~0 rows (ungefär)
DELETE FROM `image`;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;

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

-- Dumpar data för tabell hoolitels.roombooking: ~0 rows (ungefär)
DELETE FROM `roombooking`;
/*!40000 ALTER TABLE `roombooking` DISABLE KEYS */;
/*!40000 ALTER TABLE `roombooking` ENABLE KEYS */;

-- Dumpar struktur för tabell hoolitels.user
CREATE TABLE IF NOT EXISTS `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL DEFAULT '0',
  `address` varchar(50) NOT NULL DEFAULT '0',
  `zip` varchar(10) NOT NULL DEFAULT '0',
  `city` varchar(50) NOT NULL DEFAULT '0',
  `phone` varchar(20) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '0',
  `countryId` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `FK__country` (`countryId`),
  CONSTRAINT `FK__country` FOREIGN KEY (`countryId`) REFERENCES `country` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell hoolitels.user: ~0 rows (ungefär)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
