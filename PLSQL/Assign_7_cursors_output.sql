
SQL> insert into O_RollCall values (7, 'Rohit', 'Absent');

1 row created.

SQL> insert into O_RollCall values (10, 'Messi', 'Absent');

1 row created.

SQL> insert into O_RollCall values (1, 'Aishwarya', 'Present');

1 row created.

SQL> insert into O_RollCall values (7, 'Ronaldo', 'Present');

1 row created.

SQL> insert into O_RollCall values (2, 'Kohli', 'Absent');

1 row created.

SQL> insert into N_RollCall values (3, 'Bhuvi', 'Present');

1 row created.

SQL> insert into N_RollCall values (45, 'Ashwin', 'Present');

1 row created.

SQL> insert into N_RollCall values (2, 'Kohli', 'Absent');

1 row created.





SQL> -- Implicit Cursor

begin
  
  update O_RollCall
     set Status = 'Present'
   where R_no = 2;

    if sql%found then 
        dbms_output.put_line('Status Updated');
    end if;

    if sql%notfound then 
        dbms_output.put_line('Status not updated yet');
    end if;

end;
/

-- OUTPUT for IMPLICIT CURSOR

SQL>
Status Updated

PL/SQL procedure successfully completed.










SQL> -- Explicit Cursor

declare

    Cursor explicit_cursor is select * from O_RollCall 
     where Status = 'Present';
    tmp explicit_cursor%rowtype;

BEGIN
    open explicit_cursor;
    LOOP exit when explicit_cursor%notfound;
    fetch explicit_cursor into tmp;
    dbms_output.put_line('Roll no.   '||tmp.R_no||'       Name    '||tmp.Name1||'      Status    '||tmp.Status);
    


    END loop;

    if explicit_cursor%rowcount>0 then dbms_output.put_line(explicit_cursor%rowcount||' SQL> Rows found.');
    end if;



    Close explicit_cursor;


end;
/


--Output (Explicit Cursor):
SQL> 

Roll no.   1	   Name    Aishwarya	  Status    Present
Roll no.   7	   Name    Ronaldo	Status	  Present
Roll no.   2	   Name    Kohli      Status	Present
Roll no.   2	   Name    Kohli      Status	Present
3 Rows found.

PL/SQL procedure successfully completed.











SQL> -- For cursor

declare 

cursor for_cur is
select R_no,
    Name1,
    Status
from O_RollCall
where Status = 'Present';

tmp for_cur %rowtype;

begin for tmp in for_cur loop dbms_output.put_line(
    '  ROLLNO:   ' || tmp.R_no || ' ' || '  Name:  ' || tmp.Name1 || ' ' || 'Status: ' || tmp.Status
);
end loop;
end;
/

--Output (for loop cursor):

ROLLNO:   1   Name:  Aishwarya Status: Present
ROLLNO:   7   Name:  Ronaldo Status: Present
ROLLNO:   2   Name:  Kohli Status: Present

PL/SQL procedure successfully completed.










SQL> 
/* Parameterized cursor: take input from the user and display*/

declare 
roll number;
cursor param_cur(roll number) is
select *
from O_RollCall
where R_no = roll;
tmp param_cur %rowtype;
begin roll := & roll;
for tmp in param_cur(roll) 
loop 
    dbms_output.put_line('Roll No:   ' || tmp.R_no);
    dbms_output.put_line('Name:   ' || tmp.Name1);
    dbms_output.put_line('Status:   ' || tmp.Status);
end loop;
end;
/

--Output:
Enter value for roll: 2
old   8: begin roll := & roll;
new   8: begin roll := 2;


Roll No:   2
Name:	Kohli
Status:   Present

PL/SQL procedure successfully completed.



















SQL> 
-- MERGE
begin 
merge into N_RollCall t1 using (
    select R_no,
        Name1,
        Status
    from O_RollCall
) t2 on (t1.R_no = t2.R_no)
when not matched then
insert
values(t2.R_no, t2.Name1, t2.Status);
if sql %rowcount > 0 then dbms_output.put_line('Merged  ' || sql %rowcount || ' Row Updated');
else dbms_output.put_line('no row updated');
end if;
if sql %notfound then dbms_output.put_line('Not Merged');
end if;
end;
/

--OUTPUT (Merge):

Merged	4 Row Updated

PL/SQL procedure successfully completed.


SQL> select * from O_RollCall;

      R_NO NAME1			  STATUS
---------- ------------------------------ --------------------
	 7 Rohit			  Absent
	10 Messi			  Absent
	 1 Aishwarya			  Present
	 7 Ronaldo			  Present
	 2 Kohli			  Present

SQL> select * from N_RollCall;

      R_NO NAME1			  STATUS
---------- ------------------------------ --------------------
	 3 Bhuvi			  Present
	45 Ashwin			  Present
	 2 Kohli			  Absent
	 7 Ronaldo			  Present
	 7 Rohit			  Absent
	 1 Aishwarya			  Present
	10 Messi			  Absent

7 rows selected.

