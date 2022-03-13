import { DataPersistenceService } from 'packages/restBuilder/core/dataHandler/data.persistence.service';
import { IngredientRepository } from '../ingredient.repository';
import { Optional } from '../../../utils';
import { NotFoundException } from '../../../../packages/httpException';

class Service extends DataPersistenceService {
    constructor() {
        super(IngredientRepository);
    }

    async findByCategoriesId(categoriesId) {
        const data = Optional.of(await this.repository.findByCategoriesId(categoriesId))
            .throwIfNotPresent(new NotFoundException())
            .get();

        return data;
    }
}

export const IngredientService = new Service();
