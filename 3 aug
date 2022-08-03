mysql> use helloDBMS;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> use barca;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+-----------------+
| Tables_in_barca |
+-----------------+
| team            |
+-----------------+
1 row in set (0.01 sec)

mysql> show team;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'team' at line 1
mysql> select * from team;
+--------------+---------------+--------------------+-----------+------+-------------------+
| player       | jersey_number | position           | nation    | age  | club              |
+--------------+---------------+--------------------+-----------+------+-------------------+
| messi        |            23 | false nine         | Argentina |   35 | PSG               |
| ter_stregen  |             1 | Goalkeeper         | Germany   |   30 | barcelona         |
| Ronaldo      |             7 | Center_forward     | Portugal  |   37 | manchester_united |
| Carlos_puyol |             4 | Center_back        | Spain     |   40 | barcelona         |
| Xavi         |             6 | central_midfielder | Spain     |   40 | barcelona         |
| Lewendoski   |             9 | center forward     | Poland    |   33 | barcelona         |
+--------------+---------------+--------------------+-----------+------+-------------------+
6 rows in set (0.02 sec)

mysql> use helloDBMS;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+---------------------+
| Tables_in_helloDBMS |
+---------------------+
| sd                  |
| sd_view             |
+---------------------+
2 rows in set (0.01 sec)

mysql> select * from sd;
+---------+------+------+------+------+-----------+
| roll_no | name | age  | city | per  | Mobile_no |
+---------+------+------+------+------+-----------+
| 1       | Adi  |   19 | Pune | 95.2 | 4132134   |
+---------+------+------+------+------+-----------+
1 row in set (0.00 sec)

mysql> create database constraints;
Query OK, 1 row affected (0.02 sec)

mysql> use constraints;
Database changed
mysql> create table employee
    -> (emp_id int NOT NULL, emp_name varchar(25), city varchar(25));
Query OK, 0 rows affected (0.04 sec)

mysql> insert into employee
    -> values (1, "swapnil", "Pune");
Query OK, 1 row affected (0.02 sec)

mysql> insert into employee
    -> values (NULL, "amisha", "Mumbai");
ERROR 1048 (23000): Column 'emp_id' cannot be null
mysql> select * from employee;
+--------+----------+------+
| emp_id | emp_name | city |
+--------+----------+------+
|      1 | swapnil  | Pune |
+--------+----------+------+
1 row in set (0.00 sec)

mysql> create table unique
    -> (jersey no. int, player_name varchar(25) UNIQUE, club varchar(25));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'unique
(jersey no. int, player_name varchar(25) UNIQUE, club varchar(25))' at line 1
mysql> create table unique (jersey_no int, player_name varchar(25) UNIQUE, club varchar(25));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'unique (jersey_no int, player_name varchar(25) UNIQUE, club varchar(25))' at line 1
mysql> create table unique (jersey_no int, player_name varchar(25), club varchar(25),UNIQUE(player_name));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'unique (jersey_no int, player_name varchar(25), club varchar(25),UNIQUE(player_n' at line 1
mysql> create table unique (jersey_no int, player_name varchar(25), club varchar(25),UNIQUE(PLAYER_NAME));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'unique (jersey_no int, player_name varchar(25), club varchar(25),UNIQUE(PLAYER_N' at line 1
mysql> create table unique1 (jersey_no int, player_name varchar(25), club varchar(25),UNIQUE(PLAYER_NAME));
Query OK, 0 rows affected (0.02 sec)

mysql> create table unique2 (jersey no. int, player_name varchar(25) UNIQUE, club varchar(25));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'no. int, player_name varchar(25) UNIQUE, club varchar(25))' at line 1
mysql> create table unique2 (jersey_no int, player_name varchar(25) UNIQUE, club varchar(25));
Query OK, 0 rows affected (0.04 sec)

mysql> insert into unique2 
    -> values (1, "Neuer", "Bayern");
Query OK, 1 row affected (0.03 sec)

