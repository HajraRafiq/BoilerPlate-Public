module.exports = function CommonRequestHeaders(opts) {
    const { Joi } = opts;

    return {
        authHeader: () => {
            return Joi.object().keys({
                'x-sid': Joi.string().optional().default(null),
                'x-token': Joi.string().optional().default(null)
            })
        },
        apiKeyOnly: () => {
            return Joi.object().keys({
                'bl-bkd-key': Joi.string().valid('abcd').required()
            }).options({ allowUnknown: true });
        },
        clientKeyOnly: () => {
            return Joi.object().keys({
                'x-bb-client-key': Joi.string().required(),
                'x-bb-app-ver': Joi.string().optional().default(null),
            }).options({ allowUnknown: true });
        }
    }
}