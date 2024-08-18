select sum(salary) as Salary
from Instructor


select min(salary ) as MinSalary , max (salary) as MaxSalary
from Instructor

-----------------------------------------------------
select count(*),count(st_id),count(st_lname),count(st_age)
from Student
----------------------------------------------------------------

select avg(st_age)
from Student

select avg(isnull(st_age,0))
from student

select sum(st_age)/COUNT(*)
from Student

-------------------------------------------------------
select sum(salary) , Dept_Id --  this  is code not run why ? becouse select show you one row ( sum salary ) and column of Dept_id
from Instructor

-- how to fixed this error ( one row of agg and column of Dept_id ) fixed this by grup by

select sum(salary) , Dept_id
from Instructor
group by Dept_id

select sum(salary), d.Dept_Id , dept_name
from Instructor i inner join Department d
on d.Dept_Id = i.Dept_Id
group by d.Dept_Id , dept_name


select avg(st_age) ,st_address ,dept_id
from Student
group by St_Address , Dept_Id


select sum(salary), Dept_Id
from Instructor
group by Dept_Id


select sum(salary), Dept_Id
from Instructor
where salary>1000
group by Dept_Id
having sum(salary) >100000


select sum(salary), Dept_Id
from Instructor
where salary>1000
group by Dept_Id
having count(ins_id) < 5

---------------------------------------
-- Subqueries ( output of query as input in anthor query )

select *
from Student -- outer query            // inner query
where St_Age<(select avg(st_age)from Student)


select * , (select count(st_id) from Student )
from student


select dept_name 
from Department
where dept_id in (select distinct (dept_id)
                 from Student
				 where Dept_Id is not null )

--------------------------------------------------

-- subquery + DML
delete from Stud_Course
where st_id = 1


delete from Stud_Course
where st_id in (select st_id from Student where St_Address='cairo')

--------------------------------------------------------------------------
-- union family ( union all - union - intersect - except )
-- number of columns select 1 = number of cloumns select 2
-- union and intersct and except --> is distincit

-- union --> summation rows of (st_fname + ins_name)
select st_fname
from Student
union all 
select ins_name
from Instructor 


select st_fname , st_id
from Student
union all
select ins_name , ins_id
from Instructor

-- union same union all but union does distincit
-- union --> distincit of rows ( acsinding name and remove Duplicated )
select st_fname
from Student 
union 
select ins_name
from Instructor

-- intersect --> names of student = names of instructor
-- intersect is distincit (acsinding name and remove Duplicated)
select st_fname 
from Student
intersect 
select ins_name
from Instructor

-- except --> give me names in st_fname not equal ins_name
-- names of Student not equal names of Instructor 
-- expect --> is distincit
select st_fname
from Student
except 
select ins_name
from Instructor

-----------------------------------------------------------------------------------------
select St_fname ,St_Age , dept_id
from Student
order by St_Address

select st_fname , st_age , dept_id
from Student
order by 1 --  1 equal st_fname


select St_fname ,St_Age , dept_id
from Student
order by dept_id , St_Age --Age بي order by بس لو لقي مجموعة طلبة في نفس القسم يبقا يعمل dept_Id هيرتب الاول ب  

select St_fname ,St_Age , dept_id
from Student
order by dept_id asc , St_Age desc



delete from Department Where dept_id =20 

update Department set Dept_Id = 4000 where dept_id = 20

--------------------------------------------------------------------------------------------

-- builtin Functions
-- Agg Functions - getdate() - isnulll - coalesce - Concat - Convert

select year(getdate()) -- get the current year 

select month(getdate()) -- get the current Month

select substring (st_fname ,1,3)  -- substring of name of 3 chars
from Student


select db_name() -- how can i know my database


select suser_name() -- how can i know user does login in database