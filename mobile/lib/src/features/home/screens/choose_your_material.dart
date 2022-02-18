import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/core/theme/palette.dart';

class ChooseYourMaterial extends StatefulWidget {
  const ChooseYourMaterial({Key? key}) : super(key: key);

  @override
  State<ChooseYourMaterial> createState() => _ChooseYourMaterialState();
}

class _ChooseYourMaterialState extends State<ChooseYourMaterial> {
  final typeMaterialList = [
    "Tất cả",
    "Rau củ",
    "Thịt",
    "Cá",
    "Hoa quả",
    "Hải sản",
    "Gia vị"
  ];
  var selectedTypeList = <bool>[];
  var selectedMaterialList = <bool>[];

  final materialData = [
    {
      "name": "Thịt gà",
      "imageUrl": "https://bloganchoi.com/wp-c"
          "ontent/uploads/2018/02/thit-ga.jpg"
    },
    {
      "name": "Thịt bò",
      "imageUrl": "https://photo-cms-kienthuc.zadn.vn/zoom/800/Upl"
          "oaded/hongngan/2020_03_11/a/1_JJRA.jpg"
    },
    {
      "name": "Thịt heo",
      "imageUrl":
          "https://cafefcdn.com/thumb_w/650/203337114487263232/2021/9/28/photo1632"
              "798710845-1632798710943181451693.png"
    },
    {
      "name": "Cà rốt",
      "imageUrl":
          "https://cdn.tgdd.vn/2021/09/CookDish/cach-chon-mua-va-cach-bao-quan-ca-rot"
              "-tuoi-lau-mot-cach-hieu-avt-1200x676-2.jpg"
    },
    {
      "name": "Khoai tây",
      "imageUrl": "https://cdn.tgdd.vn/2021/08/"
          "CookProduct/2-1200x676-4.jpg"
    },
    {
      "name": "Ớt chuông",
      "imageUrl": "https://vinmec-prod.s3.amazonaws.com/images/"
          "20210604_012841_203821_qua-ot-chuong-2.max-1800x1800.jpg"
    },
    {
      "name": "Tôm càng xanh",
      "imageUrl": "https://file.hstatic.net/1000030244/file/"
          "z3091440817595_480c13063b6626426c1483155f8f3841__5___1__b8e3b50ecfa941acb30cc2b498fb6f9e_grande.png"
    },
    {
      "name": "Mực nang",
      "imageUrl": "https://ptaseafood.com/wp-content/"
          "uploads/2021/01/DSC02175-copy-1.jpg"
    },
    {
      "name": "Cá ngừ vây xanh",
      "imageUrl": "https://encrypted-tbn0.gstatic.com/"
          "images?q=tbn:ANd9GcRSBedXOAkdKzmw5vOQ8uwtnY_COJ-q0ItRDQ&usqp=CAU"
    },
    {
      "name": "Cá cam Nhật Bản",
      "imageUrl": "https://bizweb.dktcdn.net/100/274/539/"
          "products/304cartimage01.jpg?v=1511770953700"
    },
    {
      "name": "Cà chua",
      "imageUrl": "http://icdn.dantri.com.vn/"
          "zoom/1200_630/2019/05/18/ca-chua-1558139604071.jpg"
    },
    {
      "name": "Mì Ý",
      "imageUrl": "https://hangngoainhap.net.vn/"
          "upload/images/Linguine-Pasta.jpg"
    },
    {
      "name": "Bún",
      "imageUrl": "https://viorice.com/wp-content/"
          "uploads/2019/04/dai-ly-cung-cap-gao-lam-bun-ngon-chat-luong-gia-re.jpg"
    },
    {
      "name": "Hành lá",
      "imageUrl": "https://zicxa.com/vi/"
          "uploads/news/hanh-la-ky-gi-(1).jpg"
    },
    {
      "name": "Bánh đa phở",
      "imageUrl": "https://cf.shopee.vn/"
          "file/889bb56c8dafe256a5116443f2f69f88"
    },
  ];

