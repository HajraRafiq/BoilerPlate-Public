module.exports = function DropdownRequestParameters(opts) {
    const { Joi } = opts;

    const fetchDropdownParams = () => {
        return Joi.object().keys({
            type: Joi.string().valid('countries','deposit', 'payment').required(),
        })
    }

    const fetchDropdownBody = () => {
        return Joi.object().keys({
            fields: Joi.array().items(Joi.string().xss().required()),
        })
    }

    return {
        fetchDropdownBody,
        fetchDropdownParams,
    }
}