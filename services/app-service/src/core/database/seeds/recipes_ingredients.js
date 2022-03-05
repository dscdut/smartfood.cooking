/**
 * @param {import("knex")} knex
 */

import recipes_ingredients from '../data/recipes_ingredients.json';

exports.seed = knex => knex('recipes_ingredients')
    .del()
    .then(async () => {
        let data = [];
        for (let i = 0; i < recipes_ingredients.length; i++) {
            data.push(recipes_ingredients[i]);
            if (
                (i % 3000 === 0 && i !== 0)
          || i === recipes_ingredients.length - 1
            ) {
                await knex('recipes_ingredients').insert(data);
                data = [];
            }
        }
    });
