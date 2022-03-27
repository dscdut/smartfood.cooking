import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/src/core/constant/image_path.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/data/model/ingredient.dart';
import 'package:mobile/src/modules/home/controller/choice_your_ingredients_provider.dart';
import 'package:mobile/src/modules/home/controller/recipe_provider.dart';
import 'package:mobile/src/modules/home/widgets/ingredient_card.dart';
import 'package:mobile/src/widgets/custom_back_button.dart';
import 'package:provider/provider.dart';

class SelectedIngredientScreen extends StatelessWidget {
  const SelectedIngredientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 20.0.h,
        ),
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
                    "Nguyên liệu đã chọn",
                    style: CustomTextTheme.headline2
                        .copyWith(color: Palette.pink500, fontSize: 26.sp),
                  ),
                  const CustomBackButton(
                    isHide: true,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer<ChoiceYourIngredientsProvider>(
                  builder: (context, provider, child) {
                if (provider.selectedData.entries
                    .where((entry) => entry.value == true)
                    .isNotEmpty) {
                  final listSelectedIngredient = provider.selectedData.entries
                      .where((entry) => entry.value == true)
                      .toList();
                  return GridView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 16.h,
                    ),
                    itemCount: listSelectedIngredient.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8.h,
                      crossAxisSpacing: 8.w,
                    ),
                    itemBuilder: (context, index) {
                      log(listSelectedIngredient[index].key.toString());
                      final Ingredient data = provider.ingredientData
                          .firstWhere((element) =>
                              element.id == listSelectedIngredient[index].key);
                      return IngredientCard(
                        imageUrl: data.url!,
                        materialName: data.name!,
                        onDeleteAction: () => provider
                            .onDeleteAction(listSelectedIngredient[index].key),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(ImagePath.logoFridge),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 20, 32, 32),
                          child: Text(
                            "Bạn chưa chọn nguyên liệu có trong tủ lạnh "
                            "của bạn. Quay lại để chọn nguyên liệu nào!",
                            textAlign: TextAlign.center,
                            style: CustomTextTheme.subtitle1.copyWith(
                              color: Palette.gray500,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          style: TextButton.styleFrom(
                            fixedSize: Size(160.w, 45.h),
                            backgroundColor: Palette.orange500,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            "Quay lại",
                            style: CustomTextTheme.headline4.copyWith(
                              color: Palette.backgroundColor,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }),
            ),
            context
                    .watch<ChoiceYourIngredientsProvider>()
                    .selectedData
                    .entries
                    .where((entry) => entry.value == true)
                    .isNotEmpty
                ? Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0.w,
                      vertical: 16.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => context
                              .read<ChoiceYourIngredientsProvider>()
                              .onDeleteAllAction(),
                          style: TextButton.styleFrom(
                            fixedSize: Size(150.w, 45.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(
                                color: Palette.orange500,
                              ),
                            ),
                          ),
                          child: Consumer<ChoiceYourIngredientsProvider>(
                              builder: (_, provider, __) {
                            return Text(
                              "Xóa tất cả ${provider.countSelectedMaterial() == "0" ? "" : "(${provider.countSelectedMaterial()})"}",
                              style: CustomTextTheme.headline4.copyWith(
                                color: Palette.gray500,
                                fontSize: 18.sp,
                              ),
                            );
                          }),
                        ),
                        Consumer<ChoiceYourIngredientsProvider>(
                            builder: (context, provider, child) {
                          return TextButton(
                            onPressed: () {
                              if (provider.selectedData.values
                                  .where((element) => element == true)
                                  .toList()
                                  .isNotEmpty) {
                                context.read<RecipeProvider>().findRecipe(
                                      context,
                                      data: provider.selectedData,
                                      isInSelectedScreen: true,
                                    );
                              }
                            },
                            style: TextButton.styleFrom(
                              fixedSize: Size(115.w, 45.h),
                              backgroundColor: Palette.orange500,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              "Tiếp tục",
                              style: CustomTextTheme.headline4.copyWith(
                                color: Palette.backgroundColor,
                                fontSize: 18.sp,
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
