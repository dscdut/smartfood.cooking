import { DataRepository } from 'packages/restBuilder/core/dataHandler/data.repository';

class Repository extends DataRepository {
  findByIngredientsId(ingredientsId) {
    return this.query()
      .innerJoin(
        'recipes_ingredients',
        'recipes.id',
        'recipes_ingredients.recipe_id',
      )
      .innerJoin(
        'ingredients',
        'recipes_ingredients.ingredient_id',
        'ingredients.id',
      )
      .whereNull('recipes.deleted_at')
      .whereIn('ingredients.id', ingredientsId)
      .select(
        'recipes.id',
        'recipes.name',
        'recipes.level',
        'recipes.description',
        'recipes.deleted_at',
        'recipes.created_at',
        'recipes.updated_at',
      )
      .groupByRaw('recipes.id, recipes.name')
      .orderByRaw('count(ingredients.id) desc');
  }

  findById(id) {
    return this.query()
      .whereNull('recipes.deleted_at')
      .where('recipes.id', '=', id)
      .select();
  }
}

export const RecipeRepository = new Repository('recipes');
