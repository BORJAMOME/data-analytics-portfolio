CREATE DATABASE accidentes;
USE accidentes;

-- 1. Número total de accidentes por distrito:
SELECT distrito, COUNT(*) AS numero_accidentes
FROM accidentes_madrid
GROUP BY distrito
ORDER BY numero_accidentes DESC;

-- 2. Porcentaje de accidentes por distrito
SELECT 
	distrito,
    COUNT(*) AS total_accidentes,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM accidentes_madrid) AS porcentaje_total
FROM accidentes_madrid
GROUP BY distrito
ORDER BY total_accidentes DESC;

-- 3. Número total de accidentes por tipo de accidente:
SELECT tipo_accidente, COUNT(*) AS numero_accidentes
FROM accidentes_madrid
GROUP BY tipo_accidente
ORDER BY numero_accidentes DESC;

-- 4. Porcentaje de accidentes segun el tipo de accidente
SELECT 
    tipo_accidente,
    COUNT(*) AS total_accidentes,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM accidentes_madrid) AS porcentaje_total
FROM 
    accidentes_madrid
GROUP BY 
    tipo_accidente
ORDER BY 
    tipo_accidente;

-- 5. Número total de accidentes por el estado del tiempo
SELECT estado_meteorologico, COUNT(*) AS numero_accidentes
FROM accidentes_madrid
GROUP BY estado_meteorologico
ORDER BY numero_accidentes DESC;

-- 6. Porcentaje de accidentes segun el estado del tiempo
SELECT 
    estado_meteorologico,
    COUNT(*) AS total_accidentes,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM accidentes_madrid) AS porcentaje_total
FROM 
    accidentes_madrid
GROUP BY 
    estado_meteorologico
ORDER BY 
    estado_meteorologico;



-- 7. Número de accidentes con personas fallecidos en las 24 horas por distrito
SELECT distrito, COUNT(*) AS numero_fallecidos
FROM accidentes_madrid
WHERE lesividad = 'Fallecido 24 horas'
GROUP BY distrito
ORDER BY numero_fallecidos DESC;



-- 8. Número de accidentes según el tipo de vehículo
SELECT tipo_vehiculo, COUNT(*) AS numero_accidentes
FROM accidentes_madrid
GROUP BY tipo_vehiculo
ORDER BY numero_accidentes DESC;

-- 9. Porcentaje de accidentes segun tipo de vehículo
SELECT 
    tipo_vehiculo,
    COUNT(*) AS total_accidentes,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM accidentes_madrid) AS porcentaje_total
FROM 
    accidentes_madrid
GROUP BY 
    tipo_vehiculo
ORDER BY 
    tipo_vehiculo;


-- 10. Porcentaje de accidentes con positivo en alcohol o droga con respecto al total de accidentes según distrito
SELECT 
    distrito,
    COUNT(*) AS total_accidentes,
    SUM(CASE WHEN positiva_alcohol = 'SI' THEN 1 ELSE 0 END) AS accidentes_positiva_alcohol,
    SUM(CASE WHEN positiva_droga = 'SI' THEN 1 ELSE 0 END) AS accidentes_positiva_droga,
    (SUM(CASE WHEN positiva_alcohol = 'SI' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS porcentaje_alcohol,
    (SUM(CASE WHEN positiva_droga = 'SI' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS porcentaje_droga
FROM accidentes_madrid
GROUP BY distrito
ORDER BY total_accidentes DESC;


-- 11. Número de accidentes por rango de edad
SELECT rango_edad, COUNT(*) AS numero_accidentes
FROM accidentes_madrid
GROUP BY rango_edad
ORDER BY numero_accidentes DESC;

-- 12. Porcentaje de accidentes según rango de edad
SELECT 
    rango_edad,
    COUNT(*) AS total_accidentes,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM accidentes_madrid) AS porcentaje_total
FROM 
    accidentes_madrid
GROUP BY 
    rango_edad
ORDER BY 
    rango_edad;


-- 13. Número de accidentes por sexo de la persona implicada
SELECT sexo, COUNT(*) AS numero_accidentes
FROM accidentes_madrid
GROUP BY sexo
ORDER BY numero_accidentes DESC;

-- 14. Porcentaje de accidentes por distrito y sexo
SELECT 
    distrito,
    sexo,
    COUNT(*) AS total_accidentes,
    COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY distrito) AS porcentaje_por_distrito
FROM accidentes_madrid
GROUP BY distrito,sexo
ORDER BY distrito,sexo;



-- 15. Número de accidentes por hora del día:
SELECT
    CASE
        WHEN HOUR(hora) = 0 THEN '00:00:00 - 00:59:59'
        WHEN HOUR(hora) = 1 THEN '01:00:00 - 01:59:59'
        WHEN HOUR(hora) = 2 THEN '02:00:00 - 02:59:59'
        WHEN HOUR(hora) = 3 THEN '03:00:00 - 03:59:59'
        WHEN HOUR(hora) = 4 THEN '04:00:00 - 04:59:59'
        WHEN HOUR(hora) = 5 THEN '05:00:00 - 05:59:59'
        WHEN HOUR(hora) = 6 THEN '06:00:00 - 06:59:59'
        WHEN HOUR(hora) = 7 THEN '07:00:00 - 07:59:59'
        WHEN HOUR(hora) = 8 THEN '08:00:00 - 08:59:59'
        WHEN HOUR(hora) = 9 THEN '09:00:00 - 09:59:59'
        WHEN HOUR(hora) = 10 THEN '10:00:00 - 10:59:59'
        WHEN HOUR(hora) = 11 THEN '11:00:00 - 11:59:59'
        WHEN HOUR(hora) = 12 THEN '12:00:00 - 12:59:59'
        WHEN HOUR(hora) = 13 THEN '13:00:00 - 13:59:59'
        WHEN HOUR(hora) = 14 THEN '14:00:00 - 14:59:59'
        WHEN HOUR(hora) = 15 THEN '15:00:00 - 15:59:59'
        WHEN HOUR(hora) = 16 THEN '16:00:00 - 16:59:59'
        WHEN HOUR(hora) = 17 THEN '17:00:00 - 17:59:59'
        WHEN HOUR(hora) = 18 THEN '18:00:00 - 18:59:59'
        WHEN HOUR(hora) = 19 THEN '19:00:00 - 19:59:59'
        WHEN HOUR(hora) = 20 THEN '20:00:00 - 20:59:59'
        WHEN HOUR(hora) = 21 THEN '21:00:00 - 21:59:59'
        WHEN HOUR(hora) = 22 THEN '22:00:00 - 22:59:59'
        WHEN HOUR(hora) = 23 THEN '23:00:00 - 23:59:59'
    END AS hora_del_dia,
    COUNT(*) AS total_accidentes
FROM accidentes_madrid
GROUP BY hora_del_dia
ORDER BY total_accidentes DESC;

-- 16. Probabilidad de accidentes según el periodo del día
SELECT
    CASE
        WHEN HOUR(hora) BETWEEN 6 AND 11 THEN 'Mañana'
        WHEN HOUR(hora) BETWEEN 12 AND 13 THEN 'Mediodía'
        WHEN HOUR(hora) BETWEEN 14 AND 19 THEN 'Tarde'
        WHEN HOUR(hora) BETWEEN 20 AND 23 THEN 'Noche'
        ELSE 'Madrugada'
    END AS periodo_del_dia,
    COUNT(*) AS total_accidentes,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM accidentes_madrid) AS probabilidad
FROM
    accidentes_madrid
GROUP BY
    periodo_del_dia
ORDER BY
    FIELD(periodo_del_dia, 'Mañana', 'Mediodía', 'Tarde', 'Noche', 'Madrugada');


-- 17. Número de accidentes por fecha:
SELECT fecha, COUNT(*) AS numero_accidentes
FROM accidentes_madrid
GROUP BY fecha
ORDER BY fecha ASC;

-- 18. Probabilidad de accidentes segun la estación del año
SELECT estacion,
    COUNT(*) AS total_accidentes,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM accidentes_madrid) AS probabilidad
