/* eslint-disable no-await-in-loop */
import recipes_images from '../data/recipes_images.json';

exports.seed = knex => knex('recipes_images')
    .del()
    .then(async () => {
        let data = [];
        for (let i = 0; i < recipes_images.length; i += 1) {
            data.push(recipes_images[i]);
            if ((i % 3000 === 0 && i !== 0) || i === recipes_images.length - 1) {
                await knex('recipes_images').insert(data);
                data = [];
            }
        }
    });
