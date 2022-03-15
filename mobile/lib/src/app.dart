import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/di/injector.dart';
import 'package:mobile/src/modules/authentication/controllers/sign_in_provider.dart';
import 'package:mobile/src/modules/home/controller/ingredient_provider.dart';
import 'package:mobile/src/modules/user_choice/controller/user_choice_provider.dart';
import 'package:provider/provider.dart';

import 'modules/choice_your_ingredients/controller/choice_your_ingredients_provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: () => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => getIt<IngredientProvider>(),
            lazy: false,
          ),
          ChangeNotifierProvider(
            create: (_) => getIt<UserChoiceProvider>(),
            lazy: true,
          ),
          ChangeNotifierProvider(
            create: (_) => getIt<ChoiceYourIngredientsProvider>(),
            lazy: true,
          ),
          ChangeNotifierProvider(
            create: (_) => getIt<SignInProvider>(),
          )
        ],
        child: MaterialApp(
          builder: (context, widget) {
            ScreenUtil.setContext(context);
            return MediaQuery(
              child: widget!,
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            );
          },
          useInheritedMediaQuery: true,
          title: "Smart Food",
          debugShowCheckedModeBanner: false,
          routes: RouteManager.listRoute,
          initialRoute: RouteManager.signIn,
          theme: ThemeData(
            brightness: Brightness.light,
            fontFamily: 'Nunito',
          ),
        ),
      ),
    );
  }
}
