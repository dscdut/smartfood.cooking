import 'package:flutter/material.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/features/home/screens/cook_recipe.dart';

class SelectRecipe extends StatelessWidget {
  const SelectRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 3 / 4,
            width: MediaQuery.of(context).size.width,
            child: ScrollConfiguration(
              behavior: CustomScroll(),
              child: ListView(
                children: suggest.map(listRecipe).toList(),
              ),
            )),
        SizedBox(
          height: 100,
          width: 100,
          child: Center(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                Navigator.pushNamed(context, RouteManager.cookRecipe);
              },
              child: const Text(
                'Tiếp tục',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    ));
  }

  Widget listRecipe(Recipe val) {
    bool hasSelect = false;
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              hasSelect = true;
              print('tapped');
            },
            onDoubleTap: () {},
            child: hasSelect
                ? Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.green),
                    ),
                    child: Image.network(val.imageURL),
                  )
                : Image.network(val.imageURL),
          ),
          Padding(
              padding: EdgeInsets.only(top: 10),
              child: GestureDetector(
                onTap: () {
                  hasSelect = true;
                },
                child: Text(
                  val.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ))
        ],
      ),
    );
  }
}

Recipe recipe1 = Recipe();
Recipe recipe2 = Recipe();
Recipe recipe3 = Recipe();
Recipe recipe4 = Recipe();
Recipe recipe5 = Recipe();
List<Recipe> suggest = [recipe1, recipe2, recipe3, recipe4, recipe5];

class Recipe {
  String name = '';
  String imageURL = '';
  Recipe() {
    name = 'Food';
    imageURL =
        'https://pizzapalaceburwell.com/wp-content/uploads/2021/11/Food.jpg';
  }
}
