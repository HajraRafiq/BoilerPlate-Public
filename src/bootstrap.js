const FastServer = require('./globals/server');

const routes = require('./routes');

module.exports = async (process) => {
    let server = null;

    try {

        server = await FastServer({
            process
        });
        await server.registerRoutes({ routes });
        await server.start();
    } catch (_error) {
        console.error("Fatal Error In Bootstrap > ", _error);
        process.exit(1);
    }

    process.on('SIGINT', async () => {
        console.log('Stopping server >');

        await server.fastServer.close();

        console.log('Server has stopped >');

        process.exit(0);
    });

    return {
        server: server.fastServer,
    }
};