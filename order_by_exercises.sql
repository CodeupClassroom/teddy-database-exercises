USE employees;

# Find all employees with first names 'Irena', 'Vidya', or 'Maya'
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;


# Find all employees whose last name starts with 'E'
SELECT *
FROM employees
WHERE last_name LIKE 'E%'
ORDER BY emp_no DESC;


SELECT *
FROM employees
WHERE hire_date LIKE '199%'
  AND birth_date LIKE '%-12-25'
ORDER BY birth_date, hire_date DESC;

