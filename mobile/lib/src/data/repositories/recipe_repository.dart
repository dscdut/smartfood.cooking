import 'dart:convert';
import 'dart:developer';

import 'package:mobile/src/data/datasources/api/base_api.dart';
import 'package:mobile/src/data/model/recipe/recipe.dart';

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
      log("getRecipesByIngredients fail ${e.toString()}");
      throw Exception("getRecipesByIngredients fail");
    }
  }

  Future<Recipe> getRecipeById(int id) async {
    try {
    final dataRaw = await baseApi.getMethod("/recipes/$id");
    print(dataRaw);
    return Recipe.fromJson(jsonDecode(dataRaw));
    } catch (e) {
      log("getRecipeById  fail ${e.toString()}");
      throw Exception("getRecipeByIds fail");
    }
  }
}
