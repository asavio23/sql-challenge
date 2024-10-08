-- List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM Employees AS e
JOIN Salaries AS s 
    ON e.emp_no = s.emp_no;


-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT e.first_name, e.last_name, e.hire_date 
FROM Employees AS e 
WHERE e.hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_no, dd.dept_name
FROM Employees AS e
JOIN Dept_managers AS d 
    ON e.emp_no = d.emp_no
JOIN departments AS dd
    ON d.dept_no = dd.dept_no;


-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, de.dept_no, dd.dept_name
FROM dept_emp AS de 
JOIN Employees AS e 
    ON de.emp_no = e.emp_no
JOIN departments as d 
    ON de.dept_no = d.dept_no; 


-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex 
FROM Employees
WHERE first_name = 'HERCULES'
AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name. #d007

SELECT e.emp_no, e.last_name, e.first_name
FROM Employees AS e
WHERE e.emp_no 
IN ( 
    SELECT emp_no 
    FROM dept_emp 
    WHERE dept_no
    IN ( 
        SELECT dept_no 
        FROM departments 
        WHERE dept_name = 'Sales'
        )
    ); 

-- 7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_no, d.dept_name 
FROM dept_emp AS de 
JOIN Employees AS e 
    ON de.emp_no = e.emp_no
JOIN departments AS d 
    ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');



-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(*) AS Frequency_count 
FROM Employees 
GROUP BY last_name
ORDER BY Frequency_count DESC;


