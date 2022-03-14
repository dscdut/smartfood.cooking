import { DataPersistenceService } from 'packages/restBuilder/core/dataHandler/data.persistence.service';
import { RecipeRepository } from '../recipe.repository';
import { IngredientService } from '../../ingredient/services/ingredient.service';
import { RecipeStepService } from '../../recipe_step/services/recipe_step.service';
import { Optional } from '../../../utils';
import { NotFoundException } from '../../../../packages/httpException';

class Service extends DataPersistenceService {
    constructor() {
        super(RecipeRepository);
        this.ingredientService = IngredientService;
        this.recipeStepService = RecipeStepService;
    }

    async findByIngredientsId(ingredientsId) {
        const data = Optional.of(await this.repository.findByIngredientsId(ingredientsId))
            .throwIfNotPresent(new NotFoundException())
            .get();

        return data;
    }

    async findById(id) {
        const data = Optional.of(await this.repository.findById(id))
            .throwIfNotPresent(new NotFoundException())
            .get();
        data[0].ingredients = await this.ingredientService.findByRecipeId(id);
        data[0].steps = await this.recipeStepService.findByRecipeId(id);

        return data;
    }
}

export const RecipeService = new Service();
