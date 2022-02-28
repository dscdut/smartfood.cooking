import 'package:flutter/cupertino.dart';
import 'package:mobile/src/features/home/screens/choose_your_material.dart';
import 'package:mobile/src/features/home/screens/cook_recipe.dart';
import 'package:mobile/src/features/home/screens/done_cooking_screen.dart';
import 'package:mobile/src/features/home/screens/not_found_screen.dart';
import 'package:mobile/src/features/home/screens/select_recipe.dart';
import 'package:mobile/src/features/home/screens/steps_to_cooking.dart';
import 'package:mobile/src/features/home/screens/your_material_screen.dart';
import 'package:mobile/src/features/main_screen/main_screen.dart';
import 'package:mobile/src/features/user_choice/user_choice_screen.dart';

class RouteManager {
  static const String mainScreen = "/";
  static const String notFound = "/notFound";
  static const String yourMaterial = "/yourMaterial";
  static const String chooseYourMaterial = '/chooseYourMaterial';
  static const String stepsToCooking = '/stepsToCooking';
  static const String cookRecipe = '/cookRecipe';
  static const String selectRecipe = '/selectRecipe';
  static const String doneCooking = '/doneCooking';
  static const String userChoice = '/userChoice';

  static Map<String, WidgetBuilder> listRoute = {
    mainScreen: (_) => const MainScreen(),
    notFound: (_) => const NotFoundScreen(),
    yourMaterial: (_) => const YourMaterialScreen(),
    chooseYourMaterial: (_) => const ChooseYourMaterial(),
    stepsToCooking: (_) => const StepsToCookingScreen(),
    cookRecipe: (_) => const CookRecipe(),
    selectRecipe: (_) => const SelectRecipe(),
    doneCooking: (_) => const DoneCookingScreen(),
    userChoice: (_) => const UserChoiceScreen(),
  };
}
