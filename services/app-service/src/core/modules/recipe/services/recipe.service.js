import { DataPersistenceService } from 'packages/restBuilder/core/dataHandler/data.persistence.service';
import { RecipeRepository } from '../recipe.repository';
import { Optional } from '../../../utils';
import { NotFoundException } from '../../../../packages/httpException';

class Service extends DataPersistenceService {
    constructor() {
        super(RecipeRepository);
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

        return data;
    }
}

export const RecipeService = new Service();
