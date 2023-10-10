-- List the employee number, last name, first name, 
-- sex, and salary of each employee.
SELECT emp.emp_no,
	   emp.last_name,
	   emp.first_name,
	   emp.sex,
	   sal.salary
FROM employees AS emp
LEFT JOIN salaries AS sal
ON emp.emp_no = sal.emp_no
ORDER BY emp.emp_no;

-- List the first name, last name, and hire date for 
-- the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- List the manager of each department along with 
-- their department number, department name, 
-- employee number, last name, and first name.
SELECT dep_mng.dept_no,
	   dep.dept_name,
	   emp.emp_no,
	   emp.last_name,
	   emp.first_name
FROM dept_manager AS dep_mng
INNER JOIN departments AS dep
ON (dep_mng.dept_no = dep.dept_no)
INNER JOIN employees AS emp
ON (dep_mng.emp_no = emp.emp_no);

-- List the department number for each employee 
-- along with that employee’s employee number, 
-- last name, first name, and department name.
SELECT emp.emp_no,
	   emp.last_name,
	   emp.first_name,
	   depts.dept_no,
	   depts.dept_name
FROM employees AS emp
INNER JOIN dept_emp AS dept
ON (emp.emp_no = dept.emp_no)
INNER JOIN departments AS depts
ON (dept.dept_no = depts.dept_no)
ORDER BY emp.emp_no;

-- List first name, last name, and sex of each 
-- employee whose first name is Hercules and whose 
-- last name begins with the letter B.
SELECT first_name,
	   last_name,
	   sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- List each employee in the Sales department, 
-- including their employee number, last name, 
-- and first name.
SELECT emp.emp_no,
	   emp.last_name,
	   emp.first_name,
	   depts.dept_name
FROM employees AS emp
INNER JOIN dept_emp AS dept
ON (emp.emp_no = dept.emp_no)
INNER JOIN departments AS depts
ON (dept.dept_no = depts.dept_no)
WHERE depts.dept_name = 'Sales';


-- List each employee in the Sales and Development 
-- departments, including their employee number, 
-- last name, first name, and department name.
SELECT emp.emp_no,
	   emp.last_name,
	   emp.first_name,
	   depts.dept_name
FROM employees AS emp
INNER JOIN dept_emp AS dept
ON (emp.emp_no = dept.emp_no)
INNER JOIN departments AS depts
ON (dept.dept_no = depts.dept_no)
WHERE depts.dept_name IN ('Sales', 'Development')
ORDER BY emp.emp_no;

-- List the frequency counts, in descending order, 
-- of all the employee last names (that is, how many 
-- employees share each last name).
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;