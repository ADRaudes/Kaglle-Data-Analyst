-- empleados con mayor salario
with max_salary as (

SELECT e.emp_no, s.salary, de.dept_no
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE de.to_date = '9999-01-01'
AND s.to_date = '9999-01-01'
)
SELECT e.first_name, e.last_name, d.dept_name, c.title, ms.salary
FROM max_salary ms
JOIN employees e ON ms.emp_no = e.emp_no
JOIN departments d ON ms.dept_no = d.dept_no
JOIN titles c ON ms.emp_no = c.emp_no
WHERE c.to_date = '9999-01-01'
ORDER BY ms.salary DESC
LIMIT 10;


-- 10 empleados mas veteranos 
SELECT e.first_name, e.last_name, e.hire_date, d.dept_name, 
TIMESTAMPDIFF(YEAR, e.hire_date, CURDATE()) AS anios_trabajados
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no  
JOIN departments d ON de.dept_no = d.dept_no  
WHERE de.to_date = '9999-01-01'
ORDER BY e.hire_date ASC
LIMIT 10;

-- trayectoria de Arie Staelin
SELECT e.emp_no, e.first_name, e.last_name,s.from_date, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.emp_no = '111400' 
ORDER BY s.from_date DESC;

-- empleados que han trabajado en mas departamentos y cargos
SELECT e.first_name, e.last_name, 
COUNT(DISTINCT de.dept_no) AS departamentos , 
COUNT(DISTINCT t.title) AS titulos
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN titles t ON e.emp_no = t.emp_no
GROUP BY e.emp_no
ORDER BY departamentos DESC, titulos DESC
LIMIT 10;

-- ranking salarial por departamentos 
SELECT d.dept_name, e.first_name, e.last_name, s.salary,
RANK() OVER (PARTITION BY d.dept_name ORDER BY s.salary DESC) AS Ranking
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no    
WHERE de.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
ORDER BY d.dept_name, s.salary DESC;







