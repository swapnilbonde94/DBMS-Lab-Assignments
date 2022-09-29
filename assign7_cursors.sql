/*

Cursors: (All types: Implicit, Explicit, Cursor FOR Loop, Parameterized Cursor)
Write a PL/SQL block of code using parameterized Cursor that will merge the data available in
the newly created table N_RollCall with the data available in the table O_RollCall. If the data in
the first table already exist in the second table then that data should be skipped.
*/


create table O_RollCall (
    R_no int,
    Name1 varchar2(30),
    Status varchar2(20)
);

create table N_RollCall (
    R_no int,
    Name1 varchar2(30),
    Status varchar2(20)
);

insert into O_RollCall values (7, 'Rohit', 'Absent');
insert into O_RollCall values (10, 'Messi', 'Absent');
insert into O_RollCall values (1, 'Aishwarya', 'Present');
insert into O_RollCall values (7, 'Ronaldo', 'Present');
insert into O_RollCall values (2, 'Kohli', 'Absent');

insert into N_RollCall values (3, 'Bhuvi', 'Present');
insert into N_RollCall values (45, 'Ashwin', 'Present');
insert into N_RollCall values (2, 'Kohli', 'Absent');



-- Implicit Cursor

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

-- Explicit Cursor



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

    if explicit_cursor%rowcount>0 then dbms_output.put_line(explicit_cursor%rowcount||' Rows found.');
    end if;



    Close explicit_cursor;


end;
/

-- For cursor

--   begin
--     open c_mm;
--     fetch c_mm into a, b, c, d;
--     while (not c_mm%notfound) loop 
--         -- do what you have to do here

--         fetch c_mm into a, b, c, d;
--     end loop;
--     close c_mm;
--   end;