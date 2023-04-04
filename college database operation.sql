CREATE DATABASE college;

USE college;

CREATE TABLE Department (
  DeptId INT PRIMARY KEY,
  DeptName VARCHAR(50) NOT NULL Candidate key,
  DeptHead VARCHAR(50) NOT NULL,
  Deptemail VARCHAR(50) NOT NULL
);

CREATE TABLE Address (
  AddId INT PRIMARY KEY,
  Address VARCHAR(50) NOT NULL,
  City VARCHAR(50) NOT NULL,
  State VARCHAR(50) NOT NULL,
  Country VARCHAR(50) NOT NULL,
  Pincode VARCHAR(10) NOT NULL
);

ALTER TABLE Department
ADD CONSTRAINT CK_DeptName UNIQUE (DeptName);

CREATE TABLE Student (
  StudId INT PRIMARY KEY,
  StudName VARCHAR(50) NOT NULL,
  StudDept VARCHAR(50) NOT NULL,
  Studemail VARCHAR(50) NOT NULL,
  StudAdd INT NOT NULL,
  FOREIGN KEY (StudDept) REFERENCES Department(DeptName),
  FOREIGN KEY (StudAdd) REFERENCES Address(AddId)
);



INSERT INTO Department (DeptId, DeptName, DeptHead, Deptemail)
VALUES
(1, 'Computer Science', 'Dr. John Doe', 'cs@college.edu'),
(2, 'Electrical Engineering', 'Dr. Jane Smith', 'ee@college.edu'),
(3, 'Mechanical Engineering', 'Dr. Mark Lee', 'me@college.edu'),
(4, 'Civil Engineering', 'Dr. Sarah Johnson', 'ce@college.edu'),
(5, 'Chemical Engineering', 'Dr. Mike Brown', 'che@college.edu');

-- Sample data for Address table
INSERT INTO Address (AddId, Address, City, State, Country, Pincode)
VALUES
(1, '123 Main Street', 'Los Angeles', 'California', 'USA', '90001'),
(2, '456 Oak Street', 'New York', 'New York', 'USA', '10001'),
(3, '789 Maple Avenue', 'Chicago', 'Illinois', 'USA', '60601'),
(4, '1010 Elm Street', 'Houston', 'Texas', 'USA', '77002'),
(5, '1111 Pine Street', 'San Francisco', 'California', 'USA', '94109');

-- Sample data for Student table
INSERT INTO Student (StudId, StudName, StudDept, Studemail, StudAdd)
VALUES
(1, 'Alice Johnson', 'Computer Science', 'alice.johnson@college.edu', 1),
(2, 'Bob Smith', 'Electrical Engineering', 'bob.smith@college.edu', 2),
(3, 'Charlie Brown', 'Mechanical Engineering', 'charlie.brown@college.edu', 3),
(4, 'Diana Lee', 'Civil Engineering', 'diana.lee@college.edu', 4),
(5, 'Emma Davis', 'Chemical Engineering', 'emma.davis@college.edu', 5);

update student set StudDept='Electrical Engineering' where StudId=2;

select * from student;
select * from Department;
select * from Address;