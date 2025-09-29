# Task 5 – SQL Joins
🎯 Objective

Learn how to combine data from multiple tables using different types of SQL joins: INNER, LEFT, RIGHT, FULL.

🛠 Tools Used

DB Browser for SQLite

MySQL Workbench

📑 Problem Statement

We created two related tables:

Customers → Stores customer details

Orders → Stores order details linked to customers

Then we applied different joins to merge data from both tables.
 --ERDiagram for this tables
    CUSTOMERS {
        INT customer_id PK
        VARCHAR customer_name
        VARCHAR city
    }

    ORDERS {
        INT order_id PK
        DATE order_date
        DECIMAL amount
        INT customer_id FK
    }

    CUSTOMERS ||--o{ ORDERS : "places"
    🔹 SQL Queries
1️⃣ INNER JOIN
Returns only customers that have orders.

SELECT Customers.customer_id, customer_name, city, order_id, amount
FROM Customers
INNER JOIN Orders
ON Customers.customer_id = Orders.customer_id;

2️⃣ LEFT JOIN
Returns all customers, even if they don’t have orders.

SELECT Customers.customer_id, customer_name, city, order_id, amount
FROM Customers
LEFT JOIN Orders
ON Customers.customer_id = Orders.customer_id;

3️⃣ RIGHT JOIN
Returns all orders, even if the customer record doesn’t exist.

SELECT Customers.customer_id, customer_name, city, order_id, amount
FROM Customers
RIGHT JOIN Orders
ON Customers.customer_id = Orders.customer_id;

4️⃣ FULL OUTER JOIN
Returns all customers and all orders.
⚠️ MySQL does not support FULL OUTER JOIN directly, so we simulate it with UNION.

SELECT Customers.customer_id, customer_name, city, order_id, amount
FROM Customers
LEFT JOIN Orders
ON Customers.customer_id = Orders.customer_id
UNION
SELECT Customers.customer_id, customer_name, city, order_id, amount
FROM Customers
RIGHT JOIN Orders
ON Customers.customer_id = Orders.customer_id;
--Sample output
| customer_id | customer_name | city        | order_id | amount |
| ----------- | ------------- | ----------- | -------- | ------ |
| 1           | Dinesh Lodhi  | Bhopal      | 101      | 250.00 |
| 1           | Dinesh Lodhi  | Bhopal      | 103      | 150.00 |
| 2           | Anurag Sharma | Indore      | 102      | 300.00 |
| 3           | Abhishek jain | Agra        | 104      | 400.00 |
| 4           | Madhu         | pune        | NULL     | NULL   |
