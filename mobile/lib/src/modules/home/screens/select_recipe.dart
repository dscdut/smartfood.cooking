import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/data/model/recipe/recipe.dart';
import 'package:mobile/src/modules/home/controller/recipe_provider.dart';
import 'package:mobile/src/widgets/custom_back_button.dart';
import 'package:mobile/src/widgets/no_show_limit_scroll.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class SelectRecipe extends StatefulWidget {
  const SelectRecipe({Key? key}) : super(key: key);

  @override
  State<SelectRecipe> createState() => _SelectRecipeState();
}

class _SelectRecipeState extends State<SelectRecipe> {
  late List<Recipe> listFound;

  @override
  void didChangeDependencies() {
    listFound = ModalRoute.of(context)!.settings.arguments as List<Recipe>;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20.h),
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
                    Center(
                      child: Text(
                        "Công thức của bạn",
                        style: CustomTextTheme.headline2
                            .copyWith(color: Palette.pink500, fontSize: 26.sp),
                      ),
                    ),
                    const SizedBox()
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: ScrollConfiguration(
                  behavior: NoShowLimitScroll(),
                  child: ListView.builder(
                    itemCount: listFound.length,
                    itemBuilder: (context, index) {
                      return RecipeCard(
                        recipe: listFound[index],
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  const RecipeCard({Key? key, required this.recipe}) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Palette.shadowColor.withOpacity(0.1),
              blurRadius: 6,
            )
          ],
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Card(
          color: Palette.backgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Image.network(
                          "https://pbs.twimg.com/profile_images/683842208500285440/-kb4Pf8k_400x400.jpg",
                          width: 110.w,
                          height: 110.w,
                          fit: BoxFit.cover),
                      Container(
                        width: 110.w,
                        height: 30.w,
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black54,
                            ],
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
                                  0.1.toString(),
                                  style: CustomTextTheme.headline4.copyWith(
                                    color: Palette.backgroundColor,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.sp),
                width: 195.w,
                height: 105.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            recipe.name!,
                            style: CustomTextTheme.headline3.copyWith(
                              color: Palette.gray500,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
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
                                      .getDataRecipeById(context,
                                          id: recipe.id!)
                                      .then((value) {
                                    Navigator.pushNamed(
                                      context,
                                      RouteManager.cookRecipe,
                                      arguments: recipe.copyWith(
                                          ingredients: value!.ingredients,
                                          steps: value.steps),
                                    );
                                  });
                                }),
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Row(
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

