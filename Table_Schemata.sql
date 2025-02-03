CREATE TABLE departments (dept_no VARCHAR(30) NOT NULL PRIMARY KEY, 
 						  dept_name VARCHAR(30));
CREATE TABLE titles (title_id CHAR(5) NOT NULL PRIMARY KEY, 
 					 title VARCHAR(30));
CREATE TABLE salaries (emp_no INT NOT NULL PRIMARY KEY, 
 					   salary DECIMAL);
CREATE TABLE employees (emp_no INT NOT NULL PRIMARY KEY, 
 						emp_title_id CHAR(5), FOREIGN KEY (emp_title_id) REFERENCES titles(title_id), 
 						birth_date DATE, 
 						first_name VARCHAR(30),
 						last_name VARCHAR(30),
 						sex VARCHAR(6),
 						hire_date DATE);
CREATE TABLE dept_manager (dept_no CHAR(4), 
 						   emp_no INT, FOREIGN KEY (emp_no) REFERENCES employees(emp_no));
CREATE TABLE dept_emp (emp_no INT, 
 					   dept_no VARCHAR(30), FOREIGN KEY (dept_no) REFERENCES departments(dept_no));