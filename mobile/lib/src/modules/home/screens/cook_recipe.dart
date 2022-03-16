import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/data/model/recipe/recipe.dart';
import 'package:mobile/src/modules/home/controller/recipe_provider.dart';
import 'package:mobile/src/modules/home/widgets/nutrition_card.dart';
import 'package:mobile/src/widgets/custom_back_button.dart';
import 'package:mobile/src/widgets/loading_circle.dart';
import 'package:mobile/src/widgets/no_show_limit_scroll.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class CookRecipe extends StatefulWidget {
  const CookRecipe({Key? key}) : super(key: key);

  @override
  State<CookRecipe> createState() => _CookRecipeState();
}

class _CookRecipeState extends State<CookRecipe> {
  @override
  Widget build(BuildContext context) {
    var recipe = ModalRoute.of(context)!.settings.arguments as Recipe;

    return Scaffold(
      body: Consumer<RecipeProvider>(builder: (context, provider, child) {
        final status = provider.loadingData;
        if (status == DataLoadingStatus.loading) {
          return const LoadingCircle();
        }
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
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
                        recipe.name!,
                        style: CustomTextTheme.headline2.copyWith(
                          color: Palette.pink500,
                          fontSize: 26.sp,
                        ),
                      ),
                      SizedBox(width: 22.w),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 10.h,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 8,
                                    color: Palette.shadowColor.withOpacity(0.1),
                                    offset: const Offset(0, 3),
                                  )
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.r),
                                child: Image.network(
                                  "https://pbs.twimg.com/profile_images/683842208500285440/-kb4Pf8k_400x400.jpg",
                                  fit: BoxFit.fitWidth,
                                  width: 343.w,
                                  height: 200.w,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 343.w,
                              height: 200.w,
                              child: Column(
                                children: [
                                  Container(
                                    width: 343.w,
                                    height: 39.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20.r),
                                      ),
                                      gradient: const LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.transparent,
                                          Colors.black54,
                                        ],
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: 0.h,
                                            left: 8.w,
                                          ),
                                          child: IconButton(
                                            splashRadius: 24,
                                            padding: EdgeInsets.zero,
                                            onPressed: () {},
                                            icon: const Icon(
                                              PhosphorIcons.heartFill,
                                            ),
                                            color: Palette.orange500,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    width: 343.w,
                                    height: 39.w,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(20),
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.black54,
                                          Colors.transparent,
                                        ],
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 21.5.w,
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            PhosphorIcons.clockBold,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            ' ' + recipe.level!,
                                            style: CustomTextTheme.bodyText1
                                                .copyWith(
                                                    fontSize: 14.sp,
                                                    color: Palette
                                                        .backgroundColor),
                                          ),
                                          const Spacer(),
                                          const Text(
                                            '|',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const Spacer(),
                                          const Icon(
                                            PhosphorIcons.cookingPotBold,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            ' ' + recipe.level!,
                                            style: CustomTextTheme.bodyText1
                                                .copyWith(
                                              fontSize: 14.sp,
                                              color: Palette.backgroundColor,
                                            ),
                                          ),
                                          const Spacer(),
                                          const Spacer(),
                                          const Spacer(),
                                          const Icon(
                                            PhosphorIcons.starFill,
                                            color: Palette.yellowStar,
                                            size: 22,
                                          ),
                                          SizedBox(width: 2.w),
                                          Text(
                                            recipe.level.toString(),
                                            style: CustomTextTheme.bodyText1
                                                .copyWith(
                                              fontSize: 14.sp,
                                              color: Palette.backgroundColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        child: Row(
                          children: [
                            Text(
                              'Dinh dưỡng',
                              style: CustomTextTheme.headline3.copyWith(
                                color: Palette.gray500,
                                fontSize: 21.sp,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              'Xem tất cả',
                              style: CustomTextTheme.bodyText1.copyWith(
                                color: Palette.pink300,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            NutritionCard(
                                nameNutrition: 'Đạm', valueNutrition: '50g'),
                            NutritionCard(
                              nameNutrition: "Chất béo",
                              valueNutrition: '50g',
                            ),
                            NutritionCard(
                              nameNutrition: "Protein",
                              valueNutrition: '50g',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        child: Text(
                          'Nguyên liệu ',
                          style: CustomTextTheme.headline3.copyWith(
                            color: Palette.gray500,
                            fontSize: 21.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        height: 180.h,
                        child: ScrollConfiguration(
                          behavior: NoShowLimitScroll(),
                          child: ListView(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              children: [
                                Container(
                                  height: 300,
                                  color: Colors.red,
                                )
                              ]),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Container(
                        height: 45.h,
                        margin: EdgeInsets.symmetric(horizontal: 80.w),
                        decoration: BoxDecoration(
                          color: Palette.orange500,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                PhosphorIcons.cookingPotBold,
                                color: Palette.backgroundColor,
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(context)
                                    .pushNamed(RouteManager.stepsToCooking),
                                child: Row(
                                  children: [
                                    Text(
                                      'Bắt đầu nấu ăn!',
                                      style: CustomTextTheme.headline4.copyWith(
                                        color: Palette.backgroundColor,
                                        fontSize: 18.sp,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
