import { DataRepository } from 'packages/restBuilder/core/dataHandler/data.repository';

class Repository extends DataRepository {
    findByIngredientIds(ingredientsId) {
        return this.query()
            .innerJoin('recipes_ingredients', 'recipes.id', 'recipes_ingredients.recipe_id')
            .innerJoin('ingredients', 'recipes_ingredients.ingredient_id', 'ingredients.id')
            .innerJoin('recipes_images', 'recipes.id', 'recipes_images.recipe_id')
            .innerJoin('images', 'recipes_images.image_id', 'images.id')
            .whereNull('recipes.deleted_at')
            .whereIn('ingredients.id', ingredientsId)
            .select(
                'recipes.id',
                'recipes.name',
                'recipes.level',
                'recipes.description',
                'images.url',
                'recipes.deleted_at',
                'recipes.created_at',
                'recipes.updated_at',
            )
            .groupByRaw('recipes.id, recipes.name, images.url')
            .orderByRaw('count(ingredients.id) desc');
    }

    findById(id) {
        return this.query()
            .innerJoin('recipes_images', 'recipes.id', 'recipes_images.recipe_id')
            .innerJoin('images', 'recipes_images.image_id', 'images.id')
            .whereNull('recipes.deleted_at')
            .where('recipes.id', '=', id)
            .select(
                'recipes.id',
                'recipes.name',
                'recipes.level',
                'recipes.description',
                'images.url',
                'recipes.deleted_at',
                'recipes.created_at',
                'recipes.updated_at',
            )
            .first();
    }
}

export const RecipeRepository = new Repository('recipes');
