-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `Busunternehmen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Busunternehmen` ;

CREATE TABLE IF NOT EXISTS `Busunternehmen` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `adresse` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Fahrer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Fahrer` ;

CREATE TABLE IF NOT EXISTS `Fahrer` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `vorname` VARCHAR(45) NULL,
  `telefon` INT NULL,
  `Busunternehmen_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Busunternehmen_id`),
  INDEX `fk_Fahrer_Busunternehmen1_idx` (`Busunternehmen_id` ASC) VISIBLE,
  CONSTRAINT `fk_Fahrer_Busunternehmen1`
    FOREIGN KEY (`Busunternehmen_id`)
    REFERENCES `Busunternehmen` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Fahrzeug`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Fahrzeug` ;

CREATE TABLE IF NOT EXISTS `Fahrzeug` (
  `id` INT NOT NULL,
  `marke` VARCHAR(45) NULL,
  `plätze` VARCHAR(45) NULL,
  `zustand` VARCHAR(45) NULL,
  `modell` VARCHAR(45) NULL,
  `kennzeichen` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Disponent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Disponent` ;

CREATE TABLE IF NOT EXISTS `Disponent` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `vorname` VARCHAR(45) NULL,
  `telefon` INT NULL,
  `Busunternehmen_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Busunternehmen_id`),
  INDEX `fk_Disponent_Busunternehmen_idx` (`Busunternehmen_id` ASC) VISIBLE,
  CONSTRAINT `fk_Disponent_Busunternehmen`
    FOREIGN KEY (`Busunternehmen_id`)
    REFERENCES `Busunternehmen` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Fahrt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Fahrt` ;

CREATE TABLE IF NOT EXISTS `Fahrt` (
  `id` INT NOT NULL,
  `startzeit` VARCHAR(45) NULL,
  `endzeit` VARCHAR(45) NULL,
  `anzahl der Sitzplätze` VARCHAR(45) NULL,
  `Disponent_id` INT NOT NULL,
  `Disponent_Busunternehmen_id` INT NOT NULL,
  `Fahrer_id` INT NOT NULL,
  `Fahrer_Busunternehmen_id` INT NOT NULL,
  `Station_id` INT NOT NULL,
  `Station_Fahrt_id` INT NOT NULL,
  `Station_Fahrt_Disponent_id` INT NOT NULL,
  `Station_Fahrt_Disponent_Busunternehmen_id` INT NOT NULL,
  `Station_Fahrt_Fahrer_id` INT NOT NULL,
  `Station_Fahrt_Fahrer_Busunternehmen_id` INT NOT NULL,
  `Fahrzeug_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Disponent_id`, `Disponent_Busunternehmen_id`, `Fahrer_id`, `Fahrer_Busunternehmen_id`, `Station_id`, `Station_Fahrt_id`, `Station_Fahrt_Disponent_id`, `Station_Fahrt_Disponent_Busunternehmen_id`, `Station_Fahrt_Fahrer_id`, `Station_Fahrt_Fahrer_Busunternehmen_id`, `Fahrzeug_id`),
  INDEX `fk_Fahrt_Disponent1_idx` (`Disponent_id` ASC, `Disponent_Busunternehmen_id` ASC) VISIBLE,
  INDEX `fk_Fahrt_Fahrer1_idx` (`Fahrer_id` ASC, `Fahrer_Busunternehmen_id` ASC) VISIBLE,
  INDEX `fk_Fahrt_Station1_idx` (`Station_id` ASC, `Station_Fahrt_id` ASC, `Station_Fahrt_Disponent_id` ASC, `Station_Fahrt_Disponent_Busunternehmen_id` ASC, `Station_Fahrt_Fahrer_id` ASC, `Station_Fahrt_Fahrer_Busunternehmen_id` ASC) VISIBLE,
  INDEX `fk_Fahrt_Fahrzeug1_idx` (`Fahrzeug_id` ASC) VISIBLE,
  CONSTRAINT `fk_Fahrt_Disponent1`
    FOREIGN KEY (`Disponent_id` , `Disponent_Busunternehmen_id`)
    REFERENCES `Disponent` (`id` , `Busunternehmen_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fahrt_Fahrer1`
    FOREIGN KEY (`Fahrer_id` , `Fahrer_Busunternehmen_id`)
    REFERENCES `Fahrer` (`id` , `Busunternehmen_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fahrt_Station1`
    FOREIGN KEY (`Station_id` , `Station_Fahrt_id` , `Station_Fahrt_Disponent_id` , `Station_Fahrt_Disponent_Busunternehmen_id` , `Station_Fahrt_Fahrer_id` , `Station_Fahrt_Fahrer_Busunternehmen_id`)
    REFERENCES `Station` (`id` , `Fahrt_id` , `Fahrt_Disponent_id` , `Fahrt_Disponent_Busunternehmen_id` , `Fahrt_Fahrer_id` , `Fahrt_Fahrer_Busunternehmen_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fahrt_Fahrzeug1`
    FOREIGN KEY (`Fahrzeug_id`)
    REFERENCES `Fahrzeug` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ort`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Ort` ;

CREATE TABLE IF NOT EXISTS `Ort` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `adresse` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Station`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Station` ;

CREATE TABLE IF NOT EXISTS `Station` (
  `id` INT NOT NULL,
  `ankunftszeit` VARCHAR(45) NULL,
  `abfahrtszeit` VARCHAR(45) NULL,
  `Fahrt_id` INT NOT NULL,
  `Fahrt_Disponent_id` INT NOT NULL,
  `Fahrt_Disponent_Busunternehmen_id` INT NOT NULL,
  `Fahrt_Fahrer_id` INT NOT NULL,
  `Fahrt_Fahrer_Busunternehmen_id` INT NOT NULL,
  `Ort_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Fahrt_id`, `Fahrt_Disponent_id`, `Fahrt_Disponent_Busunternehmen_id`, `Fahrt_Fahrer_id`, `Fahrt_Fahrer_Busunternehmen_id`, `Ort_id`),
  INDEX `fk_Station_Fahrt1_idx` (`Fahrt_id` ASC, `Fahrt_Disponent_id` ASC, `Fahrt_Disponent_Busunternehmen_id` ASC, `Fahrt_Fahrer_id` ASC, `Fahrt_Fahrer_Busunternehmen_id` ASC) VISIBLE,
  INDEX `fk_Station_Ort1_idx` (`Ort_id` ASC) VISIBLE,
  CONSTRAINT `fk_Station_Fahrt1`
    FOREIGN KEY (`Fahrt_id` , `Fahrt_Disponent_id` , `Fahrt_Disponent_Busunternehmen_id` , `Fahrt_Fahrer_id` , `Fahrt_Fahrer_Busunternehmen_id`)
    REFERENCES `Fahrt` (`id` , `Disponent_id` , `Disponent_Busunternehmen_id` , `Fahrer_id` , `Fahrer_Busunternehmen_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Station_Ort1`
    FOREIGN KEY (`Ort_id`)
    REFERENCES `Ort` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
