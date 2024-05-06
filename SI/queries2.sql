
drop table if exists enrollments;
drop table if exists courses;
drop table if exists students;

create table students (
    student_id serial primary key,
    firstname varchar(50),
    lastname varchar(50),
    birthdate date
);

create table courses (
    course_id serial primary key,
    course_name varchar(50),
    teacher varchar(50)
);

create table enrollments (
    student_id int references students(student_id),
    course_id int references courses(course_id),
    grade int,
    primary key (student_id, course_id)
);

insert into students(firstname, lastname, birthdate) values 
    ('João', 'Silva', '1999-01-01'),
    ('Maria', 'Santos', '1998-02-02'),
    ('Pedro', 'Ferreira', '1997-03-03'),
    ('Ana', 'Oliveira', '1996-04-04');

insert into courses(course_name, teacher) values 
    ('Matemática', 'Prof. A'),
    ('Física', 'Prof. B'),
    ('Química', 'Prof. C'),
    ('Biologia', 'Prof. D');

insert into enrollments(student_id, course_id, grade) values 
    (1, 1, 10),
    (1, 2, 11),
    (1, 3, 12),
    (1, 4, 13),
    (2, 1, 14),
    (2, 2, 15),
    (2, 3, 16),
    (2, 4, 17),
    (3, 1, 18),
    (3, 2, 19),
    (3, 3, 20),
    (3, 4, 21),
    (4, 1, 22),
    (4, 2, 23),
    (4, 3, 24),
    (4, 4, 25);

-- Escreva uma função para retornar a idade de um estudante com base no seu `StudentID`.
create or replace function student_age(st_id int)
returns int
as $$
declare
	student_age int;
begin
	select extract(year from age(birthdate)) into student_age from students where student_id = st_id;
	return student_age;
end;$$
language plpgsql;

select student_age(1);

--Escreva um procedimento armazenado para adicionar um novo estudante à tabela `Students`.
create or replace procedure add_student(fname varchar(50), lname varchar(50), birthdate date)
as $$
begin
	insert into students(firstname, lastname, birthdate) values (fname, lname, birthdate);
end;$$
language plpgsql;

call add_student('Joaquim', 'Manel', '1997-03-03');
select * from students;

--Escreva um procedimento armazenado para adicionar um novo curso à tabela `Courses`.
create or replace procedure add_course(course varchar(50), teacher varchar(50))
as $$
begin 
	insert into courses(course_name, teacher) values (course, teacher);
end;$$
language plpgsql;

call add_course('SI', 'Manel');
select * from courses;

--Escreva um procedimento armazenado para inscrever um estudante num curso.
create or replace procedure add_enrollment(st_id int, cr_id int)
as $$
begin
	insert into enrollments(student_id, course_id) values (st_id, cr_id);
end;$$
language plpgsql;

call add_enrollment(1, 5);
select * from enrollments;

--Escreva uma função para retornar a média de notas de um estudante.
drop function avg_grades;
create or replace function avg_grades(st_id int)
returns numeric
as $$
declare
	avg_grades int;
begin
	select avg(grade) into avg_grades from enrollments where student_id = st_id;
end;$$
language plpgsql;

select avg_grades(3);

--Escreva um procedimento armazenado que atualize a nota de um estudante num curso.
create or replace procedure update_grade(st_id int, cr_id int, new_grade int)
as $$
begin 
	update enrollments set grade = new_grade where student_id = st_id and course_id = cr_id;
end;$$
language plpgsql;

call update_grade(1, 2, 100);
select * from enrollments;

--Escreva um cursor para retornar todos os cursos em que um estudante está inscrito.
drop procedure get_students_courses

create or replace procedure get_students_courses(st_id int)
as $$
declare 
	cur cursor for select course_name from courses c join enrollments e on c.course_id = e.course_id where e.student_id = st_id;
	name varchar(50);
begin
	open cur;
	loop
		fetch next from cur into name;
		exit when not found;
		raise notice 'course_name = %', name;
	end loop;
	close cur;
end;$$
language plpgsql;

call get_students_courses(2);

--Escreva um cursor para retornar todos os estudantes inscritos num curso.
drop procedure course_students 

create or replace procedure course_students(cr_id int)
as $$
declare 
	cur cursor for select firstname from students s join enrollments e on s.student_id = e.student_id where e.course_id = cr_id;
	student_name text;
begin 
	open cur;
	loop
		fetch next from cur into student_name;
		exit when not found;
		raise notice 'student_name = %', student_name;
	end loop;
	close cur;
end;$$
language plpgsql;

call course_students(1);

--Escreva uma função para retornar o número total de estudantes. 
create or replace function total_students() 
returns int
as $$
declare 
	total_students int;
begin 
	select count(firstname) from students into total_students;
	return total_students;
end;$$
language plpgsql;

select * from students;
select total_students();

--Escreva uma função para retornar o número total de cursos.
create or replace function total_courses()
returns int
as $$
declare 
	total_courses int;
begin 
	select count(course_name) from courses into total_courses;
	return total_courses;
end;$$
language plpgsql;

select * from courses;
select total_courses();

--Escreva um procedimento armazenado para remover um estudante de um curso.
drop procedure remove_student_course;
create or replace procedure remove_student_course(st_id int)
as $$
begin 
	delete from enrollments where student_id = st_id;
end;$$
language plpgsql

call remove_student_course(2);
select * from enrollments;

--Escreva um procedimento armazenado para remover um estudante da tabela `Students`.
create or replace procedure remove_student(st_id int)
as $$
begin 
	delete from students where student_id = st_id;
end;$$
language plpgsql;

call remove_student(4);
select * from students;

