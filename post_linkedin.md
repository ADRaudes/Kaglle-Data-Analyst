# Borrador — Post de LinkedIn

> Texto listo para copiar y pegar. Sin emojis (añádelos si quieres darle más calidez; en LinkedIn suelen ayudar a la lectura). Recuerda subir 2-3 capturas del dashboard junto al post — los posts con imagen rinden mucho mejor.

---

Acabo de terminar un proyecto de análisis de datos de RRHH, de punta a punta, y quiero compartir el proceso.

Partí de la Employees Database de MySQL: ~300.000 empleados y 2,8 millones de registros salariales. El reto no era técnico por sí solo, sino responder preguntas que un área de Recursos Humanos haría de verdad:

- ¿Cómo está distribuida la plantilla y qué tan equilibrada es por género?
- ¿Quién paga mejor y existe brecha salarial?
- ¿La empresa crece o se contrae con el tiempo?

Algunos hallazgos que me parecieron interesantes:

- La plantilla activa es de 240.124 personas, concentrada en Development y Production.
- La brecha salarial de género resultó mínima (menos del 1%), e incluso varios departamentos pagan ligeramente más a las mujeres.
- El salario promedio creció de forma sostenida durante casi dos décadas, pero el crecimiento de personal se frenó a mediados de los 90.

El flujo de trabajo:

1. SQL (MySQL) para la extracción y el análisis pesado: JOINs, CTEs y funciones de ventana para agregar millones de filas en tablas-resumen.
2. Excel para la visualización: Power Query, tablas dinámicas, gráficos y un dashboard final.

Lo que más me llevo: un análisis vale por las preguntas que responde, no por la complejidad de la consulta. Traducir datos crudos en una historia clara es la verdadera habilidad.

El proyecto completo, con las consultas SQL y el dashboard, está en mi GitHub: https://github.com/ADRaudes/Kaglle-Data-Analyst

#DataAnalytics #SQL #Excel #MySQL #AnálisisDeDatos #Portafolio #DataAnalyst

---

## Versión corta (alternativa)

Nuevo proyecto en mi portafolio: análisis de RRHH sobre una base de 300.000 empleados y 2,8M de registros salariales.

SQL para el análisis pesado (JOINs, CTEs, funciones de ventana), Excel para la visualización y el dashboard.

3 hallazgos:
- Plantilla activa de 240.124 personas, concentrada en Development y Production.
- Brecha salarial de género menor al 1%.
- El salario promedio creció de forma sostenida, pero las contrataciones se frenaron a mediados de los 90.

Un buen análisis no es el más complejo, sino el que responde preguntas reales de negocio.

Repo completo: https://github.com/ADRaudes/Kaglle-Data-Analyst

#DataAnalytics #SQL #Excel #DataAnalyst
