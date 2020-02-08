-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary 
FROM employees e
	JOIN salaries s
		ON e.emp_no = s.emp_no;

-- 2. List employees who were hired in 1986.
SELECT last_name, first_name
FROM employees 
WHERE hire_date LIKE '1986%'; 

-- 3. List the manager of each department with the following information: department number, department name,
-- the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no as department_number,
	d.dept_name as department_name,
	dm.emp_no as manager_employee_number,
	e.last_name,
	e.first_name,
    dm.from_date as start_employment_date,
	dm.to_date as end_employment_date
FROM dept_manager dm
JOIN departments d
	ON dm.dept_no = d.dept_no
JOIN employees e
	ON dm.emp_no = e.emp_no;

-- 4. List the department of each employee with the following information: employee number, 
-- last name, first name, and department name.
SELECT e.emp_no as employee_number,
	e.last_name as last_name,
	e.first_name as first_name,
	d.dept_name as department_name
FROM employees e
JOIN dept_emp de
	ON de.emp_no = e.emp_no	
JOIN departments d
	ON d.dept_no = de.dept_no;
	
-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT emp_no,
	last_name,
	first_name,
	(SELECT dept_name 
		FROM departments
		WHERE dept_name = 'Sales')
FROM employees 
WHERE emp_no in (
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN (
		SELECT dept_no 
		FROM departments
		WHERE dept_name = 'Sales'
	)
);

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no as employee_number,
	e.last_name,
	e.first_name,
	d.dept_name as department_name
FROM employees e
JOIN dept_emp de
	ON e.emp_no = de.emp_no
JOIN departments d
	ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
	OR d.dept_name = 'Development'
ORDER BY e.emp_no;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
	COUNT(last_name) as last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	