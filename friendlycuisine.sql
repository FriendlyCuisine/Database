-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema friendlycusinie
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `friendlycusinie` ;

-- -----------------------------------------------------
-- Schema friendlycusinie
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `friendlycusinie` DEFAULT CHARACTER SET utf8 ;
USE `friendlycusinie` ;

-- -----------------------------------------------------
-- Table `friendlycusinie`.`Restaurant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `friendlycusinie`.`Restaurant` ;

CREATE TABLE IF NOT EXISTS `friendlycusinie`.`Restaurant` (
  `restaurantID` INT NOT NULL,
  `restaurantName` VARCHAR(45) NULL,
  `restaurantDesc` VARCHAR(45) NULL,
  `restaurantRating` DOUBLE NULL,
  PRIMARY KEY (`restaurantID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `friendlycusinie`.`Message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `friendlycusinie`.`Message` ;

CREATE TABLE IF NOT EXISTS `friendlycusinie`.`Message` (
  `messageID` INT NOT NULL,
  `messageFrom` VARCHAR(45) NULL,
  `messageTo` VARCHAR(45) NULL,
  `messageBody` VARCHAR(45) NULL,
  `messageColor` VARCHAR(45) NULL,
  `messageDate` DATETIME NULL,
  PRIMARY KEY (`messageID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `friendlycusinie`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `friendlycusinie`.`User` ;

