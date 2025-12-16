select
s.usn, s.sname,
m.sem, m.sec,
c.*
from
student s,
semsec m,
class c
where
c.usn = s.usn and c.ssid = m.ssid
and
m.sem = 4 and m.sec = 'C';

select
s.gender,
ss.sem, ss.sec,
COUNT(*) as student_count
from
student s,
semsec ss,
class c
where
c.usn = s.usn and c.ssid = ss.ssid
group by
ss.sem, ss.sec, s.gender;

create view test1_bt as
select subcode, test1
from iamarks
where usn = '1BI15CS101';

update iamarks
set finalia = (test1 + test2 + test3 - LEAST(test1, test2, test3)) / 2;

select * from subject order by credits;
