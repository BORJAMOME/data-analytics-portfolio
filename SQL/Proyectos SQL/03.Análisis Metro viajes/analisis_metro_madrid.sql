-- Crear la base de datos metro
CREATE DATABASE metro;

-- Usar la base de datos metro
USE metro;

-- Crear la tabla metro_madrid
CREATE TABLE metro_madrid (
    Linea INTEGER,
    Mes TEXT,
    Valores INTEGER
);

-- Total de pasajeros por línea durante todo el año
SELECT Linea, SUM(Valores) AS Total_Pasajeros
FROM metro_madrid
GROUP BY Linea;

-- Pasajeros mensuales por línea
SELECT Linea, Mes, SUM(Valores) AS Total_Pasajeros
FROM metro_madrid
GROUP BY Linea, Mes
ORDER BY Linea, Mes;

-- Promedio de pasajeros por línea durante el año
SELECT Linea, AVG(Valores) AS Promedio_Pasajeros
FROM metro_madrid
GROUP BY Linea;

-- Mes con mayor número de pasajeros para cada línea
SELECT Linea, Mes, Valores
FROM metro_madrid
WHERE (Linea, Valores) IN (
    SELECT Linea, MAX(Valores)
    FROM metro_madrid
    GROUP BY Linea
);

-- Mes con menor número de pasajeros para cada línea
SELECT Linea, Mes, Valores
FROM metro_madrid
WHERE (Linea, Valores) IN (
    SELECT Linea, MIN(Valores)
    FROM metro_madrid
    GROUP BY Linea
);

-- Porcentaje de pasajeros por línea respecto al total anual
SELECT Linea, 
       SUM(Valores) AS Total_Pasajeros, 
       (SUM(Valores) * 100.0 / (SELECT SUM(Valores) FROM metro_madrid)) AS Porcentaje_Total
FROM metro_madrid
GROUP BY Linea;

-- Mes con menor número de pasajeros global
SELECT Mes, SUM(Valores) AS Total_Pasajeros
FROM metro_madrid
GROUP BY Mes
ORDER BY Total_Pasajeros ASC
LIMIT 1;
