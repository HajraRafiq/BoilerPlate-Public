const amqp = require('amqplib');

const mqconfig = require('./mq/mqconfig');

module.exports = async ({ logger, config }) => {

    const { username, password, host, port } = config.get('queues:rabbitmq');

    const connection = await amqp.connect(`amqp://${username}:${password}@${host}:${port}`);

    const channel = await connection.createChannel();

    logger.info('[\u2713] RabbitMq [ready]');

    return {
        connection,
        channel,
        mqconfig,
    }
}