-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 13, 2017 at 08:06 PM
-- Server version: 5.5.38-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `KOHW`
--

-- --------------------------------------------------------

--
-- Table structure for table `Activity`
--

CREATE TABLE IF NOT EXISTS `Activity` (
  `ActivityID` varchar(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Description` text NOT NULL,
  `Season` varchar(20) NOT NULL,
  PRIMARY KEY (`ActivityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Activity`
--

INSERT INTO `Activity` (`ActivityID`, `Name`, `Description`, `Season`) VALUES
('A0001', 'Painting', 'Art&Hobbies', ''),
('A0002', 'Digital transformation', 'Art&Hobbies', ''),
('A0003', 'Comedy and Drama', 'Art&Hobbies', ''),
('A0004', 'Digital transformation', 'Art&Hobbies', ''),
('A0005', 'Cooking', 'Art&Hobbies', ''),
('R0001', 'Structure building', 'Robotic', ''),
('R0002', 'Programming', 'Robotic', ''),
('R0003', 'Sensors', 'Robotic', ''),
('R0004', 'Robot race', 'Robotic', ''),
('R0005', 'Robot challenges', 'Robotic', ''),
('S0001', 'Basketball', 'Sport', ''),
('S0002', 'Kayack', 'Sport', ''),
('S0003', 'Snowboard', 'Sport', ''),
('S0004', 'SKI', 'Sport', ''),
('S0005', 'Hiking', 'Sport', ''),
('S0006', 'Baby gun', 'Sport', ''),
('S0007', 'Dodgeball', 'Sport', ''),
('S0008', 'Sailing', 'Sport', ''),
('S0009', 'Soccer', 'Sport', ''),
('S0010', 'Tennis', 'Sport', '');

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

CREATE TABLE IF NOT EXISTS `bans` (
  `id` mediumint(7) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(39) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(20) NOT NULL,
  `expire` int(20) NOT NULL,
  `reason` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `b_posts`
--

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

--
-- Dumping data for table `b_posts`
--

INSERT INTO `b_posts` (`id`, `parent`, `timestamp`, `bumped`, `ip`, `name`, `tripcode`, `email`, `nameblock`, `subject`, `message`, `password`, `file`, `file_hex`, `file_original`, `file_size`, `file_size_formatted`, `image_width`, `image_height`, `thumb`, `thumb_width`, `thumb_height`, `stickied`, `moderated`) VALUES
(1, 0, 1488914681, 1488914793, '10.2.0.6', 'Matt', '', '', '<span class="postername">Matt</span> 17/03/07(Tue)14:24:40', '', '<br>', '', '<iframe width="480" height="270" src="//www.youtube.com/embed/6WaoTEAMTdI?feature=oembed" frameborder="0" allowfullscreen></iframe>', 'YouTube', '『ジョジョの奇妙な冒険　ダイヤモンドは砕けない　第一章』特報映像', 0, '', 480, 360, '1488914681463.jpg', 250, 188, 0, 1),
(2, 1, 1488914793, 1488914793, '10.2.0.6', '', '', '', '<span class="postername">Anonymous</span> 17/03/07(Tue)14:26:33', '', 'that''s awesome!<br>', '', '', '', '', 0, '', 0, 0, '', 0, 0, 0, 1),
(3, 0, 1488925958, 1488928615, '10.2.0.6', 'HappyCamper', '', '', '<span class="postername">HappyCamper</span> 17/03/07(Tue)17:32:37', '&lt;3 KOWH', '<br>', '', '<iframe width="480" height="270" src="//www.youtube.com/embed/4E11eIBvWxw?feature=oembed" frameborder="0" allowfullscreen></iframe>', 'YouTube', 'Saved by the Spirit Bomb', 0, '', 480, 360, '1488925958429.jpg', 250, 188, 0, 1),
(4, 3, 1488925981, 1488925981, '10.2.0.6', '', '', '', '<span class="postername">Anonymous</span> 17/03/07(Tue)17:33:01', '', 'I had a great time too!<br>', '', '', '', '', 0, '', 0, 0, '', 0, 0, 0, 1),
(5, 0, 1488928550, 1488930843, '10.2.0.6', '', '', '', '<span class="postername">Anonymous</span> 17/03/07(Tue)18:15:50', 'Memories', 'Share your feedback and memories here!<br>', '', '', '', '', 0, '', 0, 0, '', 0, 0, 1, 1),
(7, 5, 1488930808, 1488930808, '10.2.0.6', '', '', '', '<span class="postername">Anonymous</span> 17/03/07(Tue)18:53:28', '', 'Definitely the best summer activity!<br>', '', '', '', '', 0, '', 0, 0, '', 0, 0, 0, 1),
(8, 5, 1488930843, 1488930843, '10.2.0.6', '', '', '', '<span class="postername">Anonymous</span> 17/03/07(Tue)18:54:03', '', 'Every counselor was super helpful<br>', '', '', '', '', 0, '', 0, 0, '', 0, 0, 0, 1),
(9, 0, 1489005293, 1489005293, '10.2.0.6', 'Jim Olwell', '', 'jolwell@scu.edu', '<a href="mailto:jolwell@scu.edu"><span class="postername">Jim Olwell</span></a> 17/03/08(Wed)15:34:53', 'Test Review', 'I am testing that people can post on the group forum.  Here''s hoping that this works.<br>', '', '', '', '', 0, '', 0, 0, '', 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Camp`
--

CREATE TABLE IF NOT EXISTS `Camp` (
  `campId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `location` varchar(128) NOT NULL,
  `capacity` int(11) NOT NULL,
  `currentKids` int(11) NOT NULL,
  `season` varchar(10) NOT NULL,
  PRIMARY KEY (`campId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `Camp`
--

INSERT INTO `Camp` (`campId`, `name`, `location`, `capacity`, `currentKids`, `season`) VALUES
(1, 'Apaches', 'Maker 12, Phoenix road, Lberty, AZ', 35, 5, 'S'),
(2, 'Eureka', 'Avenue of the giants road, 11548, Eureka, California', 1378, 87, 'S'),
(3, 'Apaches', 'Maker 12, Phoenix road, Lberty, AZ', 35, 5, 'S'),
(4, 'Eureka', 'Avenue of the giants road, 11548, Eureka, California', 55, 4, 'S'),
(5, 'Santa Clara', 'University Circle 5/ Santa Clara, California', 80, 24, 'S'),
(6, 'Tahoe South', 'Squaw park, 45, Tahoe, California', 105, 27, 'WS'),
(7, 'Boulder', 'Sierra pine ranch, 86 North, Boulder, CO, Colorado', 80, 21, 'WS'),
(8, 'Chesapeake', 'Grant avenue, 115, Dover, Delaware', 45, 15, 'S'),
(9, 'Grapefruit ressort', 'Beach road, 450, Orlando, Florida', 50, 9, 'WS'),
(10, 'Grapefruit ressort 2', 'Beach road,950, Orlando, Florida', 100, 37, 'WS'),
(11, 'Little derby', 'Bourbon corridor, 3rd, Louisville, Kentucky', 58, 42, 'S'),
(12, 'Sweet Bayou', 'Mount crawfish street, 45, Baton Rouge, Louisiana', 35, 20, 'WS'),
(13, 'Nestor camp', 'Lincoln Avenue, 124, Cambridge, Massachusetts', 52, 10, 'S'),
(14, 'Lewis and Clark', 'M50, Eugene Road, Portland, Oregon', 60, 22, 'S'),
(15, 'Robotics village', 'VEX Valley, Tech park 15, Austin, Texas', 82, 77, 'S'),
(16, 'Salt Camp', 'NACL lake, M 575, Salt Camp', 75, 33, 'WS'),
(17, 'Federal Camp', 'Georges avenue, 14555, Herdon, Federal Camp', 90, 27, 'S');

-- --------------------------------------------------------

--
-- Table structure for table `catalog`
--

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

--
-- Dumping data for table `catalog`
--

INSERT INTO `catalog` (`itemID`, `quantity`, `sold`, `description`, `category`, `picture`, `price`, `name`) VALUES
(1, 10, 0, 'Standard #2 Pencil', 0, 0, 1.99, '#2 Pencil');

-- --------------------------------------------------------

--
-- Table structure for table `forum_answer`
--

CREATE TABLE IF NOT EXISTS `forum_answer` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_id` int(11) NOT NULL,
  `a_name` varchar(64) NOT NULL DEFAULT '''''',
  `a_email` varchar(64) NOT NULL DEFAULT '''''',
  `a_answer` longtext NOT NULL,
  `a_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `forum_answer`
--

INSERT INTO `forum_answer` (`question_id`, `a_id`, `a_name`, `a_email`, `a_answer`, `a_datetime`) VALUES
(1, 1, 'Matt', 'maskoken@gmail.com', 'I think so too!', '2006-03-18 00:26:15'),
(2, 1, 'Matt', 'maskoken@gmail.com', 'I think so too!', '2006-03-18 00:26:32');

-- --------------------------------------------------------

--
-- Table structure for table `forum_question`
--

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

--
-- Dumping data for table `forum_question`
--

INSERT INTO `forum_question` (`id`, `topic`, `detail`, `name`, `email`, `datetime`, `view`, `reply`) VALUES
(1, 'Test', 'testtest', 'Matt', 'maskoken@gmail.com', '2006-03-17 11:42:29', 5, 0),
(2, 'This camp is great!', 'I love KOHW EduCamps!', 'Anonymous', 'anon@mous.com', '2006-03-17 11:45:01', 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Kids`
--

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

--
-- Dumping data for table `Kids`
--

INSERT INTO `Kids` (`childID`, `ParentID`, `LastName`, `FirstName`, `Grade`, `School`, `Allergies`, `Age`, `CampLength`) VALUES
('0', '0', 'Koken', 'Matt', 6, 'SCU', 'N', 22, '3');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `Persons`
--

CREATE TABLE IF NOT EXISTS `Persons` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LastName` varchar(255) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `RegisteredUser`
--

CREATE TABLE IF NOT EXISTS `RegisteredUser` (
  `userID` char(4) NOT NULL,
  `LastName` char(20) DEFAULT NULL,
  `FirstName` char(20) DEFAULT NULL,
  `Street` varchar(20) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `Zip` int(11) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Phone` varchar(12) DEFAULT NULL,
  `Kids` int(11) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `RegisteredUser`
--

INSERT INTO `RegisteredUser` (`userID`, `LastName`, `FirstName`, `Street`, `City`, `Zip`, `Email`, `Phone`, `Kids`) VALUES
('0', 'Koken', 'Matthew', '1632 Benton CT', 'Sunnyvale', 94087, 'maskoken@gmail.com', '4084833696', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Registration`
--

CREATE TABLE IF NOT EXISTS `Registration` (
  `RegID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` char(4) NOT NULL,
  `campID` char(4) NOT NULL,
  `CampLength` int(11) NOT NULL,
  `Season` varchar(20) NOT NULL,
  `ActivityID` varchar(11) NOT NULL,
  PRIMARY KEY (`RegID`),
  KEY `UserID` (`UserID`,`campID`,`CampLength`,`Season`,`ActivityID`),
  KEY `fkey_activityID` (`ActivityID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Registration`
--

INSERT INTO `Registration` (`RegID`, `UserID`, `campID`, `CampLength`, `Season`, `ActivityID`) VALUES
(1, '0', '1', 3, 'S', 'R0005');

-- --------------------------------------------------------

--
-- Table structure for table `StoreItem`
--

CREATE TABLE IF NOT EXISTS `StoreItem` (
  `itemID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(24) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sold` int(11) NOT NULL,
  `image` varchar(30) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Kids`
--
ALTER TABLE `Kids`
  ADD CONSTRAINT `Kids_fkey` FOREIGN KEY (`ParentID`) REFERENCES `RegisteredUser` (`userID`);

--
-- Constraints for table `Registration`
--
ALTER TABLE `Registration`
  ADD CONSTRAINT `Registration_fkey1` FOREIGN KEY (`UserID`) REFERENCES `RegisteredUser` (`userID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
