import { RecipeService } from '../../modules/recipe/services/recipe.service';
import { ValidHttpResponse } from '../../../packages/handler/response/validHttp.response';

class Controller {
  constructor() {
    this.service = RecipeService;
  }

  findByIngredientsId = async req => {
    const data = await this.service.findByIngredientsId(req.body.ids);
    return ValidHttpResponse.toOkResponse(data);
  };

  findById = async req => {
    const data = await this.service.findById(req.params.id);
    return ValidHttpResponse.toOkResponse(data);
  };
}

export const RecipeController = new Controller();
