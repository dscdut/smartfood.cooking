import 'package:flutter/material.dart';

class CookRecipe extends StatelessWidget {
  const CookRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Image.network(
                        'https://vietucnews.net/wp-content/uploads/2017/10/food_photography_palm_beach_gardens_florida_parched_pig.jpg'),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 20),
                      child: Text(
                        'Món ăn 1',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow[700],
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow[700],
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow[700],
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.grey,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dinh dưỡng',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                width: 100,
                                height: 100,
                                color: Colors.green.shade300,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Đạm',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    const Text(
                                      '50g',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    const Divider(
                                      height: 5,
                                      color: Colors.transparent,
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 15),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: LinearProgressIndicator(
                                            minHeight: 7,
                                            backgroundColor: Colors.grey,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.green.shade700),
                                            value: 0.7,
                                          ),
                                        ))
                                  ],
                                ),
                              )),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Container(
                                width: 100,
                                height: 100,
                                color: Colors.green.shade300,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Protein',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    const Text(
                                      '80g',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    const Divider(
                                      height: 5,
                                      color: Colors.transparent,
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 15),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: LinearProgressIndicator(
                                            minHeight: 7,
                                            backgroundColor: Colors.grey,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.green.shade700),
                                            value: 0.7,
                                          ),
                                        ))
                                  ],
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                width: 100,
                                height: 100,
                                color: Colors.green.shade300,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Chất béo',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    const Text(
                                      '30g',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    const Divider(
                                      height: 5,
                                      color: Colors.transparent,
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 15),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: LinearProgressIndicator(
                                            minHeight: 7,
                                            backgroundColor: Colors.grey,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.green.shade700),
                                            value: 0.7,
                                          ),
                                        ))
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nguyên liệu',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: SizedBox(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        child: ScrollConfiguration(
                          behavior: CustomScroll(),
                          child: ListView(
                            padding: EdgeInsets.all(0),
                            children: [
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.people,
                                            size: 35,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 15),
                                            child: Text(
                                              'Human',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          Spacer(),
                                          Text('5'),
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.grey.shade400,
                                        height: 1,
                                        thickness: 2,
                                      )
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.nordic_walking,
                                            size: 35,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 15),
                                            child: Text(
                                              'Human',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          Spacer(),
                                          Text('5'),
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.grey.shade400,
                                        height: 1,
                                        thickness: 2,
                                      )
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.water,
                                            size: 35,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 15),
                                            child: Text(
                                              'Water',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          Spacer(),
                                          Text('5'),
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.grey.shade400,
                                        height: 1,
                                        thickness: 2,
                                      )
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.favorite_sharp,
                                            size: 35,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 15),
                                            child: Text(
                                              'Heart',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          Spacer(),
                                          Text('5'),
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.grey.shade400,
                                        height: 1,
                                        thickness: 2,
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Text('Độ khó',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[700],
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow[700],
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow[700],
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.grey,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.grey,
                        ),
                      ],
                    )
                  ],
                )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Center(
                  child: OutlinedButton(
                    style:
                        OutlinedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {},
                    child: Text(
                      'Bắt đầu',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class CustomScroll extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
