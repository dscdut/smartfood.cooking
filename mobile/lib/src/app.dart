import 'package:flutter/material.dart';
import 'package:mobile/src/core/config/router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Smart Food",
      debugShowCheckedModeBanner: false,
      routes: RouteManager.listRoute,
      initialRoute: RouteManager.mainScreen,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
