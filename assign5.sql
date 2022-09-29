create table stud_marks (Roll_no number(30), Name varchar2(20), Total_marks number(30));

create table result1 (Roll number(30), Name1 varchar2(20), Class varchar2(20));

insert into stud_marks values (18, 'Virat', 1000);
insert into stud_marks values (45, 'Rohit', 1400);
insert into stud_marks values (99, 'Ashwin', 1250);
insert into stud_marks values (65, 'Bhuvi', 300);
insert into stud_marks values (30, 'Ishan', 500);

select * from stud_marks;

CREATE OR REPLACE PROCEDURE procedure_1 ( roll_no IN NUMBER, name IN VARCHAR2 ,marks IN NUMBER) AS
	BEGIN
		IF (marks<=1500 and marks>=990) THEN
			DBMS_OUTPUT.PUT_LINE ('DISTINCTION');
			INSERT INTO result VALUES (roll_no,name,'DISTINCTION');
		ELSIF (marks<=989 and marks>=900) THEN
			DBMS_OUTPUT.PUT_LINE ('FIRST CLASS');
			INSERT INTO result VALUES (roll_no,name,'FIRST CLASS');
		ELSIF (marks<=899 and marKs>825) THEN
			DBMS_OUTPUT.PUT_LINE('HIGHER SECOND CLASS');
			INSERT INTO result VALUES (roll_no,name,'HIGHER SECOND CLASS');
		ELSE
			DBMS_OUTPUT.PUT_LINE ('FAIL');
			INSERT INTO result VALUES (roll_no,name,'FAIL');

	    END IF;
	    INSERT INTO stud_marks VALUES (name,marks);
    END procedure_1;
/
BEGIN

			procedure_1(45,'ASHUTOSH',1450);
			procedure_1(46,'ARYAN',950);
			procedure_1(47,'ROHAN',850);
			procedure_1(48,'SARTHAK',750);
END;
/