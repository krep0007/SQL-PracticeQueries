SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

 

-- -----------------------------------------------------

-- Schema ums

-- -----------------------------------------------------

DROP SCHEMA IF EXISTS `ums` ;

 

-- -----------------------------------------------------

-- Schema ums

-- -----------------------------------------------------

CREATE SCHEMA IF NOT EXISTS `ums` DEFAULT CHARACTER SET utf8 ;

USE `ums` ;

 

-- -----------------------------------------------------

-- Table `ums`.`users`

-- -----------------------------------------------------

DROP TABLE IF EXISTS `ums`.`users` ;

 

CREATE TABLE IF NOT EXISTS `ums`.`users` (

  `id` int(16) NOT NULL,

  `name` VARCHAR(60) NULL,

  `password` VARCHAR(60) NULL,

  `email` VARCHAR(60) NULL,

  `registration` VARCHAR(60) NULL,

  PRIMARY KEY (`id`));

 

 

-- -----------------------------------------------------

-- Table `ums`.`user_roles`

-- -----------------------------------------------------

DROP TABLE IF EXISTS `ums`.`user_roles` ;

 

CREATE TABLE IF NOT EXISTS `ums`.`user_roles` (

  `user_id` int(16) NOT NULL,

  `role_id` int(16) NULL,
  
  INDEX `fk_user_roles_index` (`role_id` ASC) VISIBLE,

  INDEX `fk_user_ids_index` (`user_id` ASC) VISIBLE,

 CONSTRAINT `fk_user_roles`

    FOREIGN KEY (`role_id`)

    REFERENCES `ums`.`roles` (`id`)

    ON DELETE CASCADE

    ON UPDATE CASCADE,

  CONSTRAINT `fk_user_ids`

    FOREIGN KEY (`user_id`)

    REFERENCES `ums`.`users` (`id`)

    ON DELETE CASCADE

    ON UPDATE CASCADE);

 

-- -----------------------------------------------------

-- Table `ums`.`roles`

-- -----------------------------------------------------

DROP TABLE IF EXISTS `ums`.`roles` ;

 

CREATE TABLE IF NOT EXISTS `ums`.`roles` (

  `id` INT NOT NULL,

  `name` VARCHAR(60) NOT NULL,

  `description` VARCHAR(60) NOT NULL,

  PRIMARY KEY (`id`));


-- -----------------------------------------------------

-- Schema messaging

-- -----------------------------------------------------

DROP SCHEMA IF EXISTS `messaging` ;

 

-- -----------------------------------------------------

-- Schema messaging

-- -----------------------------------------------------

CREATE SCHEMA IF NOT EXISTS `messaging` DEFAULT CHARACTER SET utf8 ;

USE `messaging` ;

 
 -- -----------------------------------------------------

-- Table `messaging`.`producers`

-- -----------------------------------------------------

DROP TABLE IF EXISTS `messaging`.`producers` ;

 

CREATE TABLE IF NOT EXISTS `messaging`.`producers` (

  `producer_id` INT(16) NOT NULL,

  `first_name` VARCHAR(60),

  `last_name` VARCHAR(60),

  PRIMARY KEY (`producer_id`));
  
  
  

-- -----------------------------------------------------

-- Table `messaging`.`message`

-- -----------------------------------------------------

DROP TABLE IF EXISTS `messaging`.`message` ;

 

CREATE TABLE IF NOT EXISTS `messaging`.`message` (

  `id` int(16) NOT NULL,

  `producer_id` INT NOT NULL,

  `content` VARCHAR(280) NULL,

  `timestamp` TIMESTAMP NULL,

  PRIMARY KEY (`id`),
  
  INDEX `fk_producer_index` (`producer_id` ASC) VISIBLE,

CONSTRAINT `fk_producer`

    FOREIGN KEY (`producer_id`)

    REFERENCES `messaging`.`producers` (`producer_id`)

    ON DELETE CASCADE

    ON UPDATE CASCADE);

 

 

-- -----------------------------------------------------

-- Table `messaging`.`subscription`

-- -----------------------------------------------------

DROP TABLE IF EXISTS `messaging`.`subscription` ;

 

CREATE TABLE IF NOT EXISTS `messaging`.`subscription` (

  `id` INT(16) NOT NULL,

  `subscriber_id` INT(16) NOT NULL,

  `producer_id` INT(16) NOT NULL,

  PRIMARY KEY (`id`),
  
  INDEX `fk_producer_index` (`producer_id` ASC) VISIBLE,

CONSTRAINT `fk_producer2`

    FOREIGN KEY (`producer_id`)

    REFERENCES `messaging`.`producers` (`producer_id`)

    ON DELETE CASCADE

    ON UPDATE CASCADE);




SET SQL_MODE=@OLD_SQL_MODE;

SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;