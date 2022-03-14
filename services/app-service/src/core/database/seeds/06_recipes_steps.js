/* eslint-disable no-await-in-loop */
/**
 * @param {import("knex")} knex
 */

import recipes_steps from '../data/recipes_steps.json';

exports.seed = knex => knex('recipes_steps')
    .del()
    .then(async () => {
        let data = [];
        for (let i = 0; i < recipes_steps.length; i += 1) {
            data.push(recipes_steps[i]);
            if ((i % 3000 === 0 && i !== 0) || i === recipes_steps.length - 1) {
                await knex('recipes_steps').insert(data);
                data = [];
            }
        }
    });
