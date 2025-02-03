-- List the employee number, last name, first name, sex, and salary of each employee
SELECT employees.emp_no as employee_number, employees.last_name, employees.first_name, employees.sex, 
salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986						  
SELECT first_name, last_name, hire_date 
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY-MM-DD') LIKE '1986%';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name						  
SELECT dept_manager.dept_no, dept_manager.emp_no, 
departments.dept_name, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no
LEFT JOIN employees ON dept_manager.emp_no = employees.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name					  
SELECT employees.last_name, employees.first_name, departments.dept_no, departments.dept_name,
employees.emp_no
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
ORDER BY employees.last_name, employees.first_name;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B					  
SELECT e.first_name, e.last_name, e.sex
FROM employees e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';
	
-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_emp ON e.emp_no = dept_emp.emp_no
JOIN departments d ON dept_emp.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';
						  
-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, departments.dept_name
FROM employees e
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';				  
						  
-- List the frequency counts, in descending order of all the employee last names (that is, how many employees share each last name)						  
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;						  
						  						  
						  
						  
						  
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;
SELECT * FROM departments;
SELECT * FROM titles;
