import { DataRepository } from 'packages/restBuilder/core/dataHandler/data.repository';

class Repository extends DataRepository {
    findByCategoriesId(categoriesId) {
        return this.query()
            .innerJoin('ingredients_categories', 'ingredients_categories.ingredient_id', 'ingredients.id')
            .whereNull('ingredients.deleted_at')
            .whereIn('ingredients_categories.category_id', categoriesId)
            .select(
                'ingredients.id',
                'ingredients.name',
                'ingredients_categories.category_id',
                'ingredients.deleted_at',
                'ingredients.created_at',
                'ingredients.updated_at',
            );
    }
}

export const IngredientRepository = new Repository('ingredients');
