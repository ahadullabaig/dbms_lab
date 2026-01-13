insert into employee values ('1MS24AI010', 'Anjali', 'Bengaluru', 'F', 5000000, null, null);
insert into employee values ('1MS24AI006', 'Ahad', 'Bengaluru', 'M', 9000000, '1MS24AI010', null);
insert into employee values ('1MS24AI016', 'Cherry', 'Bengaluru', 'F', 1500000, '1MS24AI006', null);
insert into employee values ('1MS24AI020', 'Divisha', 'Bengaluru', 'F', 3000000, '1MS24AI006', null);
insert into employee values ('1MS24AI031', 'Arjit', 'Bengaluru', 'M', 4000000, '1MS24AI010', null);
insert into employee values ('1MS24AI001', 'John Scott', 'Bengaluru', 'M', 500000, '1MS24AI006', null);

insert into department values (1, 'Accounts', '1MS24AI006', '2020-12-31');
insert into department values (2, 'Sales', '1MS24AI010', '2023-10-01');

update employee
set dno = 1
where name in ('Ahad', 'Anjali', 'Arjit', 'Cherry', 'Divisha');

update employee
set dno = 2
where name = 'John Scott';

insert into dlocation values (1, 'Hyderabad');
insert into dlocation values (1, 'Bengaluru');
insert into dlocation values (2, 'Odisha');

insert into project values (101, 'IoT', 'Bengaluru', 1);
insert into project values (102, 'AI', 'Bengaluru', 1);
insert into project values (103, 'ML', 'Bengaluru', 1);

insert into works_on values ('1MS24AI006', 101, 10);
insert into works_on values ('1MS24AI006', 102, 10);
insert into works_on values ('1MS24AI006', 103, 10);
insert into works_on values ('1MS24AI016', 101, 10);
insert into works_on values ('1MS24AI020', 101, 10);
insert into works_on values ('1MS24AI031', 101, 10);
insert into works_on values ('1MS24AI001', 102, 10);
insert into works_on values ('1MS24AI010', 101, 10);
