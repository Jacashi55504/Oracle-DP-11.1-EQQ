
-- 1. Create a list that includes the first initial of every employee's first name, a space, and the last name of the employee.

SELECT table_name
FROM user_tables
WHERE table_name LIKE 'JO%';

-- 2. – Create a list that includes the first initial of every employee's first name, a space, and the last name of the employee.

SELECT SUBSTR(first_name, 1, 1) || ' ' || last_name AS "Employee Names"
FROM employees;

-- 3. Create a list of every employee's first name concatenated to a space and the employee's last name, and the email of all employees where the email address contains the string 'IN'.

SELECT first_name || ' ' || last_name as "Employee name", email AS "Email"
FROM employees
WHERE email LIKE '%IN%';

-- 4. Create a list of 'smallest' last name and the 'highest' last name from the employees table.

SELECT first_name, last_name
FROM employees
WHERE LENGTH(first_name) IN 
 (select MIN(LENGTH(first_name))                    --Subquery 
 FROM employees) AND LENGTH(last_name) IN 
 (select MIN(LENGTH(last_name))                    
 FROM employees);

-- 5. Create a list of weekly salaries from the employees table where the weekly salary is between 700 and 3000.
-- The salaries should be formatted to include a $ sign and have two decimal points like: $9999.99

SELECT TO_CHAR(salary, '$999,999.99') AS "Weekly Salary"
FROM employees
WHERE salary BETWEEN 700 AND 3000;

-- 6. – Create a list of every employee and his related job title sorted by job_title. 

SELECT SUBSTR(first_name, 1, 1) || ' ' || last_name as "Employee name", job_title AS "Job"
FROM employees NATURAL JOIN jobs;

-- 7. Create a list of every employee's job, the salary ranges within the job, and the employee's salary.
-- List the lowest and highest salary range within each job with a dash to separate the salaries like this: 100 – 200.

SELECT SUBSTR(e.first_name, 1, 1) || ' ' || e.last_name AS "Employee name", job_title AS "Job", j.min_salary || ' - ' || j.max_salary AS "Salary range", e.salary AS "Employee's salary"
FROM employees e INNER JOIN jobs j USING (JOB_ID);
 
-- 8. – Using an ANSII join method, create a list of every employee's first initial and last name, and department name.
-- Make sure the tables are joinedon all of the foreign keys declared between the two tables.
 
SELECT CONCAT(SUBSTR(first_name, 1, 1), last_name) AS "Employee Name", department_name AS "Department Name"
FROM employees NATURAL JOIN departments;
 
-- 9. Change the previous listing to join only on the department_id column.
 
SELECT CONCAT(SUBSTR(first_name, 1, 1), last_name) AS "Employee Name", department_name AS "Department Name"
FROM employees e LEFT OUTER JOIN departments d
 ON (e.department_id = d.department_id);
 
-- 10. Create a list of every employee's last name, and the word nobody or somebody depending on whether or not the employee has a manager.
-- Use the Oracle DECODE function to create the list.

SELECT first_name, NVL2(manager_id, 'NOBODY', 'SOMEBODY') AS "Works for" -- Using NVL2 for better handling
FROM employees 

-- 11. Create a list of every employee's first initial and last name, salary, and a yes or no to show whether or not an employee makes a commission
SELECT SUBSTR(FIRST_NAME, 1, 1) || ' ' || LAST_NAME as "Employee name", salary as "Salary",
NVL2(commission_pct, 'No', 'Yes') AS "Commission"
FROM employees 


