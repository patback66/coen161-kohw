SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


DROP TABLE IF EXISTS `Activity`;
CREATE TABLE IF NOT EXISTS `Activity` (
  `ActivityID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  `Description` text NOT NULL,
  `Season` varchar(20) NOT NULL,
  PRIMARY KEY (`ActivityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `bans`;
CREATE TABLE IF NOT EXISTS `bans` (
  `id` mediumint(7) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(39) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(20) NOT NULL,
  `expire` int(20) NOT NULL,
  `reason` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `b_posts`;
CREATE TABLE IF NOT EXISTS `b_posts` (
  `id` mediumint(7) unsigned NOT NULL AUTO_INCREMENT,
  `parent` mediumint(7) unsigned NOT NULL,
  `timestamp` int(20) NOT NULL,
  `bumped` int(20) NOT NULL,
  `ip` varchar(39) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(75) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tripcode` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(75) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `nameblock` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(75) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `file` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `file_hex` varchar(75) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `file_original` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `file_size` int(20) unsigned NOT NULL DEFAULT '0',
  `file_size_formatted` varchar(75) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image_width` smallint(5) unsigned NOT NULL DEFAULT '0',
  `image_height` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `thumb_width` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb_height` smallint(5) unsigned NOT NULL DEFAULT '0',
  `stickied` tinyint(1) NOT NULL DEFAULT '0',
  `moderated` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  KEY `bumped` (`bumped`),
  KEY `stickied` (`stickied`),
  KEY `moderated` (`moderated`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

DROP TABLE IF EXISTS `Camp`;
CREATE TABLE IF NOT EXISTS `Camp` (
  `campId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `location` varchar(30) NOT NULL,
  `capacity` int(11) NOT NULL,
  `currentKids` int(11) NOT NULL,
  `season` varchar(10) NOT NULL,
  PRIMARY KEY (`campId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `catalog`;
CREATE TABLE IF NOT EXISTS `catalog` (
  `itemID` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `sold` int(11) NOT NULL DEFAULT '0',
  `description` varchar(256) NOT NULL,
  `category` int(11) NOT NULL,
  `picture` int(11) NOT NULL,
  `price` float NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

DROP TABLE IF EXISTS `forum_answer`;
CREATE TABLE IF NOT EXISTS `forum_answer` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_id` int(11) NOT NULL,
  `a_name` varchar(64) NOT NULL DEFAULT '''''',
  `a_email` varchar(64) NOT NULL DEFAULT '''''',
  `a_answer` longtext NOT NULL,
  `a_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

DROP TABLE IF EXISTS `forum_question`;
CREATE TABLE IF NOT EXISTS `forum_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(255) NOT NULL DEFAULT '''''',
  `detail` longtext NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '''''',
  `email` varchar(64) NOT NULL DEFAULT '''''',
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `view` int(11) NOT NULL DEFAULT '0',
  `reply` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

DROP TABLE IF EXISTS `Kids`;
CREATE TABLE IF NOT EXISTS `Kids` (
  `childID` char(4) NOT NULL,
  `ParentID` char(4) DEFAULT NULL,
  `LastName` char(20) DEFAULT NULL,
  `FirstName` char(20) DEFAULT NULL,
  `Grade` int(11) DEFAULT NULL,
  `School` varchar(30) DEFAULT NULL,
  `Allergies` varchar(10) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `CampLength` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`childID`),
  KEY `Kids_fkey` (`ParentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `transactionID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` char(4) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `Street` varchar(20) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Zip` int(11) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Phone` int(11) NOT NULL,
  `OrderItemID` int(11) NOT NULL,
  `ItemName` varchar(20) NOT NULL,
  `ItemQuantity` int(11) NOT NULL,
  `ItemPrice` float NOT NULL,
  PRIMARY KEY (`transactionID`),
  KEY `userID` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `Persons`;
CREATE TABLE IF NOT EXISTS `Persons` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LastName` varchar(255) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `RegisteredUser`;
CREATE TABLE IF NOT EXISTS `RegisteredUser` (
  `userID` char(4) NOT NULL,
  `LastName` char(20) DEFAULT NULL,
  `FirstName` char(20) DEFAULT NULL,
  `Street` varchar(20) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `Zip` int(11) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Phone` int(11) DEFAULT NULL,
  `Kids` int(11) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Registration`;
CREATE TABLE IF NOT EXISTS `Registration` (
  `RegID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` char(4) NOT NULL,
  `campID` char(4) NOT NULL,
  `CampLength` int(11) NOT NULL,
  `Season` varchar(20) NOT NULL,
  `ActivityID` char(4) NOT NULL,
  PRIMARY KEY (`RegID`),
  KEY `UserID` (`UserID`,`campID`,`CampLength`,`Season`,`ActivityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `StoreItem`;
CREATE TABLE IF NOT EXISTS `StoreItem` (
  `itemID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(24) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sold` int(11) NOT NULL,
  `image` varchar(30) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


ALTER TABLE `Kids`
  ADD CONSTRAINT `Kids_fkey` FOREIGN KEY (`ParentID`) REFERENCES `RegisteredUser` (`userID`);

ALTER TABLE `Registration`
  ADD CONSTRAINT `Registration_fkey1` FOREIGN KEY (`UserID`) REFERENCES `RegisteredUser` (`userID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
