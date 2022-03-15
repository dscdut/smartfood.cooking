import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mobile/src/data/model/ingredient.dart';
import 'package:mobile/src/data/repositories/ingredient_repository.dart';

enum LoadingStatus { loading, error, idle }

class ChoiceYourIngredientsProvider with ChangeNotifier {
  // STATIC DATA for Choose Your Material screen
  final List<String> typeMaterialList = <String>[
    "Tất cả",
    "Rau củ quả",
    "Thủy sản",
    "Thịt",
    "Trứng",
    "Sữa",
    "Gia vị",
    "Hạt",
    "Thực phẩm chế biến",
    "Gạo, bột, đồ khô",
    "Nước",
    "Nội tạng",
    "Khác",
  ];

  var ingredientData = <Ingredient>[];
  var ingredientFilterData = <Ingredient>[];
  var selectedTypeList = <bool>[];
  var selectedIngredientList = <bool>[];
  var isLoadingMore = false;
  var status = LoadingStatus.idle;
  int page = 2;
  final IngredientRepository ingredientRepository;

  ChoiceYourIngredientsProvider({required this.ingredientRepository}) {
    loadIngredientData().then((value) {
      selectedTypeList =
          List<bool>.filled(typeMaterialList.length, false, growable: true)
            ..first = true;
      selectedIngredientList =
          List<bool>.filled(ingredientData.length, false, growable: true);
      ingredientFilterData.addAll(ingredientData);
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
          page++;
          selectedIngredientList.addAll(List<bool>.filled(data.length, false));
          isLoadingMore = false;
          ingredientFilterData.addAll(data);
        },
      );
    } catch (e) {
      isLoadingMore = false;
    } finally {
      notifyListeners();
    }
  }

  String countSelectedMaterial() {
    return selectedIngredientList
        .where((element) => element == true)
        .toList()
        .length
        .toString();
  }

  void onTapIngredientsCard(int index) {
    selectedIngredientList[index] = !selectedIngredientList[index];
    notifyListeners();
  }

  // void onSelected(bool value, int index) {
  //   if (index == 0 && !selectedTypeList[index]) {
  //     selectedTypeList =
  //         List<bool>.filled(typeMaterialList.length, false, growable: false)
  //           ..first = true;
  //     ingredientFilterData.clear();
  //     ingredientFilterData = ingredientData;
  //   } else if (index != 0) {
  //     selectedTypeList[index] = value;
  //     selectedTypeList[0] = false;
  //     if (selectedTypeList
  //             .where((element) => element == true)
  //             .toList()
  //             .length ==
  //         1) {
  //       ingredientFilterData.clear();
  //       ingredientFilterData
  //           .addAll(ingredientData.where((data) => data.categoryId == ));
  //     }
  //     if (value) {
  //       ingredientFilterData
  //           .addAll(ingredientData.where((data) => data.categoryId == index));
  //     }
  //   }
  // if (selectedTypeList.every(
  //   (element) => element == false,
  // )) {
  //   selectedTypeList =
  //       List<bool>.filled(typeMaterialList.length, false, growable: false)
  //         ..first = true;
  //   ingredientFilterData = ingredientData;
  //   notifyListeners();
  // }
  //   notifyListeners();
  // }

  void onSelected(bool value, int index) {
    if (index == 0 && selectedTypeList[index] == false) {
      selectedTypeList =
          List<bool>.filled(typeMaterialList.length, false, growable: false)
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
      // ingredientFilterData
      //     .addAll(ingredientData.where((data) => data.categoryId == index));

    }
    if (selectedTypeList.every(
      (element) => element == false,
    )) {
      ingredientFilterData.clear();
      selectedTypeList =
          List<bool>.filled(typeMaterialList.length, false, growable: false)
            ..first = true;
      ingredientFilterData.addAll(ingredientData);
    }
    notifyListeners();
  }
}
