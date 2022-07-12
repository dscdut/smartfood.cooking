import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/core/utils/custom_cache_manager.dart';
import 'package:mobile/src/data/model/recipe/ingredient_recipe.dart';
import 'package:mobile/src/data/model/recipe/recipe.dart';
import 'package:mobile/src/modules/home/widgets/nutrition_card.dart';
import 'package:mobile/src/widgets/custom_back_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CookRecipe extends StatelessWidget {
  const CookRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    final recipe = ModalRoute.of(context)!.settings.arguments as Recipe;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 20.h,
        ),
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
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      recipe.name!,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: CustomTextTheme.headline2.copyWith(
                        color: Palette.pink500,
                        fontSize: 24.sp,
                      ),
                    ),
                  ),
                  const CustomBackButton(
                    isHide: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h),
            GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                RouteManager.viewImage,
                arguments: recipe.imageUrl,
              ),
              child: Hero(
                tag: recipe.imageUrl!,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: 343.w,
                        height: 200.w,
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
                        child: CachedNetworkImage(
                          cacheManager: CustomCacheManager.customCacheManager,
                          imageUrl: recipe.imageUrl != ''
                              ? recipe.imageUrl!
                              : 'https://www.seriouseats.com/thmb/1Tl-bBEgEnFwD_bSxF4BOWNixPs='
                                  '/450x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__co'
                                  'eus__resources__content_migration__serious_eats__seriouseats.com__2020__12__20201203'
                                  '-indonesian-pantry-vicky-wasik-1-b827da1c26134cf18153da281f8efb19.jpg',
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          progressIndicatorBuilder:
                              (context, string, progress) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Center(
                                child: CircularProgressIndicator(
                                  value: progress.progress,
                                  color: Palette.orange500,
                                ),
                              ),
                            );
                          },
                          errorWidget: (context, string, dymamic) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: const Center(
                              child: Icon(
                                PhosphorIcons.image,
                                color: Palette.orange500,
                              ),
                            ),
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
                              padding: EdgeInsets.only(left: 8.w),
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
                                  ClipOval(
                                    child: Material(
                                      color: Colors.transparent,
                                      child: IconButton(
                                        icon: const Icon(
                                          PhosphorIcons.heartFill,
                                        ),
                                        color: Palette.orange500,
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
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
                                    SizedBox(width: 4.w),
                                    Text(
                                      //TODO: need time data
                                      '30p',
                                      style: CustomTextTheme.bodyText1.copyWith(
                                        fontSize: 14.sp,
                                        color: Palette.backgroundColor,
                                      ),
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
                                      ' ${recipe.level!}',
                                      style: CustomTextTheme.bodyText1.copyWith(
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
                                      //TODO: need data for favorite
                                      '4.8',
                                      style: CustomTextTheme.bodyText1.copyWith(
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
              ),
            ),
            SizedBox(height: 8.h),
            SizedBox(
              height: 390.h,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                color: Palette.pink500,
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
                              nameNutrition: 'Đạm',
                              valueNutrition: '50g',
                            ),
                            NutritionCard(
                              nameNutrition: 'Chất béo',
                              valueNutrition: '50g',
                            ),
                            NutritionCard(
                              nameNutrition: 'Protein',
                              valueNutrition: '50g',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        child: Text(
                          'Nguyên liệu (${recipe.ingredients!.length})',
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
                        height: 200.h,
                        child: ListView(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          children:
                              recipe.ingredients!.map(listIngredient).toList(),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            NutritionCard(
                              nameNutrition: 'Đạm',
                              valueNutrition: '50g',
                            ),
                            NutritionCard(
                              nameNutrition: 'Chất béo',
                              valueNutrition: '50g',
                            ),
                            NutritionCard(
                              nameNutrition: 'Protein',
                              valueNutrition: '50g',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        child: Text(
                          'Nguyên liệu (${recipe.ingredients!.length})',
                          style: CustomTextTheme.headline3.copyWith(
                            color: Palette.gray500,
                            fontSize: 21.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      RouteManager.stepsToCooking,
                      arguments: {
                        'step': recipe.steps,
                        'name': recipe.name,
                      },
                    );
                  },
                  style: TextButton.styleFrom(
                    fixedSize: Size(210.w, 45.h),
                    backgroundColor: Palette.orange500,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        PhosphorIcons.cookingPotBold,
                        color: Palette.backgroundColor,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        'Bắt đầu nấu ăn!',
                        style: CustomTextTheme.headline4.copyWith(
                          color: Palette.backgroundColor,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listIngredient(IngredientRecipe ingredient) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: ingredient.url ??
                'https://www.seriouseats.com/thmb/1Tl-bBEgEnFwD_bSxF4BOWNixPs='
                    '/450x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__co'
                    'eus__resources__content_migration__serious_eats__seriouseats.com__2020__12__20201203'
                    '-indonesian-pantry-vicky-wasik-1-b827da1c26134cf18153da281f8efb19.jpg',
            imageBuilder: (context, imageProvider) {
              return CircleAvatar(
                backgroundImage: imageProvider,
              );
            },
            progressIndicatorBuilder: (context, string, progress) {
              return CircleAvatar(
                backgroundColor: Palette.backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Center(
                    child: CircularProgressIndicator(
                      value: progress.progress,
                      color: Palette.orange500,
                      strokeWidth: 2,
                    ),
                  ),
                ),
              );
            },
            errorWidget: (context, string, dymamic) => const CircleAvatar(
              backgroundColor: Palette.backgroundColor,
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Center(
                  child: Icon(
                    PhosphorIcons.image,
                    color: Palette.orange500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              ingredient.name ?? '',
              style: CustomTextTheme.subtitle1.copyWith(
                color: Palette.gray500,
                fontSize: 17.sp,
              ),
            ),
          ),
          Text(
            "${ingredient.value ?? ""} ${ingredient.unit ?? ""}",
            style: CustomTextTheme.bodyText1.copyWith(
              color: Palette.gray400,
              fontSize: 15.sp,
            ),
          ),
        ],
      ),
    );
  }
}
