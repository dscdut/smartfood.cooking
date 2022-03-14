import { DataRepository } from 'packages/restBuilder/core/dataHandler/data.repository';

class Repository extends DataRepository {
    findByRecipeId(recipeId) {
        return this.query()
            .whereNull('deleted_at')
            .where('recipe_id', recipeId)
            .select('content', 'order')
            .orderBy('order');
    }
}

export const RecipeStepRepository = new Repository('recipes_steps');
