DROP TABLE IF EXISTS monthly_sales;

CREATE TABLE monthly_sales (
    sale_id SERIAL PRIMARY KEY,
    product VARCHAR(50),
    sale_month DATE,
    revenue NUMERIC(10,2)
);

INSERT INTO monthly_sales (product, sale_month, revenue) VALUES
('Laptop', '2024-01-01', 120000),
('Laptop', '2024-02-01', 150000),
('Laptop', '2024-03-01', 170000),
('Mobile', '2024-01-01', 90000),
('Mobile', '2024-02-01', 85000),
('Mobile', '2024-03-01', 110000),
('Tablet', '2024-01-01', 40000),
('Tablet', '2024-02-01', 60000),
('Tablet', '2024-03-01', 55000);


SELECT 
    product,
    sale_month,
    revenue
FROM monthly_sales
ORDER BY product, sale_month;


SELECT
    sale_month,
    product,
    revenue,
    RANK() OVER (PARTITION BY sale_month ORDER BY revenue DESC) AS revenue_rank
FROM monthly_sales;


SELECT
    product,
    sale_month,
    revenue,
    revenue - LAG(revenue) OVER (PARTITION BY product ORDER BY sale_month) AS revenue_growth
FROM monthly_sales;


SELECT
    product,
    sale_month,
    revenue,
    ROUND(
        (revenue - LAG(revenue) OVER (PARTITION BY product ORDER BY sale_month))
        / LAG(revenue) OVER (PARTITION BY product ORDER BY sale_month) * 100, 2
    ) AS growth_percentage
FROM monthly_sales;


SELECT
    product,
    sale_month,
    revenue,
    CASE
        WHEN revenue >= 150000 THEN 'High Performer'
        WHEN revenue BETWEEN 80000 AND 149999 THEN 'Medium Performer'
        ELSE 'Low Performer'
    END AS performance_category
FROM monthly_sales;
