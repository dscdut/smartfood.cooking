import { DataPersistenceService } from 'packages/restBuilder/core/dataHandler/data.persistence.service';
import { RecipeStepRepository } from '../recipe-step.repository';
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

        let saveOrder = 0;
        const steps = [];
        data.forEach(step => {
            if (step.order === saveOrder) {
                steps[saveOrder - 1].images = [...steps[saveOrder - 1].images, step.url];
            } else {
                saveOrder = step.order;
                steps.push({
                    content: step.content,
                    order: step.order,
                    images: [step.url]
                });
            }
        });

        return steps;
    }
}

export const RecipeStepService = new Service();
