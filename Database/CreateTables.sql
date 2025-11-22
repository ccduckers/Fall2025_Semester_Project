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