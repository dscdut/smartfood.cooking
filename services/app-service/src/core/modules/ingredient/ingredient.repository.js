import { DataRepository } from 'packages/restBuilder/core/dataHandler/data.repository';

class Repository extends DataRepository {
}

export const IngredientRepository = new Repository('ingredients');
