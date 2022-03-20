/* eslint-disable no-await-in-loop */
import steps_images from '../data/steps_images.json';

exports.seed = knex => knex('steps_images')
    .del()
    .then(async () => {
        let data = [];
        for (let i = 0; i < steps_images.length; i += 1) {
            data.push(steps_images[i]);
            if ((i % 3000 === 0 && i !== 0) || i === steps_images.length - 1) {
                await knex('steps_images').insert(data);
                data = [];
            }
        }
    });
