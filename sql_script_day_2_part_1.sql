-- 1
-- show all the date from two tables in one
-- select * from emp, dept;

-- 2
-- perform a join of the two tables on condition
-- there are two variants of such operation
-- select ename, dname from emp inner join dept on emp.deptno = dept.deptno order by dname;
-- select ename, dname from emp, dept where emp.deptno = dept.deptno order by dname;

-- 3
-- the same but add a department number
-- select ename, dname, dept.deptno from emp inner join dept on emp.deptno = dept.deptno;

-- 4
-- set a condition for the sal attribute
-- select ename, sal, loc, dname from emp inner join dept on emp.deptno = dept.deptno where sal > 1500;

-- 5
-- complex join condition (key) that maps if within range
-- select ename, job, sal, grade from emp inner join salgrade on emp.sal > salgrade.losal and emp.sal < salgrade.hisal;

-- 6
-- comples join condition + where condition
-- select ename, job, sal, grade from emp inner join salgrade on (emp.sal > salgrade.losal and emp.sal < salgrade.hisal) where grade >= 3;

-- 7
-- select * from emp inner join dept on emp.deptno = dept.deptno where loc = 'DALLAS';

-- 8

-- 9 an example of self-join
-- select  a.ename as manager_name,
        -- a.job as manager_job,
        -- a.sal as manager_sal,
        -- b.ename as employee_name,
        -- b.job as employee_job,
        -- b.sal as employee_sal from emp a, emp b where a.empno = b.mgr and b.sal < a.sal;

-- select a.ename as manager_name, a.job as manager_job, a.sal as manager_sal, b.ename as employee_name, b.job as employee_job, b.sal as employee_sal from emp a, emp b where a.empno = b.mgr;

-- 10
-- select all the jobs which can be found ib deptno 10 and the summ it up with
-- the next select that seeks for job that occure in deptno 20
-- select job from emp where deptno = 10 union select job from emp where deptno = 30 order by 1;
-- alternative
-- select distinct job from emp where deptno in (10, 30) order by 1;

-- 11
-- the intersect method combines the row only if they occur in both left-hand and right-hand quieries
-- select job from emp where deptno = 10 intersect select job from emp where deptno = 30;

-- 12
-- works only for sql server
-- combines row only if left-hand side does not occur in the right-hand side
-- select job from emp where deptno = 10 except select job from emp where deptno = 30;
