<div align="center">

# Análisis de Recursos Humanos
### Employees Database | SQL + Excel

Proyecto de análisis de datos de punta a punta sobre la fuerza laboral de una empresa ficticia de **~300.000 empleados** y **2,8 millones de registros salariales**. Toma una base de datos transaccional de Recursos Humanos y la convierte en respuestas claras de negocio: estructura de la plantilla, equidad salarial y evolución en el tiempo.

<br>

![MySQL](https://img.shields.io/badge/MySQL-8.x-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Avanzado-025E8C?style=for-the-badge&logo=postgresql&logoColor=white)
![Microsoft Excel](https://img.shields.io/badge/Microsoft_Excel-217346?style=for-the-badge&logo=microsoftexcel&logoColor=white)
![Power Query](https://img.shields.io/badge/Power_Query-376C2E?style=for-the-badge&logo=microsoftexcel&logoColor=white)
![VS Code](https://img.shields.io/badge/VS_Code-007ACC?style=for-the-badge&logo=visualstudiocode&logoColor=white)
![License](https://img.shields.io/badge/Licencia-MIT-green?style=for-the-badge)
![Status](https://img.shields.io/badge/Estado-Completado-success?style=for-the-badge)

</div>

---

## Tabla de contenidos

- [Resumen del proyecto](#resumen-del-proyecto)
- [Objetivo y preguntas de negocio](#objetivo-y-preguntas-de-negocio)
- [Dataset](#dataset)
- [Stack y herramientas](#stack-y-herramientas)
- [Estructura del repositorio](#estructura-del-repositorio)
- [Metodología y flujo de trabajo](#metodología-y-flujo-de-trabajo)
- [Módulo SQL](#módulo-sql)
- [Módulo Excel](#módulo-excel)
- [Hallazgos clave](#hallazgos-clave)
- [Visualizaciones](#visualizaciones)
- [Cómo reproducir](#cómo-reproducir)
- [Habilidades demostradas](#habilidades-demostradas)
- [Autor](#autor)
- [Licencia](#licencia)

---

## Resumen del proyecto

Análisis completo de la **Employees Database** de MySQL, planteado como lo haría un analista en un área real de Recursos Humanos. El trabajo pesado de extracción y agregación se resuelve en **SQL** (JOINs, CTEs y funciones de ventana sobre millones de filas). Los resultados se exportan a CSV y se transforman en **Excel** en tablas dinámicas y gráficos que resumen cada tema.

> Proyecto de portafolio orientado a un perfil de **Analista de Datos Junior**.

La idea de fondo: un análisis vale por las preguntas que responde, no por lo complicada que sea la consulta. Lo importante es traducir datos crudos en decisiones.

---

## Objetivo y preguntas de negocio

Convertir una base de datos transaccional de Recursos Humanos en respuestas accionables:

- ¿Cómo está distribuida la fuerza laboral por departamento, género y cargo?
- ¿Qué áreas y puestos pagan mejor, y existe brecha salarial de género?
- ¿La empresa creció o se contrajo a lo largo del tiempo?
- ¿Quiénes son los empleados clave (mejor pagados y más veteranos)?

---

## Dataset

**MySQL Employees Sample Database** (`test_db`, de *datacharmer*). Datos ficticios de Recursos Humanos, alrededor de 167 MB. Cubre contrataciones de 1985 a 2002.

| Tabla | Registros | Descripción |
|---|---:|---|
| `employees` | 300.024 | Datos personales de cada empleado |
| `salaries` | 2.844.047 | Histórico salarial con fechas de vigencia |
| `titles` | 443.308 | Histórico de cargos |
| `dept_emp` | 331.603 | Asignación de empleados a departamentos |
| `dept_manager` | 24 | Gerentes por departamento |
| `departments` | 9 | Catálogo de departamentos |

> Detalle clave del modelo: los registros vigentes se marcan con `to_date = '9999-01-01'`. Filtrar por ese valor es lo que separa lo activo de lo histórico.

---

## Stack y herramientas

| Herramienta | Uso en el proyecto |
|---|---|
| **MySQL 8.x** | Extracción, JOINs, CTEs, funciones de ventana y agregaciones |
| **VS Code + SQLTools** | Entorno de consultas y exportación a CSV |
| **Microsoft Excel** | Power Query, tablas dinámicas y gráficos |

---

## Estructura del repositorio

```text
Kaglle-Data-Analyst/
├── Base_de_Datos/             # Base de datos fuente (Employees DB de datacharmer)
├── Consultas_SQL/             # Scripts SQL del análisis
│   ├── Reconocimiento.sql     # Exploración inicial de tablas y vistas
│   ├── Informacion.sql        # KPIs generales
│   ├── Headcount.sql          # Fuerza laboral activa (headcount = dotación)
│   ├── Salarios.sql           # Salarios y brecha de género
│   ├── Tendencias.sql         # Evolución histórica
│   └── Trayectoria.sql        # Rankings individuales
├── Excel/
│   ├── Analisis_RRHH.xlsx     # Libro con tablas dinámicas y gráficos
│   └── CSV_Exportados/        # 11 CSV exportados desde SQL (alimentan el libro)
├── post_linkedin.md           # Borrador de publicación para LinkedIn
├── LICENSE                    # Licencia MIT
└── README.md
```

---

## Metodología y flujo de trabajo

El proyecto sigue un flujo sencillo en tres pasos:

**MySQL (SQL)  ->  CSV agregados  ->  Excel (tablas dinámicas y gráficos)**

1. **SQL: extracción y análisis.** Cada script `.sql` resuelve un bloque de preguntas, agregando los 2,8 millones de registros salariales en tablas resumen pequeñas.
2. **Exportación.** El resultado de cada consulta relevante se guarda como CSV en `Excel/CSV_Exportados/`.
3. **Excel: visualización.** Los CSV se importan con Power Query (consultas que se actualizan con un clic) y sobre ellos se montan las tablas dinámicas y los gráficos.

---

## Módulo SQL

Seis scripts, cada uno enfocado en un bloque de preguntas de negocio:

| Script | Qué resuelve |
|---|---|
| `Reconocimiento.sql` | Exploración inicial: qué tablas y vistas existen |
| `Informacion.sql` | KPIs generales: total de empleados, activos, rango de fechas y salarios |
| `Headcount.sql` | Fuerza laboral activa por departamento, género y cargo |
| `Salarios.sql` | Pago por departamento y cargo, y brecha salarial de género |
| `Tendencias.sql` | Contrataciones, abandonos, balance neto y % de mujeres por año |
| `Trayectoria.sql` | Rankings: mejor pagados, más veteranos y ranking salarial por departamento |

> Nota: `Headcount.sql` conserva su nombre en inglés. *Headcount* significa **dotación de personal**, es decir, la cantidad de empleados de la empresa. La consulta cuenta la plantilla activa por departamento, género y cargo.

**Técnicas SQL aplicadas:** JOINs de varias tablas, CTEs (`WITH`), funciones de ventana (`ROW_NUMBER`, `RANK`, `OVER (PARTITION BY ...)`), agregaciones (`AVG`, `COUNT`, `MIN`, `MAX`), `CASE WHEN` para separar por género y funciones de fecha (`YEAR`, `TIMESTAMPDIFF`).

---

## Módulo Excel

Los 11 CSV se importan al libro **`Analisis_RRHH.xlsx`** con Power Query, y cada hoja combina los datos con tablas dinámicas y gráficos:

| Hoja | Contenido |
|---|---|
| `Plantilla` | Headcount por departamento, distribución de género y cargos |
| `Salarios` | Pago por departamento y por cargo, y brecha de género |
| `Tendencias` | Balance de crecimiento y porcentaje de mujeres por año |
| `Destacados` | Top 10 mejor pagados y top 10 más veteranos |

---

## Hallazgos clave

### Plantilla

- **240.124 empleados activos.** Development (61.386) y Production (53.304) concentran casi la mitad de la plantilla.
- La distribución de género es estable, cerca de **60% hombres y 40% mujeres** en todos los departamentos.
- Predominan los perfiles de ingeniería: **Senior Engineer** es el cargo más común (85.939), y solo hay **9 managers** activos.

### Salarios y equidad

- Salario promedio de la plantilla activa: alrededor de **$72.000**.
- **Sales** es el departamento mejor pagado (**$88.853** promedio) y **Recursos Humanos** el más bajo (**$63.922**).
- **La brecha de género es mínima (menos del 1%).** La mayor diferencia a favor de los hombres está en Marketing (**+$594**), y varios departamentos pagan un poco más a las mujeres (Recursos Humanos **-$363**, Finance y Research).

### Tendencias

- El salario promedio creció de forma sostenida: de **$53.182 en 1985** a **$72.684 en 2002**.
- La empresa creció con fuerza hasta mediados de los 90 (su mejor año fue 1986, con **+35.500** netos). A partir de **1997** el balance se volvió negativo: los abandonos empezaron a superar a las nuevas contrataciones.
- La proporción de mujeres contratadas se mantuvo estable, cerca del 40%.

### Empleados destacados

- Mejor pagado: **Tokuyasu Pesch** (Sales, Senior Staff) con **$158.220**.
- Más veterano: **Tonny Butterworth** (Customer Service), en la empresa desde **1985**.

---

## Visualizaciones

> Aquí van las capturas de las hojas del libro (muy recomendable para portafolio y LinkedIn). Guarda las imágenes en `Excel/capturas/` y quita los comentarios de las líneas de abajo.

<!--
![Plantilla](Excel/capturas/plantilla.png)
![Salarios](Excel/capturas/salarios.png)
![Tendencias](Excel/capturas/tendencias.png)
![Destacados](Excel/capturas/destacados.png)
-->

---

## Cómo reproducir

1. **Cargar la base de datos.** Importar la Employees Database en MySQL siguiendo las instrucciones de la carpeta [`Base_de_Datos/`](Base_de_Datos/), que incluye los scripts y dumps de la base junto con su propio `README.md`.
2. **Ejecutar las consultas.** Correr los scripts de [`Consultas_SQL/`](Consultas_SQL/) y exportar los resultados a `Excel/CSV_Exportados/`.
3. **Construir el análisis.** Abrir `Excel/Analisis_RRHH.xlsx` y actualizar las consultas de Power Query apuntando a los CSV.

---

## Habilidades demostradas

- Traducir preguntas de negocio en consultas SQL y métricas concretas.
- SQL analítico: JOINs de varias tablas, CTEs, funciones de ventana y agregaciones sobre millones de filas.
- Diseño de un pipeline reproducible: SQL, luego CSV, luego Excel.
- Modelado y visualización en Excel con Power Query y tablas dinámicas.
- Comunicación de hallazgos orientada a la toma de decisiones.

---

## Autor

**Ale (Daniel Raudes)**, Analista de Datos Junior (Costa Rica).
GitHub: [@ADRaudes](https://github.com/ADRaudes)

---

## Licencia

Distribuido bajo licencia **MIT**. Ver el archivo [`LICENSE`](LICENSE) para más detalle.
