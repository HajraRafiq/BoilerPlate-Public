module.exports = function StatusesConsumers(obj) {//{ logger, paymentMediator }

    /*async function consumer(channel, message, payload) {
        try {
            const { trip, status, comments, customer } = payload;

            if (trip) await paymentMediator.zCashStatusUpdate({ trip_id: trip._id, status, comments, customer });

            console.log("StatusesConsumers > consumer > payload >", payload);
        } catch (ex) {
            console.error("StatusesConsumers > consumer > error >", ex);
        } finally {
            channel.ack(message)
        }
    }

    return {
        consumer,
        queue: 'x_eleanor_statuses'
    }*/
    return null;

}