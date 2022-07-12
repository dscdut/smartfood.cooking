import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/src/app.dart';
import 'package:mobile/src/di/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(fileName: 'assets/.env');
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  initDependences();
  runApp(const App());
}
