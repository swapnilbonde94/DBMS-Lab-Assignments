mysql> use constraints;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+-----------------------+
| Tables_in_constraints |
+-----------------------+
| auto_inc1             |
| default1              |
| employee              |
| unique1               |
| unique2               |
+-----------------------+
5 rows in set (0.00 sec)

mysql> select * from employee;
+--------+----------+------+
| emp_id | emp_name | city |
+--------+----------+------+
|      1 | swapnil  | Pune |
+--------+----------+------+
1 row in set (0.00 sec)

mysql> insert into employee(2, "AKash", "Pune");
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '2, "AKash", "Pune")' at line 1
mysql> insert into employee values(2, "AKash", "Pune");
Query OK, 1 row affected (0.01 sec)

mysql> select * from employee;
+--------+----------+------+
| emp_id | emp_name | city |
+--------+----------+------+
|      1 | swapnil  | Pune |
|      2 | AKash    | Pune |
+--------+----------+------+
2 rows in set (0.00 sec)

mysql> create view view1
    -> asa
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'asa' at line 2
mysql> create view view1 as
    -> select emp_id, emp_name from employee where in emp_id(1);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'in emp_id(1)' at line 2
mysql> create view view1 as select emp_id, emp_name from employee where emp_id(1);
ERROR 1305 (42000): FUNCTION constraints.emp_id does not exist
mysql> 

