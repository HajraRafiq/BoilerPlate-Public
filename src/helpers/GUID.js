const uuidv1 = require('uuid/v1');
const uuidv3 = require('uuid/v3');
const uuidv4 = require('uuid/v4');
const uuidv5 = require('uuid/v5');

module.exports = () => {
    return {
        v1: async () => uuidv1(),
        v3: async ({name, namespace}) => uuidv3(name, namespace),
        v4: async () => uuidv4(),
        v4withOptions: async (options) => uuidv4(options),
        v5: async (string, namesapce) => uuidv5(string, namesapce),
        v4WithoutHyphens: async () => uuidv4().split('-').join(''),
    }
}
