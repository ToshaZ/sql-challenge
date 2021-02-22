--1.--List the following details of each employee: 
------employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no;

--2.--List first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986';

--3.--List the manager of each department with the following information: 
------department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name 
FROM dept_manager
LEFT JOIN departments
ON dept_manager.dept_no = departments.dept_no
LEFT JOIN employees
ON dept_manager.emp_no = employees.emp_no;

--4.--List the department of each employee with the following information: 
------employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
LEFT JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
LEFT JOIN employees
ON dept_emp.emp_no = employees.emp_no;

--5.--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%';

--6.--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM departments
LEFT JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
LEFT JOIN employees
ON dept_emp.emp_no = employees.emp_no
WHERE dept_name = 'Sales';

--7.--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM departments
LEFT JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
LEFT JOIN employees
ON dept_emp.emp_no = employees.emp_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--8.--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT employees.last_name, COUNT(last_name) AS "frequency_of_last_names"
FROM employees
GROUP BY last_name
ORDER BY "frequency_of_last_names" DESC;