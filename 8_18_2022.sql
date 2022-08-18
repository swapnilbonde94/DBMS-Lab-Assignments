mysql> use swappy;
Database changed
mysql> create table orders (orderID int, customerID int, orderDate varchar(30));
Query OK, 0 rows affected (0.04 sec)

mysql> insert into orders values
    -> (101, 2, "18-09-2022"),
    -> (102, 37, "19-09-2022"),
    -> (103, 77, "20-09-2022");
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0
