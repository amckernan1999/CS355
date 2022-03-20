USE mckernan_cs355fa21

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
