const cds = require('@sap/cds')


module.exports = async (srv) => {

    let db = cds.connect.to(srv)

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



}