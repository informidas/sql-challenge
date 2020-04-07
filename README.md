# Employees Database - SQL Exercise

## Background

It is a beautiful spring day, and it is two weeks since you have been hired as a new data engineer at Pewlett Hackard. Your first major task is a research project on employees of the corporation from the 1980s and 1990s. All that remain of the database of employees from that period are six CSV files.

In this assignment, you will design the tables to hold data in the CSVs, import the CSVs into a SQL database, and answer questions about the data. In other words, you will perform:

1. Data Modeling

2. Data Engineering

3. Data Analysis

## Entity Relational Model

The following ERD was generated based on the structure of data in the following csv files: <br>

-  departments.csv
-  dept_emp.csv
-  dept_manager.csv
-  employees.csv
-  salaries.csv
-  titles.csv
---

![alt text](./EmployeeSQL/ERD.png "Entitiy Relational Diagram")

## Data Engineering
Using the ERD diagram as a guide, the following PostgreSQL database schema was generated to convert the model into a series of tables with correspondng PRIMARY KEYS, FOREIGN KEYS and other Constraints.  <br>
<pre><code><blockquote>
-- create a container Database <br>
CREATE DATABASE PewlettHackard <br></code></pre>
<br>
/* Scripts to generate tables  */ <br>
<br>
 -- employees table <br>
DROP TABLE IF EXISTS employees <br>
CREATE TABLE employees( <br>
emp_no  SERIAL PRIMARY KEY, <br>
birth_date DATE, <br>
first_name VARCHAR(100) NOT NULL, <br>
last_name VARCHAR(100) NOT NULL, <br>
gender CHAR(1), <br>
hire_date DATE <br>
); <br>
<br>
-- titles table <br>
DROP TABLE IF EXISTS titles <br>
CREATE TABLE titles ( <br>
emp_no	INT NOT NULL, <br>
title  VARCHAR(100) NOT NULL, <br>
from_date DATE NOT NULL, <br>
to_date DATE DEFAULT '1/1/9999', <br>
PRIMARY KEY (emp_no, title), <br>
FOREIGN KEY (emp_no) REFERENCES employees(emp_no) <br>
); <br>
<br>
-- salaries table <br>
DROP TABLE IF EXISTS salaries <br>
CREATE TABLE salaries ( <br>
emp_no	INT NOT NULL, <br>
salary	int NOT NULL, <br>
from_date DATE NOT NULL, <br>
to_date DATE NOT NULL, <br>
PRIMARY KEY (emp_no, from_date), <br>
FOREIGN KEY (emp_no) REFERENCES employees(emp_no) <br>
); <br>
<br>
-- departments table <br>
DROP TABLE IF EXISTS  departments <br>
CREATE TABLE departments ( <br>
dept_no SERIAL PRIMARY KEY, <br>
dept_name VARCHAR(100) NOT NULL <br>
 ); <br>
<br>
-- dept_managers table <br>
DROP TABLE IF EXISTS dept_managers <br>
CREATE TABLE dept_managers ( <br>
dept_no 	INT  NOT NULL, <br>
emp_no		INT NOT NULL, <br>
from_date	DATE NOT NULL, <br>
to_date		DATE DEFAULT '1/1/9999', <br>
PRIMARY KEY (dept_no, from_date), <br>
FOREIGN KEY (dept_no) REFERENCES departments(dept_no), <br>
FOREIGN KEY (emp_no) REFERENCES employees(emp_no) <br>
); <br>
<br>
-- dept_emp table <br>
DROP TABLE IF EXISTS dept_emp <br>
CREATE TABLE dept_emp ( <br>
emp_no 	INT NOT NULL, <br>
dept_no INT NOT NULL, <br>
from_date DATE NOT NULL, <br>
to_date   DATE DEFAULT '1/1/9999', <br>
PRIMARY KEY (emp_no, dept_no, from_date), <br>
FOREIGN KEY (emp_no) REFERENCES employees(emp_no), <br>
FOREIGN KEY (dept_no) REFERENCES departments(dept_no) <br>
); <br>
</blockquote>

## Data Analysis
<blockquote> <br>

-- 1. List Employees with their Salaries <br>
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary <br>
FROM  employees e <br>
INNER JOIN salaries s <br>
ON e.emp_no = s.emp_no; <br>
 <br>
-- 2. List of employees who were hired in 1986 <br>
SELECT e.emp_no, e.last_name, e.first_name, e.gender, e.hire_date <br>
FROM  employees e <br>
WHERE EXTRACT(YEAR FROM e.hire_date) = 1986; <br>

-- 3. List the manager of each department: department number, department name, the manager's employee number, last name, first name, and start and end employment dates <br>
SELECT dm.dept_no, d.dept_name, dm.emp_no as "mgr_no", e.last_name as "mgr_last_name", e.first_name as "mgr_first_name", dm.from_date, dm.to_date <br>
FROM employees e <br>
INNER JOIN dept_managers dm <br>
ON e.emp_no = dm.emp_no <br>
INNER JOIN departments d <br>
ON d.dept_no = dm.dept_no <br>
WHERE dm.to_date = '9999-01-01'; <br>
 <br>
-- 4. List the department of each employee: employee number, last name, first name, and department name <br>
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name <br>
FROM employees e <br>
INNER JOIN dept_emp de <br>
ON e.emp_no = de.emp_no <br>
INNER JOIN departments d <br>
ON d.dept_no = de.dept_no <br>
and de.to_date = (select max(to_date) from dept_emp where emp_no = e.emp_no); <br>
 <br>
-- 5. List all employees whose first name is "Hercules" and last names begin with "B." <br>
SELECT emp_no, first_name, last_name <br>
FROM employees <br>
where lower(first_name) = 'hercules' <br>
AND LEFT(upper(last_name), 1) = 'B'; <br>
 <br>
-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name <br>
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name <br>
FROM employees e <br>
INNER JOIN dept_emp de <br>
ON e.emp_no = de.emp_no <br>
INNER JOIN departments d <br>
ON d.dept_no = de.dept_no <br>
and de.to_date = '9999-01-01' <br>
and d.dept_name = 'Sales'; <br>
 <br>
-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name <br>
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name <br>
FROM employees e <br>
INNER JOIN dept_emp de <br>
ON e.emp_no = de.emp_no <br>
INNER JOIN departments d <br>
ON d.dept_no = de.dept_no <br>
and de.to_date = '9999-01-01' <br>
and d.dept_name in ('Sales', 'Development'); <br> 
</blockquote> <br>
