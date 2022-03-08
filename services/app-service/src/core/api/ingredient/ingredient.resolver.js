import { Module } from 'packages/handler/Module';
import { IngredientController } from './ingredient.controller';

export const IngredientResolver = Module.builder()
    .addPrefix({
        prefixPath: '/ingredients',
        tag: 'ingredients',
        module: 'IngredientModule',
    })
    .register([
        {
            route: '/',
            method: 'get',
            controller: IngredientController.findAll,
        },
    ]);
