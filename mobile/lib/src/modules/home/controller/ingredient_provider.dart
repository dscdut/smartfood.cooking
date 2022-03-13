import 'dart:developer';

import 'package:flutter/foundation.dart';

import 'package:mobile/src/data/model/ingredient.dart';
import 'package:mobile/src/data/repositories/ingredient_repository.dart';

enum LoadingStatus { loading, error, idle }

class IngredientProvider with ChangeNotifier {
  var listIngredient = <Ingredient>[];
  var status = LoadingStatus.idle;

  final IngredientRepository repository;
  IngredientProvider({
    required this.repository,
  }) {
    log("provider running");
    getListIngredient();
  }

  Future<void> getListIngredient() async {
    try {
      status = LoadingStatus.loading;
      notifyListeners();
      listIngredient = await repository.getListIngredients();
      log(listIngredient.toString());
      if (listIngredient.isEmpty) {
        status = LoadingStatus.error;
      } else {
        status = LoadingStatus.idle;
      }
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }
}
