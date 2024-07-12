using db from '../db/Schema';
using dbcargo from '../db/SchemaCargo';
using dbperfil from '../db/SchemaPerfil';

service SkyTalentService{

 entity users as projection on db.USERS;
 entity cargos as projection on db.CARGO;
 entity procesos as projection on db.PROCESOS;
 entity perfil as projection on db.PERFIL;
 entity municipios as projection on db.MUNICIPIOS;
 entity departamentos as projection on db.DEPARTAMENTOS;

 type cities {
    keyC: String;
    value: String;
  }
 function getCities() returns array of cities;

 entity HistorialCargo as projection on dbcargo.HISTORIALMODIFICACION;
 entity PersonalDirectoCargo as projection on dbcargo.ALCANCE.PERSONALDIRECTO;
 entity PersonalIndirectoCargo as projection on dbcargo.ALCANCE.PERSONALINDIRECTO;
 entity AutoridadCargo as projection on dbcargo.AUTORIDAD;
 entity FuncionCargo as projection on dbcargo.FUNCION;
 entity NivelEducativoCargo as projection on dbcargo.NIVELEDUCATIVO;
 entity ExperienciaCargo as projection on dbcargo.EXPERIENCIA;
 entity IndicadoresCargo as projection on dbcargo.INDICADORES;
 entity RelacionesCargo as projection on dbcargo.RELACIONES;
 entity HabilidadesConocimientos as projection on dbcargo.HABILIDADES_CONOCIMIENTOS;

 entity HistorialPerfil as projection on dbperfil.HISTORIALMODIFICACION;
 entity ExperienciaPerfil as projection on dbperfil.EXPERIENCIA;
 entity FormacionPerfil as projection on dbperfil.FORMACION;
 entity Procedimientos as projection on dbperfil.PROCEDIMIENTOS;
 entity FormacionGeneralPerfil as projection on dbperfil.FORMACIONGENERAL;

}






