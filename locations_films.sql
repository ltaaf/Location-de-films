-- MySQL Script generated by MySQL Workbench
-- Tue May 24 14:01:45 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Locations_Films
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Locations_Films
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Locations_Films` DEFAULT CHARACTER SET utf8 ;
USE `Locations_Films` ;

-- -----------------------------------------------------
-- Table `Locations_Films`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Locations_Films`.`film` (
  `id_film` INT NOT NULL AUTO_INCREMENT,
  `titre_film` VARCHAR(45) NULL,
  `date_sortie` VARCHAR(45) NULL,
  `duree_film` DATE NULL,
  `filmcol` TIME NULL,
  PRIMARY KEY (`id_film`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Locations_Films`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Locations_Films`.`clients` (
  `id_clients` INT NOT NULL AUTO_INCREMENT,
  `nom_clients` VARCHAR(45) NOT NULL,
  `prenom_clients` VARCHAR(45) NOT NULL,
  `email_clients` VARCHAR(45) NOT NULL,
  `film_id_film` INT NOT NULL,
  PRIMARY KEY (`id_clients`, `film_id_film`),
  INDEX `fk_clients_film1_idx` (`film_id_film` ASC) VISIBLE,
  CONSTRAINT `fk_clients_film1`
    FOREIGN KEY (`film_id_film`)
    REFERENCES `Locations_Films`.`film` (`id_film`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Locations_Films`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Locations_Films`.`categories` (
  `id_categories` INT NOT NULL AUTO_INCREMENT,
  `nom_categories` VARCHAR(45) NULL,
  `film_id_film` INT NOT NULL,
  PRIMARY KEY (`id_categories`, `film_id_film`),
  INDEX `fk_categories_film1_idx` (`film_id_film` ASC) VISIBLE,
  CONSTRAINT `fk_categories_film1`
    FOREIGN KEY (`film_id_film`)
    REFERENCES `Locations_Films`.`film` (`id_film`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Locations_Films`.`locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Locations_Films`.`locations` (
  `id_locations` INT NOT NULL AUTO_INCREMENT,
  `date_locations` DATE NULL,
  `datefin_locations` DATE NULL,
  `clients_id_clients` INT NOT NULL,
  `film_id_film` INT NOT NULL,
  PRIMARY KEY (`id_locations`),
  INDEX `fk_locations_clients_idx` (`clients_id_clients` ASC) VISIBLE,
  INDEX `fk_locations_film1_idx` (`film_id_film` ASC) VISIBLE,
  CONSTRAINT `fk_locations_clients`
    FOREIGN KEY (`clients_id_clients`)
    REFERENCES `Locations_Films`.`clients` (`id_clients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_locations_film1`
    FOREIGN KEY (`film_id_film`)
    REFERENCES `Locations_Films`.`film` (`id_film`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Locations_Films`.`factures`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Locations_Films`.`factures` (
  `id_factures` INT NOT NULL AUTO_INCREMENT,
  `prix_total` FLOAT NULL,
  `date_retour` DATE NULL,
  `locations_id_locations` INT NOT NULL,
  PRIMARY KEY (`id_factures`, `locations_id_locations`),
  INDEX `fk_factures_locations1_idx` (`locations_id_locations` ASC) VISIBLE,
  CONSTRAINT `fk_factures_locations1`
    FOREIGN KEY (`locations_id_locations`)
    REFERENCES `Locations_Films`.`locations` (`id_locations`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Locations_Films`.`rapport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Locations_Films`.`rapport` (
  `id_rapport` INT NOT NULL AUTO_INCREMENT,
  `date_creation` DATE NULL,
  `date_modification` DATE NULL,
  PRIMARY KEY (`id_rapport`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;