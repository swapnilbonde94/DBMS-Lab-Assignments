mysql> create database swappy;
Query OK, 1 row affected (0.03 sec)

mysql> create table employee;
ERROR 4028 (HY000): A table must have at least one visible column.
mysql> create table emp_info (emp_id int, emp_name varchar(30), city varchar (30), emp_salary int, skills varchar(30))
    -> ;
Query OK, 0 rows affected (0.02 sec)

mysql> insert into emp_info values (1,"Pravin", "Nashik", 50000, "web dev");
Query OK, 1 row affected (0.02 sec)

mysql> insert into emp_info values (2,"Atharva", "Pune", 70000, "app dev");
Query OK, 1 row affected (0.02 sec)

mysql> insert into emp_info value(3,"Ashish","Pimpri",40000,"ML");
Query OK, 1 row affected (0.02 sec)

mysql> Query OK, 1 row affected (0.02 sec)

mysql> insert into emp_info value(4,"Yash","pune",60000,"web dev");
Query OK, 1 row affected (0.00 sec)

mysql> insert into emp_info value(5,"om","pune",57000,"data science");
Query OK, 1 row affected (0.02 sec)

mysql> insert into emp_info value(6,"Tejas","Mumbai",90000,"web dev");
Query OK, 1 row affected (0.02 sec)

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


mysql> select * from emp_info where city IN (select city from emp_info where emp_name = "Atharva");
+--------+----------+------+------------+--------------+
| emp_id | emp_name | city | emp_salary | skills       |
+--------+----------+------+------------+--------------+
|      2 | Atharva  | Pune |      70000 | app dev      |
|      4 | Yash     | pune |      60000 | web dev      |
|      5 | om       | pune |      57000 | data science |
+--------+----------+------+------------+--------------+
3 rows in set (0.02 sec)

mysql> select * from emp_info where city NOT IN (select city from emp_info where emp_name = "Atharva");
+--------+----------+--------+------------+---------+
| emp_id | emp_name | city   | emp_salary | skills  |
+--------+----------+--------+------------+---------+
|      1 | Pravin   | Nashik |      50000 | web dev |
|      3 | Ashish   | Pimpri |      40000 | ML      |
|      6 | Tejas    | Mumbai |      90000 | web dev |
+--------+----------+--------+------------+---------+
3 rows in set (0.02 sec)


mysql> select * from emp_info where emp_salary < (select emp_salary from emp_info where emp_name = "Atharva");
+--------+----------+--------+------------+--------------+
| emp_id | emp_name | city   | emp_salary | skills       |
+--------+----------+--------+------------+--------------+
|      1 | Pravin   | Nashik |      50000 | web dev      |
|      3 | Ashish   | Pimpri |      40000 | ML           |
|      4 | Yash     | pune   |      60000 | web dev      |
|      5 | om       | pune   |      57000 | data science |
+--------+----------+--------+------------+--------------+
4 rows in set (0.00 sec)

mysql> create table anime_list (anime_id INT,anime_name VARCHAR(25),rating INT);
Query OK, 0 rows affected (0.04 sec)

mysql> insert into anime_list values (101,'Class room',8.02),(102,'AOT',9.54),(103,'demon slayer',9.08);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> create table anime_list_2 (anime_id INT,anime_name varchar(25),reviews varchar(50));
Query OK, 0 rows affected (0.03 sec)

mysql> insert into anime_list_2 values (101,'Class room','underrated'),(102,'AOT','nice'),(103,'demon slayer','overpowered');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0


mysql> select anime_list.anime_id,anime_list.anime_name from anime_list left join anime_list_2 on anime_list.anime_name = anime_list_2.anime_name;
+----------+--------------+
| anime_id | anime_name   |
+----------+--------------+
|      101 | Class room   |
|      102 | AOT          |
|      103 | demon slayer |
+----------+--------------+
3 rows in set (0.00 sec)

mysql> select anime_list.anime_id,anime_list.anime_name from anime_list right join anime_list_2 on anime_list.anime_name = anime_list_2.anime_name;
+----------+--------------+
| anime_id | anime_name   |
+----------+--------------+
|      101 | Class room   |
|      102 | AOT          |
|      103 | demon slayer |
+----------+--------------+
3 rows in set (0.00 sec)

mysql> create view top_ranked as select anime_name,rating from anime_list;
Query OK, 0 rows affected (0.03 sec)

mysql> select * from top_ranked;
+--------------+--------+
| anime_name   | rating |
+--------------+--------+
| Class room   |      8 |
| AOT          |     10 |
| demon slayer |      9 |
+--------------+--------+
3 rows in set (0.00 sec)

mysql>  ALTER VIEW top_ranked as SELECT anime_id,anime_name from anime_list WHERE (rating>8) and (rating<10);
Query OK, 0 rows affected (0.03 sec)

mysql> select * from top_ranked;
+----------+--------------+
| anime_id | anime_name   |
+----------+--------------+
|      103 | demon slayer |
+----------+--------------+
1 row in set (0.00 sec)
