using {PERFIL, USERS} from './Schema';
using { HABILIDADES_CONOCIMIENTOS } from './SchemaCargo';

entity HISTORIALMODIFICACION_PERFIL {
    Key ID             : UUID;
        PERFIL         : Association to PERFIL;
        //NO_REVISION    : Integer;
        FECHA_REVISION : Timestamp @cds.on.insert: $now;
        MOTIVO         : String(500);

        createdBy      : Association to USERS;
}

entity EXPERIENCIA_PERFIL {
    key ID          : UUID;
        PERFIL      : Association to PERFIL; 
        AREA        : String(300);
        TIEMPOAÑOS  : Integer; 
        TIEMPOMESES : Integer; 

        createdAt : Timestamp @cds.on.insert: $now; 
        createdBy : Association to USERS;
}

entity FORMACION {
    key ID           : UUID;
        PERFIL       : Association to PERFIL; 
        CATEGORIA    : Association to HABILIDADES_CONOCIMIENTOS;
        DESCRIPCION  : String(500);
        CUMPLE       : String(2);
        FECHA_MAXIMA : Date default null;
        EVIDENCIA    : String;

        createdAt    : Timestamp @cds.on.insert: $now;
        createdBy    : Association to USERS;
}

entity PROCEDIMIENTOS {
    key ID           : UUID;
        NOMBRE       : String(100);
        DESCRIPCION  : String(500) default null;
}

entity FORMACIONGENERAL {
    key ID            : UUID;
        PERFIL        : Association to PERFIL; 
        TIPO          : String(50);
        PROCEDIMIENTO : Association to PROCEDIMIENTOS;
        CUMPLE        : String(2);
        FECHA_MAXIMA  : Date default null;
        EVIDENCIA     : String;

        createdAt     : Timestamp @cds.on.insert: $now;
        createdBy     : Association to USERS;
}