/*
Section 4
How to retrieve data 
from two or more tables
Exercises
Write a SELECT statement that joins the Categories table to the Products table and returns these columns: 
category_name, product_name, list_price.
Sort the result set by the category_name column and then by the product_name column in ascending sequence.
*/

SELECT c.category_name, p.product_name, p.list_price
FROM categories c
JOIN products p
ON c.category_id = p.c.category_id
GROUP BY c.category_name, p.product_name ASC;
