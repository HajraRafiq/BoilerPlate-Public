module.exports = function PaymentRequestParameters(opts) {
    const { Joi } = opts;

    const checkoutJsByToken = () => {
        return Joi.object().keys({
            params: Joi.when('type', {
                is: 'checkoutjs_params',
                then: Joi.object().keys({
                    number: Joi.string().xss().required(),
                    expiry_month: Joi.number().required(),
                    expiry_year: Joi.number().required(),
                    cvv: Joi.string().xss().required()
                }),
                otherwise: Joi.object().keys({
                    token: Joi.string().xss().required()
                })
            })
        })
    }
    //.regex(/^(923)\d{9}$/, 'numbers')
    const checkoutBykeaCash = () => {
        return Joi.object().keys({
            name: Joi.string().max(50).optional(), 
            number: Joi.string().xss().optional(), 
            lat: Joi.number().min(-90).max(90).required(),
            lng: Joi.number().min(-180).max(180).required(),
            address: Joi.string().xss().max(255).trim().required(),
            gps_address: Joi.string().xss().max(500).trim().required()
        })
    }

    const paymentRequestBody = () => {
        return Joi.object().keys({
            self_initiate: Joi.boolean().default(false).optional(),
            channel_id: Joi.number().required(),
            txid: Joi.string().xss().required(),
            type: Joi.string().xss().valid('checkoutjs_token','bykea_cash').required(),
            meta: Joi.when('type',{
                is: 'checkoutjs_token',
                then: checkoutJsByToken()
            })
            .when('type', {
                is: 'bykea_cash',
                then: checkoutBykeaCash()
            })
        })
    }

    const bcLink = () => {
        return Joi.object().keys({
            txid: Joi.string().required(),
        })
    }

    return {
        bcLink,
        paymentRequestBody
    }
}