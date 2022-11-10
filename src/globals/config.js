const path = require('path');
const nconf = require('nconf');

nconf.env().argv();

let env = nconf.get('elnv');

if (!env) env = 'debug';

console.log("Loaded Config File >", path.join(__dirname, '../env', `${env}.json`));

nconf.file({ file: path.join(__dirname, '../env', `${env}.json`) });

module.exports = nconf;