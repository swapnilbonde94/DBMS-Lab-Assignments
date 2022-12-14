ubuntu@ubuntu-OptiPlex-5000:~$ mysql -u root -p
Enter password: 
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
ubuntu@ubuntu-OptiPlex-5000:~$ mysql -u root -p
Enter password: 
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
ubuntu@ubuntu-OptiPlex-5000:~$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 13
Server version: 8.0.29-0ubuntu0.22.04.2 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use employee;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> select * from employee;
ERROR 1146 (42S02): Table 'employee.employee' doesn't exist
mysql> show tables;
+--------------------+
| Tables_in_employee |
+--------------------+
| emp_info           |
+--------------------+
1 row in set (0.00 sec)

mysql> select * from emp_info;
+--------+----------+--------+------------+
| emp_id | emp_name | city   | emp_salary |
+--------+----------+--------+------------+
|      1 | Pravin   | Nashik |      50000 |
|      2 | Atharva  | Pune   |      70000 |
+--------+----------+--------+------------+
2 rows in set (0.02 sec)

mysql> 
mysql> 
mysql> 
mysql> "
    "> 
    "> 
    "> 
    "> 
    "> 
    "> 
    "> 
    "> 
    "> ^C
mysql> alter table emp_info add column skills;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> alter table emp_info add column skills varchar(25);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> update emp_info set skills="web dev";
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> select * from emp_info;
+--------+----------+--------+------------+---------+
| emp_id | emp_name | city   | emp_salary | skills  |
+--------+----------+--------+------------+---------+
|      1 | Pravin   | Nashik |      50000 | web dev |
|      2 | Atharva  | Pune   |      70000 | web dev |
+--------+----------+--------+------------+---------+
2 rows in set (0.00 sec)

mysql> update emp_info set skills="app dev" where emp_name="Atharva";
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> 
mysql> select * from emp_info;
+--------+----------+--------+------------+---------+
| emp_id | emp_name | city   | emp_salary | skills  |
+--------+----------+--------+------------+---------+
|      1 | Pravin   | Nashik |      50000 | web dev |
|      2 | Atharva  | Pune   |      70000 | app dev |
+--------+----------+--------+------------+---------+
2 rows in set (0.00 sec)

mysql> alter table emp_info modify emp_id int auto_increment primary key;
ERROR 1068 (42000): Multiple primary key defined
mysql> insert into emp_info value(3,"Ashish","Pimpri",40000,"ML");
Query OK, 1 row affected (0.02 sec)

mysql> select * from emp_info;
+--------+----------+--------+------------+---------+
| emp_id | emp_name | city   | emp_salary | skills  |
+--------+----------+--------+------------+---------+
|      1 | Pravin   | Nashik |      50000 | web dev |
|      2 | Atharva  | Pune   |      70000 | app dev |
|      3 | Ashish   | Pimpri |      40000 | ML      |
+--------+----------+--------+------------+---------+
3 rows in set (0.00 sec)

mysql> insert into emp_info value(4,"Yash","pune",60000,"web dev");
Query OK, 1 row affected (0.01 sec)

mysql> insert into emp_info value(4,"om","pune",70000,"data science");
ERROR 1062 (23000): Duplicate entry '4' for key 'emp_info.PRIMARY'
mysql> insert into emp_info value(5,"om","pune",70000,"data science");
ERROR 1062 (23000): Duplicate entry '70000' for key 'emp_info.emp_salary'
mysql> insert into emp_info value(5,"om","pune",57000,"data science");
Query OK, 1 row affected (0.00 sec)

mysql> insert into emp_info value(6,"Tejas","Mumbai",90000,"web dev");
Query OK, 1 row affected (0.01 sec)

mysql> select * from emp_info;
+--------+----------+--------+------------+--------------+
| emp_id | emp_name | city   | emp_salary | skills       |
+--------+----------+--------+------------+--------------+
|      1 | Pravin   | Nashik |      50000 | web dev      |
|      2 | Atharva  | Pune   |      70000 | app dev      |
|      3 | Ashish   | Pimpri |      40000 | ML           |
|      4 | Yash     | pune   |      60000 | web dev      |
|      5 | om       | pune   |      57000 | data science |
|      6 | Tejas    | Mumbai |      90000 | web dev      |
+--------+----------+--------+------------+--------------+
6 rows in set (0.00 sec)

mysql> select emp_id ,emp_name from emp_info;
ERROR 2013 (HY000): Lost connection to MySQL server during query
No connection. Trying to reconnect...
Connection id:    8
Current database: employee

+--------+----------+
| emp_id | emp_name |
+--------+----------+
|      1 | Pravin   |
|      2 | Atharva  |
|      3 | Ashish   |
|      4 | Yash     |
|      5 | om       |
|      6 | Tejas    |
+--------+----------+
6 rows in set (0.04 sec)

mysql> select distinct(city) from emp_info;
+--------+
| city   |
+--------+
| Nashik |
| Pune   |
| Pimpri |
| Mumbai |
+--------+
4 rows in set (0.00 sec)

