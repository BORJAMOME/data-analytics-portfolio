[![SQL](https://img.shields.io/badge/MySQL-8.0+-f29221?style=for-the-badge&logo=mysql&logoColor=white&labelColor=101010)](https://mysql.com)

# Análisis de Accidentes en Madrid (2023)
Los datos utilizados en este análisis provienen de la base de datos de la Ciudad de Madrid sobre los accidentes ocurridos en el año 2023. Estos datos contienen información detallada sobre cada accidente, incluyendo la fecha, hora, ubicación, condiciones meteorológicas, tipos de vehículos involucrados, tipos de personas afectadas, lesiones sufridas y resultados de pruebas de alcohol y drogas.

## Estructura de los Datos
**- fecha:** Fecha del accidente (formato: DD/MM/AAAA)

**- hora:** Hora del accidente (formato: HH:MM:SS)

**- cod_distrito:** Código del distrito donde ocurrió el accidente

**- distrito:** Nombre del distrito donde ocurrió el accidente

**- tipo_accidente:** Tipo de accidente ocurrido

**- estado_meteorologico:** Estado del tiempo en el momento del accidente

**- tipo_vehiculo:** Tipo de vehículo involucrado en el accidente

**- tipo_persona:** Tipo de persona afectada por el accidente (conductor, pasajero, peatón)

**- rango_edad:** Rango de edad de la persona afectada

**- sexo:** Género de la persona afectada

**- lesividad:** Gravedad de las lesiones sufridas por la persona afectada

**- positiva_alcohol:** Resultado positivo en prueba de alcoholemia (Si/No)

**- positiva_droga:** Resultado positivo en prueba de drogas (Si/No)

## Consultas SQL Realizadas

### 1. Número total de accidentes por distrito:
Esta consulta cuenta el número total de accidentes registrados en cada distrito de Madrid.
```sql
SELECT distrito, COUNT(*) AS numero_accidentes
FROM accidentes_madrid
GROUP BY distrito
ORDER BY numero_accidentes DESC;
```
<img width="263" alt="Screenshot 2024-05-24 at 15 42 12" src="https://github.com/BORJAMOME/accidentes_madrid/assets/19588053/e047191e-632c-40bb-9587-9526dffb52ad">

### 2. Porcentaje de accidentes por distrito:
Esta consulta calcula el porcentaje de accidentes que ocurrieron en cada distrito en relación con el total de accidentes registrados.
```sql
SELECT 
	distrito,
    COUNT(*) AS total_accidentes,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM accidentes_madrid) AS porcentaje_total
FROM accidentes_madrid
GROUP BY distrito
ORDER BY total_accidentes DESC;
```
<img width="360" alt="Screenshot 2024-05-24 at 15 43 17" src="https://github.com/BORJAMOME/accidentes_madrid/assets/19588053/94888a1e-ede9-42af-a271-5d51eb0f5f06">

### 3. Número total de accidentes por tipo de accidente:
Esta consulta cuenta el número total de accidentes agrupados por el tipo de accidente ocurrido.
```sql
SELECT tipo_accidente, COUNT(*) AS numero_accidentes
FROM accidentes_madrid
GROUP BY tipo_accidente
ORDER BY numero_accidentes DESC;
```
<img width="319" alt="Screenshot 2024-05-24 at 15 44 40" src="https://github.com/BORJAMOME/accidentes_madrid/assets/19588053/5b7e9e8f-8afc-4eef-a1a5-7f211d1f5447">

### 4. Porcentaje de accidentes según el tipo de accidente:
Esta consulta calcula el porcentaje de accidentes que corresponde a cada tipo de accidente en relación con el total de accidentes registrados.

```sql
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
```
<img width="310" alt="Screenshot 2024-05-24 at 15 46 09" src="https://github.com/BORJAMOME/accidentes_madrid/assets/19588053/128195b5-8920-46b8-9685-d52912f20d1c">

### 5. Número total de accidentes por el estado del tiempo:
Esta consulta cuenta el número total de accidentes registrados para cada estado meteorológico.

```sql
SELECT estado_meteorologico, COUNT(*) AS numero_accidentes
FROM accidentes_madrid
GROUP BY estado_meteorologico
ORDER BY numero_accidentes DESC;
```
<img width="287" alt="Screenshot 2024-05-24 at 15 46 25" src="https://github.com/BORJAMOME/accidentes_madrid/assets/19588053/61736561-8f5c-44d9-bd5d-e2b6f5dfcc5e">

### 6. Porcentaje de accidentes según el estado del tiempo:
Esta consulta calcula el porcentaje de accidentes que ocurrieron bajo cada estado meteorológico en relación con el total de accidentes registrados.
```sql
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
```
<img width="380" alt="Screenshot 2024-05-24 at 15 47 22" src="https://github.com/BORJAMOME/accidentes_madrid/assets/19588053/2911d18c-13f2-4ac5-a2f0-7239a18c15b7">

### 7. Número de accidentes con personas fallecidas en las 24 horas por distrito:
Esta consulta cuenta el número de accidentes en los que hubo personas fallecidas en las 24 horas posteriores al accidente, agrupados por distrito.

```sql
SELECT distrito, COUNT(*) AS numero_fallecidos
FROM accidentes_madrid
WHERE lesividad = 'Fallecido 24 horas'
GROUP BY distrito
ORDER BY numero_fallecidos DESC;
```
<img width="254" alt="Screenshot 2024-05-24 at 15 48 22" src="https://github.com/BORJAMOME/accidentes_madrid/assets/19588053/14d8ad0e-b1f8-4933-ace8-43e3815f8128">

### 8. Número total de accidentes por tipo de vehículo:
Esta consulta cuenta el número total de accidentes agrupados por el tipo de vehículo involucrado.
```sql
SELECT tipo_vehiculo, COUNT(*) AS numero_accidentes
FROM accidentes_madrid
GROUP BY tipo_vehiculo
ORDER BY numero_accidentes DESC;
```
<img width="298" alt="Screenshot 2024-05-24 at 15 49 33" src="https://github.com/BORJAMOME/accidentes_madrid/assets/19588053/3b9b0515-af00-4e2c-97c7-037073fdda20">


### 9. Porcentaje de accidentes según el tipo de vehículo:
Esta consulta calcula el porcentaje de accidentes que involucran a cada tipo de vehículo en relación con el total de accidentes registrados.

```sql
SELECT tipo_vehiculo,
    COUNT(*) AS total_accidentes,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM accidentes_madrid) AS porcentaje_total
FROM accidentes_madrid
GROUP BY  tipo_vehiculo
ORDER BY tipo_vehiculo;
```
<img width="386" alt="Screenshot 2024-05-24 at 15 50 56" src="https://github.com/BORJAMOME/accidentes_madrid/assets/19588053/aaf55ba5-e4e9-4f18-bfca-bac4d83ba1ae">


### 10. Porcentaje de accidentes con positivo en alcohol o droga con respecto al total de accidentes según distrito:
Esta consulta calcula el porcentaje de accidentes en los que se registró un resultado positivo en alcohol o drogas en relación con el total de accidentes, agrupados por distrito.
```sql
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
```

<img width="774" alt="Screenshot 2024-05-24 at 16 38 05" src="https://github.com/BORJAMOME/accidentes_madrid/assets/19588053/7edea07c-7435-402c-8ecc-0506d4aed41a">

### 11. Número de accidentes por rango de edad:
Esta consulta cuenta el número de accidentes por cada rango de edad de las personas involucradas.
```sql
SELECT rango_edad, COUNT(*) AS numero_accidentes
FROM accidentes_madrid
GROUP BY rango_edad
ORDER BY numero_accidentes DESC;
```
<img width="328" alt="Screenshot 2024-05-24 at 16 41 09" src="https://github.com/BORJAMOME/accidentes_madrid/assets/19588053/ba2b4b5d-893e-4f33-9ba3-7da330615dd5">


### 12. Porcentaje de accidentes según rango de edad:
Esta consulta calcula el porcentaje de accidentes para cada rango de edad de las personas involucradas.

```sql
SELECT rango_edad,
    COUNT(*) AS total_accidentes,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM accidentes_madrid) AS porcentaje_total
FROM accidentes_madrid
GROUP BY rango_edad
ORDER BY porcentaje_total DESC;
```
<img width="370" alt="Screenshot 2024-05-24 at 16 44 33" src="https://github.com/BORJAMOME/accidentes_madrid/assets/19588053/a73d5bba-379e-431f-b28a-66bb6b17537c">

### 13. Número de accidentes por sexo de la persona implicada:
Esta consulta cuenta el número de accidentes según el sexo de las personas involucradas.
```sql
SELECT sexo, COUNT(*) AS numero_accidentes
FROM accidentes_madrid
GROUP BY sexo
ORDER BY numero_accidentes DESC;
```
<img width="241" alt="Screenshot 2024-05-24 at 16 46 13" src="https://github.com/BORJAMOME/accidentes_madrid/assets/19588053/c2367c51-76ec-45c6-892d-97bb198598ed">

### 14. Porcentaje de accidentes por distrito y sexo
Esta consulta calcula el porcentaje de accidentes que ocurrieron en cada distrito según el sexo de las personas involucradas.

```sql
SELECT 
    distrito,
    sexo,
    COUNT(*) AS total_accidentes,
    COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY distrito) AS porcentaje_por_distrito
FROM accidentes_madrid
GROUP BY distrito, sexo
ORDER BY distrito, sexo;
```
<img width="538" alt="Screenshot 2024-05-24 at 16 48 06" src="https://github.com/BORJAMOME/accidentes_madrid/assets/19588053/0bb81148-5512-48fc-8b10-a54f90af135a">

### 15. Número de accidentes por hora del día
Esta consulta cuenta el número de accidentes que ocurrieron en cada hora del día.

```sql
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
```
<img width="283" alt="Screenshot 2024-05-24 at 16 48 52" src="https://github.com/BORJAMOME/accidentes_madrid/assets/19588053/79116588-433e-497f-b632-2e1e03047ede">



### 16. Probabilidad de accidentes según el periodo del día
Esta consulta calcula la probabilidad de accidentes que ocurren en diferentes periodos del día.

```sql
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
FROM accidentes_madrid
GROUP BY periodo_del_dia
ORDER BY FIELD(periodo_del_dia, 'Mañana', 'Mediodía', 'Tarde', 'Noche', 'Madrugada');
```
<img width="321" alt="Screenshot 2024-05-24 at 16 51 12" src="https://github.com/BORJAMOME/accidentes_madrid/assets/19588053/e54e1980-937c-4ce6-b60f-4eec3a09b424">


### 17. Número de accidentes por fecha
Esta consulta cuenta el número de accidentes que ocurrieron en cada fecha.
```sql
SELECT fecha, COUNT(*) AS numero_accidentes
FROM accidentes_madrid
GROUP BY fecha
ORDER BY fecha ASC;
```
<img width="350" alt="Screenshot 2024-05-24 at 16 52 35" src="https://github.com/BORJAMOME/accidentes_madrid/assets/19588053/9d23961c-5023-45bb-a1c0-0237c40e6546">


### 18. Probabilidad de accidentes según la estación del año
Esta consulta calcula la probabilidad de accidentes según la estación del año en que ocurrieron.
```sql
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
```
<img width="314" alt="Screenshot 2024-05-24 at 16 53 18" src="https://github.com/BORJAMOME/accidentes_madrid/assets/19588053/08f95508-35e7-4e40-aacf-6ee99a346d59">


### 19. Número de accidentes según el tipo de persona (conductor, pasajero, peatón)
Esta consulta cuenta el número de accidentes según el rol de la persona involucrada.

```sql
SELECT tipo_persona, COUNT(*) AS numero_tipo_de_persona
FROM accidentes_madrid
GROUP BY tipo_persona
ORDER BY tipo_persona ASC;
```
<img width="299" alt="Screenshot 2024-05-24 at 16 53 56" src="https://github.com/BORJAMOME/accidentes_madrid/assets/19588053/373e1217-d091-4409-9988-5b8941bec6c8">



### 20. Porcentaje de accidentes según el tipo de persona (conductor, pasajero, peatón)
Esta consulta calcula el porcentaje de accidentes según el rol de la persona involucrada.
```sql
SELECT tipo_persona,
    COUNT(*) AS total_accidentes,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM accidentes_madrid) AS porcentaje_total
FROM accidentes_madrid
GROUP BY tipo_persona
ORDER BY tipo_persona;
```
<img width="356" alt="Screenshot 2024-05-24 at 16 55 17" src="https://github.com/BORJAMOME/accidentes_madrid/assets/19588053/d935e91e-3d26-46e6-a82c-ee985295bf1d">


### 21. Top 5 distritos con mayor número de accidentes en condiciones meteorológicas adversas
Esta consulta encuentra los cinco distritos con el mayor número de accidentes en condiciones meteorológicas adversas.

```sql
SELECT distrito, COUNT(*) AS numero_accidentes
FROM accidentes_madrid
WHERE estado_meteorologico != 'Despejado'
GROUP BY distrito
ORDER BY numero_accidentes DESC
LIMIT 5;
```
<img width="324" alt="Screenshot 2024-05-24 at 16 55 44" src="https://github.com/BORJAMOME/accidentes_madrid/assets/19588053/22283194-6d66-40ba-97a4-e0c72b3e1de4">





### 22. Total del tipo de asistencia después del accidente según lesividad
Esta consulta cuenta el número total de tipos de asistencia proporcionada después de un accidente según el nivel de lesiones sufridas.
```sql
SELECT lesividad, COUNT(*) AS numero_tipo_de_persona
FROM accidentes_madrid
GROUP BY lesividad
ORDER BY lesividad ASC;
```
<img width="465" alt="Screenshot 2024-05-24 at 16 56 52" src="https://github.com/BORJAMOME/accidentes_madrid/assets/19588053/0b3ae753-850d-4bf3-a9a2-62590d750aa9">


### 23. Accidentes por tipo de vehículo y lesividad
Esta consulta cuenta el número de accidentes según el tipo de vehículo y el nivel de lesiones sufridas.
```sql
SELECT tipo_vehiculo, lesividad, COUNT(*) AS numero_accidentes
FROM accidentes_madrid
GROUP BY tipo_vehiculo, lesividad
ORDER BY numero_accidentes DESC;
```
<img width="600" alt="Screenshot 2024-05-24 at 16 57 51" src="https://github.com/BORJAMOME/accidentes_madrid/assets/19588053/941adc12-bd78-46ca-a761-458c47e721a6">


### 24. Número de accidentes con resultado positivo en alcohol por rango de edad
Esta consulta cuenta el número de accidentes en los que la prueba de alcoholemia fue positiva, agrupados por rango de edad.
```sql
SELECT rango_edad, COUNT(*) AS numero_accidentes
FROM accidentes_madrid
WHERE positiva_alcohol = 'SI'
GROUP BY rango_edad
ORDER BY numero_accidentes DESC;
```
<img width="302" alt="Screenshot 2024-05-24 at 16 58 20" src="https://github.com/BORJAMOME/accidentes_madrid/assets/19588053/1ad61d86-13f0-42a4-a8e8-78f62a338398">


### 25. Número de accidentes por combinación de sexo y resultado positivo en alcohol
Esta consulta cuenta el número de accidentes en los que se registró un resultado positivo en la prueba de alcoholemia, agrupados por sexo de la persona afectada.
```sql
SELECT sexo, COUNT(*) AS numero_accidentes
FROM accidentes_madrid
WHERE positiva_alcohol = 'Si'
GROUP BY sexo
ORDER BY numero_accidentes DESC;
```
<img width="215" alt="Screenshot 2024-05-24 at 16 58 50" src="https://github.com/BORJAMOME/accidentes_madrid/assets/19588053/01fa6168-87c6-4865-b76c-55ff3f6180bd">


































