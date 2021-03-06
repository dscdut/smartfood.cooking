import { DataRepository } from 'packages/restBuilder/core/dataHandler/data.repository';

class Repository extends DataRepository {
    findByCategoryIds(categoriesId, pagination) {
        return this.query()
            .innerJoin('ingredients_categories', 'ingredients_categories.ingredient_id', 'ingredients.id')
            .innerJoin('ingredients_images', 'ingredients_images.ingredient_id', 'ingredients.id')
            .innerJoin('images', 'ingredients_images.image_id', 'images.id')
            .whereNull('ingredients.deleted_at')
            .whereIn('ingredients_categories.category_id', categoriesId)
            .select(
                'ingredients.id',
                'ingredients.name',
                'ingredients_categories.category_id',
                'images.url',
                'ingredients.deleted_at',
                'ingredients.created_at',
                'ingredients.updated_at',
            )
            .limit(pagination.size)
            .offset(pagination.offset);
    }

    findByRecipeId(recipeId) {
        return this.query()
            .innerJoin('recipes_ingredients', 'recipes_ingredients.ingredient_id', 'ingredients.id')
            .innerJoin('ingredients_images', 'ingredients_images.ingredient_id', 'ingredients.id')
            .innerJoin('images', 'ingredients_images.image_id', 'images.id')
            .whereNull('ingredients.deleted_at')
            .where('recipes_ingredients.recipe_id', recipeId)
            .select(
                'ingredients.name',
                'recipes_ingredients.value',
                'recipes_ingredients.unit',
                'images.url',
            );
    }
}

export const IngredientRepository = new Repository('ingredients');
