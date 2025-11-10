-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema StudenTutoringMatchmaker
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `StudenTutoringMatchmaker` ;

-- -----------------------------------------------------
-- Schema StudenTutoringMatchmaker
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `StudenTutoringMatchmaker` DEFAULT CHARACTER SET utf8 ;
USE `StudenTutoringMatchmaker` ;

-- -----------------------------------------------------
-- Table `StudenTutoringMatchmaker`.`Subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StudenTutoringMatchmaker`.`Subject` (
  `idSubject` INT NOT NULL AUTO_INCREMENT,
  `Subject` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSubject`),
  UNIQUE INDEX `idStudents_UNIQUE` (`idSubject` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `StudenTutoringMatchmaker`.`Tutor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StudenTutoringMatchmaker`.`Tutor` (
  `idTutors` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTutors`),
  UNIQUE INDEX `idTutors_UNIQUE` (`idTutors` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `StudenTutoringMatchmaker`.`Subject_has_Tutors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StudenTutoringMatchmaker`.`Subject_has_Tutors` (
  `idSubject` INT NOT NULL,
  `idTutors` INT NOT NULL,
  `idTutorSubject` INT NOT NULL AUTO_INCREMENT,
  INDEX `fk_Subject_has_Tutors_Tutors1_idx` (`idTutors` ASC) VISIBLE,
  PRIMARY KEY (`idTutorSubject`),
  UNIQUE INDEX `idSubjectHasTutors_UNIQUE` (`idTutorSubject` ASC) VISIBLE,
  INDEX `fk_Subject_has_Tutors_Students_idx` (`idSubject` ASC) VISIBLE,
  CONSTRAINT `fk_Subject_has_Tutors_Students`
    FOREIGN KEY (`idSubject`)
    REFERENCES `StudenTutoringMatchmaker`.`Subject` (`idSubject`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Subject_has_Tutors_Tutors1`
    FOREIGN KEY (`idTutors`)
    REFERENCES `StudenTutoringMatchmaker`.`Tutor` (`idTutors`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- DATA INSERT

INSERT INTO Subject (Subject) VALUES ("Math");
INSERT INTO Subject (Subject) VALUES ("English");
INSERT INTO Subject (Subject) VALUES ("Science");
INSERT INTO Tutor(FirstName, LastName) VALUES ("John","Doe");
INSERT INTO Tutor(FirstName, LastName) VALUES ("Jane","Smith");
INSERT INTO Tutor(FirstName, LastName) VALUES ("Mike","Thomas");
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (1,1);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (1,2);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (2,2);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (2,3);
INSERT INTO Subject_HAs_Tutors(idSubject, idTutors) VALUES (3,3);
SELECT * FROM `Subject_HAs_Tutors`;
