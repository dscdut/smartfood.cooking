import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/data/repositories/ingredient_repository.dart';
import 'package:mobile/src/modules/home/screens/test_screen.dart';
import 'package:mobile/src/modules/home/widgets/material_card.dart';
import 'package:mobile/src/widgets/custom_back_button.dart';
import 'package:mobile/src/widgets/no_show_limit_scroll.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

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
      "imageUrl": "https://vinmec-prod.s3.amazonaws.com/images"
          "/20200719_014811_613311_8-loi-ich-suc-khoe-.max-1800x1800.jpg"
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
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 20.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomBackButton(
                        onPressedFunction: () => Navigator.pop(context),
                      ),
                      Text(
                        "Chọn nguyên liệu",
                        style: CustomTextTheme.headline2
                            .copyWith(color: Palette.pink500, fontSize: 26.sp),
                      ),
                      IconButton(
                        splashRadius: 28.r,
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.only(right: 5.w),
                        icon: Badge(
                          badgeColor: Palette.pink500,
                          badgeContent: Text(
                            selectedMaterialList
                                .where((element) => element == true)
                                .toList()
                                .length
                                .toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          animationType: BadgeAnimationType.scale,
                          position: BadgePosition.topEnd(
                            top: -10.h,
                            end: -10.h,
                          ),
                          child: Icon(
                            Icons.kitchen_rounded,
                            size: 32.sp,
                            color: Palette.pink500,
                          ),
                        ),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TestScreen())),
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
                          borderRadius: BorderRadius.circular(20.r),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Palette.shadowColor.withOpacity(0.1),
                              blurRadius: 12,
                              offset: const Offset(0, 3),
                            )
                          ],
                        ),
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            isCollapsed: true,
                            contentPadding: EdgeInsets.only(left: 14.w),
                            border: InputBorder.none,
                            hintText: "Tủ lạnh bạn hôm nay có gì!",
                            hintStyle: CustomTextTheme.headline4
                                .copyWith(color: Palette.gray300),
                            suffixIcon: const Icon(
                              PhosphorIcons.magnifyingGlassBold,
                              color: Palette.gray300,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        splashRadius: 28.r,
                        icon: const Icon(PhosphorIcons.scan),
                        color: Palette.orange500,
                        iconSize: 36.sp,
                        onPressed: () {},
                      ),
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
                        labelStyle: CustomTextTheme.subtitle1.copyWith(
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
                        elevation: 2,
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
                  child: ScrollConfiguration(
                    behavior: NoShowLimitScroll(),
                    child: GridView.builder(
                      itemCount: materialData.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (context, index) {
                        return MaterialCard(
                          imageUrl: materialData[index]["imageUrl"]!,
                          materialName: materialData[index]["name"]!,
                          isSelected: selectedMaterialList[index],
                          onMaterialTap: () => setState(
                            () {
                              selectedMaterialList[index] =
                                  !selectedMaterialList[index];
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // if (selectedMaterialList
                    //     .where((element) => element == true)
                    //     .toList()
                    //     .isNotEmpty) {
                    //   Navigator.pushNamed(
                    //     context,
                    //     RouteManager.notFound,
                    //   );
                    // }
                  },
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 18.h,
                        bottom: 24.h,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: !selectedMaterialList
                                .where((element) => element == true)
                                .toList()
                                .isNotEmpty
                            ? Palette.orange300
                            : Palette.orange500,
                      ),
                      child: Text(
                        "Tiếp tục ${selectedMaterialList.where((element) => element == true).toList().isEmpty ? "" : (selectedMaterialList.where((element) => element == true).toList().length)}",
                        style: CustomTextTheme.headline4.copyWith(
                          color: Palette.backgroundColor,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
