-- a)

-- display all the customers that live at ~Jordan street
-- like method
select * from Customer where address like ('%Jordan%');

-- find minimal age the center can accept
-- min, nvl
select min(nvl(min_age, 0)) from My_Group;

-- b)

-- see parents along with the children
-- self-join
select a.customer_id, a.first_name, a.last_name, b.customer_id, b.first_name, b.last_name
	from Customer a, Customer b
		where
			a.parent_1 = b.customer_id or
			a.parent_2 = b.customer_id
				order by a.customer_id;

-- see all the groups a particular nurse belongs to at a particular moment
-- regular join
select Nurse.nurse_id, Nurse.first_name, Nurse.last_name, My_Group.group_id, My_Group.title
	from Nurse, Nurse_Group, My_Group
		where
			Nurse.nurse_id = Nurse_Group.nurse_id and
			My_Group.group_id = Nurse_Group.group_id and
			Nurse_Group.timestamp_unix >= 1531422174 and
			Nurse_Group.expire_at_unix <= 1531422174;

-- see all the nurses along with thier groups if any assigned
-- left join to keep null matches
select Nurse.nurse_id, Nurse.first_name, Nurse.last_name, Nurse_Group.group_id
	from Nurse left join Nurse_Group
		on
			Nurse.nurse_id = Nurse_Group.nurse_id and
			Nurse_Group.timestamp_unix >= 1531422174 and
			Nurse_Group.expire_at_unix <= 1531422174;

-- c)

-- display the number of children assigned to a each nurse at a particular moment
-- group by, join, subquery, count
select Nurse.first_name, Nurse.last_name, n.count as number_of_children
	from Nurse, (select Nurse_Group.nurse_id, count(Customer_Group.customer_id) as count
		from Customer_Group, Nurse_Group
			where Customer_Group.group_id = Nurse_Group.group_id
				and Customer_Group.timestamp_unix >= 1531422174
				and Customer_Group.expire_at_unix <= 1531422174
				and Nurse_Group.timestamp_unix >= 1531422174
				and Nurse_Group.expire_at_unix <= 1531422174
					group by Nurse_Group.nurse_id) n
						where n.nurse_id = Nurse.nurse_id;

-- see how many children each parent has
-- join, group by, subquery
select parent_id, count(customer_id) as number_of_children
	from
		(select a.customer_id, a.first_name, a.last_name, b.customer_id as parent_id, b.first_name, b.last_name
			from Customer a, Customer b
				where
					a.parent_1 = b.customer_id or
					a.parent_2 = b.customer_id)
						group by parent_id;

-- d)

-- display only the customers valid for being in the baby center
-- e.g. thier age must match the min-max age of any existing group
-- assuming 1531467455 is now
-- subquery
select customer_id, first_name, last_name
	from Customer
		where
			floor((1531467455 - birth_date_unix) / (365*24*60*60)) >
				(select min(min_age) from My_Group)
			and
			floor((1531467455 - birth_date_unix) / (365*24*60*60)) <
				(select max(max_age) from My_Group);

-- show the nurses who are not assigned to any grops at a particular moment
-- subquery
select nurse_id, first_name, last_name
	(select Nurse.nurse_id as nurse_id, Nurse.first_name as first_name, Nurse.last_name as last_name, Nurse_Group.group_id as group_id
		from Nurse left join Nurse_Group
			on
				Nurse.nurse_id = Nurse_Group.nurse_id and
				Nurse_Group.timestamp_unix >= 1531422174 and
				Nurse_Group.expire_at_unix <= 1531422174)
				    where group_id is null;

-- e)

-- we need to create-replace a view here to save the joined tables as a whole
-- which would allow us to use it for a correlated query
create or replace view nurse_salary_group as
	select Nurse.nurse_id as nurse_id, Nurse.last_name as last_name, Nurse_Group.group_id as group_id, Nurse.salary as salary
		from Nurse, Nurse_Group
		  where
        Nurse.nurse_id = Nurse_Group.nurse_id and
        Nurse_Group.timestamp_unix >= 1531422174 and
        Nurse_Group.expire_at_unix <= 1531422174;

-- debug
select * from nurse_salary_group;

-- get the nurses grouped by the groups they are assigned to who earn more than the average
select nurse_id, last_name
	from nurse_salary_group n
		where salary > (
			select avg(salary)
				from nurse_salary_group
					where group_id = n.group_id);

-- get the nurses grouped by the groups they are assigned to who earn more than their co-grouped colleges
select nurse_id, last_name
	from nurse_salary_group n
		where salary = (
			select max(salary)
				from nurse_salary_group
					where group_id = n.group_id);


-- having example
select nurse_id from nurse_salary_group
	group by nurse_id
		having avg(salary) = (
			select max(avg(salary)) from nurse_salary_group
				group by nurse_id
		);
