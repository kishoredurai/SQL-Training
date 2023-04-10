CREATE DATABASE LMS_DB

CREATE TABLE LMS_MEMEBERS
( MEMBER_ID VARCHAR(10) PRIMARY KEY,
  MEMBER_NAME VARCHAR(30),
  CITY VARCHAR(20),
  DATE_REGISTER DATE,
  DATE_EXPIRE DATE,
  MEMBERSHIP_STATUS VARCHAR(15));

CREATE TABLE LMS_SUPPLIERS_DETAILS
( SUPPLIER_ID VARCHAR(3) PRIMARY KEY,
	SUPPLIER_NAME VARCHAR(30),
	ADDRESS VARCHAR(50),
	CONTACT BIGINT,
	EMAIL VARCHAR(15));


INSERT INTO LMS_MEMEBERS VALUES
('LM001','AMIT','CHENNAI','2012-02-12','2013-02-11','Temporary'),
('LM002','ABDHUL','DELHI','2012-04-10','2013-04-09','Temporary'),
('LM003','GAYAN','CHENNAI','2012-05-13','2013-05-12','Permanent'),
('LM004','RADHA','CHENNAI','2012-04-22','2013-04-21','Temporary'),
('LM005','GURU','BANGALORE','2012-03-30','2013-05-16','Temporary'),
('LM006','MOHAN','CHENNAI','2012-04-12','2013-05-16','Temporary');

INSERT LMS_SUPPLIERS_DETAILS VALUES
('S01','SINGAPORE SHOPPEE','CHENNAI',98941235,'sing@gmail.com'),
('S02','JK STORE','MUMBAI',99401234,'jks@yahoo.com'),
('S03','ROSE BOOK STORE','TRIVANDRUM',94444112,'rose@gmail.com'),
('S04','KAVARI STORE','DELHI',863000014,'kavi@redif.com'),
('S05','EINSTEN BOOK GALLARY','US',95420000,'eingal@aol.com'),
('S06','AKBAR STORE','MUMBAI',78556231,'akbakst@aol.com');


create table LMS_FINE_DETAILS(  ID int IDENTITY NOT NULL,  FINE_RANGE as 'R'+Cast(ID as Varchar(10)) PERSISTED PRIMARY KEY,  FINE_AMOUNT int);alter table LMS_FINE_DETAILS alter column FINE_AMOUNT float--INSERTING VALUES INTO LMS_FINE_DETAILS TABLEinsert into LMS_FINE_DETAILS values(0.00);insert into LMS_FINE_DETAILS values(20.00);insert into LMS_FINE_DETAILS values(70.00);insert into LMS_FINE_DETAILS values(100.00);insert into LMS_FINE_DETAILS values(150.00);insert into LMS_FINE_DETAILS values(200.00);select * from LMS_FINE_DETAILS;--LMS_BOOK_DETAILS TABLEcreate table LMS_BOOK_DETAILS(   ID int IDENTITY NOT NULL,   BOOK_CODE as 'BL0000'+Cast(ID as Varchar(10)) PERSISTED PRIMARY KEY,   BOOK_TITLE VARCHAR(50),   CATEGORY VARCHAR(15),   AUTHOR VARCHAR(30),   PUBLICATION VARCHAR(30),   PUBLISH_DATE DATE,   BOOK_EDITION INT,   PRICE FLOAT,   RACK_NUM VARCHAR(3),   DATE_ARRIVAL DATE,   SUPPLIER_ID VARCHAR(3),   FOREIGN KEY(SUPPLIER_ID) REFERENCES LMS_SUPPLIERS_DETAILS(SUPPLIER_ID)   ON DELETE CASCADE);--inserting values into lms_book_details tableINSERT INTO LMS_BOOK_DETAILS(BOOK_TITLE,CATEGORY,AUTHOR,PUBLICATION,PUBLISH_DATE,BOOK_EDITION,PRICE,RACK_NUM,DATE_ARRIVAL,SUPPLIER_ID)VALUES('Java ForvDummies','JAVA','Paul J.Deitel','Prentice Hall','1999-12-10',6,575.00,'A1','1999-12-21','S01'),('Java The Complete Edition','JAVA','Herbert Schildt','Tata Mcgraw Hall','2011-10-10',5,750.00,'A1','2011-12-21','S02'),('Java How To Do Program','JAVA','Paul J.Deitel','Prentice Hall','1999-05-10',6,600.00,'A1','1999-06-10','S03'),('Let Us C','C','Yashavant Kanetkar','BPB Publications','2010-12-11',9,500.00,'A3','2010-12-21','S04'),('Let Us C#','C','Yashavant Kanetkar','BPB Publications','2010-05-12',9,550.00,'A3','2010-06-12','S05'),('Let Us C++','C','Yashavant Kanetkar','BPB Publications','2010-05-12',9,650.00,'A3','2010-06-12','S06');


select * from LMS_BOOK_DETAILS;

CREATE TABLE LMS_BOOK_ISSUE
(BOOK_ISSUE_NO INT IDENTITY(1,1) PRIMARY KEY,
MEMBER_ID VARCHAR(10),
BOOK_CODE VARCHAR(10),
DATE_ISSUE DATE,
DATE_RETURN DATE,
DATE_RETURNED DATE,
BOOK_ISSUE_STATUS VARCHAR(20),
FINE_RANGE VARCHAR(10)
CONSTRAINT fine_range_key FOREIGN KEY (FINE_RANGE) REFERENCES LMS_FINE_DETAILS (FINE_RANGE) ON DELETE CASCADE ,
CONSTRAINT memeber_id_key FOREIGN KEY (MEMBER_ID) REFERENCES LMS_MEMBERS (MEMBER_ID) ON DELETE CASCADE ,
CONSTRAINT bookcode_key FOREIGN KEY (BOOK_CODE) REFERENCES LMS_BOOK_DETAILS (BOOK_CODE) ON DELETE CASCADE );

SELECT * FROM dbo.LMS_MEMBERS;