import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mobile/src/data/model/ingredient.dart';
import 'package:mobile/src/data/repositories/ingredient_repository.dart';

enum LoadingStatus { loading, error, idle }

class ChoiceYourIngredientsProvider with ChangeNotifier {
  // STATIC DATA for Choose Your Material screen

  var ingredientData = <Ingredient>[];
  var ingredientFilterData = <Ingredient>[];
  var selectedTypeList = <bool>[];
  var selectedData = <int, bool?>{};
  var isLoadingMore = false;
  var status = LoadingStatus.idle;
  int page = 2;
  final IngredientRepository ingredientRepository;

  ChoiceYourIngredientsProvider({required this.ingredientRepository}) {
    selectedTypeList = List<bool>.filled(13, false, growable: true)
      ..first = true;
    loadIngredientData().then((value) {

      ingredientFilterData.addAll(ingredientData);
      selectedData = {for (var e in ingredientData) e.id: false};
      print(selectedData);
    });
  }

  Future<void> loadIngredientData() async {
    status = LoadingStatus.loading;
    notifyListeners();
    try {
      ingredientData = await ingredientRepository.getListIngredients(1);
      if (ingredientData.isNotEmpty) {
        status = LoadingStatus.idle;
      } else {
        status = LoadingStatus.error;
      }
    } catch (e) {
      status = LoadingStatus.error;
    } finally {
      notifyListeners();
    }
  }

  Future<void> loadMoreIngredientData() async {
    isLoadingMore = true;
    notifyListeners();
    try {
      await ingredientRepository.getListIngredients(page).then(
        (data) {
          ingredientData.addAll(data);
          ingredientFilterData.addAll(data);
          selectedData.addAll({for (var e in data) e.id: false});
          page++;
        },
      );
    } catch (e) {
      isLoadingMore = false;
    } finally {
      isLoadingMore = false;
      notifyListeners();
    }
  }

  String countSelectedMaterial() {
    return selectedData.values
        .where((element) => element == true)
        .toList()
        .length
        .toString();
  }

  void onTapIngredientsCard(int index, int id) {
    selectedData.update(id, (value) => !value!);
    log(selectedData.toString());
    notifyListeners();
  }

  void onSelected(bool value, int index) {
    if (index == 0 && selectedTypeList[index] == false) {
      selectedTypeList = List<bool>.filled(13, false, growable: false)
        ..first = true;
      ingredientFilterData.clear();
      log(ingredientData.length.toString());
      ingredientFilterData.addAll(ingredientData);
      log(ingredientFilterData.length.toString());
    } else if (index != 0) {
      print(index);
      selectedTypeList[index] = value;
      selectedTypeList[0] = false;
      ingredientFilterData.clear();
      for (int j = 1; j < selectedTypeList.length; j++) {
        if (selectedTypeList[j] == true) {
          ingredientFilterData.addAll(
            ingredientData.where(
              (data) => data.categoryId == j,
            ),
          );
        }
      }
    }
    if (selectedTypeList.every(
      (element) => element == false,
    )) {
      ingredientFilterData.clear();
      selectedTypeList = List<bool>.filled(13, false, growable: false)
        ..first = true;
      ingredientFilterData.addAll(ingredientData);
    }
    for (var e in ingredientFilterData) {
      log(e.name);
    }
    log("=============================================");
    notifyListeners();
  }
}