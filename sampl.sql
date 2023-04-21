-- 1. Create a list that includes the first initial of every employee's first name, a space, and the last name of the employee. */

SELECT table_name
FROM user_tables
WHERE table_name LIKE 'JO%';

-- 2. Create a list that includes the first initial of every employee's first name, a space, and the last name of the employee.

SELECT SUBSTR(first_name, 1, 1) || ' ' || last_name AS "Employee Names"
FROM employees;

