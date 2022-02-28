import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/features/home/screens/cook_recipe.dart';
import 'package:mobile/src/widgets/custom_back_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SelectRecipe extends StatefulWidget {
  const SelectRecipe({Key? key}) : super(key: key);

  @override
  State<SelectRecipe> createState() => _SelectRecipeState();
}

class _SelectRecipeState extends State<SelectRecipe> {
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
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(color: Palette.pink500),
                      ),
                    ),
                    const SizedBox()
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: ScrollConfiguration(
                  behavior: CustomScroll(),
                  child: ListView(
                    children: suggest.map(listRecipe).toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget listRecipe(Recipe val) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteManager.cookRecipe, arguments: val);
      },
      child: Container(
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
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Image.network(val.imageURL,
                            width: 110.w, height: 110.w, fit: BoxFit.fitHeight),
                        Container(
                          width: 110.w,
                          height: 30.w,
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
                            children: [
                              IconButton(
                                padding: const EdgeInsets.all(5),
                                splashRadius: 0.01,
                                onPressed: () {
                                  val.favorited
                                      ? val.favorited = false
                                      : val.favorited = true;
                                },
                                icon: const Icon(PhosphorIcons.heartFill),
                                color: val.favorited
                                    ? Palette.pink500
                                    : Palette.backgroundColor,
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow.shade600,
                                      size: 20.sp,
                                    ),
                                    Text(
                                      val.favoriteLevel.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4!
                                          .copyWith(
                                            color: Palette.backgroundColor,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ],
                                ),
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
                  height: 100.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              val.recipeName,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
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
                              color: Palette.pink500,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: IconButton(
                                splashRadius: 0.1,
                                padding: const EdgeInsets.all(0),
                                iconSize: 20.sp,
                                icon: const Icon(PhosphorIcons.arrowRightBold),
                                color: Palette.backgroundColor,
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    RouteManager.cookRecipe,
                                    arguments: val,
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: <Widget>[
                          const Icon(
                            PhosphorIcons.clockBold,
                            color: Palette.gray400,
                          ),
                          Text(' ' + val.cookingTime,
                              style: Theme.of(context).textTheme.headline4!),
                          const Spacer(),
                          Text('|',
                              style: Theme.of(context).textTheme.headline4!),
                          const Spacer(),
                          const Icon(
                            PhosphorIcons.cookingPotBold,
                            color: Palette.gray400,
                          ),
                          Text(
                            ' ' + val.cookingLevel,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(fontWeight: FontWeight.bold),
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
      ),
    );
  }
}

Ingredient igr1 =
    Ingredient('Thịt gà', 'https://tinyurl.com/yrsj7hbm', 'con', '1');
Ingredient igr2 =
    Ingredient('Đường', 'https://tinyurl.com/yrsj7hbm', 'muỗng cà phê', '2');
Ingredient igr3 =
    Ingredient('Mắm', 'https://tinyurl.com/yrsj7hbm', 'muỗng canh', '1');
Ingredient igr4 = Ingredient(
    'Hạt nêm Knor', 'https://tinyurl.com/yrsj7hbm', 'muỗng cà phê', '4');
List<Ingredient> ingredient = [igr1, igr2, igr3, igr4];
Nutrition nutri1 = Nutrition();
Nutrition nutri2 = Nutrition();
Nutrition nutri3 = Nutrition();
List<Nutrition> nutrition = [nutri1, nutri2, nutri3];

Recipe recipe1 = Recipe(
    'Cánh gà chiên mắm',
    'http://imgs.vietnamnet.vn/Images/2016/12/09/08/20161209085123-ga3.jpg',
    4,
    'Vừa',
    '1 giờ',
    ingredient,
    nutrition, []);
Recipe recipe2 = Recipe(
    'Gà luộc',
    'http://cdn.tgdd.vn/Files/2020/08/11/1278766/cach-moi-nhanh-va-de-giup-luoc-ga-khong-nut-da-chat-gon-dep-doc-xong-chi-muon-thu-ngay-202008111016237351.jpg',
    3,
    'Dễ',
    '2 giờ',
    ingredient,
    nutrition, []);
Recipe recipe3 = Recipe(
    'Gỏi gà lá chanh chua ngọt',
    'https://cdn.cet.edu.vn/wp-content/uploads/2019/08/goi-ga-xe-phay.jpg',
    3.5,
    'Vừa',
    '1 giờ',
    ingredient,
    nutrition, []);
Recipe recipe4 = Recipe(
    'Gà hầm thuốc bắc',
    'https://st.quantrimang.com/photos/image/2020/10/14/ga-ham-thuoc-bac-2.jpg',
    4.5,
    'Khó',
    '3 giờ',
    ingredient,
    nutrition, []);
Recipe recipe5 = Recipe(
    'Gỏi gà',
    'https://image-us.eva.vn/upload/2-2019/images/2019-06-06/1559789758-596-thumbnail.jpg',
    2.5,
    'Dễ',
    '1 giờ',
    ingredient,
    nutrition, []);
List<Recipe> suggest = [recipe1, recipe2, recipe3, recipe4, recipe5];

class Recipe {
  late String recipeName;
  late String imageURL;
  late double favoriteLevel;
  late bool favorited = true;
  late String cookingTime;
  late String cookingLevel;
  late List<Ingredient> ingredient;
  late List<Nutrition> nutrition;
  late List<CookStep> step;
  Recipe(this.recipeName, this.imageURL, this.favoriteLevel, this.cookingLevel,
      this.cookingTime, this.ingredient, this.nutrition, this.step);
}

class Ingredient {
  late String ingrName;
  late String ingrImageURL;
  late String ingrUnit;
  late String inghrQuantity;
  Ingredient(
      this.ingrName, this.ingrImageURL, this.ingrUnit, this.inghrQuantity);
}

class Nutrition {
  late String nutriName;
  late String nutriUnit;
  late String nutriQuantity;
  Nutrition() {
    nutriName = 'Canxi';
    nutriUnit = 'miligram';
    nutriQuantity = '50';
  }
}

class CookStep {
  String stepName = '';
  String stepDescription = '';
}
