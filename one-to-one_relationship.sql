create table students(
    student_id serial primary key,
	name varchar(100) not null
);

insert into students (name)
values ('Akarsh Vyas'),('Anuj Shrestha'),('Sandesh');

select * from students;

create table students_profiles(
    student_id int primary key,
	address text,
	age smallint,
	phone varchar(15)
);

INSERT INTO students_profiles (student_id, address, age, phone)
VALUES
    (1, 'Butwal', 20, '9800000000'),
    (2, 'Kathmandu', 19, '9811111111'),
    (3, 'Pokhara', 21, '9822222222');

alter table students_profiles
add constraint fk_student_id
foreign key (student_id)
references students(student_id);

select * from students_profiles;

select s.student_id,s.name,sp.address,sp.age,sp.phone
from students s
join students_profiles sp
on s.student_id= sp.student_id;