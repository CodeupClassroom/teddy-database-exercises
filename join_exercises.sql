-- Write a query that shows each department along with the name of the current manager for that department.

SELECT
  d.dept_name AS 'Department Name',
  concat(e.first_name, ' ', e.last_name
  )           AS 'Department Manager'
FROM employees e
  JOIN dept_manager de ON de.emp_no = e.emp_no
  JOIN departments d ON d.dept_no = de.dept_no
WHERE de.to_date >= curdate()
ORDER BY d.dept_name;

-- Find the name of all departments currently managed by women.


SELECT
  d.dept_name AS 'Department Name',
  concat(e.first_name, ' ', e.last_name
  )           AS 'Department Manager'
FROM employees e
  JOIN dept_manager dm ON dm.emp_no = e.emp_no
  JOIN departments d ON d.dept_no = dm.dept_no
WHERE e.gender = 'F' AND dm.to_date >= curdate()
ORDER BY d.dept_name;

-- Find the current titles of employees currently working in the Customer Service department.
DESCRIBE titles;
DESCRIBE departments;

SELECT
  t.title,
  count(t.emp_no) AS 'COUNT'
FROM titles t
  JOIN dept_emp de ON de.emp_no = t.emp_no
  JOIN departments d ON d.dept_no = de.dept_no
WHERE t.to_date >= curdate() AND d.dept_name = 'Customer Service' AND de.to_date >= curdate()
GROUP BY t.title;

-- Find the current salary of all current managers.

DESCRIBE salaries;

SELECT
  d.dept_name AS 'Department Name',
  concat(e.first_name, ' ', e.last_name
  )           AS 'Department Manager',
  s.salary
FROM employees e
  JOIN dept_manager dm ON dm.emp_no = e.emp_no
  JOIN salaries s ON s.emp_no = e.emp_no
  JOIN departments d ON d.dept_no = dm.dept_no
WHERE dm.to_date >= curdate() AND s.to_date >= curdate()
ORDER BY d.dept_name;

# Bonus Find the names of all current employees, their department name, and their current manager's name.


SELECT
  d.dept_name,
  mortals.first_name,
  mortals.last_name,
  mgmt.first_name,
  mgmt.last_name
FROM employees mortals
  JOIN dept_emp de ON mortals.emp_no = de.emp_no
  JOIN departments d ON de.dept_no = d.dept_no
  JOIN dept_manager manager ON d.dept_no = manager.dept_no
  JOIN employees mgmt ON manager.emp_no = mgmt.emp_no
WHERE de.to_date > curdate()
      AND manager.to_date > curdate()
ORDER BY d.dept_name;