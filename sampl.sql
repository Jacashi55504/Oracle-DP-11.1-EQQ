
-- 1. Create a list that includes the first initial of every employee's first name, a space, and the last name of the employee.

SELECT table_name
FROM user_tables
WHERE table_name LIKE 'JO%'

-- 2. – Create a list that includes the first initial of every employee's first name, a space, and the last name of the employee.

SELECT SUBSTR(first_name, 1, 1) || ' ' || last_name AS "Employee Names"
FROM employees

-- 3. Create a list of every employee's first name concatenated to a space and the employee's last name, and the email of all employees where the email address contains the string 'IN'.

SELECT first_name || ' ' || last_name as "Employee name", email AS "Email"
FROM employees
WHERE email LIKE '%IN%'

-- 4. Create a list of 'smallest' last name and the 'highest' last name from the employees table.

SELECT first_name, last_name
FROM employees
WHERE LENGTH(first_name) IN 
 (select MIN(LENGTH(first_name))                    --Subquery 
 FROM employees) AND LENGTH(last_name) IN 
 (select MIN(LENGTH(last_name))                    
 FROM employees)

-- 5. Create a list of weekly salaries from the employees table where the weekly salary is between 700 and 3000.
-- The salaries should be formatted to include a $ sign and have two decimal points like: $9999.99

SELECT TO_CHAR(salary, '$999,999.99') AS "Weekly Salary"
FROM employees
WHERE salary BETWEEN 700 AND 3000
