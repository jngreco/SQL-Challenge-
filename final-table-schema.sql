-- Employee Table 
CREATE TABLE employees( 
emp_no INT PRIMARY KEY NOT NULL,
emp_title VARCHAR NOT NULL,
birth_date DATE NOT NULL,
first_name VARCHAR NOT NULL,
last_name VARCHAR NOT NULL,
sex VARCHAR NOT NULL,
hire_date DATE NOT NULL
	);
	
-- Departments Table
CREATE TABLE departments(
dept_no VARCHAR PRIMARY KEY NOT NULL,
dept_name VARCHAR NOT NULL
);

-- Deptartment Employee Table
CREATE TABLE dept_emp(
emp_no INT NOT NULL,
dept_no VARCHAR NOT NULL,
CONSTRAINT ck1 PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
	
);

-- Department Manager Table 
CREATE TABLE dept_manager(
dept_no VARCHAR NOT NULL,
emp_no INT NOT NULL,
CONSTRAINT ck2 PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- Salaries Table 
CREATE TABLE salaries(
emp_no INT PRIMARY KEY NOT NULL,
salary VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- Titles Table (upload first)
CREATE TABLE titles(
title_id VARCHAR PRIMARY KEY NOT NULL,
title VARCHAR NOT NULL
);

ALTER TABLE employees ADD CONSTRAINT fk_employee_title FOREIGN KEY (emp_title) 
REFERENCES titles (title_id)

-- Upload data and check status 
select * from titles;
select * from employees;
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from salaries;
