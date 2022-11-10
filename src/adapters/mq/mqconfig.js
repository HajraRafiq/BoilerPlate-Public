module.exports = ({
    exchange: 'x-eleanor',
    routing: {
        x_eleanor_request: 'eleanor-requests',
        x_eleanor_notifications: 'eleanor-notifications',
        x_eleanor_statuses: 'eleanor-statuses',
    },
    queues: {
        x_eleanor_request: 'q-eleanor-requests',
        x_eleanor_notifications: 'q-eleanor-notifications',
        x_eleanor_statuses: 'q-eleanor-statuses',
    }
})