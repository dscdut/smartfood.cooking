import { Module } from 'packages/handler/Module';
import { RecipeController } from './recipe.controller';

export const RecipeResolver = Module.builder()
    .addPrefix({
        prefixPath: '/recipes',
        tag: 'recipes',
        module: 'RecipeModule',
    })
    .register([
        {
            route: '/',
            method: 'get',
            controller: RecipeController.findAll,
        },
        {
            route: '/ingredients',
            method: 'get',
            controller: RecipeController.findByIngredientsId,
            preAuthorization: false,
        },
        {
            route: '/:id',
            method: 'get',
            controller: RecipeController.findById,
            preAuthorization: false,
        },
    ]);
