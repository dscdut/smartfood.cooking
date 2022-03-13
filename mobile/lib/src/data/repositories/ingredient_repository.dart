import 'dart:convert';
import 'dart:developer';

import 'package:mobile/src/data/datasources/api/base_api.dart';
import 'package:mobile/src/data/model/ingredient.dart';

class IngredientRepository {
  final BaseApi baseApi;
  IngredientRepository({
    required this.baseApi,
  });

  Future<List<Ingredient>> getListIngredients() async {
    try {
      final dataRaw = await baseApi.getMethod("/ingredients");
      var converted = jsonDecode(dataRaw);
      Iterable data = converted["content"];
      log(data.toString());
      return data.map((value) => Ingredient.fromJson(value)).toList();
    } catch (e) {
      log("get List Ingredients fail ${e.toString()}");
      throw Exception("get List Ingredients fail");
    }
  }
}
