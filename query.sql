-- List the following details of each employee: 
-- employee number, last name, first name, gender, and salary.

select employees.emp_no, employees.last_name,employees.first_name,employees.gender,salaries.salary
from employees
join salaries 
on employees.emp_no = salaries.emp_no;

--list employees who were hired in 1986.
SELECT * FROM employees;
SELECT
   employees.last_name,
   employees.first_name, 
   employees.hire_date 
FROM
	employees
WHERE
   hire_date BETWEEN TO_DATE('31/12/1985', 'DD/MM/YYYY')
AND TO_DATE('01/01/1987', 'DD/MM/YYYY');

--List the manager of each department with the following information:
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.
SELECT m.dept_no,
	d.dept_name,
	m.emp_no,
	e.last_name,
	e.first_name,
	m.from_date,
	m.to_date
from dept_manager as m 
join department as d
on m.dept_no=d.dept_no
join employees as e
on e.emp_no=m.emp_no;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

select e.emp_no, 
	e.last_name,
	e.first_name,
	d.dept_name
from dept_manager as m 
join department as d
on m.dept_no=d.dept_no
join employees as e
on e.emp_no=m.emp_no;

--list all employees whose first name is "Hercules" and last names begin with "B."
SELECT 
	employees.first_name,
	employees.last_name
FROM employees
WHERE
	first_name = 'Hercules'
and last_name like 'B%';

--List all employees in the Sales department,
--including their employee number, last name, first name, and department name.

SELECT 
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
from dept_manager as m 
join department as d
on m.dept_no=d.dept_no
join employees as e
on e.emp_no=m.emp_no
where d.dept_name = 'Sales';

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT 
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
from dept_manager as m 
join department as d
on m.dept_no=d.dept_no
join employees as e
on e.emp_no=m.emp_no
where 
	d.dept_name = 'Sales' 
or d.dept_name ='Development';

--In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.

SELECT  last_name, count(last_name)
  FROM employees
  group by last_name
  order by count(last_name) desc;
  