FROM
    (
    SELECT
        fecha,
        CASE
            WHEN STR_TO_DATE(fecha, '%d/%m/%Y') BETWEEN STR_TO_DATE('01/03/2023', '%d/%m/%Y') AND STR_TO_DATE('31/05/2023', '%d/%m/%Y') THEN 'Primavera'
            WHEN STR_TO_DATE(fecha, '%d/%m/%Y') BETWEEN STR_TO_DATE('01/06/2023', '%d/%m/%Y') AND STR_TO_DATE('31/08/2023', '%d/%m/%Y') THEN 'Verano'
            WHEN STR_TO_DATE(fecha, '%d/%m/%Y') BETWEEN STR_TO_DATE('01/09/2023', '%d/%m/%Y') AND STR_TO_DATE('30/11/2023', '%d/%m/%Y') THEN 'Otoño'
            ELSE 'Invierno'
        END AS estacion
    FROM
        accidentes_madrid
    ) AS estaciones
GROUP BY
    estacion;

-- 19. Número de accidentes segun el tipo de persona (conductor, pasajero, peatón)
SELECT  tipo_persona, COUNT(*) AS numero_tipo_de_persona
FROM accidentes_madrid
GROUP BY  tipo_persona
ORDER BY  tipo_persona ASC;

-- 20. Porcentaje de accidentes segun el tipo de persona (conductor, pasajero, peatón)
SELECT 
    tipo_persona,
    COUNT(*) AS total_accidentes,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM accidentes_madrid) AS porcentaje_total
FROM 
    accidentes_madrid
GROUP BY 
    tipo_persona
ORDER BY 
    tipo_persona;



-- 21. Top 5 distritos con mayor número de accidentes en condiciones meteorológicas adversas:
SELECT distrito, COUNT(*) AS numero_accidentes
FROM accidentes_madrid
WHERE estado_meteorologico != 'Despejado'
GROUP BY distrito
ORDER BY numero_accidentes DESC
LIMIT 5;



-- 22. Total del tipo de asistencia despues del accidente segun lesividad
SELECT  lesividad, COUNT(*) AS numero_tipo_de_persona
FROM accidentes_madrid
GROUP BY  lesividad
ORDER BY  lesividad ASC;



-- 23. Accidentes por tipo de vehículo y lesividad
SELECT tipo_vehiculo, lesividad, COUNT(*) AS numero_accidentes
FROM accidentes_madrid
GROUP BY tipo_vehiculo, lesividad
ORDER BY numero_accidentes DESC;


-- 24. Número de accidentes con resultado positivo en alcohol por rango de edad:
SELECT rango_edad, COUNT(*) AS numero_accidentes
FROM accidentes_madrid
WHERE positiva_alcohol = 'SI'
GROUP BY rango_edad
ORDER BY numero_accidentes DESC;


-- 25. Número de accidentes por combinación de sexo y resultado positivo en alcohol
SELECT sexo, COUNT(*) AS numero_accidentes
FROM accidentes_madrid
WHERE positiva_alcohol = 'Si'
GROUP BY sexo
ORDER BY numero_accidentes DESC;
