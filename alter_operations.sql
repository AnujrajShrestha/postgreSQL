-- ALTER operations

-- 1. Add column from existing table .
alter table students add column email varchar(100) default 'not provided';

-- 2. Drop column from existing table.
alter table students drop column email;

-- 3. Rename a column name from exisiting table.
alter table students rename column name to full_name;

-- 4. Change data type of a column.
alter table students alter column age type smallint;

-- 5. Set a default value in column age as 18.
alter table students alter column age set default 18;

-- 6. Remove that default value.
alter table students alter column age drop default;

-- 7. Add a constraint.
alter table students add constraint age_check check (age>=0); 

-- 8. Drop that constraint.
alter table students drop constraint age_check;

-- 9. Rename the table name.
alter table students rename to school_students;

select * from school_students;