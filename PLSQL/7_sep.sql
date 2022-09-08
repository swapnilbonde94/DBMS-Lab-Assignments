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
    roll_no_lib int;
    SystemDate date;
    DOI_lib date;
    BookName_lib varchar(30);
    Days int;
    
    

BEGIN
    roll_no_lib := :roll_no_lib;
    BookName_lib := :Name_lib;

    select Sysdate into SystemDate from dual;
    select DateofIssue into DOI_lib from Borrower where Roll_no=roll_no_lib and BookName_lib=NameofBook;
    Days = SystemDate - DOI_lib;
