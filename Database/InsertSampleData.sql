

USE `StudenTutoringMatchmaker` ;






-- DATA INSERT

-- Subjects
INSERT INTO Subject (Subject) VALUES ("Algebra");
INSERT INTO Subject (Subject) VALUES ("Geometry");
INSERT INTO Subject (Subject) VALUES ("Calculus");
INSERT INTO Subject (Subject) VALUES ("Chemistry");
INSERT INTO Subject (Subject) VALUES ("Biology");
INSERT INTO Subject (Subject) VALUES ("U.S. History");
INSERT INTO Subject (Subject) VALUES ("English Composition");
INSERT INTO Subject (Subject) VALUES ("Computer Science");
INSERT INTO Subject (Subject) VALUES ("Spanish");
INSERT INTO Subject (Subject) VALUES ("Physics");


-- Tutors
INSERT INTO Tutor(FirstName, LastName) VALUES ("Tyler","Dawson");
INSERT INTO Tutor(FirstName, LastName) VALUES ("Megan","Whitfield");
INSERT INTO Tutor(FirstName, LastName) VALUES ("Brandon","Keller");
INSERT INTO Tutor(FirstName, LastName) VALUES ("Alyssa","Carmichael");
INSERT INTO Tutor(FirstName, LastName) VALUES ("Jordan","Tate");
INSERT INTO Tutor(FirstName, LastName) VALUES ("Paige","Donovan");
INSERT INTO Tutor(FirstName, LastName) VALUES ("Zachary","Mills");
INSERT INTO Tutor(FirstName, LastName) VALUES ("Connor","Blake");
INSERT INTO Tutor(FirstName, LastName) VALUES ("Jenna","Whitmore");
INSERT INTO Tutor(FirstName, LastName) VALUES ("Travis","McKinley");
INSERT INTO Tutor(FirstName, LastName) VALUES ("Lauren","Bradford");
INSERT INTO Tutor(FirstName, LastName) VALUES ("Eric","Dalton");
INSERT INTO Tutor(FirstName, LastName) VALUES ("Brooke","Carver");
INSERT INTO Tutor(FirstName, LastName) VALUES ("Caleb","Stinson");
INSERT INTO Tutor(FirstName, LastName) VALUES ("Madison","Frye");
INSERT INTO Tutor(FirstName, LastName) VALUES ("Hunter","Collins");
INSERT INTO Tutor(FirstName, LastName) VALUES ("Riley","Chambers");
INSERT INTO Tutor(FirstName, LastName) VALUES ("Seth","Randall");
INSERT INTO Tutor(FirstName, LastName) VALUES ("Kaitlyn","Pierce");
INSERT INTO Tutor(FirstName, LastName) VALUES ("Trevor","Langston");


-- Links

-- Tutor 1
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (1,1);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (3,1);

-- Tutor 2
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (2,2);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (5,2);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (9,2);

-- Tutor 3
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (1,3);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (4,3);

-- Tutor 4
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (3,4);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (7,4);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (10,4);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (2,4);

-- Tutor 5
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (4,5);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (6,5);

-- Tutor 6
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (2,6);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (8,6);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (9,6);

-- Tutor 7
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (1,7);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (5,7);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (10,7);

-- Tutor 8
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (6,8);

-- Tutor 9
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (3,9);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (8,9);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (9,9);

-- Tutor 10
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (1,10);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (2,10);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (7,10);

-- Tutor 11
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (4,11);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (5,11);

-- Tutor 12
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (2,12);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (6,12);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (10,12);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (8,12);

-- Tutor 13
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (7,13);

-- Tutor 14
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (5,14);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (9,14);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (10,14);

-- Tutor 15
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (1,15);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (3,15);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (4,15);

-- Tutor 16
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (6,16);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (8,16);

-- Tutor 17
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (2,17);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (7,17);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (9,17);

-- Tutor 18
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (3,18);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (5,18);

-- Tutor 19
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (8,19);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (10,19);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (4,19);

-- Tutor 20
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (1,20);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (6,20);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (7,20);
INSERT INTO Subject_has_Tutors(idSubject, idTutors) VALUES (9,20);

