
-- Contrataciones por año
SELECT 
COUNT (emp_no) AS contrataciones, 
YEAR(hire_date) AS year 
FROM employees
GROUP BY year
ORDER BY contrataciones DESC;

-- Abandonos por año
SELECT 
count(emp_no) AS abandonos,
year(to_date) AS year
FROM dept_emp
WHERE to_date <> '9999-01-01' 
group by year
ORDER BY abandonos DESC;

-- balance de contrataciones y abandonos 
WITH contrataciones AS (
SELECT 
COUNT (emp_no) AS contrataciones, 
YEAR(hire_date) AS year 
FROM employees
GROUP BY year
),
abandonos AS (
SELECT 
count(emp_no) AS abandonos,
year(to_date) AS year
FROM dept_emp
WHERE to_date <> '9999-01-01' 
group by year
)

SELECT 
c.contrataciones - a.abandonos AS balance, 
c.year 
FROM contrataciones c
JOIN abandonos a 
ON c.year = a.year
group by c.year
ORDER BY balance DESC;

-- mujeres por año
WITH contrataciones_M AS (
SELECT 
year(hire_date) AS year_d,
COUNT (CASE WHEN gender = 'M' THEN 1 END) AS M, 
COUNT (CASE WHEN gender = 'F' THEN 1 END) AS F 
FROM employees
GROUP BY year_d
)
SELECT 
year_d, 
ROUND(F / (M + F) * 100, 2) AS porcentaje_mujeres
FROM contrataciones_M
ORDER BY year_d ASC;



-- empleados historicos de departamentos 
SELECT 
d.dept_name, 
count (e.emp_no) AS empleados_historicos
FROM dept_emp e
inner join departments d
on d.dept_no = e.dept_no
GROUP BY d.dept_name
ORDER BY empleados_historicos DESC;
