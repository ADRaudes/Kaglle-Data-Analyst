-- cuántos empleados hay activos? 
SELECT 
    COUNT (e.emp_no) AS Activos 
FROM employees e
    INNER JOIN dept_emp d
        ON d.emp_no = e.emp_no
    AND d.to_date = '9999-01-01';

-- cuantos empleados hay por departamento?
SELECT d.dept_name, 
    COUNT(e.emp_no) AS Activos
FROM departments d
    INNER JOIN dept_emp e
        ON e.dept_no = d.dept_no
    AND e.to_date = '9999-01-01'
        GROUP BY d.dept_name;


-- cuantos empleados por genero hay en cada departamento?
WITH Genero_Empleados AS(
    SELECT
    e.first_name, e.gender, d.dept_no
    FROM employees e
    INNER JOIN dept_emp d
        ON d.emp_no = e.emp_no
            AND d.to_date = '9999-01-01'
)
SELECT 
    n.dept_name, 
    COUNT(CASE WHEN g.gender = 'M' THEN 1 END) AS Masculino,
    COUNT(CASE WHEN g.gender = 'F' THEN 1 END) AS Femenino
FROM Genero_Empleados g
    INNER JOIN departments n
        ON n.dept_no = g.dept_no
    GROUP BY n.dept_name;
    
-- cuales son los cargos mas famosos?
SELECT title, 
        COUNT (emp_no) AS cargos 
from titles
    WHERE to_date = '9999-01-01'
        GROUP BY title
        ORDER BY cargos DESC;

-- Informacion general.
SELECT e.emp_no, e.first_name, e.last_name, e.gender, e.hire_date, 
    TIMESTAMPDIFF(YEAR, e.hire_date, CURDATE()) AS antiguedad,
    d.dept_name, t.title
FROM employees e
    INNER JOIN dept_emp de
        ON de.emp_no = e.emp_no
            AND de.to_date = '9999-01-01'
    INNER JOIN departments d
        ON d.dept_no = de.dept_no
    INNER JOIN titles t
        ON t.emp_no = e.emp_no
            AND t.to_date = '9999-01-01';   






