import 'dart:convert';
import 'dart:developer';

import 'package:mobile/src/data/datasources/api/base_api.dart';
import 'package:mobile/src/data/model/recipe.dart';

class RecipeRepository {
  final BaseApi baseApi;

  RecipeRepository({required this.baseApi});

  Future<List<Recipe>> getRecipesByIngredients(List<int> idIngredients) async {
    try {
      final dataRaw = await baseApi
          .postMethod("/recipes/ingredients", body: {"ids": idIngredients});
      Iterable data = jsonDecode(dataRaw);
      return data.map((value) => Recipe.fromJson(value)).toList();
    } catch (e) {
      log("gete List Ingredients fail ${e.toString()}");
      throw Exception("get List Ingredients fail");
    }
  }
}
