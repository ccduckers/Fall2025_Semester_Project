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
-- Table `mydb`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Students` (
  `idStudents` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idStudents`),
  UNIQUE INDEX `idStudents_UNIQUE` (`idStudents` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tutors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tutors` (
  `idTutors` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Subject` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTutors`),
  UNIQUE INDEX `idTutors_UNIQUE` (`idTutors` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Students_has_Tutors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Students_has_Tutors` (
  `idStudents` INT NOT NULL,
  `idTutors` INT NOT NULL,
  `idStudentHasTutors` INT NOT NULL AUTO_INCREMENT,
  INDEX `fk_Students_has_Tutors_Tutors1_idx` (`idTutors` ASC) VISIBLE,
  PRIMARY KEY (`idStudentHasTutors`),
  UNIQUE INDEX `idStudentHasTutors_UNIQUE` (`idStudentHasTutors` ASC) VISIBLE,
  INDEX `fk_Students_has_Tutors_Students_idx` (`idStudents` ASC) VISIBLE,
  CONSTRAINT `fk_Students_has_Tutors_Students`
    FOREIGN KEY (`idStudents`)
    REFERENCES `mydb`.`Students` (`idStudents`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Students_has_Tutors_Tutors1`
    FOREIGN KEY (`idTutors`)
    REFERENCES `mydb`.`Tutors` (`idTutors`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
