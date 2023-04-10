create database emp;
CREATE TABLE Employee (
    empno INT PRIMARY KEY,
    ename VARCHAR(50),
    job VARCHAR(50),
    manager INT,
    hiredate DATE,
    salary DECIMAL(7, 2),
    commission DECIMAL(7, 2),
    deptno INT
);

INSERT INTO employee (empno, ename, job, manager, hiredate, salary, commission, deptno) VALUES
(1, 'John Doe', 'Manager', NULL, '2022-01-01', 10000.00, NULL, 10),
(2, 'Jane Smith', 'Clerk', 1, '2022-01-15', 5000.00, 1000.00, 10),
(3, 'Bob Johnson', 'Salesman', 1, '2022-02-01', 6000.00, 2000.00, 20),
(4, 'Alice Lee', 'Salesman', 1, '2022-02-15', 5500.00, 1500.00, 20),
(5, 'Tom Wilson', 'Clerk', 1, '2022-03-01', 4000.00, 500.00, 10);

CREATE FUNCTION displayEmployees()
RETURNS TABLE
AS
RETURN SELECT * FROM Employee;


select * from displayEmployees()


CREATE PROCEDURE InsertEmployee
    @empno INT,
    @ename VARCHAR(50),
    @job VARCHAR(50),
    @manager INT,
    @hiredate DATE,
    @salary DECIMAL(10,2),
    @commission DECIMAL(10,2),
    @deptno INT
AS
BEGIN
    INSERT INTO Employee (empno, ename, job, manager, hiredate, salary, commission, deptno)
    VALUES (@empno, @ename, @job, @manager, @hiredate, @salary, @commission, @deptno)
END


EXEC InsertEmployee 8088 , 'Ramesh', 'CLERK', 8789, '2022-08-09', 4500.00, NULL, 10;



-- 
CREATE or alter FUNCTION countEmployees()
RETURNS INT
AS
BEGIN
  DECLARE @count INT
  SELECT @count = COUNT(*) FROM Employee
  RETURN @count
END


SELECT dbo.countEmployees() AS EmployeeCount


CREATE or alter FUNCTION searchEmployeesByDept(@deptno INT)
RETURNS TABLE
AS
RETURN SELECT * FROM Employee WHERE deptno = @deptno;


select * from searchEmployeesByDept(10);



CREATE PROCEDURE sortEmployees
AS
BEGIN
  SELECT *
  FROM Employee
  ORDER BY empno
END


EXEC sortEmployees;

CREATE PROCEDURE updateLastInsertedSalaryTo500
AS
BEGIN
  DECLARE @lastEmployeeId INT
  
  SELECT TOP 1 @lastEmployeeId = empno
  FROM Employee
  ORDER BY empno DESC
  
  UPDATE Employee
  SET salary = 500
  WHERE empno = @lastEmployeeId
END


EXEC updateLastInsertedSalaryTo500;


CREATE PROCEDURE DeleteLastInsertedRecord
AS
BEGIN
    DELETE FROM Employee
    WHERE empno = (SELECT MAX(empno) FROM Employee)
END


EXEC DeleteLastInsertedRecord;
