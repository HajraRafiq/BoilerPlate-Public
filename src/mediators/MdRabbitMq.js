module.exports = function MdRabbitMq({ queue }) {

    const { primary } = queue;

    const { channel } = primary;

    const { mqconfig } = primary;

    async function initQueueConsumers({ consumers }) {
        // eslint-disable-next-line no-shadow
        const { consumer, queue } = consumers;

        consume({ queue, callback: consumer });
    }

    async function send({ queue, payload }) {

        const _queue = mqconfig.queues[queue];

        channel.assertQueue(_queue, { durable: true });
        channel.sendToQueue(_queue, payload, { persistent: true, contentType: 'application/json' });
    }

    async function publish({ payload }) {
        await channel.publish('x-eleanor', 'eleanor-notifications', Buffer.from(JSON.stringify(payload)), { persistent: true, contentType: 'application/json' });
    }

    async function consume({ queue, callback }) {
        const _queue = mqconfig.queues[queue];

        channel.assertQueue(_queue, { durable: true });
        channel.prefetch(1);

        channel.consume(_queue, (payload) => {

            try {
                const json = JSON.parse(payload.content.toString());

                callback(channel, payload, json);
            } catch (ex) {
                callback(channel, payload, { error: ex });
            }

        }, { noAck: false });

    }

    async function sendToExchange({ exchange, route, payload }) {
        await channel.publish(exchange, route, Buffer.from(JSON.stringify(payload)), { persistent: true, contentType: 'application/json' });
    }

    async function close() {
        connection.close();
    }

    return {
        send,
        close,
        consume,
        publish,
        sendToExchange,
        initQueueConsumers,
    }

} 