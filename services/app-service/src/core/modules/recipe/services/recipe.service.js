import { RecipeRepository } from '../recipe.repository';
import { Optional } from '../../../utils';
import {
  NotFoundException,
  DuplicateException,
  BadRequestException,
} from '../../../../packages/httpException';

class Service {
  constructor() {
    this.repository = RecipeRepository;
  }

  async findByIngredientsId(ingredientsId) {
    const data = Optional.of(
      await this.repository.findByIngredientsId(ingredientsId),
    )
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
