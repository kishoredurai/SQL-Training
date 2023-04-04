INSERT into dbo.StudentDetails values (1,'Madhu','CSE',21,13/10/2001,'madhu@gmail.com');
INSERT into dbo.StudentDetails values (2,'Adam','IT',21,16/10/2001,'adam@gmail.com');
INSERT into dbo.StudentDetails values (3,'CM','IT',21,'2000-03-20','adam@gmail.com');
INSERT into dbo.StudentDetails values (4,'Ananth','IT',21,'2000-03-20 12:13:14','adam@gmail.com');
INSERT into dbo.StudentDetails values (1,'Priya','ECE',22,'2000-03-23','priya@gmail.com');
INSERT into dbo.StudentDetails values (5,'Sai','CSBS',22,'2000-03-23','sai@gmail.com');
INSERT into dbo.StudentDetails values (6,'Kriti','ICE',22,'2000-03-23','kri@gmail.com');

DELETE FROM dbo.StudentDetails WHERE name = 'Priya';

ALTER TABLE dbo.StudentDetails ADD PRIMARY KEY (id); 
ALTER TABLE dbo.StudentDetails ADD Aadhar int NULL;

CREATE TABLE dbo.DeptMaster(deptId int PRIMARY KEY, deptName nchar(15), deptHOD nchar(30));
INSERT into dbo.DeptMaster values (101,'CSE','Aaa');
INSERT into dbo.DeptMaster values (102,'IT','Bbb');
INSERT into dbo.DeptMaster values (103,'ECE','Ccc');
INSERT into dbo.DeptMaster values (104,'EEE','Ddd');
INSERT into dbo.DeptMaster values (105,'MECH','Eee');
INSERT into dbo.DeptMaster values (106,'CIVIL','Fff');

Select * from dbo.StudentDetails;
SELECT * from dbo.DeptMaster;

ALTER TABLE dbo.DeptMaster ALTER COLUMN deptName nchar(20);

ALTER TABLE dbo.StudentDetails ADD id int;
 
ALTER TABLE dbo.StudentDetails DROP COLUMN dept;

UPDATE dbo.StudentDetails SET id=101 WHERE id=1;
UPDATE dbo.StudentDetails SET id=102 WHERE id=2;
UPDATE dbo.StudentDetails SET id=103 WHERE id=3;
UPDATE dbo.StudentDetails SET id=104 WHERE id=4;
UPDATE dbo.StudentDetails SET id=105 WHERE id=5;
UPDATE dbo.StudentDetails SET id=106 WHERE id=6;

alter table dbo.StudentDetails add constraint fk_name foreign key (deptId) references dbo.DeptMaster(deptId);

INSERT into dbo.StudentDetails values (7,'Gangu',22,'2000-03-23','ga@gmail.com',242562,101);