  @override
  void initState() {
    selectedTypeList =
        List<bool>.filled(typeMaterialList.length, false, growable: false)
          ..first = true;
    selectedMaterialList =
        List<bool>.filled(materialData.length, false, growable: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 20.0.h),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            borderRadius: BorderRadius.circular(20),
                            elevation: 3,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                splashRadius: 24,
                                icon: Icon(Icons.chevron_left_rounded),
                                iconSize: 28,
                                color: Palette.pink500,
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                          ),
                          Text(
                            "Chọn nguyên liệu",
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(color: Palette.pink500),
                          ),
                          IconButton(
                            splashRadius: 28,
                            constraints: BoxConstraints(),
                            padding: EdgeInsets.only(right: 5.w),
                            icon: Badge(
                              badgeColor: Palette.pink500,
                              badgeContent: Text(
                                "3",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              position: BadgePosition.topEnd(
                                top: -10,
                                end: -10,
                              ),
                              child: Icon(
                                Icons.kitchen_rounded,
                                size: 30,
                                color: Palette.pink500,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 17.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                      child: Row(
                        children: [
                          Container(
                            height: 40.h,
                            width: 280.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff063336).withOpacity(0.1),
                                  blurRadius: 6,
                                  offset: Offset(3, 3),
                                )
                              ],
                            ),
                            child: TextField(
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                isCollapsed: true,
                                contentPadding: EdgeInsets.only(left: 14),
                                border: InputBorder.none,
                                hintText: "Tủ lạnh bạn hôm nay có gì!",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: Palette.gray300),
                                suffixIcon: Icon(Icons.search),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 36.w,
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            splashRadius: 28,
                            icon:
                                SvgPicture.asset("assets/icons/scan_icon.svg"),
                            iconSize: 28,
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 50.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        itemCount: typeMaterialList.length,
                        itemBuilder: (context, index) {
                          return ChoiceChip(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            label: Text(typeMaterialList[index]),
                            labelStyle: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                    color: selectedTypeList[index]
                                        ? Colors.white
                                        : Palette.gray500),
                            selected: selectedTypeList[index],
                            onSelected: (value) => setState(() {
                              if (index == 0 && !selectedTypeList[index]) {
                                selectedTypeList = List<bool>.filled(
                                    typeMaterialList.length, false,
                                    growable: false)
                                  ..first = true;
                              } else if (index != 0) {
                                selectedTypeList[index] = value;
                                selectedTypeList[0] = false;
                              }
                            }),
                            selectedColor: Palette.pink500,
                            backgroundColor: Palette.backgroundColor,
                            elevation: 3,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 12.w);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Expanded(
                      child: GridView.builder(
                        itemCount: materialData.length,
                        padding: EdgeInsets.only(
                          left: 16.0.w,
                          right: 16.0.w,
                          top: 10.h,
                          bottom: 30.h,
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 21.w,
                          crossAxisSpacing: 21.h,
                        ),
                        itemBuilder: (context, index) {
                          return Material(
                            elevation: 3,
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                setState(() {
                                  selectedMaterialList[index] =
                                      !selectedMaterialList[index];
                                });
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                height: 100.h,
                                width: 100.h,
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: selectedMaterialList[index]
                                      ? Palette.pink300
                                      : Palette.backgroundColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 56.h,
                                      width: 88.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: Image.network(
                                            materialData[index]["imageUrl"]!,
                                          ).image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    AnimatedDefaultTextStyle(
                                      duration: Duration(milliseconds: 200),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            color: selectedMaterialList[index]
                                                ? Palette.backgroundColor
                                                : Palette.gray500,
                                          ),
                                      child: Text(materialData[index]["name"]!),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100.h,
                  width: double.infinity,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 0.7,
                        sigmaY: 0.7,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            color: Colors.white.withOpacity(0),
                          ),
                          Container(
                            height: 40,
                            width: 130,
                            decoration: BoxDecoration(
                              color: Palette.orange500,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(RouteManager.notFound);
                                },
                                child: Text(
                                  'Tiếp tục',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(color: Palette.backgroundColor),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Palette.pink500,
          unselectedItemColor: Colors.black,
          currentIndex: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 30,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_rounded),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline_rounded),
              activeIcon: Icon(Icons.add_circle_rounded),
              label: "Add",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_rounded),
              activeIcon: Icon(Icons.favorite_rounded),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              activeIcon: Icon(Icons.account_circle_rounded),
              label: "User",
            )
          ],
        ),
      ),
    );
  }
}
