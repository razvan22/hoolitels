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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell hoolitels.amenity: ~4 rows (ungefär)
DELETE FROM `amenity`;
/*!40000 ALTER TABLE `amenity` DISABLE KEYS */;
INSERT INTO `amenity` (`id`, `name`) VALUES
	(3, 'Barnklubb'),
	(2, 'Kvällsunderhållning'),
	(1, 'Pool'),
	(4, 'Restaurang');
/*!40000 ALTER TABLE `amenity` ENABLE KEYS */;

-- Dumpar struktur för tabell hoolitels.booking
CREATE TABLE IF NOT EXISTS `booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `num_adults` int(11) unsigned NOT NULL DEFAULT 0,
  `num_children` int(11) unsigned NOT NULL DEFAULT 0,
  `num_infants` int(11) unsigned NOT NULL DEFAULT 0,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `comment` varchar(500) DEFAULT '0',
  `paid` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_booking_user` (`user_id`) USING BTREE,
  CONSTRAINT `FK_booking_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell hoolitels.booking: ~0 rows (ungefär)
DELETE FROM `booking`;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;

-- Dumpar struktur för tabell hoolitels.city
CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell hoolitels.city: ~5 rows (ungefär)
DELETE FROM `city`;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` (`id`, `name`) VALUES
	(1, 'Helsingborg'),
	(2, 'Kristiansstad'),
	(6, 'Lund'),
	(4, 'Malmö'),
	(5, 'Stockholm'),
	(3, 'Vånga');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;

-- Dumpar struktur för tabell hoolitels.country
CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumpar data för tabell hoolitels.country: ~5 rows (ungefär)
DELETE FROM `country`;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` (`id`, `name`) VALUES
	(6, 'Belgium'),
	(7, 'China'),
	(4, 'Denmark'),
	(5, 'Finland'),
	(3, 'Germany'),
	(2, 'Norway'),
	(8, 'Russia'),
	(1, 'Sweden'),
	(9, 'USA');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;

-- Dumpar struktur för tabell hoolitels.hotel
CREATE TABLE IF NOT EXISTS `hotel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `address` varchar(50) NOT NULL DEFAULT '0',
  `zip` varchar(10) NOT NULL DEFAULT '0',
  `city_id` int(11) NOT NULL DEFAULT 0,
  `desc` varchar(500) DEFAULT '0',
  `email` varchar(50) NOT NULL DEFAULT '0',
  `phone` varchar(20) NOT NULL DEFAULT '0',
  `distance_to_beach` int(11) DEFAULT -1 COMMENT '-1, finns inte nära, 0 ligger precis vid',
  `distance_to_town_center` int(11) DEFAULT -1 COMMENT '-1, finns inte nära, 0 ligger precis vid',
  `checkin_time` time NOT NULL,
  `checkout_time` time NOT NULL DEFAULT '11:00:00',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name_cityId` (`name`,`city_id`) USING BTREE,
  KEY `FK_cityId` (`city_id`) USING BTREE,
  CONSTRAINT `FK_cityId` FOREIGN KEY (`city_id`) REFERENCES `city` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell hoolitels.hotel: ~0 rows (ungefär)
DELETE FROM `hotel`;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;

-- Dumpar struktur för tabell hoolitels.hotelamenity
CREATE TABLE IF NOT EXISTS `hotelamenity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `amenity_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `hotelId_amenityId` (`hotel_id`,`amenity_id`) USING BTREE,
  KEY `FK_hotelamenity_amenity` (`amenity_id`) USING BTREE,
  CONSTRAINT `FK_hotelamenity_amenity` FOREIGN KEY (`amenity_id`) REFERENCES `amenity` (`id`),
  CONSTRAINT `FK_hotelamenity_hotel` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell hoolitels.hotelamenity: ~0 rows (ungefär)
DELETE FROM `hotelamenity`;
/*!40000 ALTER TABLE `hotelamenity` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotelamenity` ENABLE KEYS */;

-- Dumpar struktur för tabell hoolitels.image
CREATE TABLE IF NOT EXISTS `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(500) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `desc` varchar(500) NOT NULL DEFAULT '0',
  `hotel_id` int(11) DEFAULT 0,
  `room_id` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_image_hotel` (`hotel_id`) USING BTREE,
  KEY `FK_image_room` (`room_id`) USING BTREE,
  CONSTRAINT `FK_image_hotel` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`Id`),
  CONSTRAINT `FK_image_room` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell hoolitels.image: ~0 rows (ungefär)
DELETE FROM `image`;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;

-- Dumpar struktur för tabell hoolitels.room
CREATE TABLE IF NOT EXISTS `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` enum('Single','Double','Triple','Family') NOT NULL,
  `floor` int(11) NOT NULL DEFAULT 0,
  `number` int(10) unsigned NOT NULL DEFAULT 0,
  `hotel_id` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `max_occupancy` int(11) NOT NULL DEFAULT 0,
  `cost_extra_bed` int(11) NOT NULL DEFAULT 0,
  `cost_half_board` int(11) NOT NULL DEFAULT 0,
  `cost_full_board` int(11) NOT NULL DEFAULT 0,
  `cost_all_inclusive` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `number` (`number`),
  KEY `FK__hotel` (`hotel_id`) USING BTREE,
  CONSTRAINT `FK__hotel` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell hoolitels.room: ~0 rows (ungefär)
DELETE FROM `room`;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
/*!40000 ALTER TABLE `room` ENABLE KEYS */;

-- Dumpar struktur för tabell hoolitels.roombooking
CREATE TABLE IF NOT EXISTS `roombooking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL DEFAULT 0,
  `room_id` int(11) NOT NULL DEFAULT 0,
  `extra_bed` bit(1) DEFAULT b'0',
  `food_cost` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK__booking` (`booking_id`) USING BTREE,
  KEY `FK__room` (`room_id`) USING BTREE,
  CONSTRAINT `FK__booking` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`),
  CONSTRAINT `FK__room` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell hoolitels.roombooking: ~0 rows (ungefär)
DELETE FROM `roombooking`;
/*!40000 ALTER TABLE `roombooking` DISABLE KEYS */;
/*!40000 ALTER TABLE `roombooking` ENABLE KEYS */;

-- Dumpar struktur för tabell hoolitels.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL DEFAULT '0',
  `address` varchar(50) NOT NULL DEFAULT '0',
  `zip` varchar(10) NOT NULL DEFAULT '0',
  `city` varchar(50) NOT NULL DEFAULT '0',
  `phone` varchar(20) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '0',
  `country_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `FK__country` (`country_id`) USING BTREE,
  CONSTRAINT `FK__country` FOREIGN KEY (`country_id`) REFERENCES `country` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell hoolitels.user: ~0 rows (ungefär)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
