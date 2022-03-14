import { DataPersistenceService } from 'packages/restBuilder/core/dataHandler/data.persistence.service';
import { RecipeStepRepository } from '../recipe_step.repository';
import { Optional } from '../../../utils';
import { NotFoundException } from '../../../../packages/httpException';

class Service extends DataPersistenceService {
    constructor() {
        super(RecipeStepRepository);
    }

    async findByRecipeId(recipeId) {
        const data = Optional.of(await this.repository.findByRecipeId(recipeId))
            .throwIfNotPresent(new NotFoundException())
            .get();

        return data;
    }
}

export const RecipeStepService = new Service();
