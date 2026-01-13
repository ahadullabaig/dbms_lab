create database collegedb;

use collegedb;

create table student (
usn varchar(10) primary key,
sname varchar(50),
address varchar(100),
phone varchar(20),
gender varchar(10)
);

create table semsec (
ssid varchar(10) primary key,
sem int,
sec varchar(1)
);

create table class (
usn varchar(10),
ssid varchar(10),
primary key (usn, ssid),
foreign key (usn) references student(usn) on delete cascade,
foreign key (ssid) references semsec(ssid) on delete cascade
);

create table subject (
subcode varchar(10) primary key,
title varchar(50),
sem int,
credits int
);

create table iamarks (
usn varchar(10),
subcode varchar(10),
ssid varchar(10),
test1 int,
test2 int,
test3 int,
finalia int,
primary key (usn, subcode, ssid),
foreign key (usn) references student(usn) on delete cascade,
foreign key (subcode) references subject(subcode) on delete cascade,
foreign key (ssid) references semsec(ssid) on delete cascade
);
