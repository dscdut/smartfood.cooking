import 'package:flutter/cupertino.dart';

class RecipeProvider extends ChangeNotifier {
  //TODO: add depedencences
  final listTodayRecipe = List.filled(5, false);
  RecipeProvider();

  void favoriteRecipeAction(int index) {
    listTodayRecipe[index] = !listTodayRecipe[index];
    //TODO: call method from repository to send data action to API
    notifyListeners();
  }
}
