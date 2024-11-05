using {CARGO, PROCESOS} from './Schema';

entity HISTORIALMODIFICACION_CARGO {
    Key ID             : UUID;
        CARGO          : Association to CARGO;
        //NO_REVISION    : Integer;
        FECHA_REVISION : Timestamp @cds.on.insert: $now;
        MOTIVO         : String(500);
}

entity ALCANCE_PERSONALDIRECTO {
    key ID        : UUID;
        CARGO     : Association to CARGO; 
        PERSONAL  : Association to CARGO;

        createdAt : Timestamp @cds.on.insert: $now;
}

entity ALCANCE_PERSONALINDIRECTO {
    key ID       : UUID;
        CARGO    : Association to CARGO; 
        PERSONAL : Association to CARGO;

        createdAt : Timestamp @cds.on.insert: $now;
}

entity AUTORIDAD {
    key ID          : UUID;
        CARGO       : Association to CARGO; 
        DESCRIPCION : String(500);

        createdAt : Timestamp @cds.on.insert: $now;
}

entity FUNCION {
    key ID          : UUID;
        CARGO       : Association to CARGO; 
        TIPO        : String(50);
        DESCRIPCION : String(500);

        createdAt : Timestamp @cds.on.insert: $now;
}

entity NIVELEDUCATIVO {
    key ID         : UUID;
        CARGO      : Association to CARGO; 
        TIPO       : String(50);
        COMENTARIO :String(500);

        createdAt : Timestamp @cds.on.insert: $now;
}

entity EXPERIENCIA_CARGO {
    key ID     : UUID;
        CARGO  : Association to CARGO; 
        AREA   : String(200);
        TIEMPO : Decimal; 
        UNIDAD : String(20);

        createdAt : Timestamp @cds.on.insert: $now;
}

entity INDICADORES {
    key ID        : UUID;
        CARGO     : Association to CARGO; 
        FORMULA   : String(250);
        INDICADOR : String(500);   

        createdAt : Timestamp @cds.on.insert: $now; 
}

entity RELACIONES {
    key ID     : UUID;
        AREA   : String(50);
        CARGO  : Association to CARGO; 
        TIPO   : String(20);
        MOTIVO : String(500);

        createdAt : Timestamp @cds.on.insert: $now;
}

entity HABILIDADES_CONOCIMIENTOS {
    key ID                : UUID;
        CARGO             : Association to CARGO; 
        TIPO              : String(50); //HABILIDADES o los tipos de conocimientos CALIDAD-SST-AMBIENTA
        DESCRIPCION       : String(500);

        createdAt : Timestamp @cds.on.insert: $now;
}

