-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Syndrome` (
  `idSyndrome` INT NOT NULL AUTO_INCREMENT,
  `Syndrome_name` VARCHAR(100) NULL,
  `Syndome_description` MEDIUMTEXT NULL,
  PRIMARY KEY (`idSyndrome`),
  UNIQUE INDEX `idSyndrome_UNIQUE` (`idSyndrome` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gene` (
  `idGene` INT NOT NULL AUTO_INCREMENT,
  `Gene_name` VARCHAR(45) NULL,
  `chromosome` VARCHAR(45) NULL,
  `start_position` INT NULL,
  `end_position` INT NULL,
  `gene_description` MEDIUMTEXT NULL,
  PRIMARY KEY (`idGene`),
  UNIQUE INDEX `idGene_UNIQUE` (`idGene` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patients` (
  `idPatients` INT NOT NULL,
  `Lastname` VARCHAR(100) NULL,
  `Firstname` VARCHAR(100) NULL,
  `Gender` ENUM("M", "F") NULL,
  `Age` INT NULL,
  `syndrome_id` INT NOT NULL,
  `gene_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idPatients`),
  UNIQUE INDEX `idPatients_UNIQUE` (`idPatients` ASC) VISIBLE,
  UNIQUE INDEX `syndrome_id_UNIQUE` (`syndrome_id` ASC) VISIBLE,
  UNIQUE INDEX `gene_id_UNIQUE` (`gene_id` ASC) VISIBLE,
  CONSTRAINT `fk_Patients-syndrome`
    FOREIGN KEY (`syndrome_id`)
    REFERENCES `mydb`.`Syndrome` (`idSyndrome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patients-gene`
    FOREIGN KEY (`gene_id`)
    REFERENCES `mydb`.`Gene` (`idGene`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
