import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/features/home/screens/choose_your_material.dart';
import 'package:mobile/src/features/home/screens/select_recipe.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CookRecipe extends StatelessWidget {
  const CookRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recipe = ModalRoute.of(context)!.settings.arguments as Recipe;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomBackButton(
                        onPressedFunction: () => Navigator.pushNamed(
                            context, RouteManager.selectRecipe),
                      ),
                      Center(
                        child: Text(
                          recipe.recipeName,
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(color: Palette.pink500),
                        ),
                      ),
                      SizedBox()
                    ],
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 812.h * 0.777,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                            color: Palette.backgroundColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 10.h),
                            width: MediaQuery.of(context).size.height.w,
                            child: Stack(
                              alignment: AlignmentDirectional.topStart,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 7.r,
                                          color: Colors.black12)
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.r),
                                    child: Image.network(
                                      recipe.imageURL,
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
                                            gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: const [
                                                  Colors.transparent,
                                                  Colors.black54,
                                                ])),
                                        child: Row(
                                          children: [
                                            Spacer(),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0.h, right: 13.5.w),
                                              child: IconButton(
                                                padding: EdgeInsets.all(0),
                                                onPressed: () {},
                                                icon: Icon(
                                                  PhosphorIcons.heartFill,
                                                ),
                                                color: Palette.pink500,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: 343.w,
                                        height: 39.w,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.vertical(
                                              bottom: Radius.circular(20.r),
                                            ),
                                            gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: const [
                                                  Colors.black54,
                                                  Colors.transparent,
                                                ])),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 21.5.w),
                                          child: Row(
                                            children: [
                                              Icon(
                                                PhosphorIcons.clockBold,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                ' ' + recipe.cookingTime,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .copyWith(
                                                        fontSize: 16,
                                                        color: Palette
                                                            .backgroundColor),
                                              ),
                                              Spacer(),
                                              Text(
                                                'I',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Spacer(),
                                              Icon(
                                                PhosphorIcons.cookingPotBold,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                ' ' + recipe.cookingLevel,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .copyWith(
                                                        fontSize: 16,
                                                        color: Palette
                                                            .backgroundColor),
                                              ),
                                              Spacer(),
                                              Spacer(),
                                              Spacer(),
                                              Icon(
                                                PhosphorIcons.starFill,
                                                color: Palette.yellowStar,
                                                size: 22,
                                              ),
                                              Text(
                                                recipe.favoriteLevel.toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .copyWith(
                                                        fontSize: 16,
                                                        color: Palette
                                                            .backgroundColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 15.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Dinh dưỡng',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3!
                                          .copyWith(color: Palette.pink500),
                                    ),
                                    Spacer(),
                                    Text(
                                      'Xem tất cả',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(color: Palette.pink400),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 15.h, bottom: 10.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(right: 0.w),
                                          child: Container(
                                            width: 100.w,
                                            height: 100.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Color.fromRGBO(
                                                        1, 1, 1, 0.1),
                                                    blurRadius: 5.r)
                                              ],
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Đạm',
                                                  style: TextStyle(
                                                      fontSize: 17.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Divider(
                                                  height: 10.h,
                                                  color: Colors.transparent,
                                                ),
                                                Text(
                                                  '50g',
                                                  style: TextStyle(
                                                    fontSize: 16.sp,
                                                  ),
                                                ),
                                                Divider(
                                                  height: 5.sp,
                                                  color: Colors.transparent,
                                                ),
                                                Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10.h,
                                                            horizontal: 10.w),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      child:
                                                          LinearProgressIndicator(
                                                        minHeight: 6.h,
                                                        backgroundColor:
                                                            Palette.pink100,
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                    Color>(
                                                                Palette
                                                                    .pink500),
                                                        value: 0.6,
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          )),
                                      Spacer(),
                                      Padding(
                                          padding: EdgeInsets.only(right: 0.w),
                                          child: Container(
                                            width: 100.w,
                                            height: 100.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Color.fromRGBO(
                                                        1, 1, 1, 0.1),
                                                    blurRadius: 5.r)
                                              ],
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Đạm',
                                                  style: TextStyle(
                                                      fontSize: 17.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Divider(
                                                  height: 10.h,
                                                  color: Colors.transparent,
                                                ),
                                                Text(
                                                  '50g',
                                                  style: TextStyle(
                                                    fontSize: 16.sp,
                                                  ),
                                                ),
                                                Divider(
                                                  height: 5.sp,
                                                  color: Colors.transparent,
                                                ),
                                                Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10.h,
                                                            horizontal: 10.w),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      child:
                                                          LinearProgressIndicator(
                                                        minHeight: 6.h,
                                                        backgroundColor:
                                                            Palette.pink100,
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                    Color>(
                                                                Palette
                                                                    .pink500),
                                                        value: 0.6,
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          )),
                                      Spacer(),
                                      Padding(
                                          padding: EdgeInsets.only(right: 0.w),
                                          child: Container(
                                            width: 100.w,
                                            height: 100.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Color.fromRGBO(
                                                        1, 1, 1, 0.1),
                                                    blurRadius: 5.r)
                                              ],
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Đạm',
                                                  style: TextStyle(
                                                      fontSize: 17.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Divider(
                                                  height: 10.h,
                                                  color: Colors.transparent,
                                                ),
                                                Text(
                                                  '50g',
                                                  style: TextStyle(
                                                    fontSize: 16.sp,
                                                  ),
                                                ),
                                                Divider(
                                                  height: 5.sp,
                                                  color: Colors.transparent,
                                                ),
                                                Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10.h,
                                                            horizontal: 10.w),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      child:
                                                          LinearProgressIndicator(
                                                        minHeight: 6.h,
                                                        backgroundColor:
                                                            Palette.pink100,
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                    Color>(
                                                                Palette
                                                                    .pink500),
                                                        value: 0.6,
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nguyên liệu (' +
                                    recipe.ingredient.length.toString() +
                                    ')',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(color: Palette.pink500),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15.h, bottom: 0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: recipe.ingredient
                                        .map(listIngredient)
                                        .toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 40.h,
              width: 200.w,
              decoration: BoxDecoration(
                color: Palette.orange500,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      PhosphorIcons.book,
                      color: Palette.backgroundColor,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(RouteManager.selectRecipe);
                      },
                      child: Row(
                        children: [
                          Text(
                            'Bắt đầu nấu ăn!',
                            style:
                                Theme.of(context).textTheme.headline3!.copyWith(
                                      color: Palette.backgroundColor,
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
    );
  }

  Widget listIngredient(Ingredient ingredient) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(ingredient.ingrImageURL),
            backgroundColor: Colors.grey,
            radius: 20.sp,
          ),
          SizedBox(
            width: 20.sp,
          ),
          Text(
            ingredient.ingrName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
          ),
          Spacer(),
          Text(
            ingredient.inghrQuantity + ' ' + ingredient.ingrUnit,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
          ),
        ],
      ),
    );
  }
}

class CustomScroll extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
