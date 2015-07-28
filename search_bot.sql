-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 28, 2015 at 04:57 PM
-- Server version: 5.5.41-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `search_bot`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE IF NOT EXISTS `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `answer`, `createdAt`, `updatedAt`) VALUES
(1, 'Do you want a snack?', '2015-07-28 00:00:00', '2015-07-28 00:00:00'),
(2, 'Do you want something light or heavy?', '2015-07-28 00:00:00', '2015-07-28 00:00:00'),
(3, 'Do you want something fancy or casual?', '2015-07-28 00:00:00', '2015-07-28 00:00:00'),
(4, 'Do you want something higher or lower cost ?', '2015-07-28 00:00:00', '2015-07-28 00:00:00'),
(5, 'Do you want something healthy?', '2015-07-28 00:00:00', '2015-07-28 00:00:00'),
(6, 'Do you like pasta?', '2015-07-28 00:00:00', '2015-07-28 00:00:00'),
(7, 'Do you like steak?', '2015-07-28 00:00:00', '2015-07-28 00:00:00'),
(8, 'Do you like noodles?', '2015-07-28 00:00:00', '2015-07-28 00:00:00'),
(9, 'Do you want to have a look at our daily recommendations?', '2015-07-28 00:00:00', '2015-07-28 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

CREATE TABLE IF NOT EXISTS `keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `keywords`
--

INSERT INTO `keywords` (`id`, `keyword`, `createdAt`, `updatedAt`) VALUES
(1, 'hungry', '2015-07-28 00:00:00', '2015-07-28 00:00:00'),
(2, 'want', '2015-07-28 00:00:00', '2015-07-28 00:00:00'),
(3, 'eat', '2015-07-28 00:00:00', '2015-07-28 00:00:00'),
(4, 'what', '2015-07-28 00:00:00', '2015-07-28 00:00:00'),
(5, 'where', '2015-07-28 00:00:00', '2015-07-28 00:00:00'),
(6, 'bring', '2015-07-28 00:00:00', '2015-07-28 00:00:00'),
(7, 'date', '2015-07-28 00:00:00', '2015-07-28 00:00:00'),
(8, 'try', '2015-07-28 00:00:00', '2015-07-28 00:00:00'),
(9, 'new', '2015-07-28 00:00:00', '2015-07-28 00:00:00'),
(10, 'dishes', '2015-07-28 00:00:00', '2015-07-28 00:00:00'),
(11, 'starving', '2015-07-28 00:00:00', '2015-07-28 00:00:00'),
(12, 'recommend', '2015-07-28 00:00:00', '2015-07-28 00:00:00'),
(13, 'recommendations', '2015-07-28 00:00:00', '2015-07-28 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `map`
--

CREATE TABLE IF NOT EXISTS `map` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `answerId` int(11) NOT NULL DEFAULT '0',
  `keywordId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`answerId`,`keywordId`),
  KEY `keywordId` (`keywordId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `map`
--

INSERT INTO `map` (`createdAt`, `updatedAt`, `answerId`, `keywordId`) VALUES
('2015-07-28 00:00:00', '2015-07-28 00:00:00', 1, 1),
('2015-07-28 00:00:00', '2015-07-28 00:00:00', 1, 11),
('2015-07-28 00:00:00', '2015-07-28 00:00:00', 2, 2),
('2015-07-28 00:00:00', '2015-07-28 00:00:00', 2, 3),
('2015-07-28 00:00:00', '2015-07-28 00:00:00', 2, 4),
('2015-07-28 00:00:00', '2015-07-28 00:00:00', 3, 5),
('2015-07-28 00:00:00', '2015-07-28 00:00:00', 3, 6),
('2015-07-28 00:00:00', '2015-07-28 00:00:00', 3, 7),
('2015-07-28 00:00:00', '2015-07-28 00:00:00', 4, 8),
('2015-07-28 00:00:00', '2015-07-28 00:00:00', 4, 9),
('2015-07-28 00:00:00', '2015-07-28 00:00:00', 5, 9),
('2015-07-28 00:00:00', '2015-07-28 00:00:00', 5, 10),
('2015-07-28 00:00:00', '2015-07-28 00:00:00', 6, 4),
('2015-07-28 00:00:00', '2015-07-28 00:00:00', 6, 12),
('2015-07-28 00:00:00', '2015-07-28 00:00:00', 9, 13);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `map`
--
ALTER TABLE `map`
  ADD CONSTRAINT `map_ibfk_1` FOREIGN KEY (`answerId`) REFERENCES `answers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `map_ibfk_2` FOREIGN KEY (`keywordId`) REFERENCES `keywords` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
