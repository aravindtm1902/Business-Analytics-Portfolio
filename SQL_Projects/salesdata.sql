Create table Sales (
Order_line int primary key,
Order_id varchar,
Order_date date,
ship_date date,
ship_mode varchar,
customer_id varchar,
product_id varchar,
Sales numeric,
Quantity int,
Discount numeric,
Profit numeric);

select * from sales;

COPY sales from 'D:\postgres\data\dataset\SalesforSQL.csv'delimiter','
csv header;
