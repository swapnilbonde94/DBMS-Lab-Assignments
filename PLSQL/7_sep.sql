/*
CREATE TABLE Borrower ( Roll_no int, Name varchar(30), DateofIssue date, NameofBook varchar(30), Status char(1));

CREATE TABLE Fine (Roll_no int, Date1 date, Amt int);

insert into Borrower values 
(1, 'Swapnil', '09-01-2022', 'TOC', 'I');

insert into Borrower values 
(2, 'Yuvraj', '01-01-2022', 'ML', 'I');

insert into Borrower values 
(3, 'Akash', '09-06-2022', 'CN', 'I');

insert into Borrower values 
(4, 'Rajashree', '09-20-2022', 'OS', 'I');
;
select * from Borrower;
select * from Fine;
*/

DECLARE
    roll_number number :=: roll_no;

BEGIN
    dbms.output_put_line(
