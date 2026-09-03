-- Many-to-Many relationship

create table students(
    student_id int primary key,
	student_name varchar(100)
);

insert into students (student_id,student_name) values
(1,'Anuj'),(2,'Anij'),(3,'Sandesh');

create table courses(
    course_id int primary key,
	course_name varchar(100)
);

insert into courses (course_id,course_name) values
(101,'Python'),(102,'SQL'),(103,'Power BI');

create table student_courses(
    student_id int,
	course_id int,
	primary key (student_id,course_id),
	foreign key (student_id) references students (student_id),
	foreign key (course_id) references courses (course_id)
);

insert into student_courses (student_id,course_id) values
(1,101),(1,102),(2,101),(2,103),(3,102);

select * from students;
select * from courses;
select * from student_courses; 

-- Questions

-- 1. Show thr list of students with the courses they are enrolled in.
select s.student_name,c.course_name from student_courses sc 
join students s on sc.student_id = s.student_id 
join courses c on sc.course_id = c.course_id;

-- 2. Find all the courses taken by the students named 'Anij'.
select s.student_name,c.course_name from student_courses sc
join students s on sc.student_id = s.student_id
join courses c on sc.course_id = c.course_id
where s.student_name = 'Anij';