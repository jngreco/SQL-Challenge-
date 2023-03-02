--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
	FROM employees AS e
	INNER JOIN salaries as s 
	ON s.emp_no = e.emp_no
ORDER BY e.last_name DESC;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT e.emp_no, e.first_name, e.last_name, e.hire_date
	FROM employees AS e 
	WHERE DATE_PART('year', e.hire_date) = 1986
ORDER BY e.hire_date DESC;

-- List the manager of each department along with their department number, 
-- department name, employee number, last name, and first name.
SELECT ma.dept_no, d.dept_name, ma.emp_no, e.last_name, e.first_name
	FROM dept_manager AS ma
	INNER JOIN departments AS d
		ON ma.dept_no = d.dept_no
	INNER JOIN employees AS e
		ON ma.emp_no = e.emp_no
ORDER BY ma.dept_no DESC;

-- List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name.
SELECT * FROM employees;
SELECT * FROM dept_manager;

SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
	FROM dept_emp as de
	INNER JOIN employees as e 
		ON de.emp_no = e.emp_no
	INNER JOIN departments as d 
		ON de.dept_no = d.dept_no
ORDER BY d.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules 
-- and whose last name begins with the letter B.
SELECT e.first_name, e.last_name, e.sex
	FROM employees AS e 
	WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%'
ORDER BY e.last_name;

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
	FROM dept_emp as de
	INNER JOIN employees as e 
		ON de.emp_no = e.emp_no
	INNER JOIN departments as d
		ON de.dept_no = d.dept_no
	WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;

-- List each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
	FROM dept_emp as de
	INNER JOIN employees as e 
		ON de.emp_no = e.emp_no
	INNER JOIN departments as d
		ON de.dept_no = d.dept_no
	WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY e.emp_no;

-- List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).
SELECT last_name, 
	COUNT(last_name) AS Frequency 
		FROM employees 
	GROUP BY last_name
ORDER BY frequency DESC;