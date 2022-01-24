import 'package:flutter/material.dart';
import 'package:mobile/src/features/home/select_recipe.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("HomeScreen"),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SelectRecipe();
              }));
            },
            child: Container(
              color: Colors.green,
              child: Text('Next'),
            ),
          )
        ],
      )),
    );
  }
}
