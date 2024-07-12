namespace dbcargo;
using db from './Schema';

entity HISTORIALMODIFICACION {
    Key ID             : UUID;
        CARGO          : Association to db.CARGO;
        NO_REVISION    : Integer;
        FECHA_REVISION : Date @cds.on.insert: $now;
        MOTIVO         : String(500);
}

entity ALCANCE.PERSONALDIRECTO {
    key ID       : UUID;
        CARGO    : Association to db.CARGO; 
        PERSONAL : Association to db.CARGO;
}

entity ALCANCE.PERSONALINDIRECTO {
    key ID       : UUID;
        CARGO    : Association to db.CARGO; 
        PERSONAL : Association to db.CARGO;
}

entity AUTORIDAD {
    key ID          : UUID;
        CARGO       : Association to db.CARGO; 
        DESCRIPCION : String(500);
}

entity FUNCION {
    key ID          : UUID;
        CARGO       : Association to db.CARGO; 
        TIPO        : String(20);
        DESCRIPCION : String(500);
}

type Nivel :{ tipo:String(50); comentarios:String(500); }

entity NIVELEDUCATIVO {
    key ID      : UUID;
        CARGO   : Association to db.CARGO; 
        NIVELES : many Nivel;
}

entity EXPERIENCIA {
    key ID     : UUID;
        CARGO  : Association to db.CARGO; 
        AREA   : String(300);
        TIEMPO : Decimal; 
        UNIDAD : String(20);
}

entity INDICADORES {
    key ID        : UUID;
        CARGO     : Association to db.CARGO; 
        FORMULA   : String(500);
        INDICADOR : String(500);    
}

entity RELACIONES {
    key ID     : UUID;
        AREA   : Association to db.PROCESOS;
        CARGO  : Association to db.CARGO; 
        TIPO   : String(20);
        MOTIVO : String(500);
}

entity HABILIDADES_CONOCIMIENTOS {
    key ID                : UUID;
        CARGO             : Association to db.CARGO; 
        TIPO              : String(20);
        TIPO_CONOCIMIENTO : String(50) default null;
        DESCRIPCION       : String(100);
}

