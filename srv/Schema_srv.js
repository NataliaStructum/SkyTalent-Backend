const cds = require('@sap/cds')


module.exports = async (srv) => {

    let db = cds.connect.to(srv)

    srv.on('getCities', async (req) => {
        var result = [];

        try {
            const response = await fetch('https://www.datos.gov.co/api/odata/v4/xdk5-pm3f', { method: 'GET' });

            if (!response.ok) {
                throw new Error(`Error en la petición: ${response.statusText}`);
            }

            const data = await response.json(); // Si la respuesta es JSON
            //console.log('Datos recibidos:', data.value);

            for (let i = 0; i < data.value.length; i++) {

                var departamento = data.value[i].departamento;
                var ciudad = data.value[i].municipio;
                var key = data.value[i].c_digo_dane_del_municipio.toString();

                //console.log(departamento)
                //console.log(ciudad)

                var itemResult = { keyC: key, value: ciudad + ", " + departamento };
                //console.log(typeof itemResult);
                result.push(itemResult);
            }



        } catch (error) {
            console.error('Error:', error);
        }

        return result;

        /*let data = req.data.quantity;

        if(req.user.is('Manager')){

            data = 0;
        }
        return data;
        */
    })

    /*srv.on('READ', 'users' , req => {
        console.log("Estoy leyendo los usuarios")
    })
    srv.before('READ', 'users' , req => {
        console.log("Antes de leer los usuarios")
    })
    srv.after('READ', 'users' , req => {
        console.log("Despues de leer usuarios")
    })*/
}