USE employees;


# Find all employees whose last name starts with 'E'
SELECT CONCAT(first_name, ' ', last_name) AS 'Full Name'
FROM employees
WHERE last_name LIKE 'e%e'
  AND first_name LIKE 'e%e'
ORDER BY emp_no DESC;




SELECT *, CONCAT('Days Worked: ', DATEDIFF(CURDATE(), hire_date))
FROM employees
WHERE hire_date LIKE '199%'
      AND birth_date LIKE '%-12-25'
ORDER BY birth_date, hire_date DESC;


SELECT CONCAT ('NAME: ',first_name,' ', last_name, '   DAYS SINCE HIRED: ', datediff(curdate(), hire_date))
FROM employees
WHERE hire_date >= '1990-01-01' && hire_date <= '1999-12-31'
      AND birth_date LIKE '%-12-25'
ORDER BY datediff(curdate(), hire_date) DESC;