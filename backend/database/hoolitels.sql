SELECT * FROM information_schema.REFERENTIAL_CONSTRAINTS WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='hotelamenity'   AND REFERENCED_TABLE_NAME IS NOT NULL;
SELECT * FROM information_schema.KEY_COLUMN_USAGE WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='hotelamenity'   AND REFERENCED_TABLE_NAME IS NOT NULL;
SHOW CREATE TABLE `hoolitels`.`hotelamenity`;
SELECT 1 FROM `hotel` LIMIT 1;
SELECT 1 FROM `amenity` LIMIT 1;
SELECT * FROM `information_schema`.`COLUMNS` WHERE TABLE_SCHEMA='hoolitels' AND TABLE_NAME='amenity' ORDER BY ORDINAL_POSITION;
ALTER TABLE `hotelamenity`
	ADD COLUMN `hotelId` INT NOT NULL AFTER `Id`,
	ADD COLUMN `amenityId` INT NOT NULL AFTER `hotelId`,
	ADD CONSTRAINT `FK_hotelamenity_hotel` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`Id`),
	ADD CONSTRAINT `FK_hotelamenity_amenity` FOREIGN KEY (`amenityId`) REFERENCES `amenity` (`Id`);
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='hoolitels';
SHOW TABLE STATUS FROM `hoolitels`;
SHOW FUNCTION STATUS WHERE `Db`='hoolitels';
SHOW PROCEDURE STATUS WHERE `Db`='hoolitels';
SHOW TRIGGERS FROM `hoolitels`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='hoolitels';
SELECT * FROM `information_schema`.`COLUMNS` WHERE TABLE_SCHEMA='hoolitels' AND TABLE_NAME='hotelamenity' ORDER BY ORDINAL_POSITION;
SHOW INDEXES FROM `hotelamenity` FROM `hoolitels`;
SELECT * FROM information_schema.REFERENTIAL_CONSTRAINTS WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='hotelamenity'   AND REFERENCED_TABLE_NAME IS NOT NULL;
SELECT * FROM information_schema.KEY_COLUMN_USAGE WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='hotelamenity'   AND REFERENCED_TABLE_NAME IS NOT NULL;
/* Öppnar session "localhost" */
SHOW CREATE TABLE `hoolitels`.`hotelamenity`;
ALTER TABLE `hotelamenity`
	ADD UNIQUE INDEX `hotelId_amenityId` (`hotelId`, `amenityId`);
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='hoolitels';
SHOW TABLE STATUS FROM `hoolitels`;
SHOW FUNCTION STATUS WHERE `Db`='hoolitels';
SHOW PROCEDURE STATUS WHERE `Db`='hoolitels';
SHOW TRIGGERS FROM `hoolitels`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='hoolitels';
SELECT * FROM `information_schema`.`COLUMNS` WHERE TABLE_SCHEMA='hoolitels' AND TABLE_NAME='hotelamenity' ORDER BY ORDINAL_POSITION;
SHOW INDEXES FROM `hotelamenity` FROM `hoolitels`;
SELECT * FROM information_schema.REFERENTIAL_CONSTRAINTS WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='hotelamenity'   AND REFERENCED_TABLE_NAME IS NOT NULL;
SELECT * FROM information_schema.KEY_COLUMN_USAGE WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='hotelamenity'   AND REFERENCED_TABLE_NAME IS NOT NULL;
/* Öppnar session "localhost" */
SHOW CREATE TABLE `hoolitels`.`hotelamenity`;
SELECT 1 FROM `hotel` LIMIT 1;
SELECT * FROM `information_schema`.`COLUMNS` WHERE TABLE_SCHEMA='hoolitels' AND TABLE_NAME='hotel' ORDER BY ORDINAL_POSITION;
CREATE TABLE `room` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`Type` ENUM('single', 'double', 'triple', 'family') NOT NULL DEFAULT '0',
	`floor` INT NOT NULL DEFAULT 0,
	`number` INT UNSIGNED NOT NULL DEFAULT 0,
	`hotelId` INT NOT NULL DEFAULT 0,
	`price` INT NOT NULL DEFAULT 0,
	`maxOccupancy` INT NOT NULL DEFAULT 0,
	`costExtraBed` INT NOT NULL DEFAULT 0,
	`costHalfBoard` INT NOT NULL DEFAULT 0,
	`costFullBoard` INT NOT NULL DEFAULT 0,
	`costAllInclusive` INT NOT NULL DEFAULT 0,
	PRIMARY KEY (`Id`),
	UNIQUE INDEX `number` (`number`),
	CONSTRAINT `FK__hotel` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`Id`)
)
COLLATE='utf8mb4_general_ci'
;
/* SQL-fel (1067): Invalid default value for 'Type' */
CREATE TABLE `room` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`Type` ENUM("single", "double", "triple", "family") NOT NULL DEFAULT '0',
	`floor` INT NOT NULL DEFAULT 0,
	`number` INT UNSIGNED NOT NULL DEFAULT 0,
	`hotelId` INT NOT NULL DEFAULT 0,
	`price` INT NOT NULL DEFAULT 0,
	`maxOccupancy` INT NOT NULL DEFAULT 0,
	`costExtraBed` INT NOT NULL DEFAULT 0,
	`costHalfBoard` INT NOT NULL DEFAULT 0,
	`costFullBoard` INT NOT NULL DEFAULT 0,
	`costAllInclusive` INT NOT NULL DEFAULT 0,
	PRIMARY KEY (`Id`),
	UNIQUE INDEX `number` (`number`),
	CONSTRAINT `FK__hotel` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`Id`)
)
COLLATE='utf8mb4_general_ci'
;
/* SQL-fel (1067): Invalid default value for 'Type' */
CREATE TABLE `room` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`Type` ENUM('s','d','t','f') NOT NULL DEFAULT '0' COMMENT 'Single, Double, Triple, Family',
	`floor` INT NOT NULL DEFAULT 0,
	`number` INT UNSIGNED NOT NULL DEFAULT 0,
	`hotelId` INT NOT NULL DEFAULT 0,
	`price` INT NOT NULL DEFAULT 0,
	`maxOccupancy` INT NOT NULL DEFAULT 0,
	`costExtraBed` INT NOT NULL DEFAULT 0,
	`costHalfBoard` INT NOT NULL DEFAULT 0,
	`costFullBoard` INT NOT NULL DEFAULT 0,
	`costAllInclusive` INT NOT NULL DEFAULT 0,
	PRIMARY KEY (`Id`),
	UNIQUE INDEX `number` (`number`),
	CONSTRAINT `FK__hotel` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`Id`)
)
COLLATE='utf8mb4_general_ci'
;
/* SQL-fel (1067): Invalid default value for 'Type' */
CREATE TABLE `room` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`Type` ENUM('SINGLE','D','T','F') NOT NULL DEFAULT '0' COMMENT 'Single, Double, Triple, Family',
	`Kolumn 3` ENUM('Y','N') NOT NULL DEFAULT '0',
	`floor` INT NOT NULL DEFAULT 0,
	`number` INT UNSIGNED NOT NULL DEFAULT 0,
	`hotelId` INT NOT NULL DEFAULT 0,
	`price` INT NOT NULL DEFAULT 0,
	`maxOccupancy` INT NOT NULL DEFAULT 0,
	`costExtraBed` INT NOT NULL DEFAULT 0,
	`costHalfBoard` INT NOT NULL DEFAULT 0,
	`costFullBoard` INT NOT NULL DEFAULT 0,
	`costAllInclusive` INT NOT NULL DEFAULT 0,
	PRIMARY KEY (`Id`),
	UNIQUE INDEX `number` (`number`),
	CONSTRAINT `FK__hotel` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`Id`)
)
COLLATE='utf8mb4_general_ci'
;
/* SQL-fel (1067): Invalid default value for 'Type' */
CREATE TABLE `room` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`Type` ENUM('S','D','T','F') NOT NULL DEFAULT '0' COMMENT 'Single, Double, Triple, Family',
	`Kolumn 3` ENUM('Y','N') NOT NULL DEFAULT '0',
	`floor` INT NOT NULL DEFAULT 0,
	`number` INT UNSIGNED NOT NULL DEFAULT 0,
	`hotelId` INT NOT NULL DEFAULT 0,
	`price` INT NOT NULL DEFAULT 0,
	`maxOccupancy` INT NOT NULL DEFAULT 0,
	`costExtraBed` INT NOT NULL DEFAULT 0,
	`costHalfBoard` INT NOT NULL DEFAULT 0,
	`costFullBoard` INT NOT NULL DEFAULT 0,
	`costAllInclusive` INT NOT NULL DEFAULT 0,
	PRIMARY KEY (`Id`),
	UNIQUE INDEX `number` (`number`),
	CONSTRAINT `FK__hotel` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`Id`)
)
COLLATE='utf8mb4_general_ci'
;
/* SQL-fel (1067): Invalid default value for 'Type' */
CREATE TABLE `room` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`Type` ENUM('S','D','T','F') NOT NULL DEFAULT '0' COMMENT 'Single, Double, Triple, Family',
	`Kolumn 3` ENUM('Y','N') NOT NULL DEFAULT '0',
	`floor` INT NOT NULL DEFAULT 0,
	`number` INT UNSIGNED NOT NULL DEFAULT 0,
	`hotelId` INT NOT NULL DEFAULT 0,
	`price` INT NOT NULL DEFAULT 0,
	`maxOccupancy` INT NOT NULL DEFAULT 0,
	`costExtraBed` INT NOT NULL DEFAULT 0,
	`costHalfBoard` INT NOT NULL DEFAULT 0,
	`costFullBoard` INT NOT NULL DEFAULT 0,
	`costAllInclusive` INT NOT NULL DEFAULT 0,
	PRIMARY KEY (`Id`),
	UNIQUE INDEX `number` (`number`),
	CONSTRAINT `FK__hotel` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`Id`)
)
COLLATE='utf8mb4_general_ci'
;
/* SQL-fel (1067): Invalid default value for 'Type' */
CREATE TABLE `room` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`Type` ENUM('S','D','T','F') NOT NULL COMMENT 'Single, Double, Triple, Family',
	`Kolumn 3` ENUM('Y','N') NOT NULL DEFAULT '0',
	`floor` INT NOT NULL DEFAULT 0,
	`number` INT UNSIGNED NOT NULL DEFAULT 0,
	`hotelId` INT NOT NULL DEFAULT 0,
	`price` INT NOT NULL DEFAULT 0,
	`maxOccupancy` INT NOT NULL DEFAULT 0,
	`costExtraBed` INT NOT NULL DEFAULT 0,
	`costHalfBoard` INT NOT NULL DEFAULT 0,
	`costFullBoard` INT NOT NULL DEFAULT 0,
	`costAllInclusive` INT NOT NULL DEFAULT 0,
	PRIMARY KEY (`Id`),
	UNIQUE INDEX `number` (`number`),
	CONSTRAINT `FK__hotel` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`Id`)
)
COLLATE='utf8mb4_general_ci'
;
/* SQL-fel (1067): Invalid default value for 'Kolumn 3' */
CREATE TABLE `room` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`Type` ENUM('Single','D','T','F') NOT NULL COMMENT 'Single, Double, Triple, Family',
	`floor` INT NOT NULL DEFAULT 0,
	`number` INT UNSIGNED NOT NULL DEFAULT 0,
	`hotelId` INT NOT NULL DEFAULT 0,
	`price` INT NOT NULL DEFAULT 0,
	`maxOccupancy` INT NOT NULL DEFAULT 0,
	`costExtraBed` INT NOT NULL DEFAULT 0,
	`costHalfBoard` INT NOT NULL DEFAULT 0,
	`costFullBoard` INT NOT NULL DEFAULT 0,
	`costAllInclusive` INT NOT NULL DEFAULT 0,
	PRIMARY KEY (`Id`),
	UNIQUE INDEX `number` (`number`),
	CONSTRAINT `FK__hotel` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`Id`)
)
COLLATE='utf8mb4_general_ci'
;
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='hoolitels';
SHOW TABLE STATUS FROM `hoolitels`;
SHOW FUNCTION STATUS WHERE `Db`='hoolitels';
SHOW PROCEDURE STATUS WHERE `Db`='hoolitels';
SHOW TRIGGERS FROM `hoolitels`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='hoolitels';
SELECT * FROM `information_schema`.`COLUMNS` WHERE TABLE_SCHEMA='hoolitels' AND TABLE_NAME='room' ORDER BY ORDINAL_POSITION;
SHOW INDEXES FROM `room` FROM `hoolitels`;
SELECT * FROM information_schema.REFERENTIAL_CONSTRAINTS WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='room'   AND REFERENCED_TABLE_NAME IS NOT NULL;
SELECT * FROM information_schema.KEY_COLUMN_USAGE WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='room'   AND REFERENCED_TABLE_NAME IS NOT NULL;
/* Öppnar session "localhost" */
SHOW CREATE TABLE `hoolitels`.`room`;
ALTER TABLE `room`
	CHANGE COLUMN `Type` `Type` ENUM('Single','Double','Triple','Family') NOT NULL COLLATE 'utf8mb4_general_ci' AFTER `Id`;
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='hoolitels';
SHOW TABLE STATUS FROM `hoolitels`;
SHOW FUNCTION STATUS WHERE `Db`='hoolitels';
SHOW PROCEDURE STATUS WHERE `Db`='hoolitels';
SHOW TRIGGERS FROM `hoolitels`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='hoolitels';
SELECT * FROM `information_schema`.`COLUMNS` WHERE TABLE_SCHEMA='hoolitels' AND TABLE_NAME='room' ORDER BY ORDINAL_POSITION;
SHOW INDEXES FROM `room` FROM `hoolitels`;
SELECT * FROM information_schema.REFERENTIAL_CONSTRAINTS WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='room'   AND REFERENCED_TABLE_NAME IS NOT NULL;
SELECT * FROM information_schema.KEY_COLUMN_USAGE WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='room'   AND REFERENCED_TABLE_NAME IS NOT NULL;
/* Öppnar session "localhost" */
SHOW CREATE TABLE `hoolitels`.`room`;
SELECT 1 FROM `hotel` LIMIT 1;
SELECT * FROM `information_schema`.`COLUMNS` WHERE TABLE_SCHEMA='hoolitels' AND TABLE_NAME='hotel' ORDER BY ORDINAL_POSITION;
SELECT 1 FROM `room` LIMIT 1;
CREATE TABLE `image` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`url` VARCHAR(500) NOT NULL DEFAULT '0',
	`name` VARCHAR(50) NOT NULL DEFAULT '0',
	`desc` VARCHAR(500) NOT NULL DEFAULT '0',
	`hotelId` INT NULL DEFAULT 0,
	`roomId` INT NULL DEFAULT 0,
	PRIMARY KEY (`Id`),
	CONSTRAINT `FK__hotel` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`Id`),
	CONSTRAINT `FK__room` FOREIGN KEY (`roomId`) REFERENCES `room` (`Id`)
)
COLLATE='utf8mb4_general_ci'
;
/* SQL-fel (1005): Can't create table `hoolitels`.`image` (errno: 121 "Duplicate key on write or update") */
CREATE TABLE `image` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`url` VARCHAR(500) NOT NULL DEFAULT '0',
	`name` VARCHAR(50) NOT NULL DEFAULT '0',
	`desc` VARCHAR(500) NOT NULL DEFAULT '0',
	`hotelId` INT NOT NULL DEFAULT 0,
	`roomId` INT NOT NULL DEFAULT 0,
	PRIMARY KEY (`Id`),
	CONSTRAINT `FK__hotel` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`Id`),
	CONSTRAINT `FK__room` FOREIGN KEY (`roomId`) REFERENCES `room` (`Id`)
)
COLLATE='utf8mb4_general_ci'
;
/* SQL-fel (1005): Can't create table `hoolitels`.`image` (errno: 121 "Duplicate key on write or update") */
CREATE TABLE `image` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`url` VARCHAR(500) NOT NULL DEFAULT '0',
	`name` VARCHAR(50) NOT NULL DEFAULT '0',
	`desc` VARCHAR(500) NOT NULL DEFAULT '0',
	`hotelId` INT NOT NULL DEFAULT 0,
	`roomId` INT NOT NULL DEFAULT 0,
	PRIMARY KEY (`Id`),
	CONSTRAINT `FK__hotel` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`Id`),
	CONSTRAINT `FK__room` FOREIGN KEY (`roomId`) REFERENCES `room` (`Id`)
)
COLLATE='utf8mb4_general_ci'
;
/* SQL-fel (1005): Can't create table `hoolitels`.`image` (errno: 121 "Duplicate key on write or update") */
CREATE TABLE `image` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`url` VARCHAR(500) NOT NULL DEFAULT '0',
	`name` VARCHAR(50) NOT NULL DEFAULT '0',
	`desc` VARCHAR(500) NOT NULL DEFAULT '0',
	`hotelId` INT NOT NULL DEFAULT 0,
	`roomId` INT NOT NULL DEFAULT 0,
	PRIMARY KEY (`Id`),
	CONSTRAINT `FK__hotel` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`Id`)
)
COLLATE='utf8mb4_general_ci'
;
/* SQL-fel (1005): Can't create table `hoolitels`.`image` (errno: 121 "Duplicate key on write or update") */
CREATE TABLE `image` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`url` VARCHAR(500) NOT NULL DEFAULT '0',
	`name` VARCHAR(50) NOT NULL DEFAULT '0',
	`desc` VARCHAR(500) NOT NULL DEFAULT '0',
	`hotelId` INT NOT NULL DEFAULT 0,
	`roomId` INT NOT NULL DEFAULT 0,
	PRIMARY KEY (`Id`)
)
COLLATE='utf8mb4_general_ci'
;
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='hoolitels';
SHOW TABLE STATUS FROM `hoolitels`;
SHOW FUNCTION STATUS WHERE `Db`='hoolitels';
SHOW PROCEDURE STATUS WHERE `Db`='hoolitels';
SHOW TRIGGERS FROM `hoolitels`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='hoolitels';
SELECT * FROM `information_schema`.`COLUMNS` WHERE TABLE_SCHEMA='hoolitels' AND TABLE_NAME='image' ORDER BY ORDINAL_POSITION;
SHOW INDEXES FROM `image` FROM `hoolitels`;
SELECT * FROM information_schema.REFERENTIAL_CONSTRAINTS WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='image'   AND REFERENCED_TABLE_NAME IS NOT NULL;
SELECT * FROM information_schema.KEY_COLUMN_USAGE WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='image'   AND REFERENCED_TABLE_NAME IS NOT NULL;
/* Öppnar session "localhost" */
SHOW CREATE TABLE `hoolitels`.`image`;
SELECT 1 FROM `hotel` LIMIT 1;
SELECT * FROM `information_schema`.`COLUMNS` WHERE TABLE_SCHEMA='hoolitels' AND TABLE_NAME='hotel' ORDER BY ORDINAL_POSITION;
ALTER TABLE `image`
	CHANGE COLUMN `hotelId` `hotelId` INT(11) NULL DEFAULT '0' AFTER `desc`,
	ADD CONSTRAINT `FK_image_hotel` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`Id`);
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='hoolitels';
SHOW TABLE STATUS FROM `hoolitels`;
SHOW FUNCTION STATUS WHERE `Db`='hoolitels';
SHOW PROCEDURE STATUS WHERE `Db`='hoolitels';
SHOW TRIGGERS FROM `hoolitels`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='hoolitels';
SELECT * FROM `information_schema`.`COLUMNS` WHERE TABLE_SCHEMA='hoolitels' AND TABLE_NAME='image' ORDER BY ORDINAL_POSITION;
SHOW INDEXES FROM `image` FROM `hoolitels`;
SELECT * FROM information_schema.REFERENTIAL_CONSTRAINTS WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='image'   AND REFERENCED_TABLE_NAME IS NOT NULL;
SELECT * FROM information_schema.KEY_COLUMN_USAGE WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='image'   AND REFERENCED_TABLE_NAME IS NOT NULL;
/* Öppnar session "localhost" */
SHOW CREATE TABLE `hoolitels`.`image`;
SELECT 1 FROM `room` LIMIT 1;
SELECT * FROM `information_schema`.`COLUMNS` WHERE TABLE_SCHEMA='hoolitels' AND TABLE_NAME='room' ORDER BY ORDINAL_POSITION;
ALTER TABLE `image`
	ADD CONSTRAINT `FK_image_room` FOREIGN KEY (`roomId`) REFERENCES `room` (`Id`);
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='hoolitels';
SHOW TABLE STATUS FROM `hoolitels`;
SHOW FUNCTION STATUS WHERE `Db`='hoolitels';
SHOW PROCEDURE STATUS WHERE `Db`='hoolitels';
SHOW TRIGGERS FROM `hoolitels`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='hoolitels';
SELECT * FROM `information_schema`.`COLUMNS` WHERE TABLE_SCHEMA='hoolitels' AND TABLE_NAME='image' ORDER BY ORDINAL_POSITION;
SHOW INDEXES FROM `image` FROM `hoolitels`;
SELECT * FROM information_schema.REFERENTIAL_CONSTRAINTS WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='image'   AND REFERENCED_TABLE_NAME IS NOT NULL;
SELECT * FROM information_schema.KEY_COLUMN_USAGE WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='image'   AND REFERENCED_TABLE_NAME IS NOT NULL;
/* Öppnar session "localhost" */
SHOW CREATE TABLE `hoolitels`.`image`;
ALTER TABLE `image`
	CHANGE COLUMN `roomId` `roomId` INT(11) NULL DEFAULT '0' AFTER `hotelId`;
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='hoolitels';
SHOW TABLE STATUS FROM `hoolitels`;
SHOW FUNCTION STATUS WHERE `Db`='hoolitels';
SHOW PROCEDURE STATUS WHERE `Db`='hoolitels';
SHOW TRIGGERS FROM `hoolitels`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='hoolitels';
SELECT * FROM `information_schema`.`COLUMNS` WHERE TABLE_SCHEMA='hoolitels' AND TABLE_NAME='image' ORDER BY ORDINAL_POSITION;
SHOW INDEXES FROM `image` FROM `hoolitels`;
SELECT * FROM information_schema.REFERENTIAL_CONSTRAINTS WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='image'   AND REFERENCED_TABLE_NAME IS NOT NULL;
SELECT * FROM information_schema.KEY_COLUMN_USAGE WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='image'   AND REFERENCED_TABLE_NAME IS NOT NULL;
/* Öppnar session "localhost" */
SHOW CREATE TABLE `hoolitels`.`image`;
SELECT * FROM `information_schema`.`COLUMNS` WHERE TABLE_SCHEMA='hoolitels' AND TABLE_NAME='city' ORDER BY ORDINAL_POSITION;
SHOW INDEXES FROM `city` FROM `hoolitels`;
SELECT * FROM information_schema.REFERENTIAL_CONSTRAINTS WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='city'   AND REFERENCED_TABLE_NAME IS NOT NULL;
SELECT * FROM information_schema.KEY_COLUMN_USAGE WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='city'   AND REFERENCED_TABLE_NAME IS NOT NULL;
SHOW CREATE TABLE `hoolitels`.`city`;
SELECT 1 FROM `hoolitels`.`country`;
/* SQL-fel (1146): Table 'hoolitels.country' doesn't exist */
CREATE TABLE `hoolitels`.`country` (
	`Id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`Id`) USING BTREE,
	UNIQUE INDEX `name` (`name`) USING BTREE
)
 COLLATE 'utf8mb4_general_ci' ENGINE=InnoDB ROW_FORMAT=Dynamic AUTO_INCREMENT=6;
INSERT INTO `hoolitels`.`country` (`Id`, `name`) SELECT `Id`, `name` FROM `city`;
SHOW DATABASES;
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='hoolitels';
SHOW TABLE STATUS FROM `hoolitels`;
SHOW FUNCTION STATUS WHERE `Db`='hoolitels';
SHOW PROCEDURE STATUS WHERE `Db`='hoolitels';
SHOW TRIGGERS FROM `hoolitels`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='hoolitels';
SELECT * FROM `information_schema`.`COLUMNS` WHERE TABLE_SCHEMA='hoolitels' AND TABLE_NAME='city' ORDER BY ORDINAL_POSITION;
SHOW INDEXES FROM `city` FROM `hoolitels`;
SELECT * FROM information_schema.REFERENTIAL_CONSTRAINTS WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='city'   AND REFERENCED_TABLE_NAME IS NOT NULL;
SELECT * FROM information_schema.KEY_COLUMN_USAGE WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='city'   AND REFERENCED_TABLE_NAME IS NOT NULL;
/* Öppnar session "localhost" */
SELECT * FROM `information_schema`.`COLUMNS` WHERE TABLE_SCHEMA='hoolitels' AND TABLE_NAME='country' ORDER BY ORDINAL_POSITION;
SHOW INDEXES FROM `country` FROM `hoolitels`;
SELECT * FROM information_schema.REFERENTIAL_CONSTRAINTS WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='country'   AND REFERENCED_TABLE_NAME IS NOT NULL;
SELECT * FROM information_schema.KEY_COLUMN_USAGE WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='country'   AND REFERENCED_TABLE_NAME IS NOT NULL;
SHOW CREATE TABLE `hoolitels`.`country`;
SHOW CREATE TABLE `hoolitels`.`city`;
SHOW CREATE TABLE `hoolitels`.`country`;
SHOW CREATE TABLE `hoolitels`.`city`;
SHOW CREATE TABLE `hoolitels`.`country`;
SELECT 1 FROM `country` LIMIT 1;
CREATE TABLE `user` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(100) NOT NULL DEFAULT '0',
	`email` VARCHAR(50) NOT NULL DEFAULT '0',
	`address` VARCHAR(50) NOT NULL DEFAULT '0',
	`zip` VARCHAR(10) NOT NULL DEFAULT '0',
	`city` VARCHAR(50) NOT NULL DEFAULT '0',
	`phone` VARCHAR(20) NOT NULL DEFAULT '0',
	`password` VARCHAR(50) NOT NULL DEFAULT '0',
	`countryId` INT NOT NULL DEFAULT 0,
	PRIMARY KEY (`Id`),
	CONSTRAINT `FK__country` FOREIGN KEY (`countryId`) REFERENCES `country` (`Id`)
)
COLLATE='utf8mb4_general_ci'
;
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='hoolitels';
SHOW TABLE STATUS FROM `hoolitels`;
SHOW FUNCTION STATUS WHERE `Db`='hoolitels';
SHOW PROCEDURE STATUS WHERE `Db`='hoolitels';
SHOW TRIGGERS FROM `hoolitels`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='hoolitels';
SELECT * FROM `information_schema`.`COLUMNS` WHERE TABLE_SCHEMA='hoolitels' AND TABLE_NAME='user' ORDER BY ORDINAL_POSITION;
SHOW INDEXES FROM `user` FROM `hoolitels`;
SELECT * FROM information_schema.REFERENTIAL_CONSTRAINTS WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='user'   AND REFERENCED_TABLE_NAME IS NOT NULL;
SELECT * FROM information_schema.KEY_COLUMN_USAGE WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='user'   AND REFERENCED_TABLE_NAME IS NOT NULL;
/* Öppnar session "localhost" */
SHOW CREATE TABLE `hoolitels`.`user`;
ALTER TABLE `user`
	ADD UNIQUE INDEX `email` (`email`),
	ADD UNIQUE INDEX `phone` (`phone`);
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='hoolitels';
SHOW TABLE STATUS FROM `hoolitels`;
SHOW FUNCTION STATUS WHERE `Db`='hoolitels';
SHOW PROCEDURE STATUS WHERE `Db`='hoolitels';
SHOW TRIGGERS FROM `hoolitels`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='hoolitels';
SELECT * FROM `information_schema`.`COLUMNS` WHERE TABLE_SCHEMA='hoolitels' AND TABLE_NAME='user' ORDER BY ORDINAL_POSITION;
SHOW INDEXES FROM `user` FROM `hoolitels`;
SELECT * FROM information_schema.REFERENTIAL_CONSTRAINTS WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='user'   AND REFERENCED_TABLE_NAME IS NOT NULL;
SELECT * FROM information_schema.KEY_COLUMN_USAGE WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='user'   AND REFERENCED_TABLE_NAME IS NOT NULL;
/* Öppnar session "localhost" */
SHOW CREATE TABLE `hoolitels`.`user`;
CREATE TABLE `booking` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`userId` INT NOT NULL DEFAULT '0',
	`numAdults` INT NOT NULL DEFAULT '0',
	`numChildren` INT NOT NULL DEFAULT '0',
	`numInfants` INT NOT NULL DEFAULT '0',
	`startDate` DATE NOT NULL DEFAULT '0',
	`endDate` DATE NOT NULL DEFAULT '0',
	`Comment` VARCHAR(500) NULL DEFAULT '0',
	`Paid` BIT NOT NULL DEFAULT '0',
	PRIMARY KEY (`Id`)
)
COLLATE='utf8mb4_general_ci'
;
/* SQL-fel (1067): Invalid default value for 'startDate' */
CREATE TABLE `booking` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`userId` INT NOT NULL DEFAULT '0',
	`numAdults` INT NOT NULL DEFAULT '0',
	`numChildren` INT NOT NULL DEFAULT '0',
	`numInfants` INT NOT NULL DEFAULT '0',
	`startDate` DATE NOT NULL,
	`endDate` DATE NOT NULL,
	`Comment` VARCHAR(500) NULL DEFAULT '0',
	`Paid` BIT NOT NULL DEFAULT '0',
	PRIMARY KEY (`Id`)
)
COLLATE='utf8mb4_general_ci'
;
/* SQL-fel (1067): Invalid default value for 'Paid' */
CREATE TABLE `booking` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`userId` INT NOT NULL DEFAULT '0',
	`numAdults` INT NOT NULL DEFAULT '0',
	`numChildren` INT NOT NULL DEFAULT '0',
	`numInfants` INT NOT NULL DEFAULT '0',
	`startDate` DATE NOT NULL,
	`endDate` DATE NOT NULL,
	`Comment` VARCHAR(500) NULL DEFAULT '0',
	`Paid` BIT NOT NULL,
	PRIMARY KEY (`Id`)
)
COLLATE='utf8mb4_general_ci'
;
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='hoolitels';
SHOW TABLE STATUS FROM `hoolitels`;
SHOW FUNCTION STATUS WHERE `Db`='hoolitels';
SHOW PROCEDURE STATUS WHERE `Db`='hoolitels';
SHOW TRIGGERS FROM `hoolitels`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='hoolitels';
SELECT * FROM `information_schema`.`COLUMNS` WHERE TABLE_SCHEMA='hoolitels' AND TABLE_NAME='booking' ORDER BY ORDINAL_POSITION;
SHOW INDEXES FROM `booking` FROM `hoolitels`;
SELECT * FROM information_schema.REFERENTIAL_CONSTRAINTS WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='booking'   AND REFERENCED_TABLE_NAME IS NOT NULL;
SELECT * FROM information_schema.KEY_COLUMN_USAGE WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='booking'   AND REFERENCED_TABLE_NAME IS NOT NULL;
/* Öppnar session "localhost" */
SHOW CREATE TABLE `hoolitels`.`booking`;
SELECT 1 FROM `user` LIMIT 1;
SELECT * FROM `information_schema`.`COLUMNS` WHERE TABLE_SCHEMA='hoolitels' AND TABLE_NAME='user' ORDER BY ORDINAL_POSITION;
ALTER TABLE `booking`
	ADD CONSTRAINT `FK_booking_user` FOREIGN KEY (`userId`) REFERENCES `user` (`Id`);
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='hoolitels';
SHOW TABLE STATUS FROM `hoolitels`;
SHOW FUNCTION STATUS WHERE `Db`='hoolitels';
SHOW PROCEDURE STATUS WHERE `Db`='hoolitels';
SHOW TRIGGERS FROM `hoolitels`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='hoolitels';
SELECT * FROM `information_schema`.`COLUMNS` WHERE TABLE_SCHEMA='hoolitels' AND TABLE_NAME='booking' ORDER BY ORDINAL_POSITION;
SHOW INDEXES FROM `booking` FROM `hoolitels`;
SELECT * FROM information_schema.REFERENTIAL_CONSTRAINTS WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='booking'   AND REFERENCED_TABLE_NAME IS NOT NULL;
SELECT * FROM information_schema.KEY_COLUMN_USAGE WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='booking'   AND REFERENCED_TABLE_NAME IS NOT NULL;
/* Öppnar session "localhost" */
SHOW CREATE TABLE `hoolitels`.`booking`;
SELECT 1 FROM `booking` LIMIT 1;
SELECT 1 FROM `room` LIMIT 1;
SELECT * FROM `information_schema`.`COLUMNS` WHERE TABLE_SCHEMA='hoolitels' AND TABLE_NAME='room' ORDER BY ORDINAL_POSITION;
CREATE TABLE `roomBooking` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`bookingId` INT NOT NULL DEFAULT '0',
	`roomId` INT NOT NULL DEFAULT '0',
	`extraBed` BIT NULL DEFAULT 0,
	`foodCost` INT NULL DEFAULT 0,
	PRIMARY KEY (`Id`),
	CONSTRAINT `FK__booking` FOREIGN KEY (`bookingId`) REFERENCES `booking` (`Id`),
	CONSTRAINT `FK__room` FOREIGN KEY (`roomId`) REFERENCES `room` (`Id`)
)
COLLATE='utf8mb4_general_ci'
;
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='hoolitels';
SHOW TABLE STATUS FROM `hoolitels`;
SHOW FUNCTION STATUS WHERE `Db`='hoolitels';
SHOW PROCEDURE STATUS WHERE `Db`='hoolitels';
SHOW TRIGGERS FROM `hoolitels`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='hoolitels';
/* Tabellnod "roomBooking" hittades inte i trädet. */
/* Öppnar session "localhost" */
SELECT CURRENT_USER();
SHOW CHARSET;
SELECT 'hoolitels' AS `Database`, 'amenity' AS `Table`, 4 AS `Rows`, 0 AS `Duration`;
/*!40101 SET @OLD_LOCAL_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
SELECT 'hoolitels' AS `Database`, 'booking' AS `Table`, 0 AS `Rows`, 0 AS `Duration`;
SELECT 'hoolitels' AS `Database`, 'city' AS `Table`, 5 AS `Rows`, 0 AS `Duration`;
SELECT 'hoolitels' AS `Database`, 'country' AS `Table`, 5 AS `Rows`, 0 AS `Duration`;
SELECT 'hoolitels' AS `Database`, 'hotel' AS `Table`, 0 AS `Rows`, 0 AS `Duration`;
SELECT 'hoolitels' AS `Database`, 'hotelamenity' AS `Table`, 0 AS `Rows`, 0 AS `Duration`;
SELECT 'hoolitels' AS `Database`, 'image' AS `Table`, 0 AS `Rows`, 0 AS `Duration`;
SELECT 'hoolitels' AS `Database`, 'room' AS `Table`, 0 AS `Rows`, 0 AS `Duration`;
SELECT 'hoolitels' AS `Database`, 'roombooking' AS `Table`, 0 AS `Rows`, 0 AS `Duration`;
SELECT 'hoolitels' AS `Database`, 'user' AS `Table`, 0 AS `Rows`, 0 AS `Duration`;
/*!40101 SET SQL_MODE=IFNULL(@OLD_LOCAL_SQL_MODE, '') */;
SELECT 'hoolitels' AS `Database`, 'amenity' AS `Table`, 4 AS `Rows`, 0 AS `Duration`;
/*!40101 SET @OLD_LOCAL_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
SHOW CREATE TABLE `hoolitels`.`amenity`;
SELECT * FROM `hoolitels`.`amenity` LIMIT 25600;
SELECT * FROM `information_schema`.`COLUMNS` WHERE TABLE_SCHEMA='hoolitels' AND TABLE_NAME='amenity' ORDER BY ORDINAL_POSITION;
SHOW INDEXES FROM `amenity` FROM `hoolitels`;
SELECT * FROM information_schema.REFERENTIAL_CONSTRAINTS WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='amenity'   AND REFERENCED_TABLE_NAME IS NOT NULL;
SELECT * FROM information_schema.KEY_COLUMN_USAGE WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='amenity'   AND REFERENCED_TABLE_NAME IS NOT NULL;
SELECT 'hoolitels' AS `Database`, 'booking' AS `Table`, 0 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `hoolitels`.`booking`;
SELECT * FROM `hoolitels`.`booking` LIMIT 104857600;
SELECT 'hoolitels' AS `Database`, 'city' AS `Table`, 5 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `hoolitels`.`city`;
SELECT * FROM `hoolitels`.`city` LIMIT 32008;
SELECT * FROM `information_schema`.`COLUMNS` WHERE TABLE_SCHEMA='hoolitels' AND TABLE_NAME='city' ORDER BY ORDINAL_POSITION;
SHOW INDEXES FROM `city` FROM `hoolitels`;
SELECT * FROM information_schema.REFERENTIAL_CONSTRAINTS WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='city'   AND REFERENCED_TABLE_NAME IS NOT NULL;
SELECT * FROM information_schema.KEY_COLUMN_USAGE WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='city'   AND REFERENCED_TABLE_NAME IS NOT NULL;
SELECT 'hoolitels' AS `Database`, 'country' AS `Table`, 5 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `hoolitels`.`country`;
SELECT * FROM `hoolitels`.`country` LIMIT 32008;
SELECT * FROM `information_schema`.`COLUMNS` WHERE TABLE_SCHEMA='hoolitels' AND TABLE_NAME='country' ORDER BY ORDINAL_POSITION;
SHOW INDEXES FROM `country` FROM `hoolitels`;
SELECT * FROM information_schema.REFERENTIAL_CONSTRAINTS WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='country'   AND REFERENCED_TABLE_NAME IS NOT NULL;
SELECT * FROM information_schema.KEY_COLUMN_USAGE WHERE   CONSTRAINT_SCHEMA='hoolitels'   AND TABLE_NAME='country'   AND REFERENCED_TABLE_NAME IS NOT NULL;
SELECT 'hoolitels' AS `Database`, 'hotel' AS `Table`, 0 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `hoolitels`.`hotel`;
SELECT * FROM `hoolitels`.`hotel` LIMIT 104857600;
SELECT 'hoolitels' AS `Database`, 'hotelamenity' AS `Table`, 0 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `hoolitels`.`hotelamenity`;
SELECT * FROM `hoolitels`.`hotelamenity` LIMIT 104857600;
SELECT 'hoolitels' AS `Database`, 'image' AS `Table`, 0 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `hoolitels`.`image`;
SELECT * FROM `hoolitels`.`image` LIMIT 104857600;
SELECT 'hoolitels' AS `Database`, 'room' AS `Table`, 0 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `hoolitels`.`room`;
SELECT * FROM `hoolitels`.`room` LIMIT 104857600;
SELECT 'hoolitels' AS `Database`, 'roombooking' AS `Table`, 0 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `hoolitels`.`roombooking`;
SELECT * FROM `hoolitels`.`roombooking` LIMIT 104857600;
SELECT 'hoolitels' AS `Database`, 'user' AS `Table`, 0 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `hoolitels`.`user`;
SELECT * FROM `hoolitels`.`user` LIMIT 104857600;
/*!40101 SET SQL_MODE=IFNULL(@OLD_LOCAL_SQL_MODE, '') */;