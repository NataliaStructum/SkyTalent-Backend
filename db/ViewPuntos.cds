using {PUNTOS, ACTIVIDADES} from '../db/SchemaPuntos';

entity VERXMES as select
    key ID,
    USER.ID as userId,
    YEAR(FECHA) AS anio: String,
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
WHERE ESTADO IN ('Aprobado')
GROUP BY ID, USER.ID, YEAR(FECHA), MONTH(FECHA);

//AND YEAR(FECHA) = YEAR(CURRENT_DATE)

entity VERXYEAR as select
    key USER.ID as userId,
    key YEAR(FECHA) AS anio: String,
    SUM(PUNTOS) AS total_puntos: Integer
FROM PUNTOS
WHERE ESTADO IN ('Aprobado')
GROUP BY USER.ID, YEAR(FECHA);

entity VERXACT as select
	USER.ID as userId,
	YEAR(FECHA) AS anio: String,
	p.ACTIVIDAD.ID as actId,
    a.DESCRIPCION as actDes,
	p.CLASIFICACION.ID as clasId,
    p.CLASIFICACION.DESCRIPCION as clasDes,
    p.ESTADO,
	SUM(p.PUNTOS) AS total_puntos : Integer
from PUNTOS as p
LEFT JOIN ACTIVIDADES as a on p.ACTIVIDAD.ID = a.ID 
GROUP BY USER.ID, 
    YEAR(FECHA), 
    p.ESTADO,
    ACTIVIDAD.ID,
    a.DESCRIPCION,
    p.CLASIFICACION.ID,
    p.CLASIFICACION.DESCRIPCION;


/*listado de total de puntos por usuario y por año*/
entity VERXUSERXYEAR as select
	p.USER.ID,
    p.USER.NOMBRE,
    p.USER.CEDULA,
	YEAR(p.FECHA) AS anio: String, 
	SUM(p.PUNTOS) AS total_puntos: Integer 
from PUNTOS as p
WHERE ESTADO IN ('Aprobado')
GROUP BY USER.ID, USER.NOMBRE, USER.CEDULA, YEAR(FECHA);

/*total de puntos aprobados en el año*/
entity VERXYEARAPR as select
	YEAR(p.FECHA) AS anio: String, 
	SUM(p.PUNTOS) AS total_puntos: Integer 
from PUNTOS as p
WHERE ESTADO IN ('Aprobado')
GROUP BY YEAR(FECHA);

/*total de puntos no aprobados en el año*/
entity VERXYEARNAPR as select
	YEAR(p.FECHA) AS anio: String, 
	SUM(p.PUNTOS) AS total_puntos: Integer 
from PUNTOS as p
WHERE ESTADO IN ('No aprobado')
GROUP BY YEAR(FECHA);

/*listado de total de puntos por clasificacion y por año*/
entity VERXCLASXYEAR as select
	p.CLASIFICACION.ID,
    p.CLASIFICACION.DESCRIPCION,
	YEAR(p.FECHA) AS anio: String,
	SUM(p.PUNTOS) AS total_puntos: Integer 
from PUNTOS as p
WHERE ESTADO IN ('Aprobado')
GROUP BY CLASIFICACION.ID, CLASIFICACION.DESCRIPCION, YEAR(FECHA);

/*listado de total de puntos por categoria y por año*/
entity VERXCATXYEAR as select
	p.CATEGORIA.ID,
    p.CATEGORIA.DESCRIPCION,
	YEAR(p.FECHA) AS anio: String,
	SUM(p.PUNTOS) AS total_puntos: Integer
from PUNTOS as p
WHERE ESTADO IN ('Aprobado')
GROUP BY CATEGORIA.ID, CATEGORIA.DESCRIPCION, YEAR(FECHA);

