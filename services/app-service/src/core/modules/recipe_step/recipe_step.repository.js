import { DataRepository } from 'packages/restBuilder/core/dataHandler/data.repository';

class Repository extends DataRepository {
    findByRecipeId(recipeId) {
        return this.query()
            .innerJoin('steps_images', 'recipes_steps.id', 'steps_images.step_id')
            .innerJoin('images', 'images.id', 'steps_images.image_id')
            .whereNull('recipes_steps.deleted_at')
            .whereNull('images.deleted_at')
            .where('recipe_id', recipeId)
            .select('content', 'order', 'url')
            .orderBy('order');
    }
}

export const RecipeStepRepository = new Repository('recipes_steps');
