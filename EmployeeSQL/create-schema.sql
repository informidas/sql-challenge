/*
DROP TABLE IF EXISTS employees
CREATE TABLE employees(
emp_no  SERIAL PRIMARY KEY,
birth_date DATE,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
gender CHAR(1),
hire_date DATE
);

DROP TABLE IF EXISTS titles
CREATE TABLE titles (
emp_no	INT NOT NULL,
title  VARCHAR(100) NOT NULL,
from_date DATE NOT NULL,
to_date DATE DEFAULT '1/1/9999',
PRIMARY KEY (emp_no, title)
)

DROP TABLE IF EXISTS salaries
CREATE TABLE salaries (
emp_no	INT NOT NULL,
salary	int NOT NULL,
from_date DATE NOT NULL,
to_date DATE NOT NULL,
PRIMARY KEY (emp_no, from_date)
)

DROP TABLE IF EXISTS  departments
CREATE TABLE departments (
dept_no SERIAL PRIMARY KEY,
dept_name VARCHAR(100) NOT NULL)

DROP TABLE IF EXISTS dept_managers
CREATE TABLE dept_managers (
dept_no 	INT  NOT NULL,
emp_no		INT NOT NULL,
from_date	DATE NOT NULL,
to_date		DATE DEFAULT '1/1/9999',
PRIMARY KEY (dept_no, from_date)
)

DROP TABLE IF EXISTS dept_emp
CREATE TABLE dept_emp (
emp_no 	INT NOT NULL,
dept_no INT NOT NULL,
from_date DATE NOT NULL,
to_date   DATE DEFAULT '1/1/9999',
PRIMARY KEY (emp_no, dept_no, from_date)
)
*/



