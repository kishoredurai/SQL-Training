select concat('hi','hello');

select * from DeptMaster;
select * from StudentDetails;
select CONCAT(deptName,deptHOD) from DeptMaster;
select CONCAT(trim(name),'Email: ',trim(email)) from StudentDetails; -- trim() used to removed the unvanted space in data
select CONCAT(ltrim(name),'Email: ',rtrim(email)) from StudentDetails;

select replace(department,'I','C') from StudentDetails

select replace('hieveryone','e','e');

select SUBSTRING(email,-2,5)from StudentDetails

select TRANSLATE('helloee','eow','nkw'); -- replace the character

select TRANSLATE(email,'ma','ke') from StudentDetails

select replace(department,'IT','CT') from StudentDetails

select LOWER('HELLOO');

select upper(email) from StudentDetails;

select str(458.31298,8,5);

select right('welcome',3);
select left('welcome', 3);

select * from StudentDetails;
update StudentDetails set department = (replace(department, 'IT' , 'CT'));

