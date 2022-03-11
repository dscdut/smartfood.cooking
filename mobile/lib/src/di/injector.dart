import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:mobile/src/data/datasources/api/base_api.dart';
import 'package:mobile/src/data/datasources/firebase/firebase_service.dart';
import 'package:mobile/src/data/repositories/ingredient_repository.dart';
import 'package:mobile/src/modules/home/controller/ingredient_provider.dart';

final s1 = GetIt.instance;

void initDependences() {
  ///External + Http + Firebase
  s1.registerLazySingleton(() => GoogleSignIn());
  s1.registerLazySingleton(() => FirebaseAuth.instance);
  s1.registerLazySingleton(() => Client());

  ///Datasource
  ///
  ///
  s1.registerLazySingleton<FirebaseService>(
    () => FirebaseService(
      authService: s1(),
      googleSignIn: s1(),
      http: s1(),
    ),
  );

  s1.registerLazySingleton<BaseApi>(() => BaseApi(http: s1()));

  ///Repository
  ///
  ///
  s1.registerLazySingleton<IngredientRepository>(
      () => IngredientRepository(baseApi: s1()));

  ///ChangeNotifier
  ///
  ///
  s1.registerLazySingleton<IngredientProvider>(
      () => IngredientProvider(repository: s1()));
}
