--1
SELECT SUPPLIER_ID,SUPPLIER_NAME,EMAIL FROM LMS_SUPPLIERS_DETAILS WHERE EMAIL LIKE '%gmail%'

--17
SELECT SUPPLIER_ID,SUPPLIER_NAME,COALESCE(CONTACT,EMAIL,ADDRESS) AS CONTACTDETAILS  FROM LMS_SUPPLIERS_DETAILS

 --22

 select t1.MEMBER_ID,t2.MEMBER_NAME from LMS_BOOK_ISSUE t1 join LMS_MEMBERS t2 on t1.MEMBER_ID=t2.MEMBER_ID where t1.DATE_RETURN>=t1.DATE_RETURNED and YEAR(t1.DATE_RETURNED)=2012

 --23
 select RACK_NUM,COUNT(book_code) as NO_OF_BOOKS from LMS_BOOK_DETAILS group by RACK_NUM

 --24

 Select BOOK_ISSUE_NO,MEMBER_NAME,DATE_REGISTER,DATE_EXPIRE,BOOK_TITLE,CATEGORY, PRICE, DATE_ISSUE,DATE_RETURN,DATE_RETURNED,(select FINE_AMOUNT from LMS_FINE_DETAILS f where i.FINE_RANGE= f.FINE_RANGE)as FINE_AMOUNT 
 from LMS_BOOK_ISSUE i,LMS_MEMBERS m,LMS_BOOK_DETAILS b where i.MEMBER_ID=m.MEMBER_ID and b.BOOK_CODE=i.BOOK_CODE

 --25