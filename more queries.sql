--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

select e.emp_no, last_name, first_name, sex, salary
from employees as e
inner join salaries as s
on e.emp_no = s.emp_no

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.emp_no, last_name, first_name, hire_date FROM employees as e
WHERE hire_date between '1/1/1986' and '12/31/1986';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

select e.emp_no, last_name, first_name, dept_no
from employees as e
join dept_manager as dm
on e.emp_no = dm.emp_no
--join departments as de
--on dm.dept_no = de.dept_no;
-- I could not, no matter how many variations I tried, get the 2nd join to have the dept_name included.

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

select e.emp_no, last_name, first_name, dept_name
from employees as e
join dept_emp
on e.emp_no = dept_emp.emp_no
join departments
on dept_emp.dept_no = departments.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name, sex
from employees as e
where first_name = 'Hercules'
and last_name like 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select e.emp_no, last_name, first_name, dept_name
from employees as e
join dept_emp
on e.emp_no = dept_emp.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select e.emp_no, last_name, first_name, dept_name
from employees as e
join dept_emp
on e.emp_no = dept_emp.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales'
or departments.dept_name = 'Development'

--8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.

select last_name,
count(last_name) as "frequency"
from employees as e
group by last_name
order by
count(last_name) desc;