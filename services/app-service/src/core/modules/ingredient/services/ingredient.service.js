import { DataPersistenceService } from 'packages/restBuilder/core/dataHandler/data.persistence.service';
import { IngredientRepository } from '../ingredient.repository';
import { Optional } from '../../../utils';
import { NotFoundException } from '../../../../packages/httpException';

class Service extends DataPersistenceService {
    constructor() {
        super(IngredientRepository);
    }

    async findByCategoryIds(categoriesId, pagination) {
        const data = Optional.of(await this.repository.findByCategoryIds(categoriesId, pagination))
            .throwIfNotPresent(new NotFoundException())
            .get();

        return data;
    }

    async findByRecipeId(recipeId) {
        const data = Optional.of(await this.repository.findByRecipeId(recipeId))
            .throwIfNotPresent(new NotFoundException())
            .get();

        return data;
    }
}

export const IngredientService = new Service();
