SELECT  name AS 'Dogs Too Old for Puppy Training', DD_Get_Dog_Age(DOB) AS Age FROM DD_Dog GROUP BY DOB HAVING DD_Get_Dog_Age(DOB) > 0;

SELECT name AS 'Employee\'s Without a Training Program'  FROM DD_Employee 
WHERE employeeID IN   (SELECT employeeID  FROM DD_Employee EXCEPT SELECT e_ID FROM DD_Employee_Training_Program_Run);
 
SELECT name AS 'Fully Vaccinated Dogs' FROM DD_Dog 
LEFT JOIN DD_Unvaccinated_Info on DD_Dog.name = DD_Unvaccinated_Info.Dog WHERE DD_Unvaccinated_Info.Dog IS NULL;

Select title as 'Courses Without Dogs Enrolled' FROM DD_Training_Program 
WHERE NOT EXISTS (SELECT program FROM DD_Dog WHERE DD_Dog.program = DD_Training_Program
	.programID );
 
SELECT name as 'Unvaccinated Pet Owner', phone FROM DD_Owner_Phone_Numbers 
JOIN DD_Owner ON owner = customerID
WHERE owner IN(SELECT customerID FROM DD_Owner 
WHERE name IN (SELECT DISTINCT Owner from DD_Unvaccinated_Info));

