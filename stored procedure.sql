CREATE PROCEDURE FetchStudentDetails
AS 
select * from Student;
select * from Department;
EXEC FetchStudentDetails;



create or alter procedure fetchstudentdetails @id int As
select * from student where StudId=@id;

exec fetchstudentdetails 9;

/*
create procedure FetchCustomerDetails as
select * from Customers;
exec FetchCustomerDetails;

alter procedure FetchCustomerDetails @customerAddress nchar(50) As
select * from Customers where address=@customerAddress;

exec FetchCustomerDetails '123, xyz';

create procedure InsertOrderDetails @productName nchar(30), @customerId int as
insert into Orders values(@productName, @customerId);

exec InsertOrderDetails 'krt', 6;

create or alter procedure UpdateOrderDetails @tableName , @productName nchar(30), @customerId int as
declare @tempName nchar(30), @table nchar(30)
set @tempName = 'word'+@productName
update  set product = @tempName where customerid=@customerId;

exec UpdateOrderDetails 'Orders', 'laptop', 2;

select * from Orders;

CREATE OR ALTER PROCEDURE xyz
@TableName NVARCHAR(128) , @productName nchar(30), @customerId int
AS
  SET NOCOUNT ON;
  DECLARE @Sql NVARCHAR(MAX);

SET @Sql = 'update ' + @TableName + ' set product=''' + TRIM(@productName) + ''' where customerId=' + TRIM(STR(@customerId))
 PRINT(@SQL)
 EXECUTE sp_executesql @Sql

exec xyz 'Orders', 'ABCX', 2;

*/


select * from Student;
select * from Department;
select * from Address;


create procedure studentinfo @studentname nchar(30), @studentDept nchar(30) 
AS
insert into Student values(@studentname , @studentDept)

exec studentinfo 'kishore' , 'Computer Science';



create or alter procedure deletewithIdfromStudent @stid int
as
delete from Student where StudId = @stid;


/*
exec deletewithIdfromStudent 1;
*/

create or alter procedure UpdatewithIDstudent @id int , @deptinp nchar(30) = 'Electrical Engineering'
as
/*declare @dept nchar(30);
set @dept = @deptinp;
if @dept = ''
	set @deptinp = 'Electrical Engineering'*/
update student set StudDept = @deptinp where StudId = @id;

exec UpdatewithIDstudent 3 ,'Computer Science';


create procedure FetchStudentBasedonAdressid @id int,@studentname nchar(30) output as
select @studentname = StudName from Student where
StudAdd = (select AddId from Address where AddId = @id)




declare @studentname nchar(30);
exec FetchStudentBasedonAdressid 2,@studentname output;
print(@studentname);



select * from Student;
select * from Department;
select * from Address;

-- call from another procedure

create or alter procedure insertdataIntoStudent @id int, @name nchar(30),@dept nchar(30),@email nchar(30),@addid int
as
insert into student values (@id,@name,@dept,@email,@addid);


create or alter procedure callInsertProcedure @id int,@name nchar(30),@dept nchar(30)
as
declare @email nchar(30),@addid int
set @email= 'kumar@gmail.com'
set @addid = 2
exec insertdataIntoStudent @id,@name,@dept,@email,@addid;

exec callInsertProcedure 7,'kishore','Computer Science';


-- statement with try catch block


create or alter procedure fetchstudentinfo
as
begin try
update student set StudId = 2 where StudId =3
end try
begin catch
declare @errorMessage varchar(255);
set @errorMessage = 'Duplicate data';
print(@errorMessage);
end catch

exec fetchstudentinfo;



-- without try catch block
create or alter procedure fetchstudentinfo
as
update student set StudId = 2 where StudId =3


exec fetchstudentinfo;


create or alter 