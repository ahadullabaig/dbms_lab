create database companydb;

use companydb;

create table department (
dno int primary key,
dname varchar(50),
mgrssn varchar(10),
mgrstartdate date
);

create table employee (
ssn varchar(10) primary key,
name varchar(50),
address varchar(100),
sex char(1),
salary int,
superssn varchar(10),
dno int,
foreign key (dno) references department(dno) on delete cascade,
foreign key (superssn) references employee(ssn) on delete set null
);

alter table department
add foreign key (mgrssn) references employee(ssn) on delete cascade;

create table dlocation (
dno int,
dloc varchar(100),
primary key (dno, dloc),
foreign key (dno) references department(dno) on delete cascade
);

create table project (
pno int primary key,
pname varchar(50),
plocation varchar(100),
dno int,
foreign key (dno) references department(dno) on delete cascade
);

create table works_on (
ssn varchar(10),
pno int,
hours int,
primary key (ssn, pno),
foreign key (ssn) references employee(ssn) on delete cascade,
foreign key (pno) references project(pno) on delete cascade
);
