select * from student;
select * from department;
select * from address;
select * from log;

alter table log add transactionid BIGINT;

create table log
(id int not null,
TIMESTAMP nchar(30))

CREATE or alter TRIGGER StudentInsertTrigger
ON student
AFTER INSERT
AS
insert into log values ((select COUNT(*) from log)+1 ,CURRENT_TIMESTAMP,NEWID() );


insert into student values (12,'tharun','Computer Science','tharun@gmail.com',4)


ALTER TABLE student
 alter column INT AUTO_INCREMENT PRIMARY KEY;

 ALTER TABLE student
alter column StudId INT  AUTO_INCREMENT PRIMARY KEY;




