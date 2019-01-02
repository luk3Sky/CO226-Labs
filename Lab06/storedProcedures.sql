CREATE PROCEDURE updateRegistration (IN RegNo INTEGER, IN LName VARCHAR(40), IN Adrs VARCHAR(65), IN Age INTEGER, IN ConRegNo INTEGER)
BEGIN
	INSERT INTO Convocation(Reg_No, LName, Age, Address, Con_Reg_No) VALUES(RegNo, LName, Age, Address, ConRegNo);
UPDATE Student 
SET 
    Con_Reg_No = ConRegNo
WHERE
    Student.Reg_No = Convocation.Reg_No;
END