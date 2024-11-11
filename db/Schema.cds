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
