import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final menuData = [
    {
      "name": "Bánh canh",
      "time": "20",
      "level": "Dễ",
      "imageUrl": "https://traicaycaonghe.vn/"
          "wp-content/uploads/2021/07/banh-canh-tuoi-bot-loc-hue-ngon.jpg",
      "isFavorite": false,
    },
    {
      "name": "Phở gà",
      "time": "30",
      "level": "Dễ",
      "imageUrl": "https://img-global.cpcdn.com/recipes/"
          "b711dcb7a259c93c/400x400cq70/photo.jpg",
      "isFavorite": false,
    },
    {
      "name": "Mì tôm",
      "time": "10",
      "level": "Dễ",
      "imageUrl": "https://photo-cms-kienthuc.zadn.vn/"
          "zoom/800/uploaded/hongnhat/2021_01_10/smj-1_MNJT.jpg",
      "isFavorite": true,
    },
    {
      "name": "Cơm tấm",
      "time": "30",
      "level": "Vừa",
      "imageUrl": "https://statics.vinpearl.com/"
          "com-tam-ngon-o-sai-gon-0_1630562640.jpg",
      "isFavorite": true,
    },
    {
      "name": "Mì quảng tôm thịt trứng",
      "time": "30",
      "level": "Vừa",
      "imageUrl": "https://cdn.cet.edu.vn/"
          "wp-content/uploads/2021/04/to-mi-quang.jpg",
      "isFavorite": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 22.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Xin chào, A",
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: Palette.pink500),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.indigo,
                      child: Text(
                        "A",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 9.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0.w),
                child: Text(
                  "Hôm nay bạn muốn nấu món gì?",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Palette.gray400),
                ),
              ),
              SizedBox(
                height: 9.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0.w),
                child: Text(
                  "Công thức hôm nay",
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: Palette.pink500),
                ),
              ),
              SizedBox(height: 15.h),
              SizedBox(
                height: 160.h,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 14.0.w),
                  itemCount: menuData.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          height: 150.w,
                          width: 150.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: Image.network(
                                menuData[index]["imageUrl"]! as String,
                              ).image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 140.w,
                          width: 140.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff0B0B0B).withOpacity(0.6),
                                Color(0xffC4C4C4).withOpacity(0),
                              ],
                              stops: const [0, 0.3],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            child: IconButton(
                              splashRadius: 20,
                              constraints: BoxConstraints(),
                              icon: Icon(PhosphorIcons.heartFill),
                              color: menuData[index]["isFavorite"] as bool
                                  ? Palette.pink500
                                  : Palette.backgroundColor,
                              onPressed: () {
                                setState(() {
                                  menuData[index]["isFavorite"] =
                                      !(menuData[index]["isFavorite"] as bool);
                                });
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5.h,
                          left: 10.w,
                          right: 10.w,
                          child: Container(
                            padding: EdgeInsets.all(6),
                            height: 65.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                              color: Palette.backgroundColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(children: [
                              Spacer(),
                              Text(
                                menuData[index]["name"]! as String,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: Palette.gray500,
                                    ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Spacer(flex: 2),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          PhosphorIcons.clock,
                                          color: Palette.gray400,
                                          size: 16,
                                        ),
                                        SizedBox(width: 2.w),
                                        Text(
                                          "${menuData[index]["time"]} phút",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(
                                                color: Palette.gray400,
                                                fontSize: 12.sp,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          PhosphorIcons.cookingPot,
                                          color: Palette.gray400,
                                          size: 18,
                                        ),
                                        SizedBox(width: 2.w),
                                        Text(
                                          menuData[index]["level"]! as String,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(
                                                color: Palette.gray400,
                                                fontSize: 12.sp,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 25.w);
                  },
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, RouteManager.chooseYourMaterial),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.center,
                    width: 250,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Palette.orange500,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Tủ lạnh bạn hôm nay có gì?",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
