import 'package:flutter/material.dart';
import 'package:mobile/src/core/config/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RouteManager.yourMaterial);
          },
          child: Text("HomeScreen")
        ),
      ),
    );
  }
}
