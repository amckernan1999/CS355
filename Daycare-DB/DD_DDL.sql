USE mckernan_cs355fa21

DROP TABLE IF EXISTS DD_Dog;
DROP TABLE IF EXISTS DD_Employee_Training_Program_Run;
DROP TABLE IF EXISTS DD_Owner_Phone_Numbers;
DROP TABLE IF EXISTS DD_Owner;
DROP TABLE IF EXISTS DD_Training_Program;
DROP TABLE IF EXISTS DD_Employee;
DROP VIEW IF EXISTS DD_Unvaccinated_Info;

CREATE TABLE DD_Owner
(
	name 		VARCHAR(255),
	customerID 	VARCHAR(8),
	primary key	(customerID)
);

CREATE TABLE DD_Training_Program
(
	programID	VARCHAR(8),
	title		VARCHAR(64),
	time		DATETIME,
	primary key	(programID),
	UNIQUE		(title)
);

CREATE TABLE DD_Dog
(
	name		VARCHAR(255),
	owner		VARCHAR(8),
	program		VARCHAR(8),
	DOB		DATE,
	rabies		BOOLEAN,
	bordetella	BOOLEAN,
	distemper	BOOLEAN,
	breed		VARCHAR(255),
	
	primary key (name, owner),

	foreign key (owner) references DD_Owner (customerID)
	                on delete cascade,
	foreign key (program) references DD_Training_Program (programID)
	                on delete set null
);

CREATE TABLE DD_Employee
(
	name 		VARCHAR(255),
	employeeID	VARCHAR(8),
	primary key	(employeeID)
);

CREATE TABLE DD_Employee_Training_Program_Run
(
	e_ID		VARCHAR(8),
	p_ID		VARCHAR(8),

	primary key (e_ID, p_ID),

	foreign key (e_ID) references DD_Employee (employeeID)
			on delete cascade,
	foreign key (p_ID) references DD_Training_Program (programID)
			on delete cascade
);

CREATE TABLE DD_Owner_Phone_Numbers
(
	owner		VARCHAR(8),
	phone		CHAR(10),

	primary key(owner,phone),
	foreign key (owner) references DD_Owner (customerID)
			on delete cascade
);

CREATE VIEW DD_Unvaccinated_Info AS
Select DD_Owner.name as Owner, phone as Phone, DD_Dog.name as Dog, rabies, bordetella, distemper FROM DD_Dog 
JOIN DD_Owner on DD_Dog.owner = DD_Owner.customerID 
JOIN DD_Owner_Phone_Numbers ON DD_Dog.owner = DD_Owner_Phone_Numbers.owner
WHERE rabies = FALSE or bordetella = FALSE or distemper = FALSE
GROUP BY Owner, Dog;

DELIMITER //
CREATE OR REPLACE FUNCTION DD_Get_Dog_Age
(
	DoB DATE
)
RETURNS INTEGER
BEGIN
	DECLARE age INTEGER DEFAULT '0';
	SET age = FLOOR((CURDATE() - DoB) / 10000);
	RETURN age;
END; //
DELIMITER ;

DELIMITER //
CREATE OR REPLACE PROCEDURE DD_Drop_Unvaccinated_Dogs
(
	IN selectedProgram VARCHAR(8)
)
BEGIN
	UPDATE  DD_Dog 
	SET program = '00000000' 
	WHERE program = selectedProgram AND
	( rabies = FALSE or bordetella = FALSE or distemper = FALSE);
END; //
DELIMITER ;

insert into DD_Owner values( 'Andrew McKernan', '01234567');
insert into DD_Owner values( 'Joe Smith', '76543210');
insert into DD_Owner values( 'Bob Ross', '11111111');
insert into DD_Owner values( 'Patrick Mahomes', '99999999');
insert into DD_Owner values( 'Jim Carrey', '55555555');

insert into DD_Training_Program values ('10295821','Puppy Obedience Training','2021-11-01 10:00:00');
insert into DD_Training_Program values ('42108532','Seperation Anxiety Training','2021-11-14 10:30:00');
insert into DD_Training_Program values ('01924812','Leash Training','2021-11-08 06:45:00');
insert into DD_Training_Program values ('41022935','Dog Aggression Training','2021-12-14 02:00:00');
insert into DD_Training_Program values ('95125321','Resource Guarding Training','2022-11-02 04:30:00');
insert into DD_Training_Program values ('00000000','Not Enrolled','1000-01-01 00:00:00');
insert into DD_Training_Program values ('71922812','Potty Training','2021-11-21 10:45:00');

insert into DD_Dog values ('Lucky','01234567','42108532','20180709','1','1','1','Chihuahua Mix');
insert into DD_Dog values ('Moose','01234567','01924812','20160221','1','1','0','Jack Russel Terrier');
insert into DD_Dog values ('Spot','76543210','41022935','20201021','1','1','1','Golden Retriever');
insert into DD_Dog values ('Brix','99999999','95125321','20141225','0','1','0','Golden Retriever');
insert into DD_Dog values ('Scout','55555555','10295821','20210602','1','0','0','Border Collie');
insert into DD_Dog values ('Charlie', '55555555', '10295821', '20140221', '0','0','0', 'Great Dane');

insert into DD_Employee values ('Camille Lesher','58105921');
insert into DD_Employee values ('Antonio Slayton','94219292');
insert into DD_Employee values ('Ricky Zigler','92516725');
insert into DD_Employee values ('Patricia Oakes','83282042');
insert into DD_Employee values ('Michelle Wilson','41820351');

insert into DD_Employee_Training_Program_Run values ('58105921','10295821');
insert into DD_Employee_Training_Program_Run values ('58105921','42108532');
insert into DD_Employee_Training_Program_Run values ('41820351','95125321');
insert into DD_Employee_Training_Program_Run values ('83282042','41022935');
insert into DD_Employee_Training_Program_Run values ('92516725','01924812');

insert into DD_Owner_Phone_Numbers values ('01234567','4084420778');
insert into DD_Owner_Phone_Numbers values ('01234567','9133148668');
insert into DD_Owner_Phone_Numbers values ('76543210','4529127263');
insert into DD_Owner_Phone_Numbers values ('99999999','8174292221');
insert into DD_Owner_Phone_Numbers values ('55555555','2815029211');
