using {PERFIL} from './Schema';
using { HABILIDADES_CONOCIMIENTOS } from './SchemaCargo';

entity HISTORIALMODIFICACION_PERFIL {
    Key ID             : UUID;
        PERFIL         : Association to PERFIL;
        NO_REVISION    : Integer;
        FECHA_REVISION : Timestamp @cds.on.insert: $now;
        MOTIVO         : String(500);
}

entity EXPERIENCIA_PERFIL {
    key ID     : UUID;
        PERFIL : Association to PERFIL; 
        AREA   : String(300);
        TIEMPO : Decimal; 
        UNIDAD : String(20);
}

entity FORMACION {
    key ID           : UUID;
        PERFIL       : Association to PERFIL; 
        CATEGORIA    : Association to HABILIDADES_CONOCIMIENTOS;
        DESCRIPCION  : String(500);
        CUMPLE       : Boolean;
        FECHA_MAXIMA : Date default null;
        EVIDENCIA    : String;
}

entity PROCEDIMIENTOS {
    key ID           : UUID;
        NOMBRE       : String(50);
        DESCRIPCION  : String(500) default null;
}

entity FORMACIONGENERAL {
    key ID            : UUID;
        PERFIL        : Association to PERFIL; 
        PROCEDIMIENTO : Association to PROCEDIMIENTOS;
        CUMPLE        : Boolean;
        FECHA_MAXIMA  : Date default null;
        EVIDENCIA     : String;
}