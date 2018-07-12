-- create two tables woth pk and reference one to another by a fk

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

-- version 2

-- create two tables woth pk and reference one to another by a fk
-- create many-to-many relation with sql

drop table my_class;
drop table room;
drop table studentl;
drop table my_group;

create table my_group (
    group_id int,
    title varchar(16),
    constraint pk_group primary key (group_id)
);

create table student (
    student_id int,
    last_name varchar(16),
    group_id int,
    constraint pk_student primary key (student_id),
    constraint fk_student_group foreign key (group_id) references my_group(group_id)
);

create table room (
    room_id int not null,
    room_num int not null,
    constraint pk_room primary key (room_id)
);

create table my_class (
    class_id int,
    room_id int,
    group_id int,
    start_time date,
    duration int,
    constraint pk_class primary key (class_id),
    constraint fk_room foreign key (room_id) references room(room_id),
    constraint fk_group foreign key (group_id) references my_group(group_id)
);

-- these two are identical
select * from student, my_group where student.group_id = my_group.group_id;
select * from student inner join my_group on student.group_id = my_group.group_id;
