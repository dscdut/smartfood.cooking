// import {} from 'core/modules/recipe';
import { DefaultQueryCriteriaDocument, RecordId } from 'core/common/swagger';
import { RecordIdInterceptor } from 'core/modules/interceptor/recordId/record-id.interceptor';
import { GetRecipesByIngredientsInterceptor } from 'core/modules/recipe/interceptor';
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
            params: DefaultQueryCriteriaDocument,
            controller: RecipeController.findAll,
        },
        {
            route: '/ingredients',
            method: 'post',
            interceptors: [GetRecipesByIngredientsInterceptor],
            body: 'GetRecipesByIngredientsDto',
            controller: RecipeController.findByIngredientIds,
            preAuthorization: false,
        },
        {
            route: '/:id',
            method: 'get',
            params: [RecordId],
            interceptors: [RecordIdInterceptor],
            controller: RecipeController.findById,
            preAuthorization: false,
        },
    ]);
