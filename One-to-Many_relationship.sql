create table students(
   student_id serial primary key,
   name varchar(100) not null
);

create table marks(
    marks_id serial primary key,
	student_id int,
	subject varchar(50),
	marks smallint,
	foreign key (student_id) references students (student_id)
);

insert into students (name) values
('Akarsh Vyas'),('Anuj Shrestha'),('Subash magar');

insert into marks (student_id,subject,marks) values
(1,'English',85),(1,'Math',89),(1,'Science',92),
(2,'English',80),(2,'Math',75),(2,'Science',78),
(3,'English',72),(3,'Math',70),(3,'Science',74);

select * from students;
select * from marks;

-- Questions

-- 1. Show each students name along with their subject and marks.
select s.name,m.subject,m.marks from students s join marks m on s.student_id = m.student_id;

-- 2. Show marks for only 'Anuj Shrestha' in all subjects.
select s.name,m.subject,m.marks from students s join marks m on s.student_id = m.student_id where s.name= 'Anuj Shrestha';

-- 3. Show only those subjects where marks are above 80.
select subject from marks where marks > 80;

-- 4. Short all students subject marks in descending order of marks.
select s.name,m.subject,m.marks from students s join marks m on s.student_id = m.student_id order by marks desc;

-- 5. Show each students average marks. 
select s.name,round(avg(m.marks),2) as average_marks from students s join marks m on s.student_id = m.student_id group by s.student_id,s.name;