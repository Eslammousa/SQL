use ITI

-- Cross join 
select st_fname, dept_name
from Student , Department

select st_fname, dept_name
from Student cross join Department

----------------------------------------------------------------

-- inner join

select st_fname, dept_name
from Student , Department  
where Department.Dept_Id = Student.Dept_Id

select st_fname, dept_name
from Student inner join Department  
on Department.Dept_Id = Student.Dept_Id

select st_fname, dept_name
from Student S , Department D  
where S.Dept_Id = D.Dept_Id and St_Address = 'alex'
order by Dept_Name Desc 

--------------------------------------------------------------------

-- Outer join (1- eft  2- Right 3- Full )

-- left outer join 
select st_fname, dept_name
from Student S left outer join Department D  
on S.Dept_Id = D.Dept_Id

-- right outer join
select st_fname, dept_name
from Student S right outer join Department D  
on S.Dept_Id = D.Dept_Id

-- Full outer join
select st_fname , dept_name
from Student S full outer join Department D
on S.Dept_Id = D.Dept_Id

-------------------------------------------------------------------------------------

-- self join
select X.St_Fname as Sname ,Y.*
from student X , Student Y -- Y --> perant ( have Primary Key ) - x --> Child ( have Forgin Key ) in Database
where Y.St_Id= X.St_Id


-----------------------------------------------------------------------------
-- join Multi tables
 select st_fname , Crs_Name ,grade
 from Student S , Stud_Course SC , Course C
 where S.St_Id = sc.St_Id and C.Crs_Id = SC.Crs_Id


 select st_fname , Crs_Name ,grade ,dept_name
 from Student S inner join Stud_Course SC 
 on S.St_Id = sc.St_Id 
 inner join  Course C
 on C.Crs_Id = SC.Crs_Id
 inner join Department D
 on d.Dept_Id = s.St_Id

 -----------------------------------------------------------------------------------------
 -- join with DML
 -- join update

 -- update rows back from join
 update Stud_Course
       set Grade+=10
 from student s , Stud_Course sc  
 where s.St_Id = sc.St_Id and St_Address = 'Cairo'
 -- from --> where --> update
  update sc
       set Grade+=10
 from student s , Stud_Course sc
 where s.St_Id = sc.St_Id and St_Address = 'Cairo'

 ----------------------------------------------------
  select st_fname
 from Student 
 where St_Fname is not null

-- how can i replace null for value

select isnull (st_fname , '')  -- replace null to space
from Student

select isnull(st_fname , 'has no name ') -- replace null to has no name
from Student


select isnull(st_fname , st_lname ) as new_name -- replace null to anthor Column
from Student


select coalesce(st_fname , st_lname,st_address ,'No Data') -- Multireplace 
 
 ----------------------------------------------------------------------------------------

 -- how can i concat two column in one column
 select st_fname +' '+ st_lname as full_name
 from Student

 -- Concat two column but two column not the same type
 select st_fname + ' ' + convert(varchar(2) , st_age)
 from Student

 select 'studname = '+ st_fname +'   &age = '+convert(varchar(2) , st_age)
 from Student

 -- لو عملت كونكات ل عمودين وفيه عمود فيه قيمة فاضية قيمة الصف كلها هتبقا فاضية

select isnull('studname = '+ st_fname ,'' )+'   &age = '+convert(varchar(2) , isnull(st_age , 0))
from Student

-- use to function Concat 
-- what will do function concat ( changing every column to string if (date - int - float) and replace null value to Empty string or age
select concat(st_fname ,' ', st_age) 
from student

----------------------------------------------------------------------------------------
select * 
from Student 
where st_fname = 'ahmed'

select * 
from Student 
where st_fname like 'ahmed'

select *
from Student
where St_Fname like 'a%' -- select every name the st_fname start 'a'


select *
from Student
where St_Fname like '%a' -- selevt every name the st_fname end 'a'

select * 
from Student 
where St_Fname like '%a%' -- select every name containe 'a'


select * 
from Student 
where st_fname like '_a%' -- s    elect every name the second char has 'a'

-- 'a%h' string first char has 'a' and last char 'h'
-- '%a_' string last second has 'a'
-- 'ahm%' string start ahm
-- '[ahm]%' string start 'a' or 'h' or 'm' 
-- '[^ahm]%' string not start 'a' or 'h' or 'm'
-- '[a-h]%'  string  start of range of 'a' to 'h'
-- '[^a-h]%' string not start of range of 'a' to 'h'
-- '%[%]'  string end '%'
-- '%[_]%' string the middle has '_'  ahmed-ail  - eman_omar
-- '[_]%[_]' string start '_' and end '-'  -eslam-


select st_fname ,dept_id , st_age
from Student
order by St_Address -- Column order by should'nt be in select

select st_fname , dept_id , st_age
from Student
order by 1    -- order by using the first column in select ( st_fname)


select st_fname , dept_id , st_age 
from Student
order by dept_id , st_age 
-- هيرتب ب القسم ولو كان القسم فيه قيم متكررة هيرتب ب العمر 

