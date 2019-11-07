-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 07, 2019 at 05:50 PM
-- Server version: 5.6.37
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `friendlycuisine`
--

-- --------------------------------------------------------

--
-- Table structure for table `Event`
--

CREATE TABLE IF NOT EXISTS `Event` (
  `eventID` int(11) NOT NULL,
  `eventName` varchar(50) NOT NULL,
  `eventDesc` varchar(500) NOT NULL,
  `eventDate` varchar(50) NOT NULL,
  `eventLocation` varchar(50) NOT NULL,
  `eventImage` varchar(100) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Friend`
--

CREATE TABLE IF NOT EXISTS `Friend` (
  `myFriendID` int(11) NOT NULL,
  `myID` int(11) NOT NULL,
  `friendID` int(11) NOT NULL,
  `friendFirstName` varchar(50) NOT NULL,
  `firendLastName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Image`
--

CREATE TABLE IF NOT EXISTS `Image` (
  `imageID` int(11) NOT NULL,
  `imageName` varchar(50) NOT NULL,
  `imageDesc` varchar(500) NOT NULL,
  `imageLocation` varchar(50) NOT NULL,
  `imageType` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Message`
--

CREATE TABLE IF NOT EXISTS `Message` (
  `messageID` int(11) NOT NULL,
  `messageSenderID` int(11) NOT NULL,
  `messageRecieverID` int(11) NOT NULL,
  `messageContent` varchar(500) NOT NULL,
  `messageDateSended` varchar(50) NOT NULL,
  `messageDateRecieved` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Post`
--

CREATE TABLE IF NOT EXISTS `Post` (
  `postId` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `postContent` varchar(500) NOT NULL,
  `postDatePosted` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Restaurant`
--

CREATE TABLE IF NOT EXISTS `Restaurant` (
  `restaurantID` int(11) NOT NULL,
  `restaurantName` varchar(50) NOT NULL,
  `restaurantDesc` varchar(500) NOT NULL,
  `restaurantRating` double NOT NULL,
  `restaurantImage` varchar(100) NOT NULL,
  `restaurantLocation` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE IF NOT EXISTS `User` (
  `userID` int(11) NOT NULL,
  `userFirstName` varchar(50) NOT NULL,
  `userLastName` varchar(50) NOT NULL,
  `userEmail` varchar(50) NOT NULL,
  `userUsername` varchar(50) NOT NULL,
  `userPassword` varchar(50) NOT NULL,
  `userLastActive` datetime(4) NOT NULL,
  `userShowStatus` tinyint(4) NOT NULL,
  `userAllowMessage` tinyint(4) NOT NULL,
  `userProfanityFilter` tinyint(4) NOT NULL,
  `userDisabled` tinyint(4) NOT NULL,
  `userIsMod` tinyint(4) NOT NULL,
  `userProfileImage` varchar(100) NOT NULL,
  `userPhone` varchar(50) NOT NULL,
  `userWork` varchar(50) NOT NULL,
  `userBirthday` varchar(50) NOT NULL,
  `userDesc` varchar(500) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Event`
--
ALTER TABLE `Event`
  ADD PRIMARY KEY (`eventID`);

--
-- Indexes for table `Friend`
--
ALTER TABLE `Friend`
  ADD PRIMARY KEY (`myFriendID`);

--
-- Indexes for table `Image`
--
ALTER TABLE `Image`
  ADD PRIMARY KEY (`imageID`);

--
-- Indexes for table `Message`
--
ALTER TABLE `Message`
  ADD PRIMARY KEY (`messageID`);

--
-- Indexes for table `Post`
--
ALTER TABLE `Post`
  ADD PRIMARY KEY (`postId`);

--
-- Indexes for table `Restaurant`
--
ALTER TABLE `Restaurant`
  ADD PRIMARY KEY (`restaurantID`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Event`
--
ALTER TABLE `Event`
  MODIFY `eventID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Friend`
--
ALTER TABLE `Friend`
  MODIFY `myFriendID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Image`
--
ALTER TABLE `Image`
  MODIFY `imageID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Message`
--
ALTER TABLE `Message`
  MODIFY `messageID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Post`
--
ALTER TABLE `Post`
  MODIFY `postId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Restaurant`
--
ALTER TABLE `Restaurant`
  MODIFY `restaurantID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
