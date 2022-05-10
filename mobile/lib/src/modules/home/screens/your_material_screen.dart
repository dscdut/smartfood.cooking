import 'package:flutter/material.dart';
import 'package:mobile/src/core/config/router.dart';

class YourMaterialScreen extends StatelessWidget {
  const YourMaterialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
          left: 20,
          top: MediaQuery.of(context).padding.top + 40,
          right: 20,
        ),
        child: Column(
          children: [
            const Text(
              'Danh sách nguyên liệu của bạn',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 40,
                crossAxisSpacing: 40,
              ),
              itemBuilder: (context, index) {
                return Image.network(
                  'https://media.self.com/photos/5f189b76c58e27c99fbef9e3/1:1/w_768,c_limit/blackberry-vanilla-french-toast.jpg',
                  key: ValueKey(index),
                );
              },
              itemCount: 9,
            ),
            const SizedBox(
              height: 18,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteManager.notFound);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.pink,
                fixedSize: const Size(100, 30),
              ),
              child: const Text(
                'Tiếp tục',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RouteManager.chooseYourIngredient,
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.pink,
                fixedSize: const Size(100, 30),
              ),
              child: const Text(
                'Chỉnh sửa',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
