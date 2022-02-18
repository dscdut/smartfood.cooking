/**
 * @param {import("knex")} knex
 */

import recipes from '../data/recipes.json';

exports.seed = knex =>
  knex('recipes')
    .del()
    .then(async () => {
      let data = [];
      for (let i = 0; i < recipes.length; i++) {
        data.push(recipes[i]);
        if ((i % 3000 === 0 && i !== 0) || i === recipes.length - 1) {
          await knex('recipes').insert(data);
          data = [];
        }
      }
    });
