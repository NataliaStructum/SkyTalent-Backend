using {PUNTOS} from '../db/SchemaPuntos';

entity VERXMES as select
    key ID,
    USER.ID as userId,
    YEAR(FECHA) AS anio: Integer,
    CASE 
        WHEN MONTH(FECHA) = 1 THEN '01-Ene'
        WHEN MONTH(FECHA) = 2 THEN '02-Feb'
        WHEN MONTH(FECHA) = 3 THEN '03-Mar'
        WHEN MONTH(FECHA) = 4 THEN '04-Abr'
        WHEN MONTH(FECHA) = 5 THEN '05-May'
        WHEN MONTH(FECHA) = 6 THEN '06-Jun'
        WHEN MONTH(FECHA) = 7 THEN '07-Jul'
        WHEN MONTH(FECHA) = 8 THEN '08-Ago'
        WHEN MONTH(FECHA) = 9 THEN '09-Sep'
        WHEN MONTH(FECHA) = 10 THEN '10-Oct'
        WHEN MONTH(FECHA) = 11 THEN '11-Nov'
        WHEN MONTH(FECHA) = 12 THEN '12-Dic'
    END AS mes: Integer,
    SUM(PUNTOS) AS total_puntos: Integer
FROM PUNTOS
WHERE ESTADO IN ('Aprobado') AND YEAR(FECHA) = YEAR(CURRENT_DATE)
GROUP BY ID, USER.ID, YEAR(FECHA), MONTH(FECHA);
