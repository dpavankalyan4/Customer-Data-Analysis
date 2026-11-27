SHOW DATABASES;
USE project_customer_segmentation;
SHOW TABLES;
DESCRIBE customer;
SELECT COUNT(*) AS total_records
FROM customer;
SELECT COUNT(*) AS total_columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'project_customer_segmentation'
AND TABLE_NAME = 'customer';


select * from customer;
SELECT COUNT(*) AS total_rows FROM customer;
SELECT COUNT(*) AS null_count FROM customer WHERE customer_id IS NULL;
SELECT COUNT(*) FROM customer WHERE gender IS NULL;
SELECT COUNT(*) FROM customer WHERE age IS NULL;
SELECT COUNT(*) FROM customer WHERE category IS NULL;
SELECT COUNT(*) FROM customer WHERE quantity  IS NULL;
SELECT COUNT(*) FROM customer WHERE price IS NULL;
SELECT COUNT(*) FROM customer WHERE payment_method IS NULL;
SELECT COUNT(*) FROM customer WHERE invoice_date IS NULL;
SELECT COUNT(*) FROM customer WHERE shopping_mall IS NULL;
SELECT COUNT(*) FROM customer WHERE invoice_no IS NULL;

SELECT customer_id, COUNT(*) 
FROM customer 
GROUP BY customer_id 
HAVING COUNT(*) > 1;

SELECT invoice_no, COUNT(*)
FROM customer
GROUP BY invoice_no
HAVING COUNT(*) > 1;

SELECT * FROM customer WHERE age < 0 OR age > 100 OR quantity <= 0 OR price <= 0;

SELECT * FROM customer WHERE gender NOT IN ('Male', 'Female') OR gender IS NULL;

SELECT invoice_no, COUNT(*) FROM customer GROUP BY invoice_no HAVING COUNT(*) > 1;

DESCRIBE customer;

SELECT invoice_date
FROM customer
LIMIT 10;
SELECT invoice_no, COUNT(*)
FROM customer
GROUP BY invoice_no
HAVING COUNT(*) > 1;

SELECT *
FROM customer
WHERE invoice_no IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR price IS NULL
   OR payment_method IS NULL
   OR invoice_date IS NULL
   OR shopping_mall IS NULL;
   
   SELECT
SUM(invoice_no IS NULL) AS invoice_no,
SUM(customer_id IS NULL) AS customer_id,
SUM(gender IS NULL) AS gender,
SUM(age IS NULL) AS age,
SUM(category IS NULL) AS category,
SUM(quantity IS NULL) AS quantity,
SUM(price IS NULL) AS price,
SUM(payment_method IS NULL) AS payment_method,
SUM(invoice_date IS NULL) AS invoice_date,
SUM(shopping_mall IS NULL) AS shopping_mall
FROM customer;
   
   SELECT DISTINCT category
FROM customer;
SELECT DISTINCT payment_method
FROM customer;

SELECT invoice_date
FROM customer
WHERE STR_TO_DATE(invoice_date, '%d-%m-%Y') IS NULL;
SELECT DISTINCT shopping_mall
FROM customer;
SELECT COUNT(*) AS total_records
FROM customer;
SELECT
    MIN(age) AS min_age,
    MAX(age) AS max_age,
    MIN(quantity) AS min_quantity,
    MAX(quantity) AS max_quantity,
    MIN(price) AS min_price,
    MAX(price) AS max_price
FROM customer;

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT invoice_no) AS unique_invoices,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM customer;

SELECT
    MIN(age) AS min_age,
    MAX(age) AS max_age,
    MIN(quantity) AS min_quantity,
    MAX(quantity) AS max_quantity,
    MIN(price) AS min_price,
    MAX(price) AS max_price
FROM customer;

SELECT customer_id, COUNT(*)
FROM customer
GROUP BY customer_id
HAVING COUNT(*) > 1;
SELECT invoice_no, customer_id, gender, age, category,
       quantity, price, payment_method, invoice_date, shopping_mall,
       COUNT(*)
FROM customer
GROUP BY invoice_no, customer_id, gender, age, category,
         quantity, price, payment_method, invoice_date, shopping_mall
HAVING COUNT(*) > 1;

SELECT invoice_date
FROM customer
LIMIT 10;

## 1. How is the shopping distribution according to gender?
SELECT
    gender,
    COUNT(*) AS total_transactions,
    SUM(quantity) AS total_products
FROM customer
GROUP BY gender;
SELECT
    gender,
    COUNT(*) AS total_transactions
FROM customer
GROUP BY gender;
## 2.	Which gender did we sell more products to?
SELECT
    gender,
    SUM(quantity) AS total_products_sold
FROM customer
GROUP BY gender;

## 3.	Which gender generated more revenue?
SELECT
    gender,
    SUM(quantity * price) AS total_revenue
FROM customer
GROUP BY gender;

## 4.	Distribution of purchase categories relative to other columns?
SELECT category, COUNT(*) AS total_transactions, SUM(quantity) AS total_products FROM customer GROUP BY category ORDER BY total_products DESC;

