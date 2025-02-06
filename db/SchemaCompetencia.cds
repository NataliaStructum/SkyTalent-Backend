using { PROCESOS, CARGO, PERFIL, USERS } from './Schema';

//mostrar el proceso del cargo
//mostrar la fecha de ingreso de la info basica del usuario
//las inducciones solo las pueden crear los de admin 
//las pueden ver los usuarios y le pueden cambiar la fecha de ejecución
entity INDUCCIONES{
    key ID                : UUID;
        PERFIL            : Association to PERFIL;
        PROCESO           : Association to PROCESOS;
        TEMA              : String(300);
        SOPORTES          : many String;
        TIPO              : String(20); //Inducción- Reinducción
        METODO            : String(20); //presencial-virtual-hibrida
        TIEMPOH           : Integer;
        CAPACITADOR_CARGO : Association to CARGO;
        CAPACITADOR       : Association to USERS; 
        //FIRMA 
        FPROGRAMADA       : Date; 
        FEJECUTADA        : Date;
        //FIRMA COLABORADOR   

        createdAt         : Timestamp @cds.on.insert: $now;
        createdBy         : Association to USERS; 
}

//los usuarios pueden agregar capacitaciones y los admin 
//estado? union con programa puntos? 
entity CAPACITACIONES {
    key ID          : UUID;
        PERFIL      : Association to PERFIL;
        FECHA       : Date;
        METODO      : String(20); //presencial-virtual-hibrida
        LUGAR       : String(300);
        CAPACITADOR : String(100);
        TIPO        : String(50); //CALIDAD-SST-AMBIENTAL
        TEMA        : String(300);
        COSTO       : Integer;
        EVIDENCIA   : String;
        //firma empleado
}

