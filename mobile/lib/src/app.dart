import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/data/datasources/test.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: () => MultiProvider(
        providers: [
          Provider(
            create: (context) => ApiTest(
              FirebaseAuth.instance,
              GoogleSignIn(),
              Client(),
            ),
          )
        ],
        child: MaterialApp(
          builder: (context, widget) {
            DevicePreview.appBuilder;
            ScreenUtil.setContext(context);
            return MediaQuery(
              child: widget!,
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            );
          },
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
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
