CREATE DATABASE IF NOT EXISTS E15142Lab04;
USE E15142Lab04;

-- 1
CREATE TABLE IF NOT EXISTS Student (
    LName VARCHAR(50) NOT NULL,
    Reg_No INTEGER NOT NULL,
    GPA FLOAT(4) NOT NULL,
    Con_Reg_No INTEGER,
    Class VARCHAR(50),
    PRIMARY KEY(Reg_No)
);

INSERT INTO Student(LName, Reg_No, GPA) VALUES("Sameera", 425, 3.25);
INSERT INTO Student(LName, Reg_No, GPA) VALUES("Kasun", 210, 3.40);
INSERT INTO Student(LName, Reg_No, GPA) VALUES("Kalpa", 201, 3.10);
INSERT INTO Student(LName, Reg_No, GPA) VALUES("Chathura", 312, 3.85);
INSERT INTO Student(LName, Reg_No, GPA) VALUES("Lakmali", 473, 3.75);
INSERT INTO Student(LName, Reg_No, GPA) VALUES("Sidath", 352, 3.30);
INSERT INTO Student(LName, Reg_No, GPA) VALUES("Kumudu", 111, 3.70);
INSERT INTO Student(LName, Reg_No, GPA) VALUES("Nalin", 456, 3.05);
INSERT INTO Student(LName, Reg_No, GPA) VALUES("Rohani", 324, 3.70);
INSERT INTO Student(LName, Reg_No, GPA) VALUES("Chithra", 231, 3.30);

-- 2
CREATE TABLE Convocation (
    Con_Reg_No INTEGER NOT NULL PRIMARY KEY,
    Reg_No INTEGER NOT NULL,
    LName VARCHAR(40),
    Address VARCHAR(65),
    Age INTEGER,
    FOREIGN KEY(Reg_No) REFERENCES Student(Reg_No)
);

-- 3
DELIMITER //
CREATE PROCEDURE updateRegistration(IN LName VARCHAR(40), IN Adrs VARCHAR(65), IN Age INTEGER, IN RegNo INTEGER, IN ConRegNo INTEGER)
BEGIN
	INSERT INTO Convocation(Reg_No, LName, Age, Address, Con_Reg_No) VALUES(RegNo, LName, Age, Adrs, ConRegNo);
UPDATE Student 
SET 
    Con_Reg_No = ConRegNo
WHERE
    Student.Reg_No = RegNo;
END //
DELIMITER ;

-- 4
CALL updateRegistration("Sameera", "Galle", 21, 425, 1);
CALL updateRegistration("Chathura", "Mathara", 23, 312, 2);
CALL updateRegistration("Lakmali", "Kaluthara", 20, 473, 3);
CALL updateRegistration("Sidath", "Colombo", 22, 352, 4);
CALL updateRegistration("Nalin", "Galle", 21, 456, 5);

SELECT * FROM Student;


SELECT * FROM Convocation;

-- 5
CREATE VIEW Registered AS
    SELECT 
        C.LName as Name, C.Reg_No as RegNumber, S.GPA as GPA, C.Con_Reg_No as ConRegNo, C.Address as Address, C.Age as Age
    FROM
        Student S,
        Convocation C
    WHERE
        S.Reg_No = C.Reg_No;

-- 6
CREATE VIEW Notregistered AS
    SELECT 
        LName AS Name, Reg_No AS RegNumber, GPA, NULL AS Address, NULL AS Age
    FROM
        Student
    WHERE
        Con_Reg_No IS NULL;

-- 7
CREATE TABLE LateRegistration(
    Con_Reg_No INTEGER NOT NULL PRIMARY KEY,
    Reg_No INTEGER NOT NULL,
    LName VARCHAR(40),
    Address VARCHAR(65),
    Age INTEGER,
    FOREIGN KEY(Reg_No) REFERENCES Student(Reg_No)
);

-- 8
DELIMITER $$
CREATE TRIGGER triggerLateRegistration
    AFTER INSERT ON LateRegistration
    FOR EACH ROW 
BEGIN
	IF NEW.Con_Reg_No IS NOT NULL THEN
    Update Student
    SET Student.Con_Reg_No = New.Con_Reg_No 
    WHERE Reg_No = NEW.Reg_No; 
    END IF;
END $$ 
DELIMITER ;

-- 9
INSERT INTO LateRegistration VALUES
 ( 6, 210, 'Kasun', 'Colombo', 25),
 ( 7, 201, 'Kalpa', 'kandy', 20),
 ( 8, 111, 'Kumudu', 'Nuwara Eliya', 19),
 ( 9, 324, 'Rohani', 'Kurunegala', 30),
 ( 10, 231, 'Chitra', 'Hambanthota', 21);
 
 -- 10
 DELIMITER $$
CREATE PROCEDURE setClass()
BEGIN
 UPDATE Student SET Class = 'First class honors' WHERE GPA >= 3.70;
UPDATE Student 
SET 
    Class = 'Second class honors-upper division'
WHERE
    (GPA < 3.70) AND (GPA >= 3.30);
UPDATE Student 
SET 
    Class = 'Second class honors-lower division'
WHERE
    (GPA < 3.30) AND (GPA >= 2.70);
UPDATE Student 
SET 
    Class = 'Third class honors'
WHERE
    (GPA < 2.70) AND (GPA >= 2.0);
 END $$
DELIMITER ;

CALL setClass();