module.exports = function ReceiverRequestParameters(opts) {

    const { Joi } = opts;

    const cancelRequest = () => {
        return Joi.object().keys({
            txid: Joi.string().xss().required(),
        })
    }

    const customizeLinkBody = () => {
        return Joi.object().keys({
            phone: Joi.string().xss().required(),
            txid: Joi.string().xss().required(),
            new_link: Joi.string().xss().min(4).max(12).required(),
        })
    }

    const verifyReceiverRequest = () => {
        return Joi.object().keys({
            phone: Joi.string().xss().required(),
            txid: Joi.string().xss().required(),
            call: Joi.boolean().default(false).optional(),
        })
    }

    const verifyReceiverTransaction = () => {
        return Joi.object().keys({
            otvc: Joi.string().xss().max(4).required(),
            phone: Joi.string().xss().required(),
            txid: Joi.string().xss().required(),
        })
    }

    const requestFormBody = () => {
        return Joi.object().keys({
            receiver_number: Joi.string().xss().regex(/^(03)\d{9}$/, 'numbers').max(11).min(11).required(),
            receiver_name: Joi.string().xss().trim().required(),
            deposit_channel: Joi.string().xss().required(),
            deposit_channel_id: Joi.number().positive().optional(),
            deposit_number: Joi.string().xss().required(),
            is_email: Joi.boolean().default(false),
            sender_number: Joi.when('is_email', {
                is: false, 
                then: Joi.string().xss().regex(/^(03)\d{9}$/, 'numbers').max(11).min(11).required(),
                otherwise: Joi.forbidden()
            }),
            sender_email: Joi.when('is_email', {
                is: true, 
                then: Joi.string().xss().email().required(),
                otherwise: Joi.forbidden()
            }),
            receiver_lat: Joi.number().min(-90).max(90).required(),
            receiver_lng: Joi.number().min(-180).max(180).required(),
            order_id: Joi.string().xss().max(12).default(null).optional(),
            extra_params: Joi.object().keys({
                attachment: Joi.string().xss().optional()
            }).optional(),
            request_amount: Joi.number().positive().precision(0).required(),
            request_currency: Joi.string().xss().required(),
        }).options({ allowUnknown: false });
    }

    const upload = () => {
        return Joi.object().keys({
            file: Joi.string().xss().required(),
            name: Joi.string().xss().required(),
        })
    }

    return {
        upload,
        cancelRequest,
        requestFormBody,
        customizeLinkBody,
        verifyReceiverRequest,
        verifyReceiverTransaction,
    }

}