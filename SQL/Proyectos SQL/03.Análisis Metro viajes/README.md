[![SQL](https://img.shields.io/badge/MySQL-8.0+-f29221?style=for-the-badge&logo=mysql&logoColor=white&labelColor=101010)](https://mysql.com)

# Análisis de Pasajeros del Metro de Madrid

Este repositorio contiene un análisis de los datos de pasajeros del Metro de Madrid, organizados y procesados mediante un script SQL. El archivo `datos_metro_madrid.sql` incluye la creación de la base de datos y la tabla correspondiente, así como varias consultas para obtener información relevante sobre los pasajeros del metro.

## Estructura del Proyecto

- **datos_metro_madrid.sql**: Archivo SQL que contiene todas las consultas para analizar los datos de pasajeros del Metro de Madrid.

## Descripción del Análisis

### Crear la Base de Datos y la Tabla

Primero, se crea una base de datos llamada `metro` y una tabla `metro_madrid` con las siguientes columnas:
- `Linea` (INTEGER): Número de la línea del metro.
- `Mes` (TEXT): Mes del año.
- `Valores` (INTEGER): Número de pasajeros.

```sql
CREATE DATABASE metro;

USE metro;

CREATE TABLE metro_madrid (
    Linea INTEGER,
    Mes TEXT,
    Valores INTEGER
);
```
### Total de Pasajeros por Línea Durante Todo el Año
Esta consulta calcula el total de pasajeros para cada línea del metro a lo largo del año.

```sql
SELECT Linea, SUM(Valores) AS Total_Pasajeros
FROM metro_madrid
GROUP BY Linea;
```
<img width="230" alt="Screenshot 2024-05-17 at 11 25 36" src="https://github.com/BORJAMOME/metro_madrid/assets/19588053/7602ff46-0860-4c1a-8e33-22b60292ddc0">

### Pasajeros Mensuales por Línea
Esta consulta obtiene el número total de pasajeros por mes para cada línea del metro.
```sql
SELECT Linea, Mes, SUM(Valores) AS Total_Pasajeros
FROM metro_madrid
GROUP BY Linea, Mes
ORDER BY Linea, Mes;
```
<img width="350" alt="Screenshot 2024-05-17 at 11 26 41" src="https://github.com/BORJAMOME/metro_madrid/assets/19588053/52d79914-7109-4092-8b3e-f0256d275ddf">

### Promedio de Pasajeros por Línea Durante el Año
Esta consulta calcula el promedio de pasajeros por línea durante todo el año.
```sql
SELECT Linea, AVG(Valores) AS Promedio_Pasajeros
FROM metro_madrid
GROUP BY Linea;
```
<img width="278" alt="Screenshot 2024-05-17 at 11 27 13" src="https://github.com/BORJAMOME/metro_madrid/assets/19588053/85187aad-e839-493b-879e-3ea76193d461">

### Mes con Mayor Número de Pasajeros para Cada Línea
Esta consulta identifica el mes con el mayor número de pasajeros para cada línea del metro.
```sql
SELECT Linea, Mes, Valores
FROM metro_madrid
WHERE (Linea, Valores) IN (
    SELECT Linea, MAX(Valores)
    FROM metro_madrid
    GROUP BY Linea
);
```
<img width="232" alt="Screenshot 2024-05-17 at 11 27 50" src="https://github.com/BORJAMOME/metro_madrid/assets/19588053/fdef1292-06ad-4aea-b663-0f06eea91835">

### Mes con Menor Número de Pasajeros para Cada Línea
Esta consulta identifica el mes con el menor número de pasajeros para cada línea del metro.
```sql
SELECT Linea, Mes, Valores
FROM metro_madrid
WHERE (Linea, Valores) IN (
    SELECT Linea, MIN(Valores)
    FROM metro_madrid
    GROUP BY Linea
);
```
<img width="294" alt="Screenshot 2024-05-17 at 11 28 46" src="https://github.com/BORJAMOME/metro_madrid/assets/19588053/d4c235ba-a4d2-4b79-af6a-891839d166ef">

### Porcentaje de Pasajeros por Línea Respecto al Total Anual
Esta consulta calcula el porcentaje de pasajeros de cada línea respecto al total anual de pasajeros.
```sql
SELECT Linea, 
       SUM(Valores) AS Total_Pasajeros, 
       (SUM(Valores) * 100.0 / (SELECT SUM(Valores) FROM metro_madrid)) AS Porcentaje_Total
FROM metro_madrid
GROUP BY Linea;
```
<img width="300" alt="Screenshot 2024-05-17 at 11 29 23" src="https://github.com/BORJAMOME/metro_madrid/assets/19588053/62f8db0e-2b02-4a76-9faa-4af371a30403">

### Mes con Mayor Número de Pasajeros Global
Esta consulta identifica el mes con el mayor número total de pasajeros en todas las líneas del metro
```sql
SELECT Mes, SUM(Valores) AS Total_Pasajeros
FROM metro_madrid
GROUP BY Mes
ORDER BY Total_Pasajeros DESC
LIMIT 1;
```
<img width="212" alt="Screenshot 2024-05-17 at 11 31 44" src="https://github.com/BORJAMOME/metro_madrid/assets/19588053/cfaaebc0-22d9-43d0-ac93-348b199ff502">

### Mes con Menor Número de Pasajeros Global
Esta consulta identifica el mes con el menor número total de pasajeros en todas las líneas del metro.
```sql
SELECT Mes, SUM(Valores) AS Total_Pasajeros
FROM metro_madrid
GROUP BY Mes
ORDER BY Total_Pasajeros ASC
LIMIT 1;
```
<img width="194" alt="Screenshot 2024-05-17 at 11 32 03" src="https://github.com/BORJAMOME/metro_madrid/assets/19588053/f92c2907-7c88-440d-960a-07b32f3667f8">









































