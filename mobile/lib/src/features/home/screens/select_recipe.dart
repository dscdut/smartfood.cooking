import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/core/theme/palatte.dart';
import 'package:mobile/src/features/home/screens/cook_recipe.dart';

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
        child: Container(
            color: Palatte.backgroundColor,
            padding: EdgeInsets.only(top: 20.h),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            borderRadius: BorderRadius.circular(20),
                            elevation: 3,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: Palatte.backgroundColor,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                splashRadius: 24,
                                icon: Icon(Icons.chevron_left_rounded),
                                iconSize: 28,
                                color: Palatte.pink500,
                                onPressed: () => Navigator.pushNamed(
                                    context, RouteManager.notFound),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Công thức của bạn",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(color: Palatte.pink500),
                            ),
                          ),
                          SizedBox()
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      color: Palatte.backgroundColor,
                      child: Column(
                        children: [
                          SizedBox(
                              height: 812.w * 0.7,
                              child: ScrollConfiguration(
                                  behavior: CustomScroll(),
                                  child: ListView(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.all(0),
                                    children: suggest.map(listRecipe).toList(),
                                  ))),
                        ],
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Palatte.pink500,
        unselectedItemColor: Colors.black,
        currentIndex: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_rounded),
            activeIcon: Icon(Icons.add_circle_rounded),
            label: "Add",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_rounded),
            activeIcon: Icon(Icons.favorite_rounded),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            activeIcon: Icon(Icons.account_circle_rounded),
            label: "User",
          )
        ],
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
                color: Color.fromRGBO(0, 0, 0, 0.05),
                blurRadius: 5.sp,
              )
            ],
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: Card(
            color: Palatte.backgroundColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.sp)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.sp),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.sp),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Image.network(val.imageURL,
                            width: 110.w, height: 110.w, fit: BoxFit.fitHeight),
                        Container(
                          width: 110.w,
                          height: 30.w,
                          padding: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: const [
                                Colors.transparent,
                                Colors.black54,
                              ])),
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                padding: EdgeInsets.all(5),
                                splashRadius: 0.01,
                                onPressed: () {
                                  val.favorited
                                      ? val.favorited = false
                                      : val.favorited = true;
                                },
                                icon: Icon(Icons.favorite),
                                color: val.favorited
                                    ? Colors.red
                                    : Palatte.backgroundColor,
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.all(5),
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
                                            color: Palatte.backgroundColor,
                                            fontWeight: FontWeight.bold,
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
                        children: <Widget>[
                          Expanded(
                              flex: 2,
                              child: Text(
                                val.recipeName,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(
                                      color: Palatte.gray500,
                                      fontWeight: FontWeight.bold,
                                    ),
                              )),
                        ],
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 28.w,
                            height: 26.h,
                            decoration: BoxDecoration(
                                color: Palatte.pink500,
                                borderRadius: BorderRadius.circular(10.sp)),
                            child: Center(
                              child: IconButton(
                                splashRadius: 0.1,
                                padding: EdgeInsets.all(0),
                                iconSize: 20.sp,
                                icon: Icon(Icons.arrow_forward),
                                color: Palatte.backgroundColor,
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RouteManager.cookRecipe,
                                      arguments: val);
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            color: Palatte.gray400,
                          ),
                          Text(
                            ' ' + val.cookingTime,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            '|',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Icon(
                            Icons.book_outlined,
                            color: Palatte.gray400,
                          ),
                          Text(
                            ' ' + val.cookingLevel,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Spacer(),
                          Spacer(),
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
  late bool favorited = false;
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
