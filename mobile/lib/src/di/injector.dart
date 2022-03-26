import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:mobile/src/data/datasources/api/base_api.dart';
import 'package:mobile/src/data/datasources/firebase/firebase_service.dart';
import 'package:mobile/src/data/repositories/authentication_repository.dart';
import 'package:mobile/src/data/repositories/ingredient_repository.dart';
import 'package:mobile/src/data/repositories/recipe_repository.dart';
import 'package:mobile/src/modules/authentication/controllers/sign_in_provider.dart';
import 'package:mobile/src/modules/home/controller/choice_your_ingredients_provider.dart';
import 'package:mobile/src/modules/home/controller/recipe_provider.dart';
import 'package:mobile/src/modules/user_choice/controller/user_choice_provider.dart';

final GetIt getIt = GetIt.instance;

void initDependences() {
  ///External + Http + Firebase
  getIt.registerLazySingleton(() => GoogleSignIn());
  getIt.registerLazySingleton(() => FirebaseAuth.instance);
  getIt.registerLazySingleton(() => Client());

  ///Datasource
  ///
  ///
  getIt.registerLazySingleton<FirebaseService>(
    () => FirebaseService(
      firebaseAuth: getIt(),
      googleSignIn: getIt(),
      http: getIt(),
    ),
  );

  getIt.registerLazySingleton<BaseApi>(() => BaseApi(http: getIt()));

  ///Repository
  ///
  ///
  getIt.registerLazySingleton<IngredientRepository>(
      () => IngredientRepository(baseApi: getIt()));
  getIt.registerLazySingleton<RecipeRepository>(
      () => RecipeRepository(baseApi: getIt()));
  getIt.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepository(
            baseApi: getIt(),
            firebaseService: getIt(),
          ));

  ///ChangeNotifier
  ///
  ///

  getIt.registerFactory<UserChoiceProvider>(() => UserChoiceProvider());

  getIt.registerFactory<ChoiceYourIngredientsProvider>(
      () => ChoiceYourIngredientsProvider(ingredientRepository: getIt()));

  getIt.registerFactory<RecipeProvider>(
      () => RecipeProvider(recipeRepository: getIt()));

  getIt.registerFactory<SignInProvider>(
      () => SignInProvider(authenticationRepository: getIt()));
}
