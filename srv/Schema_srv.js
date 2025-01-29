const cds = require('@sap/cds')


module.exports = async (srv) => {

    let db = cds.connect.to(srv)

    /*srv.on('submitOrder', req =>{
        let data = req.data.quantity;
        if(req.user.is('Manager')){
            data = 0;
        }
        console.log(data);
        return data;
    })*/

    srv.after('CREATE', ['cargos','PersonalDirectoCargo','PersonalIndirectoCargo','AutoridadCargo', 'FuncionCargo', 'RelacionesCargo', 'NivelEducativoCargo', 'ExperienciaCargo', 'HabilidadesConocimientos','IndicadoresCargo'], async (data, req) => {
        await recordHistory(data, req, 'crear');
    });

    srv.after('UPDATE', ['cargos','PersonalDirectoCargo','PersonalIndirectoCargo','AutoridadCargo', 'FuncionCargo', 'RelacionesCargo', 'NivelEducativoCargo', 'ExperienciaCargo', 'HabilidadesConocimientos','IndicadoresCargo'], async (data, req) => {
        await recordHistory(data, req, 'editar');
    });

    srv.after('DELETE', ['cargos','PersonalDirectoCargo','PersonalIndirectoCargo','AutoridadCargo', 'FuncionCargo', 'RelacionesCargo', 'NivelEducativoCargo', 'ExperienciaCargo', 'HabilidadesConocimientos','IndicadoresCargo'], async (data, req) => {
        const cargo = req.headers['cargo'];
        await recordHistory(data, req, 'eliminar', cargo);
    });

    async function recordHistory(data, req, operation, cargo=null) {
        const cargoId = data.CARGO_ID || data.ID || cargo; // El ID del cargo puede depender de la tabla
        //const revisionAnterior = await SELECT.one.from(HISTORIALMODIFICACION_CARGO).where({ CARGO_ID: cargoId }).orderBy('NO_REVISION desc');
        //const noRevision = revisionAnterior ? revisionAnterior.NO_REVISION + 1 : 1;

        let serviceName = 'skyTalentService'
        let motivo = '';
        switch (req.target.name) {
            case `${serviceName}.cargos`:
                motivo = `Modificación en los datos principales del cargo (${operation})`;
                break;
            case `${serviceName}.PersonalDirectoCargo`:
                motivo = `Modificación en personal directo (${operation})`;
                break;
            case `${serviceName}.PersonalIndirectoCargo`:
                motivo = `Modificación en personal indirecto (${operation})`;
                break;
            case `${serviceName}.AutoridadCargo`:
                motivo = `Modificación de nueva autoridad (${operation})`;
                break;
            case `${serviceName}.FuncionCargo`:
                motivo = `Modificación de función (${operation})`;
                break;
            case `${serviceName}.RelacionesCargo`:
                motivo = `Modificación en relaciones de cargo (${operation})`;
                break;
            case `${serviceName}.NivelEducativoCargo`:
                motivo = `Modificación en nivel educativo (${operation})`;
                break;
            case `${serviceName}.ExperienciaCargo`:
                motivo = `Modificación en experiencia requerida (${operation})`;
                break;
            case `${serviceName}.HabilidadesConocimientos`:
                motivo = `Modificación en habilidades y conocimientos (${operation})`;
                break;
            case `${serviceName}.IndicadoresCargo`:
                motivo = `Modificación de indicadores (${operation})`;
                break;
            default:
                motivo = `Modificación en el registro (${operation}) ${req.target.name}`;
                break;
        }

        // Insertar en la tabla de historial
        await INSERT.into('HISTORIALMODIFICACION_CARGO').entries({
            ID: cds.utils.uuid(),
            CARGO_ID: cargoId,
            //NO_REVISION: noRevision,
            MOTIVO: motivo
        });
    }

    srv.after('CREATE', ['perfil','ExperienciaPerfil','FormacionPerfil', 'FormacionGeneralPerfil'], async (data, req) => {
        await recordHistoryPerfil(data, req, 'crear');
    });

    srv.after('UPDATE', ['perfil','ExperienciaPerfil','FormacionPerfil', 'FormacionGeneralPerfil'], async (data, req) => {
        const createdby = req.headers['createdby'];
        await recordHistoryPerfil(data, req, 'editar', null, createdby);
    });

    srv.after('DELETE', ['perfil','ExperienciaPerfil','FormacionPerfil', 'FormacionGeneralPerfil'], async (data, req) => {
        const perfil = req.headers['perfil'];
        const createdby = req.headers['createdby'];
        await recordHistoryPerfil(data, req, 'eliminar', perfil, createdby);
    });

    async function recordHistoryPerfil(data, req, operation, perfil=null, createdby=null) {
        const perfilId = data.PERFIL_ID || data.ID || perfil; // El ID del perfil puede depender de la tabla
        const created = data.createdBy_ID || createdby;
        //const revisionAnterior = await SELECT.one.from(HISTORIALMODIFICACION_CARGO).where({ CARGO_ID: cargoId }).orderBy('NO_REVISION desc');
        //const noRevision = revisionAnterior ? revisionAnterior.NO_REVISION + 1 : 1;

        let serviceName = 'skyTalentService'
        let motivo = '';
        switch (req.target.name) {
            case `${serviceName}.perfil`:
                motivo = `Modificación en los datos principales del perfil (${operation})`;
                break;
            case `${serviceName}.ExperienciaPerfil`:
                motivo = `Modificación en la experiencia del perfil (${operation})`;
                break;
            case `${serviceName}.FormacionPerfil`:
                motivo = `Modificación en formación técnica, conocimientos y habilidades del perfil (${operation})`;
                break;
            case `${serviceName}.FormacionGeneralPerfil`:
                motivo = `Modificación en formación básica y general del perfil (${operation})`;
                break;
            default:
                motivo = `Modificación en el registro (${operation}) ${req.target.name}`;
                break;
        }

        // Insertar en la tabla de historial
        await INSERT.into('HISTORIALMODIFICACION_PERFIL').entries({
            ID: cds.utils.uuid(),
            PERFIL_ID: perfilId,
            //NO_REVISION: noRevision,
            MOTIVO: motivo,
            createdBy_ID: created
        });
    }


}