import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/modules/home/widgets/ingredient_card.dart';
import 'package:mobile/src/widgets/custom_back_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AllergicFoodChoice extends StatefulWidget {
  const AllergicFoodChoice({Key? key}) : super(key: key);

  @override
  State<AllergicFoodChoice> createState() => _AllergicFoodChoiceState();
}

class _AllergicFoodChoiceState extends State<AllergicFoodChoice> {
  late final ScrollController _scrollController;

  var selectedTypeList = <bool>[];
  final List<String> typeMaterialList = <String>[
    "Tất cả",
    "Thịt",
    "Thủy sản",
    "Rau củ quả",
    "Trứng",
    "Sữa",
    "Gia vị",
    "Hạt",
    "Thực phẩm chế biến",
    "Gạo, bột, đồ khô",
    "Nước",
    "Nội tạng",
    "Khác",
  ];

  final List<Map<String, dynamic>> listData = [
    {"name": "Thịt gà", "imageUrl": "", "category": 1, "isSelected": false},
    {"name": "Cá lóc", "imageUrl": "", "category": 2, "isSelected": false},
    {"name": "Rau cần tây", "imageUrl": "", "category": 3, "isSelected": false},
    {"name": "Rau lang", "imageUrl": "", "category": 3, "isSelected": false},
    {"name": "Thịt heo", "imageUrl": "", "category": 1, "isSelected": false},
    {"name": "Sườn non", "imageUrl": "", "category": 1, "isSelected": false},
    {"name": "Ba chỉ", "imageUrl": "", "category": 1, "isSelected": false},
    {"name": "Cá rô phi", "imageUrl": "", "category": 2, "isSelected": false},
    {"name": "Bắp cải", "imageUrl": "", "category": 3, "isSelected": false},
    {"name": "Cá rô đồng", "imageUrl": "", "category": 2, "isSelected": false},
    {"name": "Cá trê", "imageUrl": "", "category": 2, "isSelected": false},
    {"name": "Thịt bò", "imageUrl": "", "category": 1, "isSelected": false},
  ];

  @override
  void initState() {
    selectedTypeList = List<bool>.filled(13, false, growable: true)
      ..first = true;
    _scrollController = ScrollController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20.h),
        child: Column(
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
                    "Nguyên liệu dị ứng",
                    style: CustomTextTheme.headline2.copyWith(
                      color: Palette.pink500,
                      fontSize: 26.sp,
                    ),
                  ),
                  SizedBox.square(
                    dimension: 24.w,
                  ),
                ],
              ),
            ),
            Container(
              height: 40.h,
              margin: EdgeInsets.symmetric(
                horizontal: 16.0.w,
                vertical: 22.0.h,
              ),
              width: 1.sw,
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
                  hintText: "Nguyên liệu bạn bị dị ứng?",
                  hintStyle: CustomTextTheme.headline4.copyWith(
                    color: Palette.gray300,
                    fontSize: 18.sp,
                  ),
                  suffixIcon: const Icon(
                    PhosphorIcons.magnifyingGlassBold,
                    color: Palette.gray300,
                  ),
                ),
              ),
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
                    onSelected: (value) {
                      setState(() {
                        if (index == 0 && selectedTypeList[index] == false) {
                          selectedTypeList =
                              List<bool>.filled(13, false, growable: false)
                                ..first = true;
                        } else if (index != 0) {
                          selectedTypeList[index] = value;
                          selectedTypeList[0] = false;
                        }
                        if (selectedTypeList.every(
                          (element) => element == false,
                        )) {
                          selectedTypeList =
                              List<bool>.filled(13, false, growable: false)
                                ..first = true;
                        }
                      });
                    },
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
              height: 8.h,
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.zero,
                controller: _scrollController,
                itemCount: listData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return IngredientCard(
                      imageUrl: listData[index]["imageUrl"] as String,
                      materialName: listData[index]["name"] as String,
                      isSelected: listData[index]["isSelected"] as bool,
                      onMaterialTap: () {
                        setState(() {
                          listData[index]["isSelected"] =
                              !(listData[index]["isSelected"] as bool);
                        });
                      });
                },
              ),
            ),
            Center(
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
                  color: Palette.orange500,
                ),
                child: Text(
                  "Xác nhận",
                  style: CustomTextTheme.headline4.copyWith(
                    color: Palette.backgroundColor,
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
