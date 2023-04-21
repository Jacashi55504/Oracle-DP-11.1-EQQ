-- 1. Create a list that includes the first initial of every employee's first name, a space, and the last name of the employee. */

SELECT table_name
FROM user_tables
WHERE table_name LIKE 'JO%';

-- 2. Create a list that includes the first initial of every employee's first name, a space, and the last name of the employee.

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

-- 6. Create a list of every employee and his related job title sorted by job_title. 

SELECT SUBSTR(first_name, 1, 1) || ' ' || last_name as "Employee name", job_title AS "Job"
FROM employees NATURAL JOIN jobs;

-- 7. Create a list of every employee's job, the salary ranges within the job, and the employee's salary.
-- List the lowest and highest salary range within each job with a dash to separate the salaries like this: 100 – 200.

SELECT SUBSTR(e.first_name, 1, 1) || ' ' || e.last_name AS "Employee name", job_title AS "Job", j.min_salary || ' - ' || j.max_salary AS "Salary range", e.salary AS "Employee's salary"
FROM employees e INNER JOIN jobs j USING (JOB_ID);
 
-- 8. Using an ANSII join method, create a list of every employee's first initial and last name, and department name.
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
FROM employees;

-- 11. Create a list of every employee's first initial and last name, salary, and a yes or no to show whether or not an employee makes a commission

SELECT SUBSTR(first_name, 1, 1) || ' ' || last_name AS "Employee name", salary AS "Salary",
NVL2(commission_pct, 'No', 'Yes') AS "Commission"
FROM employees;

-- 12. Create a list of every employee's last name, department name, city, and state_province.
-- Include departments without employees.

SELECT e.last_name, d.department_name, l.city, l.state_province
FROM employees e LEFT OUTER JOIN departments d
 ON (e.department_id = d.department_id)
LEFT OUTER JOIN locations l
 ON (d.location_id = l.location_id);
 
-- 13. Create a list of every employee's first and last names, and the first occurrence of: commission_pct, manager_id, or -1.
-- If an employee gets commission, display the commission_pct column; if no commission, then display his manager_id; if he has neither commission nor manager, then the number -1.

SELECT first_name AS "First name", last_name AS "Last name",
CASE 
 WHEN commission_pct > 0 THEN commission_pct
 WHEN commission_pct = NULL THEN manager_id
 ELSE -1 
END AS "Which Function?"
FROM employees;

-- 14. Create a list of every employee's last name, salary, and job_grade for all employees working in departments with a department_id greater than 50.

SELECT last_name, salary, grade_level
FROM employees NATURAL JOIN job_grades
WHERE department_id > 50;

-- 15. Produce a list of every employee's last name and department name.
--Include both employees without departments, and departments without employees.

SELECT e.last_name, d.department_name
FROM employees e RIGHT OUTER JOIN departments d
ON (e.department_id = d.department_id);

-- 16. Create a treewalking list of every employee's last name, his manager's last name, and his position in the company.
-- The top level manager has position 1, this manager's subordinates position 2, their subordinates position 3, and so on.
-- Start the listing with employee number 100.

SELECT LEVEL AS POSITION, e.last_name, m.last_name AS MANAGER_NAME
FROM employees e LEFT OUTER JOIN employees m
 ON (e.manager_id = m.employee_id)
START WITH e.employee_id = 100 -- (e.employee_id IS NULL) BETTER OPTIMIZATION
E BY PRIOR e.employee_id = e.manager_id

-- 17. Produce a list of the earliest hire date, the latest hire date, and the number of employees from the employees table
SELECT MIN(hire_date) AS "Lowest", MAX(hire_date) AS "Highest", COUNT(employee_id) AS "No of employees"
FROM employees;

-- 18.Create a list of department names and the departmental costs (salaries added up).
-- Include only departments whose salary costs are between 15000 and 31000, and sort the listingby the cost.

-- 19. Show the highest average salary for the departments in the employees table.
-- Round the result to the nearest whole number

-- 20. Create a list of department names and their monthly costs (salaries added up).

-- 21. Create a list of department names, and job_ids.
-- Calculate the monthly salary cost for each job_id within a department, for each department, and for all departments added together.

-- 22. Create a list of department names, and job_ids.
-- Calculate the monthly salary costfor each job_id within a department, for each department, for each group of job_ids irrespective of the department, and for all departments added together. (Hint: Cube)

-- 23. Expand the previous list to also show if the department_id or job_id was used to create the subtotals shown in the output. (Hint: Cube, Grouping)

-- 24. Create a list that includes the monthly salary costs for each job title within a department.
-- In the same list, display the monthly salary cost per city. (Hint: Grouping Sets)

-- 25. Create a list of employee names as shown and department ids.
-- In the same report, list the department ids and department names. And finally, list the cities.
-- The rows should not be joined, just listed in the same report. (Hint: Union)

-- 26. Create a list of each employee's first initial and last name, salary, and department name for each employee earning more than the average for his department.




