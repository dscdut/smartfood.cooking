import 'package:flutter/material.dart';
import 'package:mobile/src/data/model/recipe/recipe.dart';

class RecipeFilterProvider extends ChangeNotifier {
  late List<Recipe> listFound;
  late List<Recipe> listDisplay;
  late int levelFilter = 1;
  late int reviewFilter = 3;
  late RangeValues timeFilter = const RangeValues(100, 200);
  late RangeValues caloriFilter = const RangeValues(200, 1000);
  late List<Recipe> filterResult = [];

  void displayRoutingResult() {
    listDisplay = listFound;
    notifyListeners();
  }

  void displayFilterResult() {
    listDisplay = filterResult;
    notifyListeners();
  }

  void levelFilterAction(int i) {
    levelFilter = i;
    notifyListeners();
  }

  void timeFilterAction(RangeValues newValue) {
    timeFilter = newValue;
    notifyListeners();
  }

  void reviewFilterAction(int i) {
    reviewFilter = i;
    notifyListeners();
  }

  void caloriFilterAction(RangeValues newValue) {
    caloriFilter = newValue;
    notifyListeners();
  }

  void resetFilter() {
    levelFilter = 1;
    reviewFilter = 3;
    timeFilter = const RangeValues(100, 200);
    caloriFilter = const RangeValues(200, 1000);
    notifyListeners();
  }

  void submitFilter(List<Recipe> listFound) {
    filterResult = [];
    for (final element in listFound) {
      if (element.level.toString() == checkFilterLevel()) {
        filterResult.add(element);
      }
    }
    notifyListeners();
  }

  String checkFilterLevel() {
    switch (levelFilter) {
      case 1:
        return 'Dễ';
      case 2:
        return 'Vừa';
      case 3:
        return 'Khó';
      default:
        return 'Error';
    }
  }
}
