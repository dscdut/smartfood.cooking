/* eslint-disable no-await-in-loop */
import ingredients_images from '../data/ingredients_images.json';

exports.seed = knex => knex('ingredients_images')
    .del()
    .then(async () => {
        let data = [];
        for (let i = 0; i < ingredients_images.length; i += 1) {
            data.push(ingredients_images[i]);
            if ((i % 3000 === 0 && i !== 0) || i === ingredients_images.length - 1) {
                await knex('ingredients_images').insert(data);
                data = [];
            }
        }
    });
