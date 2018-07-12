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
