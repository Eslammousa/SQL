use Train

--DDL ( Create and alter and drop )

Create table Emp (

eid int primary key  ,
ename varchar(20) not null , 
eage int ,
eadd varchar(20) default 'cairo' ,
hirdate date default getdate() , 
Dnum int 
)


-- alter   لو هضيف كولوم او اغير كولوم او احذف كولوم او اغير داتا تايب لي الكولوم

alter table Emp add sal int               -- Add Coulmn Sal in a table Emp
alter table Emp alter column sal bigint   -- Change Data type in a Column Sal
alter table Emp drop column sal           -- Delete column sal form table Emp


-- drop 

drop table Emp             -- drop table form database


------------------------------------------------------------------------------------------------------

-- DML ( insert and update and delete )

--- insert

insert into Emp      -- لو عايز تحط داتا جوه الجدول طول ما انت مش محددالكولوم لازم تدخل الداتا بنفس ترتيب الكولوم   
values(3,'Eslam',20,'alex','1/1/2010',null)  


insert into Emp (ename,eid) -- ده هيدخل داتا بس لي كولوم متحددهم من غير بقا مترتب الداتا ولا الكلام ده
values('eman',4)

 
insert into Emp (ename,eid)  -- ده لو عايز تدخل اكتر من صف لنفس الكولوم من في نفس الكويري
values('eman',5), ('Ali' , 6) , ('moahmed', 7)


-- update

update Emp          -- اللي رقمه 1 id هيغير الاسم والعمل ل 
set ename = 'Mousa' , eage = 21   
where eid=1

update Emp
set eage+=1

update Emp 
set ename=NULL



-- delete

delete from Emp   --  هيفضي الجدول كله من الداتا اللي فيه بس هيسيب الكولوم 
drop table Emp   --  انما ده هيسمح كل حاجه سواء داتا او كولوم او جدول

delete from Emp  --  رقمه 1 id هنا بقول اسمح الصف اللي 
where eid=1


---------------------------------------------------------------------------------------------------------------

-- DQL 
use Company_SD
select * from employee


select Fname , Lname
from employee


select *
from employee 
order by Bdate desc


use Company_SD
select fname+' '+ lname as 'Full name'
from employee


use Company_SD
select *
from employee
where Dno is not null


use ITI
select *
from Student


select distinct st_Fname
from student

select st_fname , St_Age
from student 
where St_Age = 24


select *
from student 
where St_Address = 'Mansoura' or St_Address = 'Alex'


select *
from Student 
where St_Address in ('cairo' , 'Mansoura' , 'Alex')


select *
from student
where st_age>=23 and st_age<=25


select *
from student
where St_age between 23 and 25



