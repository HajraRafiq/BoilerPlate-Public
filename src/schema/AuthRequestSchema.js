module.exports = function AuthRequestSchema(opts) {

    const { authRequestHandlers, Joi } = opts;



    // const verifyAuthOtvc = () => {
    //     return {
    //         method: 'POST',
    //         schema: {
    //             body: Joi.object().keys({
    //                 otvc: Joi.string().required(),
    //                 phone: Joi.string().required(),
    //             })
    //         },
    //         url: '/verify/auth/otvc',
    //         handler: authRequestHandlers.verifyAuthOtvc,
    //     }
    // }



    const reqtest = () => {
        return {
            method: 'POST',
            url: '/test',
            handler: authRequestHandlers.test,
        }
    }



    return {
        

        reqtest
    }

}