/**
 * @param {import("knex")} knex
 */

import ingredients from '../data/ingredients.json';

exports.seed = knex => knex('ingredients')
    .del()
    .then(async () => {
        let data = [];
        for (let i = 0; i < ingredients.length; i++) {
            data.push(ingredients[i]);
            if ((i % 3000 === 0 && i !== 0) || i === ingredients.length - 1) {
                await knex('ingredients').insert(data);
                data = [];
            }
        }
    });
