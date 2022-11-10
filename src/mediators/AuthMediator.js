module.exports = function AuthMediator(opts) {

    const {
        svcTalos
    } = opts;


    async function test({ number, service }) {
        let account = 'hello';

      //  number = sanitizePhoneNumber({ phone: number });

        account = await svcTalos.getFromDB({ phone: number });
        return account;
    }


    return {
        test
    }
}