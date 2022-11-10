/* eslint-disable no-plusplus, no-await-in-loop */
const getUnixTime = () => ((new Date()).getTime() / 1000);

const asyncForEach = async (array, callback) => {
    for (let index = 0; index < array.length; index++) {
        await callback(array[index], index, array);
    }
};

const checkNumberFormat = (number) => {

}

const checkTxIdFormat = (txid) => {

}

const generateTransactionId = (length) => {
    let result = '';
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const charactersLength = characters.length;
    for (let i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return `PMT${result.trim()}`.trim().toUpperCase();
};

const isJWTNotUniform = (jwt) => {
    return (!/^[A-Za-z0-9-]+\.[A-Za-z0-9-]+\.[A-Za-z0-9-_.+/=]*$/.test(jwt));
};

const randomUsername = async () => {
    const a = ['Thandi', 'Babes', 'Babuwa', 'Cold', 'Coldplay', 'Lagaan', 'Lead_Bhai', 'Architect_Bhai'];
    const b = ['1337', 'LEET', 'WHOAMI', 'Beat_It', 'Jugar', 'Phat_Gaya', 'Blaster'];

    const rA = Math.floor(Math.random() * a.length);
    const rB = Math.floor(Math.random() * b.length);

    return a[rA] + b[rB];
};

const randomOtp = async () => {
    const charset = '0123456789';
    let retVal = '';

    for (let i = 0, n = charset.length; i < 4; ++i) {
        retVal += charset.charAt(Math.floor(Math.random() * n));
    }

    return retVal;
}

const randomOneTimePassword = async (length = 4) => {
    const charset = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    let retVal = '';

    for (let i = 0, n = charset.length; i < length; ++i) {
        retVal += charset.charAt(Math.floor(Math.random() * n));
    }

    return retVal;
}

const randomPassword = async (length = 12) => {
    const charset = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_*&$#@!';
    let retVal = '';

    for (let i = 0, n = charset.length; i < length; ++i) {
        retVal += charset.charAt(Math.floor(Math.random() * n));
    }

    return retVal;
};

const randomFixedInteger = async (length) => {
    return Math.floor(Math.pow(10, length - 1) + Math.random() * (Math.pow(10, length) - Math.pow(10, length - 1) - 1));
}

const sanitizePhoneNumber = ({ phone }) => {
    if (phone.length === 11) {
        phone = phone.substring(1, phone.length); 
        
        return `92${phone}`;
    } 
    
    if (phone.length === 10) return `92${phone}`;
    if (phone.length === 12) return phone;

    return phone;
};

module.exports = (opts) => {
    return {
        randomOtp: randomOtp.bind(null),
        getUnixTime: getUnixTime.bind(null),
        asyncForEach: asyncForEach.bind(null),
        isJWTNotUniform: isJWTNotUniform.bind(null),
        randomUsername: randomUsername.bind(null),
        randomPassword: randomPassword.bind(null),
        sanitizePhoneNumber: sanitizePhoneNumber.bind(null),
        randomFixedInteger: randomFixedInteger.bind(null),
        generateTransactionId: generateTransactionId.bind(null),
        randomOneTimePassword: randomOneTimePassword.bind(null)
    }
}