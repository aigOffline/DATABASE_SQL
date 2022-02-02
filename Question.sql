


/*------------------------------------------------------------------------
Write a SELECT statement that returns one column from the Customers table
named full_name that joins the last_name and first_name columns.
Format this column with the last name, a comma, a space, and
the first name like this:
Doe, John
Sort the result set by last name in ascending sequence.
Return only the customers whose last name begins with letters from M to Z.

------------------------------------------------------------------------*/
SELECT first_name, last_name, CONCAT(last_name, ", ", first_name) AS full_name
FROM customers
WHERE last_name >= "M"
ORDER BY last_name ASC;

