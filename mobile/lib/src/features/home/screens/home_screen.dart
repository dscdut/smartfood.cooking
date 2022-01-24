import 'package:flutter/material.dart';
import 'package:mobile/src/core/config/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
              "https://avatars.githubusercontent.com/u/63831488?v=4"),
        ),
        title: const Text("SmartFood"),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Align(
                  alignment: index % 2 == 0
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    height: size.height * 0.2,
                    width: size.width * 0.7,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image.network(
                                "https://www.hoidaubepaau.com/wp-content/uploads/2019/06/bao-ngu.jpg")
                            .image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(
            color: Colors.pink,
            thickness: 2,
            endIndent: 20,
            indent: 20,
          ),
          SizedBox(
            height: size.height * 0.12,
            child: Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(
                    context, RouteManager.chooseYourMaterial),
                child: const Text("Tủ lạnh nhà bạn nay có gì"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
