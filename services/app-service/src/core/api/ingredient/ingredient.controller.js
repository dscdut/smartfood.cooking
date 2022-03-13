import { RequestTransformer } from 'packages/restBuilder/core/requestTransformer';
import { GetIngredientsByCategoriesDto } from 'core/modules/ingredient/dto/get-ingredients-by-categories.dto';
import { IngredientService } from '../../modules/ingredient/services/ingredient.service';
import { ValidHttpResponse } from '../../../packages/handler/response/validHttp.response';
import searchIngredientSchema from './query/searchIngredient.schema.json';

class Controller {
    constructor() {
        this.service = IngredientService;
    }

    findByCategoriesId = async req => {
        const data = await this.service.findByCategoriesId(GetIngredientsByCategoriesDto(req.body).ids);
        return ValidHttpResponse.toOkResponse(data);
    };

    findAll = async req => {
        const reqTransformed = new RequestTransformer(req.query, searchIngredientSchema);
        const data = await this.service.getAndCount(reqTransformed);
        return ValidHttpResponse.toOkResponse(data);
    };
}

export const IngredientController = new Controller();
