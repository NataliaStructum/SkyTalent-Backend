namespace db;
using { Currency } from '@sap/cds/common';

//type CreatedAt : Timestamp default $now;
//type CreatedAt : Date default $now;
// Timestamp @cds.on.insert: $now
// @cds.on.update

entity USERS {
  key ID               : UUID;
      CEDULA           : String(50);
      NOMBRE           : String(50);
      DIRECCION        : String(50);
      MUNICIPIO        : Association to MUNICIPIOS;
      EMAIL            : String(100);
      FECHA_NACIMIENTO : Date;
      CELULAR          : Integer;
      CREATEDAT        : Date @cds.on.insert: $now;
};

entity MUNICIPIOS {
  key ID           : Decimal;
      departamento : Association to DEPARTAMENTOS;
      municipio    : String(200);
}

entity DEPARTAMENTOS {
  key ID           : Integer;
      region       : String(200);
      departamento : String(200);
}

entity CARGO {
  Key ID                : UUID;
      ELABORADO_POR     : Association to USERS;
      APROBADO_POR      : Association to USERS;
      NOMBRE_CARGO      : String(50);
      OBJETIVO          : String(500);
      NOMBRE_CARGO_JEFE : String(50);
      NO_REVISION       : Integer default 1;
      UPDATEAT          : Date @cds.on.insert : $now  @cds.on.update : $now;

      //Alcance
      PRESUPUESTO       : Decimal;
      MONEDA            : Currency;
}

entity PROCESOS {
  Key ID      : UUID;
  NOMBRE      : String(50);
  DESCRIPCION : String(300);
  JEFE        : Association to USERS;
}

entity PERFIL {
  Key ID           : UUID;
  USUARIO          : Association to USERS;
  CARGO            : Association to CARGO; 
  PROCESO          : Association to PROCESOS; 
  NIVELACADEMICO   : String(20);
  DESCRIPCIONNIVEL : String(200);
  UPDATEAT         : Date @cds.on.insert : $now  @cds.on.update : $now;
  UPDATEBY         : Association to USERS;
}




