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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Danh sách nguyên liệu của bạn",
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 18
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
                  "https://url.dscdut.com/Gyhh",
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
              child: const Text(
                "Tiếp tục",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.pink,
                fixedSize: const Size(100, 30),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {

              },
              child: const Text(
                "Chỉnh sửa",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.pink,
                fixedSize: const Size(100, 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
