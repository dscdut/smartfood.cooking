import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/di/injector.dart';
import 'package:mobile/src/modules/authentication/controllers/sign_in_provider.dart';
import 'package:mobile/src/modules/home/controller/recipe_filter_provider.dart';
import 'package:mobile/src/modules/home/controller/recipe_provider.dart';
import 'package:mobile/src/modules/user_choice/controller/user_choice_provider.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => getIt<UserChoiceProvider>(),
            ),
            ChangeNotifierProvider(
              create: (_) => getIt<RecipeProvider>(),
            ),
            ChangeNotifierProvider(
              create: (_) => getIt<SignInProvider>(),
            ),
            ChangeNotifierProvider(
              create: (_) => getIt<RecipeFilterProvider>(),
            )
          ],
          child: MaterialApp(
            useInheritedMediaQuery: true,
            title: 'Smart Food',
            debugShowCheckedModeBanner: false,
            routes: RouteManager.listRoute,
            initialRoute: RouteManager.splash,
            theme: ThemeData(
              brightness: Brightness.light,
              fontFamily: 'Nunito',
              useMaterial3: true,
            ),
          ),
        );
      },
    );
  }
}
