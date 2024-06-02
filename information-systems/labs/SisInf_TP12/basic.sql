/*#####################################
#
#	ISEL, ND, 2022-2024
#
# Didactic material to support 
# to the curricular unit of 
# Information Systems, LEIC
#
# The examples may not be complete and/or totally correct 
# They are being developed for pedagogical purposes
# Any inaccuracies are the subject of discussion
# in class. Tested DBeaver v24.0.4 + PostgreSQL 16
#
#######################################*/
start transaction;
do $$
begin

drop table if exists public.StudentCourse;
drop table if exists public.Student;
drop table if exists public.Course;
drop table if exists public.Country;

create table public.Country
(
	countryId serial primary key,
	name varchar(50) not null unique
);


create table public.Student
(
	studentNumber int primary key,
	name varchar(256) not null,
	dateBirth Date,
	sex char check(sex in('M','F')) not null,

	country int not null references public.Country
);

create table public.Course
(
	courseId serial primary key,
	name varchar(256) not null
);

create table public.StudentCourse
(
	studentId int references  public.Student,
	courseId int references public.Course,
	primary key(studentId,courseId)
);

/*populate with sample values */
insert into public.Country(name) values ('Portugal'),('Spain'),('Ireland'),('Greece');
insert into public.Student(studentNumber,name,dateBirth,sex,country) values (123,'Bob','1970-01-01','M',1),(124,'Alice','1971-01-10','F',2),(999,'Carol','1990-02-14','F',3);
insert into public.Course(name) values ('Sistemas de Informação'), ('Programação Concorrente'), ('Comunicação Digital');
insert into public.StudentCourse(studentId,courseId) values (123,1),(124,2),(999,3),(123,2),(123,3);

exception
when others then null; /* Get all errors*/
raise warning E'Got exception:
        SQLSTATE: % 
        SQLERRM: %', SQLSTATE, SQLERRM; 
/**
 * Exception is propagated as a warning to terminate the transaction
 */       
end;

$$ Language 'plpgsql';

create or replace function rand_fx(seed int)
returns numeric(6,2)
volatile
language plpgsql
as 
$$
begin
    return random()*seed;
end;
$$;

create or replace function fromCountry(k int) 
RETURNS SETOF Student
LANGUAGE plpgsql
as
$$
begin
	RETURN QUERY
		select * from Student where country  = k;
end; $$ ;


create or replace function getCoursesfromStudents(k int) 
RETURNS SETOF Course
LANGUAGE plpgsql
as
$$
begin
	RETURN QUERY
		select c.* from StudentCourse sc inner join Course c on (sc.courseId = c.courseId) where sc.studentId = k;
end; $$ ;
commit;


/* select *  from student;
 * select * from Country;
 * select * from StudentCourse;
 * */