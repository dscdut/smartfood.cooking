import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/config/router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      builder: () => MaterialApp(
        builder: (context, widget) {
          ScreenUtil.setContext(context);
          return MediaQuery(
            child: widget!,
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          );
        },
        title: "Smart Food",
        debugShowCheckedModeBanner: false,
        routes: RouteManager.listRoute,
        initialRoute: RouteManager.mainScreen,
        theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: 'Nunito',
          textTheme: TextTheme(
            headline1: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 32,
              letterSpacing: 0.1,
              height: 36 / 32,
            ),
            headline2: TextStyle(
              fontSize: 24,
              height: 28 / 24,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.1,
            ),
            headline3: TextStyle(
              fontSize: 20,
              height: 24 / 20,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.4,
            ),
            headline4: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 20 / 16,
              letterSpacing: 0.4,
            ),
            headline5: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.4,
              height: 30 / 16,
            ),
            subtitle1: TextStyle(
              fontSize: 14,
              height: 16 / 14,
              letterSpacing: 0.175,
              fontWeight: FontWeight.w800,
            ),
            bodyText1: TextStyle(
              fontSize: 12,
              height: 14 / 12,
              letterSpacing: 0.15,
              fontWeight: FontWeight.w800,
            ),
            bodyText2: TextStyle(
              fontSize: 8,
              height: 10 / 8,
              letterSpacing: 0.15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
