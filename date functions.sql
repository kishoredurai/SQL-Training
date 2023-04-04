---select dateadd(year,2,'2023-1-20');
--select DATEDIFF(minute,'2023-12-12 12:00:00','2023-12-12 11:59:59');
select DATEDIFF_BIG(second,'2023-12-12 12:00:00','2023-12-12 11:59:59');
select DATEPART(day,'2023-12-02'); -- return month,year or date

select DATEFROMPARTS(2023,12,20);  -- if format is not know we can use to get date fromdb

