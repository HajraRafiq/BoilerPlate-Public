module.exports = function BootstrapMediator(opts) {

    const {
        svcCache,
        logger,
        utility,
        _,
        queue,
        mdRabbitMq,
        statusesConsumers,
    } = opts;

    const { asyncForEach } = utility;

    async function initQueueConsumers() {
        // await mdRabbitMq.initQueueConsumers({ consumers: requestsConsumers });
        //await mdRabbitMq.initQueueConsumers({ consumers: statusesConsumers });

        return true;
    }

    async function initSystemQueues() {
        const { mqconfig, channel } = queue.primary;

        const { exchange, routing, queues } = mqconfig;

        const _registrations = Object.keys(queues);

        await asyncForEach(_registrations, async (_r) => {
            const route = routing[_r];
            const queue = queues[_r];

            await channel.assertExchange(exchange, 'direct', { durable: true });
            await channel.assertQueue(queue);
            await channel.bindQueue(queue, exchange, route);
        });

        return true;
    }

    async function initSystemSettings() {
return;
        logger.trace(`Initializing System Settings > Initialize > Begin`);

        

        if (settings) {
            const groups = _.map(settings, (value) => value.field_group);

            const _obj = {};

            await asyncForEach(groups, (group) => {
                if (!_obj[group]) _obj[group] = {};
            });


            await asyncForEach(settings, async (setting) => {
                const {
                    field_group,
                    field_name,
                    field_value
                } = setting;

                if (!_obj[field_group]) _obj[field_group] = {};

                _obj[field_group][field_name] = field_value;
            })

            const keys = Object.keys(_obj);

            await asyncForEach(keys, async (key) => {
                const _setting_key = `SYSSETTING:${key.toUpperCase()}`;

                await svcCache.setHash({
                    hashKey: _setting_key,
                    fields: _obj[key]
                });
            });
        }

        logger.trace(`Initializing System Settings > Initialize > End`);
    }

    async function initRaptorAuth() {
        // let token = await svcCache.getKV({
        //     key: 'ELRP_TOKEN'
        // });

        // logger.trace('Bootstrap Mediator > initRaptorAuth > Token From Cache >', token);

        // if (token === null) {
        //     logger.trace('No client token in cache, requesting new one >');

        //     token = await svcRaptor.fetchClientToken();

        //     const { code, data, message } = token;

        //     if (code === 200) {
        //         token = data.token;
        //     } else throw Error(`Eleanor can not initialize due to error from Raptor >`, message);

        //     logger.trace('Client token fetched from raptor >', token)

        //     await svcCache.setKV({
        //         key: 'ELRP_TOKEN',
        //         value: token,
        //     });
        // }

        // logger.trace(`Raptor Auth Token Initialized >`, token);

        return null;//token;
    }

    const initialize = async function initialize() {
        await initRaptorAuth();
        await initSystemSettings();
        await initSystemQueues();
        await initQueueConsumers();
    }

    return {
        initialize,
    }
}