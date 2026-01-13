insert into student values ('1MS24AI006', 'Ahad', 'Bengaluru', '1234567890', 'M');
insert into student values ('1MS24AI010', 'Anjali', 'Bengaluru', '1234567880', 'F');
insert into student values ('1MS24AI020', 'Divisha', 'Bengaluru', '1234567899', 'F');
insert into student values ('1BI15CS101', 'Cherry', 'Bengaluru', '1134567890', 'F');

insert into semsec values ('24AI01', 4, 'A');
insert into semsec values ('24AD01', 6, 'A');
insert into semsec values ('24BT01', 4, 'C');

insert into class values ('1MS24AI006', '24AI01');
insert into class values ('1MS24AI010', '24AI01');
insert into class values ('1MS24AI020', '24AD01');
insert into class values ('1BI15CS101', '24BT01');

insert into subject values ('24AI43', 'AIML', 4, 3);
insert into subject values ('24BT63', 'DBMS', 6, 4);

insert into iamarks values ('1MS24AI006', '24AI43', '24AI01', 90, 95, 90, 275);
insert into iamarks values ('1MS24AI010', '24AI43', '24AI01', 90, 99, 90, 279);
insert into iamarks values ('1MS24AI020', '24AI43', '24AD01', 90, 95, 95, 280);
insert into iamarks values ('1BI15CS101', '24BT63', '24BT01', 90, 90, 100, 280);