mysql> select count(distinct(skills)) from emp_info;
+-------------------------+
| count(distinct(skills)) |
+-------------------------+
|                       4 |
+-------------------------+
1 row in set (0.01 sec)

mysql> select max(emp_salary) from emp_info;
+-----------------+
| max(emp_salary) |
+-----------------+
|           90000 |
+-----------------+
1 row in set (0.00 sec)

mysql> select emp_id,emp_name from emp_info where emp_salary between 57000 and 70000;
+--------+----------+
| emp_id | emp_name |
+--------+----------+
|      5 | om       |
|      4 | Yash     |
|      2 | Atharva  |
+--------+----------+
3 rows in set (0.00 sec)

mysql> select * from emp_info where city like "P%";
+--------+----------+--------+------------+--------------+
| emp_id | emp_name | city   | emp_salary | skills       |
+--------+----------+--------+------------+--------------+
|      2 | Atharva  | Pune   |      70000 | app dev      |
|      3 | Ashish   | Pimpri |      40000 | ML           |
|      4 | Yash     | pune   |      60000 | web dev      |
|      5 | om       | pune   |      57000 | data science |
+--------+----------+--------+------------+--------------+
4 rows in set (0.00 sec)

mysql> select emp_name from emp_info where emp_salary in (50000,90000);
+----------+
| emp_name |
+----------+
| Pravin   |
| Tejas    |
+----------+


ASSIGNMENT 3: PART 2
ubuntu@ubuntu-OptiPlex-5000:~$ mysql -u
mysql: [ERROR] mysql: option '-u' requires an argument.
ubuntu@ubuntu-OptiPlex-5000:~$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.30-0ubuntu0.22.04.1 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use employee
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables
    -> show tables;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'show tables' at line 2
mysql> show tables;
+--------------------+
| Tables_in_employee |
+--------------------+
| Employee_1         |
| Students           |
| emp_info           |
| employee           |
+--------------------+
4 rows in set (0.00 sec)

mysql> select * from employee
    -> select * from employee;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'select * from employee' at line 2
mysql> select * from employee select * from employee;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'select * from employee' at line 1
mysql> select * from employee;
+----+---------+--------+-----------------+---------------+
| ID | empname | salary | designation     | Address       |
+----+---------+--------+-----------------+---------------+
|  1 | Nishant |  23724 | Manager         | Ahmednagar    |
|  6 | E       |  49999 | Employee        | SambhajiNagar |
|  9 | C       |  34504 | Project Manager | Pune          |
| 11 | B       | 100004 | CEO             | Mumbai        |
| 13 | H       |  31179 | Junior Employee | Kolhapur      |
| 19 | I       |  36383 | Employee        | Ahmednagar    |
| 36 | D       |  67504 | Data Scientist  | Pune          |
| 39 | G       |  63179 | Senior Employee | Solapur       |
| 41 | F       |  51179 | Co-manager      | Thane         |
| 71 | A       |  50024 | Employee        | Nashik        |
+----+---------+--------+-----------------+---------------+
10 rows in set (0.03 sec)

mysql> emp_info
    -> emp_info;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'emp_info
emp_info' at line 1
mysql> emp_info;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'emp_info' at line 1
mysql> select * from emp_info;
+--------+----------+--------+------------+--------------+
| emp_id | emp_name | city   | emp_salary | skills       |
+--------+----------+--------+------------+--------------+
|      1 | Pravin   | Nashik |      50000 | web dev      |
|      2 | Atharva  | Pune   |      70000 | app dev      |
|      3 | Ashish   | Pimpri |      40000 | ML           |
|      4 | Yash     | pune   |      60000 | web dev      |
|      5 | om       | pune   |      57000 | data science |
|      6 | Tejas    | Mumbai |      90000 | web dev      |
+--------+----------+--------+------------+--------------+
6 rows in set (0.02 sec)

mysql> use employee;
Database changed
mysql> create table emp_more;
ERROR 4028 (HY000): A table must have at least one visible column.
mysql> alter table emp_info add column experience_in_yr int ,DOB varchar(12);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DOB varchar(12)' at line 1
mysql> alter table emp_info add column experience_in_yr int ,DOB varchar(12);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DOB varchar(12)' at line 1
mysql> alter table emp_info add column experience_in_yr int;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from emp_info;
+--------+----------+--------+------------+--------------+------------------+
| emp_id | emp_name | city   | emp_salary | skills       | experience_in_yr |
+--------+----------+--------+------------+--------------+------------------+
|      1 | Pravin   | Nashik |      50000 | web dev      |             NULL |
|      2 | Atharva  | Pune   |      70000 | app dev      |             NULL |
|      3 | Ashish   | Pimpri |      40000 | ML           |             NULL |
|      4 | Yash     | pune   |      60000 | web dev      |             NULL |
|      5 | om       | pune   |      57000 | data science |             NULL |
|      6 | Tejas    | Mumbai |      90000 | web dev      |             NULL |
+--------+----------+--------+------------+--------------+------------------+
6 rows in set (0.00 sec)

