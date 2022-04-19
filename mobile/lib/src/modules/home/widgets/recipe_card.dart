import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/core/utils/custom_cache_manager.dart';
import 'package:mobile/src/data/model/recipe/recipe.dart';
import 'package:mobile/src/modules/home/controller/recipe_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({Key? key, required this.recipe}) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: () async {
        await context
            .read<RecipeProvider>()
            .getDataRecipeById(context, id: recipe.id!)
            .then((value) {
          log(value.toString());
          Navigator.pushNamed(
            context,
            RouteManager.cookRecipe,
            arguments: recipe.copyWith(
              ingredients: value!.ingredients,
              steps: value.steps,
            ),
          );
        });
      },
      child: Container(
        height: 140.h,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Palette.backgroundColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              offset: const Offset(0, 2),
              color: Palette.shadowColor.withOpacity(0.1),
            ),
          ],
        ),
        child: Row(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  cacheManager: CustomCacheManager.customCacheManager,
                  imageUrl: recipe.imageUrl != ""
                      ? recipe.imageUrl!
                      : "https://www.seriouseats.com/thmb/1Tl-bBEgEnFwD_bSxF4BOWNixPs="
                          "/450x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__co"
                          "eus__resources__content_migration__serious_eats__seriouseats.com__2020__12__20201203"
                          "-indonesian-pantry-vicky-wasik-1-b827da1c26134cf18153da281f8efb19.jpg",
                  imageBuilder: (context, imageProvider) => Container(
                    height: 120.w,
                    width: 120.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  progressIndicatorBuilder: (context, string, progress) {
                    return Container(
                      height: 120.w,
                      width: 120.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
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
                    height: 120.w,
                    width: 120.w,
                    child: const Center(
                      child: Icon(
                        PhosphorIcons.warning,
                        color: Palette.orange500,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                Container(
                  width: 120.w,
                  height: 30.h,
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black54,
                      ],
                    ),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          splashRadius: 24,
                          onPressed: () {
                            // setState(() {
                            //  recipe.favorited = !val.favorited;
                            // });
                          },
                          icon: const Icon(PhosphorIcons.heartFill),
                          color: Palette.orange500
                          // : Palette.backgroundColor,
                          ),
                      Row(
                        children: [
                          Icon(
                            PhosphorIcons.starFill,
                            color: Palette.yellowStar,
                            size: 20.sp,
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            "4.8",
                            style: CustomTextTheme.headline4.copyWith(
                              color: Palette.backgroundColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 6.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        recipe.name!,
                        style: CustomTextTheme.headline3.copyWith(
                          color: Palette.gray500,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(
                            PhosphorIcons.clockBold,
                            color: Palette.gray400,
                          ),
                          Text(
                            ' 30p',
                            style: CustomTextTheme.bodyText1.copyWith(
                              color: Palette.gray400,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                            child: Text('|', style: CustomTextTheme.headline4),
                          ),
                          Icon(
                            PhosphorIcons.cookingPotBold,
                            color: Palette.gray400,
                            size: 24.sp,
                          ),
                          Text(
                            ' ' + recipe.level!,
                            style: CustomTextTheme.bodyText1.copyWith(
                              color: Palette.gray400,
                              fontSize: 14.sp,
                            ),
                          ),
                          const Spacer(),
                          const Spacer(),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 28.w,
              height: 26.h,
              decoration: BoxDecoration(
                color: Palette.orange500,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: IconButton(
                  splashRadius: 0.1,
                  padding: const EdgeInsets.all(0),
                  iconSize: 20.sp,
                  icon: const Icon(PhosphorIcons.arrowRightBold),
                  color: Palette.backgroundColor,
                  onPressed: () async {
                    await context
                        .read<RecipeProvider>()
                        .getDataRecipeById(context, id: recipe.id!)
                        .then(
                      (value) {
                        Navigator.pushNamed(
                          context,
                          RouteManager.cookRecipe,
                          arguments: recipe.copyWith(
                            ingredients: value!.ingredients,
                            steps: value.steps,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
