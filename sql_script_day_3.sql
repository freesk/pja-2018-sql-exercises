-- a condition for all returned nested select rows
select ename from emp where hiredate > all(select hiredate from emp where deptno = 10);

-- a condition for at least one returned row
select ename from emp where hiredate > any(select hiredate from emp where deptno = 10);

-- 1
select loc, min(hiredate) from (select hiredate, loc from emp, dept where emp.deptno = dept.deptno) group by loc;

-- 2
select job from emp group by job having avg(sal) = (select max(avg(sal)) from emp group by job);

-- what the hell is going on here
select e.ename from emp e where e.sal = (select min(sal) from emp where deptno = e.deptno);

select dname from dept d where exists (select empno from emp where deptno = d.deptno);

-- 1
select * from emp where emp.sal = (select min(sal) from (select sal from emp group by sal));

-- 2
select job from emp where ename = 'BLAKE';
select * from emp where emp.job = any(select job from emp where ename = 'BLAKE');

-- 3
select * from emp where sal = any(select min(sal) from emp group by deptno);

-- 4
select * from emp, (select min(sal) as min, deptno from emp group by deptno) e where emp.deptno = e.deptno and emp.sal = e.min;

-- 5
select * from emp where sal > any(select min(sal) from emp where deptno = 30);

-- 6
select * from emp where sal > all(select min(sal) from emp where deptno = 30);

-- 7
select a.deptno, a.avg from (select deptno, avg(sal) as avg from emp group by deptno) a, (select avg(sal) as avg from emp where deptno = 30) b where a.avg > b.avg;

-- 8
select job, avg(sal) as avg from emp group by job;

select job, avg from (select job, avg(sal) as avg from emp group by job) e where e.avg = (select max(avg) from (select job, avg(sal) as avg from emp group by job));

-- ???
-- select job, avg from (select job, avg(sal) as avg from emp group by job) e where e.avg = (select max(avg) from e);

select job from emp group by job having avg(sal) = (select max(avg(sal)) from emp group by job);

-- 9
select * from emp where sal > (select max(sal) from (select * from emp inner join dept on emp.deptno = dept.deptno) group by dname having dname = 'SALES');

-- 10
select * from emp, (select avg(sal) as avg, deptno from emp group by deptno) e where emp.sal > e.avg and emp.deptno = e.deptno;

-- 11
select * from emp e where exists (select empno from emp where mgr = e.empno); 

-- 12 ??? 
select * from emp where deptno not in (select deptno from dept);

-- 13
select emp.empno, emp.ename, emp.job, emp.sal from emp, (select max(sal) as max, job from emp group by job) e where emp.sal = e.max and emp.job = e.job order by emp.sal;

-- 14
select emp.empno, emp.ename, emp.job, emp.sal from emp, (select min(sal) as max, job from emp group by job) e where emp.sal = e.max and emp.job = e.job order by emp.ename;

-- 15 
select emp.empno, emp.ename, emp.hiredate from emp, (select deptno, max(hiredate) as hiredate from emp group by deptno) e where emp.hiredate = e.hiredate and emp.deptno = e.deptno; 

-- 16 
select emp.ename, emp.sal, emp.deptno from emp, (select avg(sal) as avg, deptno from emp group by deptno) e where emp.sal > e.avg and emp.deptno = e.deptno;

-- 17 
select * from dept where dept.deptno not in (select deptno from emp);

-- 18 
select ename, sal from (select * from emp order by sal desc) where rownum <= 3;
select ename, sal from emp e where 3 > (select count(empno) from emp where sal > e.sal) order by sal desc;

-- 19 

