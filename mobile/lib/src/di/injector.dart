import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:mobile/src/data/datasources/api/base_api.dart';
import 'package:mobile/src/data/datasources/firebase/firebase_service.dart';
import 'package:mobile/src/data/repositories/ingredient_repository.dart';
import 'package:mobile/src/modules/choice_your_ingredients/controller/choice_your_ingredients_provider.dart';
import 'package:mobile/src/modules/home/controller/ingredient_provider.dart';
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
      authService: getIt(),
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

  ///ChangeNotifier
  ///
  ///
  getIt.registerFactory<IngredientProvider>(
      () => IngredientProvider(repository: getIt()));

  getIt.registerFactory<UserChoiceProvider>(() => UserChoiceProvider());

  getIt.registerFactory<ChoiceYourIngredientsProvider>(() => ChoiceYourIngredientsProvider());
}
