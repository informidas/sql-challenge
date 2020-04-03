/* Employee Database Schema */

DROP TABLE IF EXISTS employees
CREATE TABLE employees(
emp_no  SERIAL PRIMARY KEY,
birth_date DATE,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
gender CHAR(1),
hire_date DATE
);

-- create titles table
DROP TABLE IF EXISTS titles
CREATE TABLE titles (
emp_no	INT NOT NULL,
title  VARCHAR(100) NOT NULL,
from_date DATE NOT NULL,
to_date DATE DEFAULT '1/1/9999',
PRIMARY KEY (emp_no, title),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- create salaries table
DROP TABLE IF EXISTS salaries
CREATE TABLE salaries (
emp_no	INT NOT NULL,
salary	int NOT NULL,
from_date DATE NOT NULL,
to_date DATE NOT NULL,
PRIMARY KEY (emp_no, from_date),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- create departments table
DROP TABLE IF EXISTS  departments
CREATE TABLE departments (
dept_no SERIAL PRIMARY KEY,
dept_name VARCHAR(100) NOT NULL
);

-- create department managers table
DROP TABLE IF EXISTS dept_managers
CREATE TABLE dept_managers (
dept_no 	INT  NOT NULL,
emp_no		INT NOT NULL,
from_date	DATE NOT NULL,
to_date		DATE DEFAULT '1/1/9999',
PRIMARY KEY (dept_no, from_date),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- create deartment employees table
DROP TABLE IF EXISTS dept_emp
CREATE TABLE dept_emp (
emp_no 	INT NOT NULL,
dept_no INT NOT NULL,
from_date DATE NOT NULL,
to_date   DATE DEFAULT '1/1/9999',
PRIMARY KEY (emp_no, dept_no, from_date),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);




