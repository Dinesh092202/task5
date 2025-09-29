-- Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(100)
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Insert Customers
INSERT INTO Customers (customer_id, customer_name, city) VALUES
(1, 'Dinesh Lodhi', 'Bhopal'),
(2, 'Anurag Sharma', 'Indore'),
(3, 'Abhishek jain', 'Agra'),
(4, 'Madhu', 'Pune');

-- Insert Orders
INSERT INTO Orders (order_id, order_date, amount, customer_id) VALUES
(101, '2025-09-01', 250.00, 1),
(102, '2025-09-05', 300.00, 2),
(103, '2025-09-10', 150.00, 1),
(104, '2025-09-15', 400.00, 3);

-- INNER JOIN
SELECT Customers.customer_id, customer_name, city, order_id, amount
FROM Customers
INNER JOIN Orders
ON Customers.customer_id = Orders.customer_id;

-- LEFT JOIN
SELECT Customers.customer_id, customer_name, city, order_id, amount
FROM Customers
LEFT JOIN Orders
ON Customers.customer_id = Orders.customer_id;

-- RIGHT JOIN
SELECT Customers.customer_id, customer_name, city, order_id, amount
FROM Customers
RIGHT JOIN Orders
ON Customers.customer_id = Orders.customer_id;

-- FULL OUTER JOIN (MySQL workaround using UNION)
SELECT Customers.customer_id, customer_name, city, order_id, amount
FROM Customers
LEFT JOIN Orders
ON Customers.customer_id = Orders.customer_id
UNION
SELECT Customers.customer_id, customer_name, city, order_id, amount
FROM Customers
RIGHT JOIN Orders
ON Customers.customer_id = Orders.customer_id;
