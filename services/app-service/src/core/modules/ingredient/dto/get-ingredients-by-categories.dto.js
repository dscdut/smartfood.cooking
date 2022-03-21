import { ApiDocument } from 'core/config/swagger.config';
import { SwaggerDocument } from 'packages/swagger';

ApiDocument.addModel('GetIngredientsByCategoriesDto',
    {
        ids: SwaggerDocument.ApiProperty({ type: 'array', model: 'int' })
    });

export const GetIngredientsByCategoriesDto = body => ({
    ids: body.ids
});
