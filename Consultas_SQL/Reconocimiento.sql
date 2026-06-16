-- primero vamos a identificar que tablas tenemos en este nuevo DataBase.
Show Tables; 

-- Empleados
SELECT * FROM employees;

-- Salarios
SELECT * FROM salaries;

-- Cargo de cada empleado
SELECT * FROM titles;

-- Departamento de cada empleado
SELECT * FROM dept_emp;

-- Departamentos 
SELECT * FROM departments;

-- Manager de cada departamento 
SELECT * FROM dept_manager;

-- por cada empleado, trae la fecha más reciente en que estuvo asignado a algún departamento.
SELECT * FROM dept_emp_latest_date;

-- por cada empleado, trae el departamento donde está ahora (el actual).
SELECT * FROM current_dept_emp;














