

USE `StudenTutoringMatchmaker` ;






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

