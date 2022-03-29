import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/core/constant/image_path.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/modules/home/controller/recipe_provider.dart';
import 'package:mobile/src/modules/home/widgets/diet_mode_card.dart';
import 'package:mobile/src/modules/home/widgets/menu_button.dart';
import 'package:mobile/src/modules/home/widgets/menu_recipe_card.dart';
import 'package:mobile/src/modules/home/widgets/news_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final recipeProvider = context.read<RecipeProvider>();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: SingleChildScrollView(
          child: AnimationLimiter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 400),
                childAnimationBuilder: (widget) {
                  return SlideAnimation(
                    horizontalOffset: 75.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  );
                },
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 14.0.w, right: 14.0.w, top: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Xin chào, A",
                          style: CustomTextTheme.headline1.copyWith(
                            color: Palette.pink500,
                            fontSize: 32.sp,
                          ),
                        ),
                        const CircleAvatar(
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
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.0.w),
                    child: Text(
                      "Hôm nay bạn muốn nấu món gì?",
                      style: CustomTextTheme.headline4.copyWith(
                        color: Palette.gray400,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MenuButton(
                        menuName: 'Tủ lạnh\nbạn có gì?',
                        onMenuAction: () => Navigator.pushNamed(
                            context, RouteManager.chooseYourIngredient),
                        child: SvgPicture.asset(
                          ImagePath.fridgeIcon,
                          height: 32.h,
                          width: 32.h,
                        ),
                      ),
                      MenuButton(
                        menuName: 'Công thức\nSmartfood',
                        onMenuAction: () {},
                        child: const Icon(
                          PhosphorIcons.forkKnifeBold,
                          color: Palette.yellowStar,
                        ),
                      ),
                      MenuButton(
                        menuName: 'Tạo\nthực đơn',
                        onMenuAction: () {},
                        child: const Icon(
                          PhosphorIcons.calendarPlusBold,
                          color: Palette.infoColor,
                        ),
                      ),
                      MenuButton(
                        menuName: 'Tính\ncalories',
                        onMenuAction: () {},
                        child: const Icon(
                          PhosphorIcons.fireFill,
                          color: Palette.orange500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.0.w),
                    child: Text(
                      "Công thức hôm nay",
                      style: CustomTextTheme.headline2.copyWith(
                        color: Palette.pink500,
                        fontSize: 30.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 240.h,
                    child: ListView.separated(
                      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
                      itemCount: recipeProvider.menuData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Consumer<RecipeProvider>(
                            builder: (context, provider, child) {
                          return MenuRecipeCard(
                            imageUrl:
                                provider.menuData[index]["imageUrl"] as String,
                            isFavorite: provider.listTodayRecipe[index],
                            level: provider.menuData[index]["level"] as String,
                            recipeName:
                                provider.menuData[index]["name"] as String,
                            timeNeed:
                                provider.menuData[index]["time"] as String,
                            onMenuCardAction: () {},
                            onFavoriteAction: () {
                              recipeProvider.favoriteRecipeAction(index);
                            },
                          );
                        });
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 26.w);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.0.w),
                    child: Text(
                      "Chế độ ăn",
                      style: CustomTextTheme.headline2.copyWith(
                        color: Palette.pink500,
                        fontSize: 30.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 260.h,
                    child: ListView.separated(
                      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
                      itemCount: recipeProvider.dietModeData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Consumer<RecipeProvider>(
                            builder: (context, provider, child) {
                          return DietModeCard(
                            imageUrl: provider.dietModeData[index]["imageUrl"]
                                as String,
                            joinedCount: provider.dietModeData[index]
                                ["joinedCount"] as String,
                            modeName: provider.dietModeData[index]["modeName"]
                                as String,
                            noMenu:
                                provider.dietModeData[index]["menu"] as String,
                            onTapAction: () {},
                          );
                        });
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 25.w);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.0.w),
                    child: Text(
                      "SmartFood News",
                      style: CustomTextTheme.headline2.copyWith(
                        color: Palette.pink500,
                        fontSize: 30.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 240.h,
                    child: ListView.separated(
                      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
                      itemCount: recipeProvider.newsData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Consumer<RecipeProvider>(
                          builder: (context, provider, child) {
                            return NewsCard(
                              description: provider.newsData[index]
                                  ["description"]!,
                              imageUrl: provider.newsData[index]["imageUrl"]!,
                              title: provider.newsData[index]["newsTitle"]!,
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 25.w);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
