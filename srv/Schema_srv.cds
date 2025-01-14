using { USERS, CARGO, PROCESOS, PERFIL } from '../db/Schema';

using { HISTORIALMODIFICACION_CARGO,
        ALCANCE_PERSONALDIRECTO,
        ALCANCE_PERSONALINDIRECTO,
        AUTORIDAD,
        FUNCION,
        NIVELEDUCATIVO,
        EXPERIENCIA_CARGO,
        INDICADORES,
        RELACIONES,
        HABILIDADES_CONOCIMIENTOS} from '../db/SchemaCargo';

using { HISTORIALMODIFICACION_PERFIL,
        EXPERIENCIA_PERFIL,
        FORMACION,
        PROCEDIMIENTOS,
        FORMACIONGENERAL} from '../db/SchemaPerfil';

using { INDUCCIONES, CAPACITACIONES } from '../db/SchemaCompetencia';

using { VERUSER, VERPERFIL } from '../db/ViewSchema';

using {CLASIFICACION, CATEGORIAS, PUNTOS, ACTIVIDADES} from '../db/SchemaPuntos';

using { VERXMES } from '../db/ViewPuntos';


service skyTalentService{

 @cds.redirection.target
 entity users as projection on USERS;
 @readonly
 entity verusers as projection on VERUSER;

 entity cargos as projection on CARGO;
 entity procesos as projection on PROCESOS;
 entity perfil as projection on PERFIL;
 //entity municipios as projection on MUNICIPIOS;
 //entity departamentos as projection on DEPARTAMENTOS;

 type cities {
    keyC: String;
    value: String;
  }
 function getCities() returns array of cities;

 //-------------------Cargo-------------------------

 entity HistorialCargo as projection on HISTORIALMODIFICACION_CARGO;
 entity PersonalDirectoCargo as projection on ALCANCE_PERSONALDIRECTO;
 entity PersonalIndirectoCargo as projection on ALCANCE_PERSONALINDIRECTO;
 entity AutoridadCargo as projection on AUTORIDAD;
 entity FuncionCargo as projection on FUNCION;
 entity NivelEducativoCargo as projection on NIVELEDUCATIVO;
 entity ExperienciaCargo as projection on EXPERIENCIA_CARGO;
 entity IndicadoresCargo as projection on INDICADORES;
 entity RelacionesCargo as projection on RELACIONES;
 entity HabilidadesConocimientos as projection on HABILIDADES_CONOCIMIENTOS;

 //------------------Perfil --------------------------------

 entity HistorialPerfil as projection on HISTORIALMODIFICACION_PERFIL;
 entity ExperienciaPerfil as projection on EXPERIENCIA_PERFIL;
 entity FormacionPerfil as projection on FORMACION;
 entity Procedimientos as projection on PROCEDIMIENTOS;
 entity FormacionGeneralPerfil as projection on FORMACIONGENERAL;
  @readonly
 entity VerPerfil as projection on VERPERFIL;

 //--------------- Competencia ----------------------------
 entity Inducciones as projection on INDUCCIONES;
 entity Capacitaciones as projection on CAPACITACIONES;

 //-------------- Puntos -----------------------------
 entity Categorias as projection on CATEGORIAS;
 entity Clasificacion as projection on CLASIFICACION;
 entity Actividades as projection on ACTIVIDADES;
 entity Puntos as projection on PUNTOS;

 @readonly
 entity VerXMes as projection on VERXMES;
}







