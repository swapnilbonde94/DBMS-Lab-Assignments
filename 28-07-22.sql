mysql> use helloDBMS;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+---------------------+
| Tables_in_helloDBMS |
+---------------------+
| student_details     |
+---------------------+
1 row in set (0.00 sec)

mysql> select * from student_details;
Empty set (0.01 sec)

mysql> alter table student_details rename to sd;
Query OK, 0 rows affected (0.02 sec)

mysql> insert into sd 
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> desc sd;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| roll_no   | varchar(20) | YES  |     | NULL    |       |
| name      | varchar(30) | YES  |     | NULL    |       |
| age       | int         | YES  |     | NULL    |       |
| city      | varchar(20) | YES  |     | NULL    |       |
| per       | float       | YES  |     | NULL    |       |
| Mobile_no | varchar(20) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

mysql> desc table sd;
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------+
| id | select_type | table | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra |
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------+
|  1 | SIMPLE      | sd    | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    1 |   100.00 | NULL  |
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------+
1 row in set, 1 warning (0.01 sec)

mysql> insert into table 
    -> values(1, "Adi", 19, "Pune", 95.2);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'table
values(1, "Adi", 19, "Pune", 95.2)' at line 1
mysql> insert into sd values(1, "Adi", 19, "Pune", 95.2);
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into sd values("1", "Adi", 19, "Pune", 95.2);
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into sd values(1, "Adi", 19, "Pune", 95.2, 4132134);
Query OK, 1 row affected (0.03 sec)

mysql> select * from sd;
+---------+------+------+------+------+-----------+
| roll_no | name | age  | city | per  | Mobile_no |
+---------+------+------+------+------+-----------+
| 1       | Adi  |   19 | Pune | 95.2 | 4132134   |
+---------+------+------+------+------+-----------+
1 row in set (0.00 sec)

mysql> create view customerPayments
    -> as
    -> select
    -> ^C
mysql> create view sd_view
    -> as
    -> select roll_no, name, age from sd
    -> where roll_no>0;
Query OK, 0 rows affected (0.03 sec)

mysql> select * from sd_view;
+---------+------+------+
| roll_no | name | age  |
+---------+------+------+
| 1       | Adi  |   19 |
+---------+------+------+
1 row in set (0.01 sec)

mysql> 