SELECT DISTINCT category FROM customer;
SELECT DISTINCT age FROM customer;
SELECT DISTINCT gender FROM customer;

## 5.	How is the shopping distribution according to age?
SELECT 
    age,
    COUNT(*) AS total_transactions,
    SUM(quantity) AS total_products
FROM
    customer
GROUP BY age ORDER BY total_transactions DESC;

SELECT
    CASE
        WHEN age BETWEEN 10 AND 19 THEN '10-19'
        WHEN age BETWEEN 20 AND 29 THEN '20-29'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        WHEN age BETWEEN 60 AND 69 THEN '60-69'
    END AS age_group,
    COUNT(*) AS total_transactions
FROM customer
GROUP BY age_group
ORDER BY age_group; ## actual query





SELECT age, COUNT(*) AS total_transactions
FROM customer
GROUP BY age
ORDER BY total_transactions DESC;
## 6.	Which age cat did we sell more products to?
SELECT
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        ELSE '46+'
    END AS age_group,
    SUM(quantity) AS total_products
FROM customer
GROUP BY age_group
ORDER BY total_products DESC;
SELECT
    CASE
        WHEN age BETWEEN 10 AND 19 THEN '10-19'
        WHEN age BETWEEN 20 AND 29 THEN '20-29'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        WHEN age BETWEEN 60 AND 69 THEN '60-69'
    END AS age_group,
    SUM(quantity) AS total_products_sold
FROM customer
GROUP BY age_group
ORDER BY age_group;
## 7.	Which age cat generated more revenue?

SELECT
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        ELSE '46+'
    END AS age_group,
    SUM(quantity * price) AS total_revenue
FROM customer
GROUP BY age_group
ORDER BY total_revenue DESC;


select  * from customer;



SELECT
    CASE
        WHEN age BETWEEN 10 AND 19 THEN '10-19'
        WHEN age BETWEEN 20 AND 29 THEN '20-29'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        WHEN age BETWEEN 60 AND 69 THEN '60-69'
    END AS age_group,
    SUM(price * quantity) AS total_revenue
FROM customer
GROUP BY age_group
ORDER BY age_group;
## 8.	Distribution of purchase categories relative to other columns?
SELECT category, gender, COUNT(*) AS total_transactions
FROM customer
GROUP BY category, gender
ORDER BY total_transactions DESC;

SELECT
    category,
    gender,
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        ELSE '46+'
    END AS age_group,
    payment_method,
    shopping_mall,
    COUNT(*) AS total_transactions,
    SUM(quantity) AS total_products,
    ROUND(SUM(quantity * price), 2) AS total_revenue
FROM customer
GROUP BY
    category,
    gender,
    age_group,
    payment_method,
    shopping_mall
ORDER BY total_products DESC;


SELECT
    category,
    gender,
    payment_method,
    shopping_mall,
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        ELSE '46+'
    END AS age_group,
    COUNT(*) AS total_transactions,
    SUM(quantity) AS total_products,
    SUM(quantity * price) AS total_revenue
FROM customer
GROUP BY
    category,
    gender,
    payment_method,
    shopping_mall,
    age_group;
    
    
    SELECT
    category,
    COUNT(*) AS total_transactions,
    SUM(quantity) AS total_products,
    ROUND(SUM(quantity * price), 2) AS total_revenue
FROM customer
GROUP BY category
ORDER BY total_products DESC;
select * from customer;
## 9.	Does the payment method have a relation with other columns?

SELECT
    payment_method,
    gender,
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        ELSE '46+'
    END AS age_group,
    category,
    shopping_mall,
    COUNT(*) AS total_transactions
FROM customer
GROUP BY
    payment_method,
    gender,
    age_group,
    category,
    shopping_mall;
    
    SELECT
    payment_method,
    gender,
    COUNT(invoice_no) AS total_transactions
FROM customer
GROUP BY
    payment_method,
    gender
ORDER BY
    payment_method,
    gender;
    
    SELECT
    payment_method,
    gender,
    category,
    shopping_mall,
    COUNT(invoice_no) AS total_transactions
FROM customer
GROUP BY
    payment_method,
    gender,
    category,
    shopping_mall
ORDER BY
    payment_method,
    gender;
    ## 10.	How is the distribution of the payment method?
    SELECT
    payment_method,
    COUNT(*) AS total_transactions
FROM customer
GROUP BY payment_method
ORDER BY total_transactions DESC;
## q4 & q8
SELECT
    category,
    gender,
    payment_method,
    shopping_mall,
    COUNT(*) AS total_transactions,
    SUM(quantity) AS total_products,
    SUM(price * quantity) AS total_revenue
FROM customer
GROUP BY
    category,
    gender,
    payment_method,
    shopping_mall
ORDER BY total_products DESC;

## q4 final 
SELECT
    category,
    gender,
    SUM(quantity) AS total_products_sold
FROM customer
GROUP BY
    category,
    gender
ORDER BY
    category,
    gender;