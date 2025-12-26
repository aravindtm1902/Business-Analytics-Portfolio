

DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(50),
    region VARCHAR(50)
);

CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    product VARCHAR(50),
    quantity INT,
    price NUMERIC(10,2),
    sale_date DATE
);

INSERT INTO customers (customer_name, region) VALUES
('Ravi', 'South'),
('Anita', 'North'),
('Karthik', 'East'),
('Meena', 'West');

INSERT INTO sales (customer_id, product, quantity, price, sale_date) VALUES
(1, 'Laptop', 1, 55000, '2024-01-10'),
(2, 'Mobile', 2, 20000, '2024-01-12'),
(1, 'Tablet', 1, 15000, '2024-01-15'),
(3, 'Laptop', 1, 60000, '2024-01-18'),
(4, 'Mobile', 3, 18000, '2024-01-20');

SELECT SUM(quantity * price) AS total_revenue FROM sales;

SELECT product, SUM(quantity * price) AS revenue
FROM sales
GROUP BY product
ORDER BY revenue DESC;

SELECT c.region, SUM(s.quantity * s.price) AS revenue
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.region
ORDER BY revenue DESC;
