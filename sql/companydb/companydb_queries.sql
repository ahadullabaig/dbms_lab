-- query 1
-- Part A: Find projects where Scott is a WORKER
SELECT pno FROM works_on w, employee e
WHERE w.ssn = e.ssn AND e.name LIKE '%Scott'

UNION

-- Part B: Find projects where Scott is the MANAGER of the controlling dept
SELECT p.pno FROM project p, department d, employee e
WHERE p.dno = d.dno AND d.mgrssn = e.ssn AND e.name LIKE '%Scott';

-- query 2
select
e.name, (e.salary * 1.1) as increased_salaries,
p.pname
from
employee e,
project p,
works_on w
where
w.ssn = e.ssn and w.pno = p.pno
and
p.pname = 'IoT';

-- query 3
select
d.dname,
sum(e.salary) as total,
max(e.salary) as max_salary,
min(e.salary) as min_salary,
avg(e.salary) as avg_salary
from
employee e,
department d
where
e.dno = d.dno
and
dname = 'Accounts';

-- query 4
select e.name
from employee e
where not exists (
    select p.pno
    from project p
    where p.dno = 1
    and not exists (
        select w.pno
        from works_on w
        where
        w.ssn = e.ssn
        and
        w.pno = p.pno
    )
);

-- query 5
select dno, count(*) as high_sal_count
from employee
where salary > 600000
group by dno
    having dno in (
    select dno
    from employee
    group by dno
    having count(*) > 5
);
