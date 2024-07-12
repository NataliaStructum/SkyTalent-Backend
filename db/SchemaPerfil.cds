namespace dbperfil;
using db from './Schema';
using dbcargo from './SchemaCargo';

entity HISTORIALMODIFICACION {
    Key ID             : UUID;
        PERFIL         : Association to db.PERFIL;
        NO_REVISION    : Integer;
        FECHA_REVISION : Date @cds.on.insert: $now;
        MOTIVO         : String(500);
}

entity EXPERIENCIA {
    key ID     : UUID;
        PERFIL : Association to db.PERFIL; 
        AREA   : String(300);
        TIEMPO : Decimal; 
        UNIDAD : String(20);
}

entity FORMACION {
    key ID           : UUID;
        PERFIL       : Association to db.PERFIL; 
        CATEGORIA    : Association to dbcargo.HABILIDADES_CONOCIMIENTOS;
        DESCRIPCION  : String(500);
        CUMPLE       : Boolean;
        FECHA_MAXIMA : Date default null;
        EVIDENCIA    : String;
}

entity PROCEDIMIENTOS {
    key ID           : UUID;
        NOMBRE : String(50);
        DESCRIPCION : String(500) default null;

}

entity FORMACIONGENERAL {
    key ID            : UUID;
        PERFIL        : Association to db.PERFIL; 
        PROCEDIMIENTO : Association to PROCEDIMIENTOS;
        CUMPLE       : Boolean;
        FECHA_MAXIMA : Date default null;
        EVIDENCIA    : String;
}