import 'package:flutter/cupertino.dart';
import 'package:mobile/src/modules/authentication/screen/forgot_password_action_screen.dart';
import 'package:mobile/src/modules/authentication/screen/sign_in.dart';
import 'package:mobile/src/modules/authentication/screen/sign_up.dart';
import 'package:mobile/src/modules/home/screens/choose_your_ingredient.dart';
import 'package:mobile/src/modules/home/screens/cook_recipe.dart';
import 'package:mobile/src/modules/home/screens/done_cooking_screen.dart';
import 'package:mobile/src/modules/home/screens/not_found_screen.dart';
import 'package:mobile/src/modules/home/screens/select_recipe.dart';
import 'package:mobile/src/modules/home/screens/steps_to_cooking.dart';
import 'package:mobile/src/modules/home/screens/your_material_screen.dart';
import 'package:mobile/src/modules/home/widgets/view_image.dart';
import 'package:mobile/src/modules/main_screen/main_screen.dart';
import 'package:mobile/src/modules/splash/splash_screen.dart';
import 'package:mobile/src/modules/user_choice/screens/allergic_food_choice.dart';
import 'package:mobile/src/modules/user_choice/screens/user_choice_screen.dart';

class RouteManager {
  static const String splash = '/';
  static const String mainScreen = '/main';
  static const String notFound = '/notFound';
  static const String yourMaterial = '/yourMaterial';
  static const String chooseYourIngredient = '/chooseYourIngredient';
  static const String stepsToCooking = '/stepsToCooking';
  static const String cookRecipe = '/cookRecipe';
  static const String selectRecipe = '/selectRecipe';
  static const String doneCooking = '/doneCooking';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String forgotPassword = '/forgotPassword';
  static const String userChoice = '/userChoice';
  static const String allergicChoice = '/allergicChoice';
  static const String viewImage = '/viewImage';

  static Map<String, WidgetBuilder> listRoute = {
    splash: (_) => const SplashScreen(),
    mainScreen: (_) => const MainScreen(),
    notFound: (_) => const NotFoundScreen(),
    yourMaterial: (_) => const YourMaterialScreen(),
    chooseYourIngredient: (_) => const ChooseYourIngredient(),
    stepsToCooking: (_) => const StepsToCookingScreen(),
    cookRecipe: (_) => const CookRecipe(),
    selectRecipe: (_) => const SelectRecipe(),
    doneCooking: (_) => const DoneCookingScreen(),
    signIn: (_) => const SignIn(),
    signUp: (_) => const SignUp(),
    forgotPassword: (_) => const ForgotPasswordActionScreen(),
    userChoice: (_) => const UserChoiceScreen(),
    allergicChoice: (_) => const AllergicFoodChoice(),
    viewImage: (_) => const ViewImage(),
  };
}
