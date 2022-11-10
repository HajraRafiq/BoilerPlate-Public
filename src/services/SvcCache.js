module.exports = function SvcCache(opts) {

    const { cache } = opts;

    async function setKV({ key, value, time }) {
        if (time) {
            await cache.primary.set(key, value, 'EX', time);
        } else await cache.primary.set(key, value);

        return true;
    }

    async function setHash({ hashKey, fields }) {
        let _fields = Object.keys(fields);

        let _hashObj = {};

        if (_fields.length === 1) {

            _hashObj[_fields[0]] = fields[_fields[0]];

            await cache.primary.hmset(hashKey, _hashObj)
        } else {
            for (let i = 0; i < _fields.length; ++i) {
                _hashObj[_fields[i]] = fields[_fields[i]]
            }

            await cache.primary.hmset(hashKey, _hashObj);
        }

        return true;
    }

    async function getHash({ key }) {
        return await cache.primary.hgetall(key);
    }

    async function setInHash({ key, field, value }) {
        return await cache.primary.hmset(key, field, value)
    }

    async function getFromHash({ key, field }) {
        return await cache.primary.hget(key, field);
    }

    async function deleteHash({ key }) {
        return await cache.primary.del(key);
    }

    async function getKV({ key }) {
        return await cache.primary.get(key);
    }

    return {
        getKV,
        setKV,
        setHash,
        setInHash,
        getHash,
        getFromHash,
        deleteHash,
    }
}