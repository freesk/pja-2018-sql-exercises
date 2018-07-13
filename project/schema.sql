drop table Activity;
drop table Customer_Group;
drop table Place;
drop table Nurse_Group;
drop table My_Group;
drop table Nurse;
drop table Customer;

create table Customer (
  customer_id number(10) not null,
  first_name varchar2(45) not null,
  last_name varchar2(45) not null,
  birth_date_unix number(10) not null,
  title varchar(4), -- ms., mrs., ms.
  phone number(10),
  parent_1 number(10),
  parent_2 number(10),
  address varchar2(45) not null,
  constraint pk_customer primary key (customer_id),
  constraint fk_customer_customer1 foreign key (parent_1) references Customer (customer_id),
  constraint fk_customer_customer2 foreign key (parent_2) references Customer (customer_id)
);

create table Nurse (
  nurse_id number(10) not null,
  first_name varchar2(45) not null,
  last_name varchar2(45) not null,
  phone varchar2(45),
  address varchar2(45),
  salary number(10),
  constraint pk_nurse primary key (nurse_id)
);

create table My_Group (
  group_id number(10) not null,
  title varchar2(45) not null,
  min_age number(3),
  max_age number(3),
  constraint pk_group primary key (group_id)
);

create table Nurse_Group (
  nurse_group_id number(10) not null,
  timestamp_unix number(10) not null,
  expire_at_unix number(10) not null,
  group_id number(10) not null,
  nurse_id number(10) not null,
  constraint pk_nurse_group primary key (nurse_group_id),
  constraint fk_nursegroup_group foreign key (group_id) references My_Group (group_id),
  constraint fk_nursegroup_nurse foreign key (nurse_id) references Nurse (nurse_id)
);

create table Place (
  place_id number(10) not null,
  title varchar2(45) not null,
  constraint pk_place primary key (place_id)
);

create table Customer_Group (
  customer_group_id number(10) not null,
  timestamp_unix number(10) not null,
  expire_at_unix number(10) not null,
  customer_id number(10) not null,
  group_id number(10) not null,

  constraint pk_customer_group primary key (customer_group_id),
  constraint fk_customer_group_customer foreign key (customer_id) references Customer (customer_id),
  constraint fk_customer_group_group foreign key (group_id) references My_Group (group_id)
);

create table Activity (
  activity_id number(10) not null,
  start_at_unix number(10) not null,
  duration_in_seconds number(10) not null,
  description varchar2(45) null,
  group_id number(10) not null,
  place_id number(10) not null,

  constraint pk_activity primary key (activity_id),
  constraint fk_activity_group foreign key (group_id) references My_Group (group_id),
  constraint fk_activity_place foreign key (place_id) references Place (place_id)
);
