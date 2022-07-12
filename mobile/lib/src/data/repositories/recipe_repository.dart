import 'dart:convert';
import 'dart:developer';

import 'package:mobile/src/data/datasources/api/base_api.dart';
import 'package:mobile/src/data/model/recipe/recipe.dart';

class RecipeRepository {
  RecipeRepository({required this.baseApi});

  final BaseApi baseApi;

  Future<List<Recipe>> getRecipesByIngredients(List<int> idIngredients) async {
    try {
      final dataRaw = await baseApi
          .postMethod('/recipes/ingredients', body: {'ids': idIngredients});
      final data = jsonDecode(dataRaw) as List;
      return data
          .map((e) => Recipe.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      log('getRecipesByIngredients fail ${e.toString()}');
      throw Exception('getRecipesByIngredients fail');
    }
  }

  Future<Recipe> getRecipeById(int id) async {
    try {
      final dataRaw = await baseApi.getMethod('/recipes/$id');
      return Recipe.fromJson(jsonDecode(dataRaw) as Map<String, dynamic>);
    } catch (e) {
      log('getRecipeById  fail ${e.toString()}');
      throw Exception('getRecipeByIds fail');
    }
  }
}
