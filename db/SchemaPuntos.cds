using { PROCESOS, CARGO, PERFIL, USERS } from './Schema';

entity CLASIFICACION {
    key ID          : UUID;
        DESCRIPCION : String(300);

        ACTIVIDADES : Composition of many ACTIVIDADES on ACTIVIDADES.CLASIFICACION = $self;
}

entity ACTIVIDADES {
    key ID          : UUID;
        DESCRIPCION : String(300);
        CLASIFICACION : Association to CLASIFICACION;
        PUNTOS      : Integer;
        EVIDENCIAS  : many String;
        VALIDACION  : many String;
}

entity CATEGORIAS {
    key ID          : UUID;
        DESCRIPCION : String(300);    
}

entity PUNTOS {
    key ID            : UUID;
        USER          : Association to USERS;
        ACTIVIDAD     : Association to ACTIVIDADES;
        DESCRIPCION   : String(500);
        CATEGORIA     : Association to CATEGORIAS;
        FECHA         : Date;
        ESFUERZO      : Decimal; //horas semanales
        DURACION      : Decimal; //Numero de semanas
        TIPO          : String(50); //Asistencia, Certificación, No aplica, Ambas
        NOTA          : Decimal;
        CLASIFICACION : Association to CLASIFICACION;
        EVIDENCIA     : LargeString;
        ESTADO        : String(50) default 'Enviado'; //Aprobado, No aprobado, Enviado
        
        createdAt   : Timestamp @cds.on.insert: $now;    
}