import { DataPersistenceService } from 'packages/restBuilder/core/dataHandler/data.persistence.service';
import { IngredientRepository } from '../ingredient.repository';
// import { Optional } from '../../../utils';
// import { NotFoundException } from '../../../../packages/httpException';

class Service extends DataPersistenceService {
    constructor() {
        super(IngredientRepository);
    }
}

export const IngredientService = new Service();
