const pgsql = require('./pgsql');
const redis = require('./redis');
const rabbitmq = require('./rabbitmq');

module.exports = async (opts) => ({
    cache: {
        primary: await redis(opts),
    },
    db: {
        primary: await pgsql(opts),
    },
    queue: {
        primary: await rabbitmq(opts),
    }
});