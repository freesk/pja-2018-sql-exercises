drop table Customer;

drop table Nurse;
drop table Group;
drop table CustomerGroup;
drop table NurseGroup;
drop table Place;
drop table Activity;

create table Customer (
    customer_id number generated always as identity (start with 1 increment by 1),
    first_name varchar(16) not null,
    last_name varchar(16) not null,
    birth_date_unix int,
    parent_1 number,
    parent_2 number,
    phone int,

    constraint pk_customer primary key (customer_id),
    constraint fk_parent_1 foreign key (parent_1) references Customer(customer_id),
    constraint fk_parent_2 foreign key (parent_2) references Customer(customer_id)
);

create table Nurse (
    nurse_id number generated always as identity (start with 1 increment by 1),
    first_name varchar(16) not null,
    last_name varchar(16) not null,

    constraint pk_nurse primary key (nurse_id)
);

create table Group (
    group_id number generated always as identity (start with 1 increment by 1),
    group_title varchar(16),
    min_age int,
    max_age int,

    constraint pk_group primary key (group_id)
);

create table CustomerGroup (
    customer_group_id number generated always as identity (start with 1 increment by 1),
    customer_id int,
    group_id int,
    timestamp int,

    constraint pk_customer_group primary key (customer_group_id),
    constraint fk_group foreign key (group_id) references Group(group_id),
    constraint fk_customer foreign key (customer_id) references Customer(customer_id)
);

create table NurseGroup (
    nurse_group_id number generated always as identity (start with 1 increment by 1),
    nurse_id int,
    group_id int,
    timestamp int,

    constraint pk_nurse_group primary key (nurse_group_id),
    constraint fk_group foreign key (group_id) references Group(group_id),
    constraint fk_nurse foreign key (nurse_id) references Nurse(nurse_id)
);

create table Place (
    place_id number generated always as identity (start with 1 increment by 1),
    title varchar(36)

    constraints pk_place primary key (place_id)
);

create table Activity (
    activity_id number generated always as identity (start with 1 increment by 1),
    nurse_group_id int,
    customer_group_id int,
    place_id int,
    description varchar(64),

    constraint pk_activity primary key (activity_id),
    constraint fk_nurse_group foreign key (nurse_group_id) references CustomerGroup(nurse_group_id),
    constraint fk_customer_group foreign key (customer_group_id) references NurseGroup(customer_group_id),
    constraint fk_place foreign key (place_id) references Place(place_id)
);