mysql> insert into unique2  values 1, "Neuer");
[1]+  Stopped                 mysql -u root -p
ubuntu@ubuntu-OptiPlex-5000:~$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.29-0ubuntu0.22.04.2 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use constraints;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> insert into unique2 
    -> values(2, "Neuer", "Bayern")
    -> ;
ERROR 1062 (23000): Duplicate entry 'Neuer' for key 'unique2.player_name'
mysql> select * from unique2;
+-----------+-------------+--------+
| jersey_no | player_name | club   |
+-----------+-------------+--------+
|         1 | Neuer       | Bayern |
+-----------+-------------+--------+
1 row in set (0.00 sec)

mysql> alter table unique2 
    -> modify column jersey_no int PRIMARY KEY;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc unique2
    -> ;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| jersey_no   | int         | NO   | PRI | NULL    |       |
| player_name | varchar(25) | YES  | UNI | NULL    |       |
| club        | varchar(25) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into unique2 
    -> values (1, "Swapnil", "Pune");
ERROR 1062 (23000): Duplicate entry '1' for key 'unique2.PRIMARY'
mysql> create table auto_inc1
    -> (anime_id int AUTO INCREMENT, anime_name varchar(25), genre varchar(10));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'AUTO INCREMENT, anime_name varchar(25), genre varchar(10))' at line 2
mysql> create table auto_inc1 (anime_id int AUTO_INCREMENT, anime_name varchar(25), genre varchar(10));
ERROR 1075 (42000): Incorrect table definition; there can be only one auto column and it must be defined as a key
mysql> create table auto_inc1 (anime_id int AUTO_INCREMENT, anime_name varchar(25), genre varchar(10));
ERROR 1075 (42000): Incorrect table definition; there can be only one auto column and it must be defined as a key
mysql> create table auto_inc1 (anime_id int PRIMARY KEY AUTO_INCREMENT, anime_name varchar(25), genre varchar(10))
;
Query OK, 0 rows affected (0.04 sec)

mysql> insert into auto_inc1
    -> ^C
mysql> insert into auto_inc1(anime_name, genre)
    -> values ("AOT", "Action");
Query OK, 1 row affected (0.02 sec)

mysql> insert into auto_inc1(anime_name, genre) values ("JJK", "Action");
Query OK, 1 row affected (0.02 sec)

mysql> select * from auto_inc1;
+----------+------------+--------+
| anime_id | anime_name | genre  |
+----------+------------+--------+
|        1 | AOT        | Action |
|        2 | JJK        | Action |
+----------+------------+--------+
2 rows in set (0.01 sec)

mysql> create table default1
    -> (emp_id int, emp_name varchar(25), city varchar(15) DEFAULT "Pune");
Query OK, 0 rows affected (0.03 sec)

mysql> insert into default1 (emp_id, emp_name)
    -> values (1001, "Swapnil");
Query OK, 1 row affected (0.03 sec)

mysql> insert into default1 (emp_id, emp_name) values (1002, "akash");
Query OK, 1 row affected (0.01 sec)

mysql> select * from default1;
+--------+----------+------+
| emp_id | emp_name | city |
+--------+----------+------+
|   1001 | Swapnil  | Pune |
|   1002 | akash    | Pune |
+--------+----------+------+
2 rows in set (0.00 sec)

mysql> alter table default1 add salary int CHECK (salary>0);
ERROR 2013 (HY000): Lost connection to MySQL server during query
No connection. Trying to reconnect...
Connection id:    8
Current database: constraints

Query OK, 2 rows affected (0.05 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> insert into default1 (emp_id, emp_name, salary) values (1003, "harsh", 50000);
Query OK, 1 row affected (0.02 sec)

mysql> insert into default1 (emp_id, emp_name, salary) values (1003, "harsh",- 50000);
ERROR 3819 (HY000): Check constraint 'default1_chk_1' is violated.
mysql> select * from default1;
+--------+----------+------+--------+
| emp_id | emp_name | city | salary |
+--------+----------+------+--------+
|   1001 | Swapnil  | Pune |   NULL |
|   1002 | akash    | Pune |   NULL |
|   1003 | harsh    | Pune |  50000 |
+--------+----------+------+--------+
3 rows in set (0.00 sec)

mysql> 

