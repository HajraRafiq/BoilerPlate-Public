const Bootstrap = require('../bootstrap');

describe('Test Server Bootup', () => {
    test('Should return server object', async () => {
        let server = null;
        try {
            const bootstrap = await Bootstrap(process);

            server = bootstrap.server;

        } catch (ex) {
            expect(server).toBeUndefined(undefined);
        } finally {
            expect(server).not.toBeUndefined(undefined);
        }
    })
})