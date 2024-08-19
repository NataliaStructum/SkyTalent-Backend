using {CARGO, PROCESOS} from './Schema';

entity HISTORIALMODIFICACION_CARGO {
    Key ID             : UUID;
        CARGO          : Association to CARGO;
        NO_REVISION    : Integer;
        FECHA_REVISION : Timestamp @cds.on.insert: $now;
        MOTIVO         : String(500);
}

entity ALCANCE_PERSONALDIRECTO {
    key ID       : UUID;
        CARGO    : Association to CARGO; 
        PERSONAL : Association to CARGO;
}

entity ALCANCE_PERSONALINDIRECTO {
    key ID       : UUID;
        CARGO    : Association to CARGO; 
        PERSONAL : Association to CARGO;
}

entity AUTORIDAD {
    key ID          : UUID;
        CARGO       : Association to CARGO; 
        DESCRIPCION : String(500);
}

entity FUNCION {
    key ID          : UUID;
        CARGO       : Association to CARGO; 
        TIPO        : String(20);
        DESCRIPCION : String(500);
}

entity NIVELEDUCATIVO {
    key ID         : UUID;
        CARGO      : Association to CARGO; 
        TIPO       : String(50);
        COMENTARIO :String(500);
}

entity EXPERIENCIA_CARGO {
    key ID     : UUID;
        CARGO  : Association to CARGO; 
        AREA   : String(300);
        TIEMPO : Decimal; 
        UNIDAD : String(20);
}

entity INDICADORES {
    key ID        : UUID;
        CARGO     : Association to CARGO; 
        FORMULA   : String(500);
        INDICADOR : String(500);    
}

entity RELACIONES {
    key ID     : UUID;
        AREA   : Association to PROCESOS;
        CARGO  : Association to CARGO; 
        TIPO   : String(20);
        MOTIVO : String(500);
}

entity HABILIDADES_CONOCIMIENTOS {
    key ID                : UUID;
        CARGO             : Association to CARGO; 
        TIPO              : String(20);
        TIPO_CONOCIMIENTO : String(50) default null;
        DESCRIPCION       : String(100);
}

