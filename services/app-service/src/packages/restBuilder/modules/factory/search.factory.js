import { logger } from '../../../logger';

export class SearchFactory {
    static logger = logger;

    static REGEX_SEARCH_CLEANER = '/[^\\w\\s]/gi';

    constructor() {
        SearchFactory.logger.info(`[${SearchFactory.name}] is building`);
    }

    produce(req) {
        const { search } = req;
        const schema = {};

        if (!search || search.length === 0) return null;

        schema.value = search.replace(
            SearchFactory.REGEX_SEARCH_CLEANER,
            ''
        );

        schema.criteria = req.searchSchema;

        return schema;
    }
}
