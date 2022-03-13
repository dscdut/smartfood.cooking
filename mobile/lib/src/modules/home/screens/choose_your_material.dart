import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/modules/home/screens/test_screen.dart';
import 'package:mobile/src/modules/home/widgets/material_card.dart';
import 'package:mobile/src/modules/choice_your_ingredients/controller/choice_your_ingredients_provider.dart';
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
  @override
  Widget build(BuildContext context) {
    final choiceYourIngredientsProvider =
        context.read<ChoiceYourIngredientsProvider>();

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
                            choiceYourIngredientsProvider
                                .countSelectedMaterial(),
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
                    itemCount:
                        choiceYourIngredientsProvider.typeMaterialList.length,
                    itemBuilder: (context, index) {
                      return Consumer<ChoiceYourIngredientsProvider>(
                          builder: (_, provider, __) {
                        return ChoiceChip(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          label: Text(choiceYourIngredientsProvider
                              .typeMaterialList[index]),
                          labelStyle: CustomTextTheme.subtitle1.copyWith(
                              color: choiceYourIngredientsProvider
                                      .selectedTypeList[index]
                                  ? Colors.white
                                  : Palette.gray500),
                          selected: choiceYourIngredientsProvider
                              .selectedTypeList[index],
                          onSelected: (value) => choiceYourIngredientsProvider
                              .onSelected(value, index),
                          selectedColor: Palette.pink500,
                          backgroundColor: Palette.backgroundColor,
                          elevation: 2,
                        );
                      });
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
                      itemCount:
                          choiceYourIngredientsProvider.materialData.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (context, index) {
                        return Consumer<ChoiceYourIngredientsProvider>(
                          builder: (_, provider, __) {
                            return MaterialCard(
                              imageUrl: choiceYourIngredientsProvider
                                  .materialData[index]["imageUrl"]!,
                              materialName: choiceYourIngredientsProvider
                                  .materialData[index]["name"]!,
                              isSelected: choiceYourIngredientsProvider
                                  .selectedMaterialList[index],
                              onMaterialTap: () => choiceYourIngredientsProvider
                                  .onTapIngredientsCard(index),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (choiceYourIngredientsProvider.selectedMaterialList
                        .where((element) => element == true)
                        .toList()
                        .isNotEmpty) {
                      Navigator.pushNamed(
                        context,
                        RouteManager.notFound,
                      );
                    }
                  },
                  child: Center(
                    child: Consumer<ChoiceYourIngredientsProvider>(
                      builder: (_, provider, __) {
                        return Container(
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
                            color: !choiceYourIngredientsProvider
                                    .selectedMaterialList
                                    .where((element) => element == true)
                                    .toList()
                                    .isNotEmpty
                                ? Palette.orange300
                                : Palette.orange500,
                          ),
                          child: Text(
                            "Tiếp tục ${choiceYourIngredientsProvider.selectedMaterialList.where((element) => element == true).toList().isEmpty ? "" : (choiceYourIngredientsProvider.selectedMaterialList.where((element) => element == true).toList().length)}",
                            style: CustomTextTheme.headline4.copyWith(
                              color: Palette.backgroundColor,
                              fontSize: 18.sp,
                            ),
                          ),
                        );
                      },
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
