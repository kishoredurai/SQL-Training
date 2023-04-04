select concat('hi','hello');

select * from DeptMaster;
select * from StudentDetails;
select CONCAT(deptName,deptHOD) from DeptMaster;
select CONCAT(trim(name),'Email: ',trim(email)) from StudentDetails; -- trim() used to removed the unvanted space in data
select CONCAT(ltrim(name),'Email: ',rtrim(email)) from StudentDetails;

select replace(department,'I','C') from StudentDetails

select replace('hieveryone','e','e');