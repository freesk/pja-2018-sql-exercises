
drop table student;
drop table my_group;

create table my_group(group_id int primary key, title varchar(16));

insert into my_group (group_id, title) values (0, 'w-1');

create table student(
    student_id int,
    first_name varchar(16),
    last_name varchar(16),
    group_id int,
    constraint pk_student primary key (student_id),
    constraint fk_student_group foreign key (group_id) references my_group(group_id)
);

insert into student (student_id, first_name, last_name, group_id) values (0, 'a', 'b', 0);

select student_id, first_name, last_name, title from student, my_group where student.group_id = my_group.group_id;