--Escreva um procedimento armazenado para remover um curso da tabela `Courses`.
create or replace procedure remove_course(cr_id int)
as $$
begin
    delete from enrollments where course_id = cr_id;
    delete from courses where course_id = cr_id;
end;$$
language plpgsql;

call remove_course(1);
select * from courses;

--Escreva um cursor para retornar todos os estudantes que estão inscritos em pelo menos um curso.
create or replace procedure enrollment_student()
as $$
declare 
	cur cursor for select firstname from students s join enrollments e on s.student_id = e.student_id;
	student_name text;
begin 
	open cur;
	loop
		fetch next from cur into student_name;
		exit when not found;
		raise notice 'student_name = %', student_name;
	end loop;
	close cur;
end;$$
language plpgsql;

call enrollment_student();

--Escreva um cursor para retornar todos os cursos que têm pelo menos um estudante inscrito.
create or replace procedure enrollment_course()
as $$
declare 
	cur cursor for select course_name from courses c join enrollments e on c.course_id = e.course_id;
	course_name text;
begin 
	open cur;
	loop
		fetch next from cur into course_name;
		exit when not found;
		raise notice 'course_name = %', course_name;
	end loop;
	close cur;
end;$$
language plpgsql;

call enrollment_course();

--Escreva uma função para retornar o curso com o maior número de estudantes inscritos.
create or replace function max_students_course()
returns text
as $$
declare 
	count_students text;
begin 
	select course_name, count(student_id) into count_students 
	from courses c join enrollments e on c.course_id = e.course_id
	group by course_name 
	order by count_students desc 
	limit 1;
	return count_students;
end;$$
language plpgsql;

select max_students_course();

--Escreva uma função para retornar o estudante com a maior média de notas.
create or replace function max_avg()
returns text
as $$
declare
	avg_grades text;
begin
	select firstname, avg(grade) into avg_grades 
	from students s join enrollments e on s.student_id = e.student_id
	group by firstname
	order by avg_grades desc
	limit 1;
	return avg_grades;
end;$$
language plpgsql;

select max_avg();

--Escreva um procedimento armazenado que atualize o nome de um curso.
create or replace procedure update_course_name(cr_id int, new_name varchar(50))
as $$
begin
	update courses set course_name = new_name where course_id = cr_id;
end;$$
language plpgsql;

call update_course_name(4, 'PC')
select * from courses;

--Escreva um procedimento armazenado que atualize o nome de um estudante.
create or replace procedure update_student_name(st_id int, new_firstname varchar(50), new_lastname varchar(50))
as $$
begin
	update students set firstname = new_firstname, lastname = new_lastname where student_id = st_id;
end;$$
language plpgsql;

call update_student_name(1, 'Manel', 'Silva');
select * from students;

--Escreva um cursor para retornar todos os estudantes que não estão inscritos em nenhum curso.
create or replace procedure not_enroll_students()
as $$
declare 
	cur cursor for select firstname from students where student_id not in (select distinct student_id from enrollments);
	student_name text;
begin 
	open cur;
	loop 
		fetch next from cur into student_name;
		exit when not found;
		raise notice 'student_name = %', student_name;
	end loop;
	close cur;
end;$$
language plpgsql;

call not_enroll_students();

--Escreva um cursor para retornar todos os cursos que não têm nenhum estudante inscrito.
create or replace procedure not_enroll_courses()
as $$
declare 
	cur cursor for select course_name from courses where course_id not in (select distinct course_id from enrollments);
	course_name text;
begin 
	open cur;
	loop
		fetch next from cur into course_name;
		exit when not found;
		raise notice 'course_name = %', course_name;
	end loop;
	close cur;
end;$$
language plpgsql;

call not_enroll_courses();

--Escreva uma função para retornar o curso com o menor número de estudantes inscritos.
create or replace function minor_course_enroll()
returns text
as $$
declare 
	st_count int;
begin 
	select course_name, count(student_id) into st_count 
	from courses c join enrollments e on c.course_id = e.course_id
	group by course_name 
	order by st_count asc 
	limit 1;
	return course_name;
end;$$
language plpgsql;

select minor_course_enroll();

--Escreva uma função para retornar o estudante com a menor média de notas.
create or replace function min_avg()
returns text
as $$
declare
	avg_grades text;
begin
	select firstname, avg(grades) into avg_grades 
	from students join enrollments on student_id = st_id 
	group by firstname
	order by avg_grades asc
	limit 1;
end;$$
language plpgsql;

--Escreva um procedimento armazenado que atualize a data de nascimento de um estudante.
create or replace procedure update_birthdate(st_id int, new_birthdate date)
as $$
begin 
	update students set birthdate = new_birthdate where students_id = st_id;
end;$$
language plpgsql

--Escreva um procedimento armazenado que atualize o professor de um curso.
create or replace procedure update_teacher(cr_id int, new_teacher varchar(50))
as $$
begin
	update courses set teacher = new_teacher where course_id = cr_id;
end;$$
language plpgsql

--Escreva uma função para retornar o estudante mais velho.
create or replace function oldest_student()
returns text
as $$
declare 
	student_name text;
	student_age int;
begin
	select firstname, extract(year from age(birthdate)) into student_age from student
	group by student_age 
	order by firstname desc
	limit 1;
	return student_name;
end;$$
language plpgsql

--Escreva um procedimento armazenado que atualize a nota de um estudante num curso e lance um erro se a nota for menor que 0 ou maior que 100.
create or replace procedure update_student_grade(course_id int, new_grade int)
as $$
begin
	if grade between 0 and 100 then 
		update enrollments set grade = new_grade where cr_id = course_id;
	else 
		raise exception 'A nota não está no intervalo pretendido';
	end if;
end;$$
language plpgsql;


