using { managed } from '@sap/cds/common';


entity USERS {
  key ID               : UUID;
      CEDULA           : String(50);
      NOMBRE           : String(50);
      DIRECCION        : String(100);
      MUNICIPIO        : String(80);
      EMAIL            : String(100);
      FECHA_NACIMIENTO : Date;
      CELULAR          : Integer;
      ESTADO           : String(20) default 'Activo';
      INICONTRATO      : Date default $now;
      FINCONTRATO      : Date default null;
      createdAt        : Timestamp @cds.on.insert: $now;

      //ANTIGUEDADA      : Integer;
      //ANTIGUEDADM      : Integer;
      //EDAD             : Integer;

      //CREATEDAT        : Timestamp @cds.on.insert: $now;
      //createdBy        : User      @cds.on.insert : $user;
};

entity CARGO {
  Key ID                : UUID;
      APROBADO_POR      : Association to USERS;
      NOMBRE_CARGO      : String(50);
      OBJETIVO          : String(500);
      NOMBRE_CARGO_JEFE : String(50);
      CARGO_JEFE        : Association to CARGO;
      //NO_REVISION       : Integer default 1;
      //UPDATEAT          : Timestamp @cds.on.insert : $now  @cds.on.update : $now;

      //Alcance
      PRESUPUESTO       : Decimal;
      MONEDA            : String(10);

      createdBy         : Association to USERS;
      createdAt         : Timestamp @cds.on.insert: $now;
}

entity PROCESOS {
  Key ID          : UUID;
      NOMBRE      : String(50);
      DESCRIPCION : String(300);
      JEFE        : Association to USERS;
}

entity PERFIL {
  Key ID               : UUID;
      USUARIO          : Association to USERS;
      CARGO            : Association to CARGO; 
      PROCESO          : Association to PROCESOS; 
      NIVELACADEMICO   : String(20);
      DESCRIPCIONNIVEL : String(300);

      createdBy         : Association to USERS;
      createdAt         : Timestamp @cds.on.insert: $now;
}




/*entity MUNICIPIOS {
  key ID           : Decimal;
      departamento : Association to DEPARTAMENTOS;
      municipio    : String(200);
}

entity DEPARTAMENTOS {
  key ID           : Integer;
      region       : String(200);
      departamento : String(200);
}*/


