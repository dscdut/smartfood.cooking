import 'dart:convert';
import 'dart:developer';

import 'package:mobile/src/data/datasources/api/base_api.dart';
import 'package:mobile/src/data/model/ingredient.dart';

class IngredientRepository {
  final BaseApi baseApi;
  IngredientRepository({
    required this.baseApi,
  });

  Future<List<Ingredient>> getListIngredients(int page) async {
    try {
      final dataRaw = await baseApi
          .getMethod("/ingredients?page=$page&size=12&sort=category_id");
      var converted = jsonDecode(dataRaw);
      Iterable data = converted["content"];
      return data.map((value) => Ingredient.fromJson(value)).toList();
    } catch (e) {
      log("gete List Ingredients fail ${e.toString()}");
      throw Exception("get List Ingredients fail");
    }
  }

  Future<List<Ingredient>> searchIngredients(String value) async {
    try {
      final dataRaw = await baseApi.getMethod("/ingredients/?search=$value");
      var converted = jsonDecode(dataRaw);
      Iterable data = converted["content"];
      return data.map((value) => Ingredient.fromJson(value)).toList();
    } catch (e) {
      log("Search List Ingredients fail ${e.toString()}");
      throw Exception("Search Ingredients $value fail");
    }
  }

  Future<List<Ingredient>> getListIngredientByCategory(
      int categoryId, int page) async {
    try {
      final dataRaw = await baseApi.postMethod(
        "/ingredients/categories?page=$page&size=12",
        body: <String, List<int>>{
          "ids": <int>[categoryId]
        },
      );
      Iterable data = jsonDecode(dataRaw);
      return data.map((value) => Ingredient.fromJson(value)).toList();
    } catch (e) {
      log("post List Ingredients by category fail ${e.toString()}");
      throw Exception("post List Ingredients by category fail $categoryId");
    }
  }
}
