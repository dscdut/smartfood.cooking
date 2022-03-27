import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mobile/src/data/model/ingredient.dart';
import 'package:mobile/src/data/repositories/ingredient_repository.dart';

enum LoadingStatus { loading, error, idle }
enum SearchLoadingStatus { loading, error, idle }

class ChoiceYourIngredientsProvider with ChangeNotifier {
  // STATIC DATA for Choose Your Material screen

  var ingredientData = <Ingredient>{};
  var ingredientFilterData = <Ingredient>{};
  var selectedTypeList = <bool>[];
  var selectedData = <int, bool?>{};
  var isLoadingMore = false;
  var status = LoadingStatus.idle;
  var searchStatus = SearchLoadingStatus.idle;
  var listPageObserve = List<int>.filled(13, 1);
  bool isAll = true;
  final IngredientRepository ingredientRepository;
  late TextEditingController searchEditingController;

  ChoiceYourIngredientsProvider({required this.ingredientRepository}) {
    searchEditingController = TextEditingController();
    selectedTypeList = List<bool>.filled(13, false, growable: true)
      ..first = true;
    loadIngredientData().then((value) {
      ingredientFilterData.addAll(ingredientData);
      selectedData = {for (var e in ingredientData) e.id!: false};
    });
  }

  Future<void> loadIngredientData() async {
    status = LoadingStatus.loading;
    notifyListeners();
    try {
      await ingredientRepository.getListIngredients(1).then((value) {
        ingredientData.addAll(value);
      });

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

  Future<void> loadMoreAllIngredientData() async {
    isLoadingMore = true;
    notifyListeners();
    try {
      await ingredientRepository.getListIngredients(listPageObserve[0]).then(
        (data) {
          listPageObserve[0]++;
          ingredientData.addAll(data);
          ingredientFilterData.addAll(data);
          selectedData.addAll({for (var e in data) e.id!: false});
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

  Future<void> onSelected(int index) async {
    if (index == 0 && selectedTypeList[index] == false) {
      selectedTypeList = List<bool>.filled(13, false, growable: false)
        ..first = true;
      ingredientFilterData.clear();
      log(ingredientData.length.toString());
      ingredientFilterData.addAll(ingredientData);
      isAll = true;
    } else if (index != 0) {
      if (!selectedTypeList[index]) {
        isAll = false;
        selectedTypeList = List<bool>.filled(13, false, growable: false);
        selectedTypeList[index] = true;
        selectedTypeList[0] = false;
        ingredientFilterData.clear();
        for (int j = 1; j < selectedTypeList.length; j++) {
          if (selectedTypeList[j] == true) {
            ingredientFilterData
                .addAll(ingredientData.where((data) => data.categoryId == j));
          }
        }
      } else {
        selectedTypeList[index] = false;
      }

      /// In case current data ```isEmpty```
      ///
      if (ingredientFilterData.isEmpty &&
          ingredientData
              .where(
                (data) => data.categoryId == index,
              )
              .isEmpty) {
        searchStatus = SearchLoadingStatus.loading;
        notifyListeners();
        await ingredientRepository
            .getListIngredientByCategory(index, listPageObserve[index])
            .then((data) {
          ingredientData.addAll(data);
          listPageObserve[index]++;
          //sort
          final temp = ingredientData.toList();
          temp.sort(((a, b) => a.categoryId!.compareTo(b.categoryId!)));
          ingredientData = temp.toSet();
          ingredientFilterData.addAll(data);
          selectedData.addAll({for (var e in data) e.id!: false});

          searchStatus = SearchLoadingStatus.idle;
        }).catchError((err) {
          searchStatus = SearchLoadingStatus.error;
        });
        notifyListeners();
      }
    }
    if (selectedTypeList.every(
      (element) => element == false,
    )) {
      ingredientFilterData.clear();
      selectedTypeList = List<bool>.filled(13, false, growable: false)
        ..first = true;
      ingredientFilterData.addAll(ingredientData);
      isAll = true;
    }
    for (var e in ingredientFilterData) {
      log(e.name!);
    }
    log("==============================================================");
    notifyListeners();
  }

  Future<void> onSearchWithValue() async {
    searchStatus = SearchLoadingStatus.idle;
    if (searchEditingController.text.isEmpty) {
      ingredientFilterData.clear();
      if (selectedTypeList.indexOf(
              selectedTypeList.firstWhere((element) => element == true)) !=
          0) {
        ingredientFilterData.addAll(
          ingredientData.where((element) =>
              element.categoryId!.compareTo(selectedTypeList.indexOf(
                  selectedTypeList.firstWhere((element) => element == true))) ==
              0),
        );
      } else {
        ingredientFilterData.addAll(ingredientData);
      }
      log(ingredientData.length.toString());
    } else {
      if (selectedTypeList.indexOf(
              selectedTypeList.firstWhere((element) => element == true)) !=
          0) {
        ingredientFilterData = ingredientFilterData
            .where((element) => (element.name!
                    .toLowerCase()
                    .contains(searchEditingController.text.toLowerCase()) &&
                element.categoryId!.compareTo(selectedTypeList.indexOf(
                        selectedTypeList
                            .firstWhere((element) => element == true))) ==
                    0))
            .toSet();
      }
      searchStatus = SearchLoadingStatus.loading;
      notifyListeners();
      await ingredientRepository
          .searchIngredients(searchEditingController.text)
          .then((data) {
        log(data.toString());
        if (data.isNotEmpty) {
          if (selectedTypeList.indexOf(
                  selectedTypeList.firstWhere((element) => element == true)) !=
              0) {
            ingredientFilterData.addAll(data.where((element) =>
                element.categoryId!.compareTo(selectedTypeList.indexOf(
                    selectedTypeList
                        .firstWhere((element) => element == true))) ==
                0));
          } else {
            ingredientFilterData.addAll(data);
          }
          selectedData.addAll({for (var e in data) e.id!: false});
          if (ingredientData.isEmpty) {
            searchStatus = SearchLoadingStatus.error;
          } else {
            searchStatus = SearchLoadingStatus.idle;
          }
        } else {
          searchStatus = SearchLoadingStatus.error;
        }
      }).catchError(((err) {
        searchStatus = SearchLoadingStatus.error;
      }));

      log(ingredientFilterData.length.toString());
    }
    notifyListeners();
  }

  Future<void> loadMoreIngredientsDataByCategory(int index, int page) async {
    isLoadingMore = true;
    notifyListeners();
    try {
      await ingredientRepository.getListIngredientByCategory(index, page).then(
        (data) {
          listPageObserve[index]++;
          ingredientData.addAll(data);
          ingredientFilterData.addAll(data);
          selectedData.addAll({for (var e in data) e.id!: false});
        },
      );
    } catch (e) {
      isLoadingMore = false;
    } finally {
      isLoadingMore = false;
      notifyListeners();
    }
  }

  void clearSearch() {
    searchEditingController.clear();
    ingredientFilterData.clear();
    onSelected(selectedTypeList
        .indexOf(selectedTypeList.firstWhere(((element) => element == true))));
    ingredientFilterData.addAll(ingredientData);
    notifyListeners();
  }

  void onDeleteAction(int id) {
    selectedData.update(id, (value) => value = false);
    notifyListeners();
  }

  void onDeleteAllAction() {
    selectedData.updateAll(((key, value) => value = false));
    notifyListeners();
  }

  @override
  void dispose() {
    searchEditingController.dispose();
    super.dispose();
  }
}