mysql> update emp_info set experience_in_yr=2 where emp_id=1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from emp_info;
+--------+----------+--------+------------+--------------+------------------+
| emp_id | emp_name | city   | emp_salary | skills       | experience_in_yr |
+--------+----------+--------+------------+--------------+------------------+
|      1 | Pravin   | Nashik |      50000 | web dev      |                2 |
|      2 | Atharva  | Pune   |      70000 | app dev      |             NULL |
|      3 | Ashish   | Pimpri |      40000 | ML           |             NULL |
|      4 | Yash     | pune   |      60000 | web dev      |             NULL |
|      5 | om       | pune   |      57000 | data science |             NULL |
|      6 | Tejas    | Mumbai |      90000 | web dev      |             NULL |
+--------+----------+--------+------------+--------------+------------------+
6 rows in set (0.00 sec)

mysql> update emp_info set experience_in_yr=4 where emp_id=2;
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update emp_info set experience_in_yr=3 where emp_id=3;
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update emp_info set experience_in_yr=6 where emp_id=4;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update emp_info set experience_in_yr=1 where emp_id=5;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update emp_info set experience_in_yr=8 where emp_id=6;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from emp_info;
+--------+----------+--------+------------+--------------+------------------+
| emp_id | emp_name | city   | emp_salary | skills       | experience_in_yr |
+--------+----------+--------+------------+--------------+------------------+
|      1 | Pravin   | Nashik |      50000 | web dev      |                2 |
|      2 | Atharva  | Pune   |      70000 | app dev      |                4 |
|      3 | Ashish   | Pimpri |      40000 | ML           |                3 |
|      4 | Yash     | pune   |      60000 | web dev      |                6 |
|      5 | om       | pune   |      57000 | data science |                1 |
|      6 | Tejas    | Mumbai |      90000 | web dev      |                8 |
+--------+----------+--------+------------+--------------+------------------+
6 rows in set (0.00 sec)

mysql> select emp_id,emp_name,city from emp_info where emp_id in (1,4);
+--------+----------+--------+
| emp_id | emp_name | city   |
+--------+----------+--------+
|      1 | Pravin   | Nashik |
|      4 | Yash     | pune   |
+--------+----------+--------+
2 rows in set (0.00 sec)

mysql> create view data as select emp_id,emp_name,city from emp_info where emp_id in (1,4);
Query OK, 0 rows affected (0.00 sec)

mysql> select * from data;
+--------+----------+--------+
| emp_id | emp_name | city   |
+--------+----------+--------+
|      1 | Pravin   | Nashik |
|      4 | Yash     | pune   |
+--------+----------+--------+
2 rows in set (0.00 sec)

mysql> create view salary_data as select experience_in_yr,emp_salary,skills from
 emp_info where emp_id in (5,2);
Query OK, 0 rows affected (0.03 sec)

mysql> select * from salary_data;
+------------------+------------+--------------+
| experience_in_yr | emp_salary | skills       |
+------------------+------------+--------------+
|                4 |      70000 | app dev      |
|                1 |      57000 | data science |
+------------------+------------+--------------+
2 rows in set (0.01 sec)

mysql> drop view data;
Query OK, 0 rows affected (0.03 sec)

mysql> select * from data;
ERROR 1146 (42S02): Table 'employee.data' doesn't exist
mysql> ALTER VIEW salary_data (emp_id,emp_salary) AS SELECT emp_id,emp_salary, FROM emp_info;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FROM emp_info' at line 1
mysql> select *from salary_data;
+------------------+------------+--------------+
| experience_in_yr | emp_salary | skills       |
+------------------+------------+--------------+
|                4 |      70000 | app dev      |
|                1 |      57000 | data science |
+------------------+------------+--------------+
2 rows in set (0.00 sec)


mysql> create view data as select * from emp_info;
Query OK, 0 rows affected (0.03 sec)

mysql> select * from data;
+--------+----------+--------+------------+--------------+------------------+
| emp_id | emp_name | city   | emp_salary | skills       | experience_in_yr |
+--------+----------+--------+------------+--------------+------------------+
|      1 | Pravin   | Nashik |      50000 | web dev      |                2 |
|      2 | Atharva  | Pune   |      70000 | app dev      |                4 |
|      3 | Ashish   | Pimpri |      40000 | ML           |                3 |
|      4 | Yash     | pune   |      60000 | web dev      |                6 |
|      5 | om       | pune   |      57000 | data science |                1 |
|      6 | Tejas    | Mumbai |      90000 | web dev      |                8 |
+--------+----------+--------+------------+--------------+------------------+
6 rows in set (0.00 sec)

mysql> ALTER VIEW data  (emp_id,emp_salary) AS SELECT emp_id,emp_salary, FROM emp_info;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FROM emp_info' at line 1
mysql> ALTER VIEW data  (emp_id,emp_salary) AS SELECT emp_id,emp_salary, FROM emp_info;
