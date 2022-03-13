/* eslint-disable no-await-in-loop */
/**
 * @param {import("knex")} knex
 */

import ingredients_categories from '../data/ingredients_categories.json';

exports.seed = knex => knex('ingredients_categories')
    .del()
    .then(async () => {
        let data = [];
        for (let i = 0; i < ingredients_categories.length; i += 1) {
            data.push(ingredients_categories[i]);
            if ((i % 3000 === 0 && i !== 0) || i === ingredients_categories.length - 1) {
                await knex('ingredients_categories').insert(data);
                data = [];
            }
        }
    });
