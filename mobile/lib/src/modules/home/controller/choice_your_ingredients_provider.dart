import 'package:flutter/cupertino.dart';
import 'package:mobile/src/data/model/ingredient.dart';
import 'package:mobile/src/data/repositories/ingredient_repository.dart';

enum LoadingStatus { loading, error, idle }
enum SearchLoadingStatus { loading, error, idle }
enum FilterDataMode { search, chip, none }

class ChoiceYourIngredientsProvider with ChangeNotifier {
  // STATIC DATA for Choose Your Material screen

  Set ingredientData = <Ingredient>{};
  Set ingredientFilterData = <Ingredient>{};
  var selectedTypeList = <bool>[];
  var selectedData = <int, bool?>{};
  var filterDataMode = FilterDataMode.none;
  var isLoadingMore = false;
  var status = LoadingStatus.idle;
  var searchStatus = SearchLoadingStatus.idle;
  var listPageObserve = List<int>.filled(13, 1);
  int pageForSearch = 1;
  final IngredientRepository ingredientRepository;
  late TextEditingController searchEditingController;

  ChoiceYourIngredientsProvider({required this.ingredientRepository}) {
    searchEditingController = TextEditingController();
    selectedTypeList = List<bool>.filled(13, false, growable: true)
      ..first = true;

    loadIngredientData().then((value) {
      listPageObserve[0]++;
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
    notifyListeners();
  }

  Future<void> onSelected(int index) async {
    //TODO: refactor Chip Mode
    if (index == 0 && selectedTypeList[index] == false) {
      selectedTypeList = List<bool>.filled(13, false, growable: false)
        ..first = true;
      ingredientFilterData.clear();
      ingredientFilterData.addAll(ingredientData);
      filterDataMode = FilterDataMode.none;
    } else if (index != 0) {
      if (!selectedTypeList[index]) {
        filterDataMode = FilterDataMode.chip;
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
    }

    notifyListeners();
  }

  Future<void> onSearchWithValue() async {
    //TODO: refactor Search
    pageForSearch = 1;
    searchStatus = SearchLoadingStatus.idle;
    filterDataMode = FilterDataMode.search;
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
    } else {
      ingredientFilterData = ingredientFilterData
          .where((element) => (element.name!
                  .toLowerCase()
                  .contains(searchEditingController.text.toLowerCase()) &&
              element.categoryId!.compareTo(selectedTypeList.indexOf(
                      selectedTypeList
                          .firstWhere((element) => element == true))) ==
                  0))
          .toSet();
      searchStatus = SearchLoadingStatus.loading;
      notifyListeners();
      await ingredientRepository
          .searchIngredients(searchEditingController.text, pageForSearch)
          .then((data) {
        if (data.isNotEmpty) {
          pageForSearch++;
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
        pageForSearch = 1;
      }));
    }
    notifyListeners();
  }

  Future<void> loadingDataMoreBySearch() async {
    isLoadingMore = true;
    notifyListeners();
    try {
      await ingredientRepository
          .searchIngredients(searchEditingController.text, pageForSearch)
          .then((data) {
        pageForSearch++;
        ingredientData.addAll(data);
        ingredientFilterData.addAll(data);
        selectedData.addAll({for (var e in data) e.id!: false});
        isLoadingMore = false;
      });
    } catch (e) {
      isLoadingMore = false;
    } finally {
      isLoadingMore = false;
      notifyListeners();
    }
  }

  Future<void> loadMoreIngredientsDataByCategory(int index) async {
    isLoadingMore = true;
    notifyListeners();
    try {
      await ingredientRepository
          .getListIngredientByCategory(index, listPageObserve[index])
          .then(
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
    pageForSearch = 1;
    filterDataMode = FilterDataMode.none;
    searchEditingController.clear();
    ingredientFilterData.clear();
    onSelected(selectedTypeList
        .indexOf(selectedTypeList.firstWhere(((element) => element == true))));
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
