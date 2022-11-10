module.exports = function QueryHandler(opts) {
    const { db } = opts;

    const any = async ({ statement, adapter }) => {

        const { query, params } = statement

        if (!adapter) adapter = 'primary';

        return await db[adapter].any(query, params);
    }

    const task = async ({ entity, useCase, task, adapter, params, options = {} }) => {

        if (!adapter) adapter = 'primary';

        const model = opts[entity];

        const queries = model[useCase];

        if (options && options.asTx) return await db[adapter].tx((tx) => task(tx, queries, params));

        return await db[adapter].task((tk) => task(tk, queries, params));
    }

    return {
        any,
        task,
    }
}