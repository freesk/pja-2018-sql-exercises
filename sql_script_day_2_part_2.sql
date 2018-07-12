-- 1
-- get avarge salary of all listd jobs
-- select avg(sal) from emp;

-- 2
-- get the minimal salary by a condition
-- select min(sal) from emp where job = 'CLERK';

-- 3
-- count the number of people in the deptno 20
-- select count(empno) from emp where deptno = 20;

-- 4
-- group the records by job and then calculate the average salary for each group
-- select job, avg(sal) from emp group by job;

-- 5
-- same as #4 but a nested select excludes managers from the output
-- select * from (select job, avg(sal) from emp group by job) where job not in ('MANAGER');

-- 6
-- group by job then group by deptno then find average salary of job for each deptno
-- select deptno, job, avg(sal) from emp group by job, deptno;

-- 7
-- select job, max(sal) from emp group by job;

-- 8
-- having condition sets a constraint that doesn't let group by to aggregate records
-- select avg(sal), deptno from emp group by deptno having count(empno) > 3;

-- 9
-- select job from emp group by job having avg(sal) >= 3000;
-- alternative
-- select job from (select job, avg(sal) as avg_sal from emp group by job) where avg_sal >= 3000;

-- 10
-- some advanced calculations
-- select job, avg((sal * 12 + nvl(comm, 0))) as per_year, avg((sal + nvl(comm, 0))) as per_mo from emp group by job;

-- 11
-- the difference between min and max salaries of all jobs
-- select (max - min) as diff from (select min(sal) as min from emp), (select max(sal) as max from emp);

-- 12 select by a condition on count aggregate method
-- select * from (select deptno, count(empno) as count from emp group by deptno) where count > 3;

-- 13
-- to verify that all the ids are unique
-- select count(empno) from emp group by empno;

-- 14
-- some advanced conditioning here
-- select min, mgr from (select min(sal) as min, mgr from emp group by mgr) where min > 1000 order by min ;

-- 15
-- select count(empno) from (select * from emp inner join dept on emp.deptno = dept.deptno where loc = 'DALLAS');

-- 16
-- select grade, max(sal) from (select ename, job, sal, grade from emp inner join salgrade on emp.sal > salgrade.losal and emp.sal < salgrade.hisal) group by grade;

-- 17
-- select count(sal), sal from emp group by sal;

-- 18
-- select avg, grade from (select avg(sal) as avg, grade from (select ename, job, sal, grade from emp inner join salgrade on emp.sal > salgrade.losal and emp.sal < salgrade.hisal) group by grade) where grade = 3;

-- 19
-- select mgr, count(empno) from (select b.empno as empno, b.mgr as mgr, a.ename as manager_name from emp a, emp b where a.empno = b.mgr) group by mgr;

-- 20
-- select total, grade from (select sum(sal) as total, grade from (select ename, job, sal, grade from emp inner join salgrade on emp.sal > salgrade.losal and emp.sal < salgrade.hisal) group by grade) where grade = 1;
