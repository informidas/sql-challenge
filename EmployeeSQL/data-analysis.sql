<<<<<<< HEAD

/* Data Analysis */

-- 1. List Employees with their Salaries
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM  employees e
INNER JOIN salaries s
ON e.emp_no = s.emp_no;


-- 2. List of employees who were hired in 1986
SELECT e.emp_no, e.last_name, e.first_name, e.gender, e.hire_date
FROM  employees e
WHERE EXTRACT(YEAR FROM e.hire_date) = 1986;

-- 3. List the manager of each department: department number, department name, the manager's employee number, last name, first name, and start and end employment dates
SELECT dm.dept_no, d.dept_name, dm.emp_no as "mgr_no", e.last_name as "mgr_last_name", e.first_name as "mgr_first_name", dm.from_date, dm.to_date
FROM employees e
INNER JOIN dept_managers dm
ON e.emp_no = dm.emp_no
INNER JOIN departments d
ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01';

-- 4. List the department of each employee: employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de
ON e.emp_no = de.emp_no
INNER JOIN departments d
ON d.dept_no = de.dept_no
and de.to_date = (select max(to_date) from dept_emp where emp_no = e.emp_no);

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT emp_no, first_name, last_name
FROM employees
where lower(first_name) = 'hercules'
AND LEFT(upper(last_name), 1) = 'B';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de
ON e.emp_no = de.emp_no
INNER JOIN departments d
ON d.dept_no = de.dept_no
and de.to_date = '9999-01-01'
and d.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de
ON e.emp_no = de.emp_no
INNER JOIN departments d
ON d.dept_no = de.dept_no
and de.to_date = '9999-01-01'
and d.dept_name in ('Sales', 'Development');
=======

/* Data Analysis */

-- 1. List Employees with their Salaries
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM  employees e
INNER JOIN salaries s
ON e.emp_no = s.emp_no;


-- 2. List of employees who were hired in 1986
SELECT e.emp_no, e.last_name, e.first_name, e.gender, e.hire_date
FROM  employees e
WHERE EXTRACT(YEAR FROM e.hire_date) = 1986;

-- 3. List the manager of each department: department number, department name, the manager's employee number, last name, first name, and start and end employment dates
SELECT dm.dept_no, d.dept_name, dm.emp_no as "mgr_no", e.last_name as "mgr_last_name", e.first_name as "mgr_first_name", dm.from_date, dm.to_date
FROM employees e
INNER JOIN dept_managers dm
ON e.emp_no = dm.emp_no
INNER JOIN departments d
ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01';

-- 4. List the department of each employee: employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de
ON e.emp_no = de.emp_no
INNER JOIN departments d
ON d.dept_no = de.dept_no
and de.to_date = (select max(to_date) from dept_emp where emp_no = e.emp_no);

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT emp_no, first_name, last_name
FROM employees
where lower(first_name) = 'hercules'
AND LEFT(upper(last_name), 1) = 'B';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de
ON e.emp_no = de.emp_no
INNER JOIN departments d
ON d.dept_no = de.dept_no
and de.to_date = '9999-01-01'
and d.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de
ON e.emp_no = de.emp_no
INNER JOIN departments d
ON d.dept_no = de.dept_no
and de.to_date = '9999-01-01'
and d.dept_name in ('Sales', 'Development');
>>>>>>> refs/remotes/origin/master
