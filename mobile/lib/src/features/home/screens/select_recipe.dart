import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/config/router.dart';
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 0,
          leadingWidth: 20.w,
          leading: Container(),
          title: Row(
            children: <Widget>[
              Container(
                width: 29.w,
                height: 29.h,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(241, 91, 42, 0.2),
                    shape: BoxShape.circle),
                child: Center(
                  child: IconButton(
                    splashRadius: 0.1,
                    padding: EdgeInsets.all(0),
                    iconSize: 22.sp,
                    icon: Icon(Icons.arrow_back_ios_new),
                    color: Color.fromRGBO(249, 106, 100, 1),
                    onPressed: () {
                      Navigator.pushNamed(context, RouteManager.notFound);
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 65.w,
              ),
              Text(
                'Công thức của bạn',
                style: TextStyle(
                    color: Color.fromRGBO(249, 106, 100, 1),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w900),
              )
            ],
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  height: 812.w * 3 / 4,
                  width: 375.w,
                  child: ScrollConfiguration(
                      behavior: CustomScroll(),
                      child: Builder(
                        builder: (context) {
                          return ListView(
                            shrinkWrap: true,
                            padding: EdgeInsets.all(0),
                            children: suggest.map(listRecipe).toList(),
                          );
                        },
                      ))),
            ],
          ),
        ));
  }

  Widget listRecipe(Recipe val) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteManager.cookRecipe, arguments: val);
      },
      child: Container(
        height: 155.h,
        width: 334.w,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
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
            color: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.sp)),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.sp),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.sp),
                    child: Image.network(val.imageURL,
                        width: 110.w, height: 110.h, fit: BoxFit.fitHeight),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.sp),
                  width: 195.w,
                  height: 110.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                              flex: 3,
                              child: Text(
                                val.recipeName,
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              )),
                          Spacer(),
                          Icon(
                            Icons.star,
                            color: Colors.yellow.shade600,
                            size: 15.sp,
                          ),
                          Text(val.cookingLevel.toString()),
                        ],
                      ),
                      Divider(
                        height: 4.h,
                        color: Colors.transparent,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 25.57.w,
                            height: 24.h,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(249, 106, 100, 1),
                                borderRadius: BorderRadius.circular(10.sp)),
                            child: Center(
                              child: IconButton(
                                splashRadius: 0.1,
                                padding: EdgeInsets.all(0),
                                iconSize: 20.sp,
                                icon: Icon(Icons.arrow_forward),
                                color: Colors.white,
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
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            val.cookingTime + ' | ' + val.type,
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w500),
                          )
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
Ingredient igr4 =
    Ingredient('Hạt nêm Knor', 'https://tinyurl.com/yrsj7hbm', 'muỗng cà phê', '4');
List<Ingredient> ingredient = [igr1, igr2, igr3, igr4];
Nutrition nutri1 = Nutrition();
Nutrition nutri2 = Nutrition();
Nutrition nutri3 = Nutrition();
List<Nutrition> nutrition = [nutri1, nutri2, nutri3];

Recipe recipe1 = Recipe(
    'Cánh gà chiên mắm',
    'http://imgs.vietnamnet.vn/Images/2016/12/09/08/20161209085123-ga3.jpg',
    4,
    'Trung bình',
    '1 giờ',
    ingredient,
    nutrition, []);
Recipe recipe2 = Recipe(
    'Gà luộc',
    'http://cdn.tgdd.vn/Files/2020/08/11/1278766/cach-moi-nhanh-va-de-giup-luoc-ga-khong-nut-da-chat-gon-dep-doc-xong-chi-muon-thu-ngay-202008111016237351.jpg',
    3,
    'Trung bình',
    '2 giờ',
    ingredient,
    nutrition, []);
Recipe recipe3 = Recipe(
    'Gà xé',
    'https://cdn.cet.edu.vn/wp-content/uploads/2019/08/goi-ga-xe-phay.jpg',
    3.5,
    'Trung bình',
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
  late double cookingLevel;
  late String type;
  late String cookingTime;
  late List<Ingredient> ingredient;
  late List<Nutrition> nutrition;
  late List<CookStep> step;
  Recipe(this.recipeName, this.imageURL, this.cookingLevel, this.type,
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
