import 'package:flutter/material.dart';
import 'package:mobile/src/core/config/router.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 250,
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
            padding: const EdgeInsets.all(30),
            child: const Center(
              child: Text(
                "Rất tiếc! Hệ thống không tìm được món ăn với nguyên liệu ban cung cấp",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteManager.chooseYourMaterial,
                ModalRoute.withName(RouteManager.mainScreen),
              );
            },
            child: const Text(
              "Chỉnh sửa danh sách",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.pink,
              fixedSize: Size(180, 30),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Công thức tương tự",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.pink,
              fixedSize: Size(180, 30),
            ),
          ),
        ],
      ),
    );
  }
}
