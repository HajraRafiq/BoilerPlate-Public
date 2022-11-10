/* eslint-disable array-callback-return */
const fp = require('fastify-plugin');

const headlocker = (fastify, opts, next) => {

    fastify.addHook('onRequest', async function onRequest(request, reply) {
        const { headers } = request;

        const { svcCache, Boom, } = fastify.di().cradle;

        const _sid = headers['x-sid'];
        const _token = headers['x-token'];

        let session = null;

        const valid = await svcCache.getKV({ key: `SESSION:${_sid}` });

        if (valid === null) {
            request.elSession = null;

            await svcCache.deleteHash({ key: `CUSTOMER:${_sid}` });
        }
        
        if (valid !== null) {
            request.elSession = await svcCache.getHash({key: `CUSTOMER:${_sid}`});

            request.elSession = {
                ...request.elSession,
                _sid,
                _token,
            }
        }

        return;
    });

    next();
};

module.exports = fp(headlocker, {
    name: 'headlocker',
    fastify: '3.x',
});
