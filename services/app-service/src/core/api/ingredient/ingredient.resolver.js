import { DefaultQueryCriteriaDocument } from 'core/common/swagger';
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
            params: DefaultQueryCriteriaDocument,
            controller: IngredientController.findAll,
        },
        {
            route: '/categories',
            method: 'post',
            params: DefaultQueryCriteriaDocument,
            body: 'GetIngredientsByCategoriesDto',
            controller: IngredientController.findByCategoryIds,
        },
    ]);
