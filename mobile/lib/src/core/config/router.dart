import 'package:flutter/cupertino.dart';
import 'package:mobile/src/features/home/screens/not_found_screen.dart';
import 'package:mobile/src/features/home/screens/your_material_screen.dart';
import 'package:mobile/src/features/main_screen/main_screen.dart';

class RouteManager {
  static const String mainScreen = "/";
  static const String notFound = "/notFound";
  static const String yourMaterial = "/yourMaterial";

  static Map<String, WidgetBuilder> listRoute = {
    mainScreen : (_) => const MainScreen(),
    notFound : (_) => const NotFoundScreen(),
    yourMaterial : (_) => const YourMaterialScreen(),
  };
}