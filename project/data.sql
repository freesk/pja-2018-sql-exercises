insert into Customer (customer_id, first_name, last_name, birth_date_unix, address, title)
    values (0, 'Dmitry', 'Kurbatov', 662688000, 'Sumska str. 24-10', 'mr.');

insert into Customer (customer_id, first_name, last_name, birth_date_unix, address, title)
    values (1, 'Anastasiia', 'Kurbatova', 662688000, 'Sumska str. 24-10', 'ms.');

insert into Customer (customer_id, first_name, last_name, birth_date_unix, address, parent_1, parent_2)
    values (2, 'Nina', 'Kurbatova', 1420070400, 'Sumska str. 24-10', 0, 1);

insert into Customer (customer_id, first_name, last_name, birth_date_unix, address, title)
    values (3, 'Jason', 'Benson', 662688000, 'Jordan str. 110', 'mr.');

insert into Customer (customer_id, first_name, last_name, birth_date_unix, address, parent_1, parent_2)
    values (4, 'Estella', 'Benson', 1420070400, 'Jordan str. 110', 3, null);

insert into Customer (customer_id, first_name, last_name, birth_date_unix, address, title)
    values (5, 'Jack', 'White', 662688000, 'Jordan str. 98', '.mr');

insert into Customer (customer_id, first_name, last_name, birth_date_unix, address, parent_1, parent_2)
    values (6, 'Katty', 'White', 1420070400, 'Jordan str. 98', null, 5);

insert into Customer (customer_id, first_name, last_name, birth_date_unix, address, title)
    values (7, 'Harry', 'Potter', 662688000, '4 Privet Drive', '.mr');

insert into Customer (customer_id, first_name, last_name, birth_date_unix, address, parent_1, parent_2)
    values (8, 'James', 'Potter', 1420070400, '4 Privet Drive', null, 7);

insert into Customer (customer_id, first_name, last_name, birth_date_unix, address, parent_1, parent_2)
    values (9, 'Albus', 'Potter', 1420070400, '4 Privet Drive', null, 7);

insert into Customer (customer_id, first_name, last_name, birth_date_unix, address, parent_1, parent_2)
    values (10, 'Lily', 'Potter', 1420070400, '4 Privet Drive', null, 7);



insert into Nurse (nurse_id, first_name, last_name, salary)
    values (0, 'Alexa', 'Johnson', 2500);

insert into Nurse (nurse_id, first_name, last_name, salary)
    values (1, 'Tom', 'Riddle', 1000);

insert into Nurse (nurse_id, first_name, last_name, salary)
    values (2, 'Molly', 'Clifford', 3000);

insert into Nurse (nurse_id, first_name, last_name, salary)
    values (3, 'Anna', 'Thompson', 2900);

insert into Nurse (nurse_id, first_name, last_name, salary)
    values (4, 'Josefina', 'Montane', 4000);



insert into My_Group (group_id, title, min_age, max_age)
    values (0, 'g-1.1', null, null);

insert into My_Group (group_id, title, min_age, max_age)
    values (1, 'g-1.2', 1, 3);

insert into My_Group (group_id, title, min_age, max_age)
    values (2, 'g-2.1', 3, 5);

insert into My_Group (group_id, title, min_age, max_age)
    values (3, 'g-2.2', 3, 5);

insert into My_Group (group_id, title, min_age, max_age)
    values (4, 'g-3.1', 5, 10);

insert into My_Group (group_id, title, min_age, max_age)
    values (5, 'g-3.2', 5, 10);

insert into My_Group (group_id, title, min_age, max_age)
    values (6, 'g-3.3', 5, 10);



insert into Nurse_Group (nurse_group_id, timestamp_unix, expire_at_unix, group_id, nurse_id)
    values (0, 1531422174, 1514764800, 0, 0);

insert into Nurse_Group (nurse_group_id, timestamp_unix, expire_at_unix, group_id, nurse_id)
    values (1, 1531422174, 1514764800, 1, 1);

insert into Nurse_Group (nurse_group_id, timestamp_unix, expire_at_unix, group_id, nurse_id)
    values (2, 1531422174, 1514764800, 2, 2);

insert into Nurse_Group (nurse_group_id, timestamp_unix, expire_at_unix, group_id, nurse_id)
    values (3, 1531422174, 1514764800, 0, 4);



insert into Customer_Group (customer_group_id, timestamp_unix, expire_at_unix, customer_id, group_id)
    values (0, 1531422174, 1514764800, 2, 0);

insert into Customer_Group (customer_group_id, timestamp_unix, expire_at_unix, customer_id, group_id)
    values (1, 1531422174, 1514764800, 4, 0);

insert into Customer_Group (customer_group_id, timestamp_unix, expire_at_unix, customer_id, group_id)
    values (2, 1531422174, 1514764800, 6, 0);

insert into Customer_Group (customer_group_id, timestamp_unix, expire_at_unix, customer_id, group_id)
    values (3, 1531422174, 1514764800, 8, 1);

insert into Customer_Group (customer_group_id, timestamp_unix, expire_at_unix, customer_id, group_id)
    values (4, 1531422174, 1514764800, 9, 1);

insert into Customer_Group (customer_group_id, timestamp_unix, expire_at_unix, customer_id, group_id)
    values (5, 1531422174, 1514764800, 10, 1);



insert into Place (place_id, title) values (0, 'sandbox');

insert into Place (place_id, title) values (1, 'classroom');

insert into Place (place_id, title) values (2, 'dining room');

insert into Place (place_id, title) values (3, 'bedroom');



insert into Activity (
    activity_id,
    start_at_unix,
    duration_in_seconds,
    description,
    group_id,
    place_id) values (
      0, 1535788800, 7200, 'free time', 0, 0
    );

insert into Activity (
    activity_id,
    start_at_unix,
    duration_in_seconds,
    description,
    group_id,
    place_id) values (
      1, 1535796000, 3600, 'lunch', 0, 2
    );

insert into Activity (
    activity_id,
    start_at_unix,
    duration_in_seconds,
    description,
    group_id,
    place_id) values (
      2, 1535799600, 7200, 'free time', 0, 3
    );

insert into Activity (
    activity_id,
    start_at_unix,
    duration_in_seconds,
    description,
    group_id,
    place_id) values (
      3, 1535788800, 7200, 'revenge', 1, 0
    );
