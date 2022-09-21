create table stud_marks (Roll_no number(30), Name varchar2(20), Total_marks number(30));

create table result1 (Roll number(30), Name1 varchar2(20), Class varchar2(20));

insert into stud_marks values (18, 'Virat', 1000);
insert into stud_marks values (45, 'Rohit', 1400);
insert into stud_marks values (99, 'Ashwin', 1250);
insert into stud_marks values (65, 'Bhuvi', 300);
insert into stud_marks values (30, 'Ishan', 500);

select * from stud_marks;

create or replace 
