using { USERS, CARGO,PROCESOS, PERFIL } from '../db/Schema';

entity VERUSER as select 
    key ID,
        CEDULA,
        NOMBRE,
        DIRECCION,
        MUNICIPIO,
        EMAIL,
        FECHA_NACIMIENTO,
        CELULAR,
        ESTADO,
        INICONTRATO,
        FINCONTRATO,
        createdAt,
        TO_INTEGER(MONTHS_BETWEEN(TO_DATE(INICONTRATO, 'YYYY-MM-DD'), (CASE WHEN FINCONTRATO IS NULL THEN CURRENT_DATE ELSE FINCONTRATO END) ) / 12) AS ANTIGUEDADA: Integer,
        MOD(MONTHS_BETWEEN(TO_DATE(INICONTRATO, 'YYYY-MM-DD'), (CASE WHEN FINCONTRATO IS NULL THEN CURRENT_DATE ELSE FINCONTRATO END) ), 12) AS ANTIGUEDADM: Integer,
        TO_INTEGER(MONTHS_BETWEEN(TO_DATE(FECHA_NACIMIENTO, 'YYYY-MM-DD'), CURRENT_DATE) / 12) AS EDAD : Integer
        from USERS;

        //Falta mostrar creado por y cuando

entity VERPERFIL as select 
       key p.ID,
       u.NOMBRE as colaborador,
	   u.EMAIL as emailColaborador,
	   c.NOMBRE_CARGO as cargo,
	   c.OBJETIVO as objCargo, 
	   pr.NOMBRE as proceso,
	   jefe.NOMBRE as jefePr,
	   jefe.EMAIL as jefePrEmail,
	   p.NIVELACADEMICO,
	   p.DESCRIPCIONNIVEL,
	   us.NOMBRE as createdBy,
	   us.EMAIL as createdByEmail,
	   p.createdAt
from PERFIL as p
LEFT JOIN CARGO as c on p.CARGO.ID = c.ID
LEFT JOIN USERS as u on p.USUARIO.ID = u.ID
LEFT JOIN USERS as us on p.createdBy.ID = us.ID
LEFT JOIN PROCESOS as pr on p.PROCESO.ID = pr.ID
LEFT JOIN USERS as jefe on pr.JEFE.ID = jefe.ID;