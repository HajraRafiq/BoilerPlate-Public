module.exports = function SenderRequestParameters(opts) {

    const { Joi } = opts;

    const verifySenderUrl = () => {
        return Joi.object().keys({
            number: Joi.string().xss().required()
        })
    }

    const verifySelfInitiatedTransaction = () => {
        return Joi.object().keys({
            number: Joi.string().xss().optional(),
            txid: Joi.string().xss().required()
        })
    }

    const verifyTransactionUrl = () => {
        return Joi.object().keys({
            number: Joi.string().xss().optional(),
            txid: Joi.when('number', {
                is: Joi.exist(),
                then: Joi.string().xss().required(),
            }),
            tinyurl: Joi.string().xss().optional(),
        })
    }

    const senderSelfInitiate = () => {
        return Joi.object().keys({
            receiver_number: Joi.string().xss().regex(/^(03)\d{9}$/, 'numbers').max(11).min(11).required(),
            receiver_name: Joi.string().xss().trim().required(),
            sender_name: Joi.string().xss().required(),
            sender_number: Joi.string().xss().regex(/^(03)\d{9}$/, 'numbers').max(11).min(11).required(),
            receiver_lat: Joi.number().min(-90).max(90).required(),
            receiver_lng: Joi.number().min(-180).max(180).required(),
            request_details: Joi.string().default(null).optional(),
            extra_params: Joi.object().keys({
                attachment: Joi.string().xss().optional()
            }).optional(),
            request_amount: Joi.number().positive().precision(0).required(),
            request_currency: Joi.string().xss().required(),
        })
    }

    const verifySenderRequest = () => {
        return Joi.object().keys({
            phone: Joi.string().xss().required(),
            txid: Joi.string().xss().required(),
            call: Joi.boolean().default(false).optional(),
        })
    }

    const verifySenderTransaction = () => {
        return Joi.object().keys({
            otvc: Joi.string().xss().max(4).required(),
            phone: Joi.string().xss().required(),
            txid: Joi.string().xss().required(),
        })
    }

    return {
        verifySenderRequest,
        verifySenderTransaction,
        verifySenderUrl,
        senderSelfInitiate,
        verifyTransactionUrl,
        verifySelfInitiatedTransaction,
    }

}