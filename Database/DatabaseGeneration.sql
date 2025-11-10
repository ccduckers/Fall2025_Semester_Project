-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema StudentTutorMatchmaker
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `StudentTutorMatchmaker` ;

-- -----------------------------------------------------
-- Schema StudentTutorMatchmaker
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `StudentTutorMatchmaker` DEFAULT CHARACTER SET utf8 ;
USE `StudentTutorMatchmaker` ;

-- -----------------------------------------------------
-- Table `StudentTutorMatchmaker`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StudentTutorMatchmaker`.`Students` (
  `idStudents` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idStudents`),
  UNIQUE INDEX `idStudents_UNIQUE` (`idStudents` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `StudentTutorMatchmaker`.`Tutors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StudentTutorMatchmaker`.`Tutors` (
  `idTutors` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `TutorSubject` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTutors`),
  UNIQUE INDEX `idTutors_UNIQUE` (`idTutors` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `StudentTutorMatchmaker`.`Students_has_Tutors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StudentTutorMatchmaker`.`Students_has_Tutors` (
  `idStudents` INT NOT NULL,
  `idTutors` INT NOT NULL,
  `idStudentHasTutors` INT NOT NULL AUTO_INCREMENT,
  INDEX `fk_Students_has_Tutors_Tutors1_idx` (`idTutors` ASC) VISIBLE,
  PRIMARY KEY (`idStudentHasTutors`),
  UNIQUE INDEX `idStudentHasTutors_UNIQUE` (`idStudentHasTutors` ASC) VISIBLE,
  INDEX `fk_Students_has_Tutors_Students_idx` (`idStudents` ASC) VISIBLE,
  CONSTRAINT `fk_Students_has_Tutors_Students`
    FOREIGN KEY (`idStudents`)
    REFERENCES `StudentTutorMatchmaker`.`Students` (`idStudents`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Students_has_Tutors_Tutors1`
    FOREIGN KEY (`idTutors`)
    REFERENCES `StudentTutorMatchmaker`.`Tutors` (`idTutors`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



-- Sample Data Insert
INSERT INTO Students (FirstName, LastName) VALUES ("John", "Doe");
INSERT INTO Students (FirstName, LastName) VALUES ("Santa", "Clause");
INSERT INTO Students (FirstName, LastName) VALUES ("Marky", "Mark");
INSERT INTO Tutors (FirstName, LastName, TutorSubject) VALUES ("Beth", "Johnson", "English");
INSERT INTO Tutors (FirstName, LastName, TutorSubject) VALUES ("Martha", "Smith", "Math");
INSERT INTO Tutors (FirstName, LastName, TutorSubject) VALUES ("Claire", "Thomas", "Science");

INSERT INTO Students_has_Tutors (idStudents, idTutors) VALUES (1, 1);
INSERT INTO Students_has_Tutors (idStudents, idTutors) VALUES (1, 2);

SELECT 
  s.FirstName AS Student, 
  t.FirstName AS Tutor
FROM Students s
JOIN Students_has_Tutors st ON s.idStudents = st.idStudents
JOIN Tutors t ON t.idTutors = st.idTutors;
