
-- cuantos empleados activos tenemos y sus salarios?
SELECT 
    COUNT(emp_no) 
        AS Total_Empleados, 
    AVG(salary) 
        AS Promedio,
    MIN(salary) 
        AS S_MIN,
    MAX(salary) 
        AS S_MAX  
FROM salaries 
WHERE to_date = '9999-01-01'; 


-- Cual departamento está pagando mejor?
WITH salarios_dept AS (
    SELECT
d.dept_no, s.salary
FROM dept_emp d 
    INNER JOIN salaries s 
        ON d.emp_no = s.emp_no 
WHERE s.to_date = '9999-01-01' 
    AND d.to_date = '9999-01-01')

SELECT d.dept_name, 
    AVG(sd.salary) AS Promedio,
    MIN(sd.salary) AS S_MIN,
    MAX(sd.salary) AS S_MAX
    FROM salarios_dept sd
    INNER JOIN departments d
        ON d.dept_no = sd.dept_no
GROUP BY d.dept_name
ORDER BY Promedio DESC;


-- Cual cargo está pagando mejor?
WITH salarios_carg AS (
    SELECT
t.title, s.salary
FROM titles t
    INNER JOIN salaries s 
        ON t.emp_no = s.emp_no 
WHERE s.to_date = '9999-01-01' 
    AND t.to_date = '9999-01-01')

SELECT sc.title,
    AVG(sc.salary) AS Promedio,
    MIN(sc.salary) AS S_MIN,
    MAX(sc.salary) AS S_MAX
FROM salarios_carg sc
GROUP BY sc.title
ORDER BY Promedio DESC;


-- diferencia de salarios entre hombres y mujeres
WITH salarios_genero AS (
    SELECT 
    AVG(CASE WHEN e.gender = 'M' THEN s.salary END) AS Promedio_Masculino,
    AVG(CASE WHEN e.gender = 'F' THEN s.salary END) AS Promedio_Femenino
FROM employees e
    INNER JOIN salaries s
        ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
)
SELECT  
    ROUND(Promedio_Masculino, 2) AS Promedio_Masculino,
    ROUND(Promedio_Femenino, 2) AS Promedio_Femenino,
    ROUND(Promedio_Masculino - Promedio_Femenino, 2) AS Diferencia, 
    ROUND((Promedio_Masculino - Promedio_Femenino) / Promedio_Masculino * 100, 2) AS Porcentaje_Diferencia
FROM salarios_genero;


-- Diferencia por departamento entre hombres y mujeres
WITH salarios_genero_dept AS (
SELECT de.dept_no, 
    AVG(CASE WHEN e.gender = 'M' THEN s.salary END) AS Promedio_Masculino,
    AVG(CASE WHEN e.gender = 'F' THEN s.salary END) AS Promedio_Femenino    
FROM employees e
    INNER JOIN salaries s
        ON e.emp_no = s.emp_no
    INNER JOIN dept_emp de
        ON e.emp_no = de.emp_no 
            WHERE s.to_date = '9999-01-01'
                AND de.to_date = '9999-01-01'
GROUP BY de.dept_no
)
SELECT 
d.dept_name,
    sgd.Promedio_Masculino,
    sgd.Promedio_Femenino,
    ROUND(sgd.Promedio_Masculino - sgd.Promedio_Femenino, 2) AS Diferencia, 
    ROUND((sgd.Promedio_Masculino - sgd.Promedio_Femenino) / sgd.Promedio_Masculino * 100, 2) AS Porcentaje_Diferencia
FROM salarios_genero_dept sgd
    INNER JOIN departments d
        ON d.dept_no = sgd.dept_no
ORDER BY Porcentaje_Diferencia DESC;


-- Salarios promedio por año
SELECT 
YEAR(from_date) AS Año,  
    ROUND(AVG(salary), 2) AS Promedio
FROM salaries
GROUP BY YEAR(from_date)
ORDER BY YEAR(from_date) ASC;

-- departamentos con mas personas
SELECT 
d.dept_name AS Departamento, 
    COUNT(de.emp_no) AS Total_Empleados
FROM dept_emp de
    INNER JOIN departments d
        ON de.dept_no = d.dept_no
Group BY d.dept_name
ORDER BY Total_Empleados DESC;















