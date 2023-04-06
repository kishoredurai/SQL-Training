select * from student where StudAdd = 2;
select * from Address;
select * from Department;


-- user defined function

create or alter function FetchStudentDetailsCount (@Addid int) RETURNS nchar(30) as
BEGIN
 return (select StudName from Student where StudAdd = @Addid)
END;

print dbo.FetchStudentDetailsCount(3);


-- user defined function return multiple using variable

create or alter function FetchStudentDetail1 (@Addid int) RETURNS 
 TABLE
 as
return select * from Student where StudAdd = @Addid;

select * from FetchStudentDetail1(2);





-- user defined function return multiple using variable

create or alter function FetchStudentDetailsss (@Addid int) RETURNS 
@tabletype TABLE(id int,name nchar(30),department nchar(30),email nchar(30))
 as
 begin
 insert into @tabletype select StudId,StudName,StudDept,Studemail from Student where StudAdd = @Addid;
 return;
end

 -- function return as multiple rows
select * from FetchStudentDetailsss(2);


 

 -- insert values into function

 create or alter function udatemail (@Addid int) RETURNS 
@tabletype TABLE(id int,name nchar(30),department nchar(30),email nchar(30))
 as
 begin
 declare @
 insert into @tabletype select StudId,StudName,StudDept,Studemail from Student where StudAdd = @Addid;
 return;
end



/*
CREATE OR ALTER FUNCTION EXE_EMPLOYEE () RETURNS TABLEAS	RETURN(SELECT * FROM EMPLOYEE)CREATE TYPE SINGLE_COL AS TABLE(VALUES_ONE INT);CREATE OR ALTER FUNCTION COUNT_OF_VAL_IN_RANGE (@TB_NAME SINGLE_COL READONLY ,@START INT,@END INT) RETURNS INTASBEGIN	DECLARE @SUBQUERY VARCHAR(MAX)	RETURN(SELECT COUNT(*) FROM @TB_NAME)ENDDECLARE @TB_NAME SINGLE_COLINSERT INTO @TB_NAME EXEC('SELECT SALARY FROM EMPLOYEE')PRINT DBO.COUNT_OF_VAL_IN_RANGE(@TB_NAME,2000,7000)EXEC DISPLAY_DETAILS;*/