CREATE TABLE IF NOT EXISTS `friendlycusinie`.`User` (
  `userID` INT NOT NULL,
  `userFirstName` VARCHAR(45) NULL,
  `userLastName` VARCHAR(45) NULL,
  `userEmail` VARCHAR(45) NULL,
  `userUsername` VARCHAR(45) NULL,
  `userPassword` VARCHAR(45) NULL,
  `userLastActive` DATETIME NULL,
  `userShowStatus` TINYINT NULL,
  `userIsMod` TINYINT NULL,
  `Message_messageID` INT NOT NULL,
  PRIMARY KEY (`userID`, `Message_messageID`),
  CONSTRAINT `fk_User_Message1`
    FOREIGN KEY (`Message_messageID`)
    REFERENCES `friendlycusinie`.`Message` (`messageID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_User_Message1_idx` ON `friendlycusinie`.`User` (`Message_messageID` ASC);


-- -----------------------------------------------------
-- Table `friendlycusinie`.`Image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `friendlycusinie`.`Image` ;

CREATE TABLE IF NOT EXISTS `friendlycusinie`.`Image` (
  `imageID` INT NOT NULL,
  `imageName` VARCHAR(45) NULL,
  `imageDesc` VARCHAR(45) NULL,
  `imageType` INT NULL,
  PRIMARY KEY (`imageID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `friendlycusinie`.`Location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `friendlycusinie`.`Location` ;

CREATE TABLE IF NOT EXISTS `friendlycusinie`.`Location` (
  `locationID` INT NOT NULL,
  `locationStreet` VARCHAR(45) NULL,
  `locationCity` VARCHAR(45) NULL,
  `locationState` VARCHAR(45) NULL,
  `locationZipcode` INT NULL,
  PRIMARY KEY (`locationID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `friendlycusinie`.`Event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `friendlycusinie`.`Event` ;

CREATE TABLE IF NOT EXISTS `friendlycusinie`.`Event` (
  `eventID` INT NOT NULL,
  `eventName` VARCHAR(45) NULL,
  `eventDate` DATETIME NULL,
  `locationID` INT NULL,
  `Image_imageID` INT NOT NULL,
  `Location_locationID` INT NOT NULL,
  `User_userID` INT NOT NULL,
  PRIMARY KEY (`eventID`, `Image_imageID`, `Location_locationID`, `User_userID`),
  CONSTRAINT `fk_Event_Image1`
    FOREIGN KEY (`Image_imageID`)
    REFERENCES `friendlycusinie`.`Image` (`imageID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Event_Location1`
    FOREIGN KEY (`Location_locationID`)
    REFERENCES `friendlycusinie`.`Location` (`locationID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Event_User1`
    FOREIGN KEY (`User_userID`)
    REFERENCES `friendlycusinie`.`User` (`userID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_Event_Image1_idx` ON `friendlycusinie`.`Event` (`Image_imageID` ASC);

CREATE INDEX `fk_Event_Location1_idx` ON `friendlycusinie`.`Event` (`Location_locationID` ASC);

CREATE INDEX `fk_Event_User1_idx` ON `friendlycusinie`.`Event` (`User_userID` ASC);


-- -----------------------------------------------------
-- Table `friendlycusinie`.`Blurb`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `friendlycusinie`.`Blurb` ;

CREATE TABLE IF NOT EXISTS `friendlycusinie`.`Blurb` (
  `blurbID` INT NOT NULL,
  `blurbBody` VARCHAR(45) NULL,
  `blurbLike` INT NULL,
  `blurbDate` DATETIME NULL,
  `User_userID` INT NOT NULL,
  PRIMARY KEY (`blurbID`, `User_userID`),
  CONSTRAINT `fk_Blurb_User1`
    FOREIGN KEY (`User_userID`)
    REFERENCES `friendlycusinie`.`User` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Blurb_User1_idx` ON `friendlycusinie`.`Blurb` (`User_userID` ASC);


-- -----------------------------------------------------
-- Table `friendlycusinie`.`FriendRequest`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `friendlycusinie`.`FriendRequest` ;

CREATE TABLE IF NOT EXISTS `friendlycusinie`.`FriendRequest` (
  `firendRequestID` INT NOT NULL,
  `firendRequestTo` VARCHAR(45) NULL,
  `firendRequestFrom` VARCHAR(45) NULL,
  `User_userID` INT NOT NULL,
  PRIMARY KEY (`firendRequestID`, `User_userID`),
  CONSTRAINT `fk_FriendRequest_User1`
    FOREIGN KEY (`User_userID`)
    REFERENCES `friendlycusinie`.`User` (`userID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_FriendRequest_User1_idx` ON `friendlycusinie`.`FriendRequest` (`User_userID` ASC);


-- -----------------------------------------------------
-- Table `friendlycusinie`.`Friend`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `friendlycusinie`.`Friend` ;

CREATE TABLE IF NOT EXISTS `friendlycusinie`.`Friend` (
  `friendID` INT NOT NULL,
  `friendFirstName` VARCHAR(45) NULL,
  `firendLastName` VARCHAR(45) NULL,
  `User_userID` INT NOT NULL,
  PRIMARY KEY (`friendID`, `User_userID`),
  CONSTRAINT `fk_Friend_User1`
    FOREIGN KEY (`User_userID`)
    REFERENCES `friendlycusinie`.`User` (`userID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_Friend_User1_idx` ON `friendlycusinie`.`Friend` (`User_userID` ASC);


-- -----------------------------------------------------
-- Table `friendlycusinie`.`Like`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `friendlycusinie`.`Like` ;

CREATE TABLE IF NOT EXISTS `friendlycusinie`.`Like` (
  `likeID` INT NOT NULL,
  `userID` INT NULL,
  `burbID` INT NULL,
  PRIMARY KEY (`likeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `friendlycusinie`.`ReserveStatus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `friendlycusinie`.`ReserveStatus` ;

CREATE TABLE IF NOT EXISTS `friendlycusinie`.`ReserveStatus` (
  `reserveStatusID` INT NOT NULL,
  `reserveStatusAttend` VARCHAR(45) NULL,
  `reserveStatusDecline` VARCHAR(45) NULL,
  `reserveStatusUnsure` VARCHAR(45) NULL,
  `Event_eventID` INT NOT NULL,
  `Event_Image_imageID` INT NOT NULL,
  PRIMARY KEY (`reserveStatusID`, `Event_eventID`, `Event_Image_imageID`),
  CONSTRAINT `fk_ReserveStatus_Event1`
    FOREIGN KEY (`Event_eventID` , `Event_Image_imageID`)
    REFERENCES `friendlycusinie`.`Event` (`eventID` , `Image_imageID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_ReserveStatus_Event1_idx` ON `friendlycusinie`.`ReserveStatus` (`Event_eventID` ASC, `Event_Image_imageID` ASC);


-- -----------------------------------------------------
-- Table `friendlycusinie`.`RestaurantImage`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `friendlycusinie`.`RestaurantImage` ;

CREATE TABLE IF NOT EXISTS `friendlycusinie`.`RestaurantImage` (
  `restaurantImageID` INT NOT NULL,
  `Restaurant_restaurantID` INT NOT NULL,
  `Image_imageID` INT NOT NULL,
  PRIMARY KEY (`restaurantImageID`, `Restaurant_restaurantID`, `Image_imageID`),
  CONSTRAINT `fk_RestaurantImage_Restaurant`
    FOREIGN KEY (`Restaurant_restaurantID`)
    REFERENCES `friendlycusinie`.`Restaurant` (`restaurantID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_RestaurantImage_Image1`
    FOREIGN KEY (`Image_imageID`)
    REFERENCES `friendlycusinie`.`Image` (`imageID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_RestaurantImage_Restaurant_idx` ON `friendlycusinie`.`RestaurantImage` (`Restaurant_restaurantID` ASC);

CREATE INDEX `fk_RestaurantImage_Image1_idx` ON `friendlycusinie`.`RestaurantImage` (`Image_imageID` ASC);


-- -----------------------------------------------------
-- Table `friendlycusinie`.`UserImage`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `friendlycusinie`.`UserImage` ;

CREATE TABLE IF NOT EXISTS `friendlycusinie`.`UserImage` (
  `userImageID` INT NOT NULL,
  `User_userID` INT NOT NULL,
  `Image_imageID` INT NOT NULL,
  PRIMARY KEY (`userImageID`, `User_userID`, `Image_imageID`),
  CONSTRAINT `fk_UserImage_User1`
    FOREIGN KEY (`User_userID`)
    REFERENCES `friendlycusinie`.`User` (`userID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_UserImage_Image1`
    FOREIGN KEY (`Image_imageID`)
    REFERENCES `friendlycusinie`.`Image` (`imageID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_UserImage_User1_idx` ON `friendlycusinie`.`UserImage` (`User_userID` ASC);

CREATE INDEX `fk_UserImage_Image1_idx` ON `friendlycusinie`.`UserImage` (`Image_imageID` ASC);


-- -----------------------------------------------------
-- Table `friendlycusinie`.`BlurbLike`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `friendlycusinie`.`BlurbLike` ;

CREATE TABLE IF NOT EXISTS `friendlycusinie`.`BlurbLike` (
  `blurbLikeID` INT NOT NULL,
  `Blurb_blurbID` INT NOT NULL,
  `Blurb_User_userID` INT NOT NULL,
  `Like_likeID` INT NOT NULL,
  PRIMARY KEY (`blurbLikeID`, `Blurb_blurbID`, `Blurb_User_userID`, `Like_likeID`),
  CONSTRAINT `fk_BlurbLike_Blurb1`
    FOREIGN KEY (`Blurb_blurbID` , `Blurb_User_userID`)
    REFERENCES `friendlycusinie`.`Blurb` (`blurbID` , `User_userID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_BlurbLike_Like1`
    FOREIGN KEY (`Like_likeID`)
    REFERENCES `friendlycusinie`.`Like` (`likeID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_BlurbLink_Blurb1_idx` ON `friendlycusinie`.`BlurbLike` (`Blurb_blurbID` ASC, `Blurb_User_userID` ASC);

CREATE INDEX `fk_BlurbLink_Like1_idx` ON `friendlycusinie`.`BlurbLike` (`Like_likeID` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
