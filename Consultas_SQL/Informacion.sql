-- vamos a introducir unos datos clave 

SELECT 
    COUNT (DISTINCT emp_no) AS Total_Empleados
FROM employees; -- cuantos empleados tenemos? 

SELECT 
    ROW_NUMBER() OVER(ORDER BY dept_no),
    dept_name
FROM departments; -- cuantos departamentos hay y sus nombres? 

SELECT      
    MIN (hire_date) AS Desde, 
    MAX(hire_date) AS Hasta
-- rango de fechas de contratación
FROM employees;



SELECT gender, 
    COUNT (emp_no) AS cantidad
FROM employees
group by gender; -- cuantos clientes tenemos por genero? 

SELECT 
    COUNT(e.emp_no) AS ACTIVOS
FROM employees e
INNER JOIN dept_emp d
    ON e.emp_no = d.emp_no
AND d.to_date = '9999-01-01'; -- cuantos empleados activos tenemos?

SELECT
    AVG(salary) AS Promedio, 
    MIN(salary) AS S_MIN, 
    MAX(salary) AS S_MAX
FROM salaries -- cuantificar salarios
WHERE to_date = '9999-01-01'; -- actuales











