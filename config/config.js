const promise = require('bluebird');
const options = {
    promiseLib: promise,
    query: (e) => {}
}

const pgp = require('pg-promise')(options);
const types = pgp.pg.types;
types.setTypeParser(1114, function(stringValue) {
    return stringValue;
});

// Actualización de los datos de configuración para la base de datos
const databaseConfig = {
    'host': 'viaduct.proxy.rlwy.net',
    'port': 54602,
    'database': 'railway',
    'user': 'postgres',
    'password': 'BugbBjqZpzQyDqrQVSmcoyHSlYdrIRpQ'
};

const db = pgp(databaseConfig);

module.exports = db;
