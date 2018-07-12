-- description of the table (types of the columns)
-- desc EMP;

-- create a table
-- create table people (
  -- idp number(4),
  -- first_name varchar(10),
  -- position varchar(9),
  -- income number(7,2)
-- );

-- insert a new record
-- insert into PEOPLE (IDP, FIRST_NAME, POSITION, INCOME) values (0, 'jhon', 'junior', 2800);

-- delete a table
-- drop table people;

-- copy a table
-- create table staff as select * from emp;

-- select all records
-- select * from staff;

-- add a new column
-- alter table division add head varchar2(20);

-- rename a table
-- alter table division rename to branch;

-- update all reords in a table
-- update branch set loc = 'Warsaw';

-- delete all the records that have null
-- delete from branch where deptno is null;

-- set a condition not null to one of the attributes
-- alter table branch modify (loc varchar2(13) not null);

-- update a specific record
-- update people set first_name = 'Dmitry' where position = 'president';

-- create a table with a pk
-- create table my_group (group_id number(4) primary key, title varchar(10));

-- create a table with a pk and an fk reference to another table
-- create table student (
  -- student_id number(4) primary key,
  -- first_name varchar(10),
  -- group_id number(4), foreign key (group_id) references my_group(group_id)
-- );
