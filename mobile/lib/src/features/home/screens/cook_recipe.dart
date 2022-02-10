import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/features/home/screens/select_recipe.dart';

class CookRecipe extends StatelessWidget {
  const CookRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recipe = ModalRoute.of(context)!.settings.arguments as Recipe;
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
              width: 30.w,
              height: 30.h,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(241, 91, 42, 0.2),
                  shape: BoxShape.circle),
              child: Center(
                child: IconButton(
                  splashRadius: 0.1,
                  padding: EdgeInsets.all(0),
                  iconSize: 20.sp,
                  icon: Icon(Icons.arrow_back_ios_new),
                  color: Color.fromRGBO(249, 106, 100, 1),
                  onPressed: () {
                    Navigator.pushNamed(context, RouteManager.selectRecipe);
                  },
                ),
              ),
            ),
            SizedBox(
              width: 60.w,
            ),
            Text(
              recipe.recipeName,
              style: TextStyle(
                  color: Color.fromRGBO(249, 106, 100, 1),
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w900),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(blurRadius: 7.r, color: Colors.black12)
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Image.network(recipe.imageURL),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.sp),
                      child: Row(
                        children: [
                          Text(
                            recipe.cookingTime + ' | ' + recipe.type,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: Colors.white),
                          ),
                          Spacer(),
                          Icon(
                            Icons.star,
                            color: Colors.yellow.shade600,
                          ),
                          Text(
                            recipe.cookingLevel.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Dinh dưỡng',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21.sp,
                              color: Color.fromRGBO(249, 106, 100, 1)),
                        ),
                        Spacer(),
                        Text(
                          'Xem tất cả',
                          style: TextStyle(
                              color: Color.fromRGBO(249, 106, 100, 1),
                              fontSize: 16.sp),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.h, bottom: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: Container(
                                width: 100.w,
                                height: 100.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(1, 1, 1, 0.1),
                                        blurRadius: 5.r)
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Đạm',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Divider(
                                      height: 10,
                                      color: Colors.transparent,
                                    ),
                                    const Text(
                                      '50g',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    const Divider(
                                      height: 5,
                                      color: Colors.transparent,
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: LinearProgressIndicator(
                                            minHeight: 6,
                                            backgroundColor: Color.fromRGBO(
                                                254, 106, 100, 0.15),
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Color.fromRGBO(
                                                        249, 106, 100, 1)),
                                            value: 0.6,
                                          ),
                                        ))
                                  ],
                                ),
                              )),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromRGBO(1, 1, 1, 0.1),
                                        blurRadius: 5)
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Protein',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Divider(
                                      height: 10,
                                      color: Colors.transparent,
                                    ),
                                    const Text(
                                      '80g',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    const Divider(
                                      height: 5,
                                      color: Colors.transparent,
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: LinearProgressIndicator(
                                            minHeight: 6,
                                            backgroundColor: Color.fromRGBO(
                                                254, 106, 100, 0.15),
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Color.fromRGBO(
                                                        249, 106, 100, 1)),
                                            value: 0.3,
                                          ),
                                        ))
                                  ],
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromRGBO(1, 1, 1, 0.1),
                                        blurRadius: 5)
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Tinh bột',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Divider(
                                      height: 10,
                                      color: Colors.transparent,
                                    ),
                                    const Text(
                                      '20g',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    const Divider(
                                      height: 5,
                                      color: Colors.transparent,
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: LinearProgressIndicator(
                                            minHeight: 6,
                                            backgroundColor: Color.fromRGBO(
                                                254, 106, 100, 0.15),
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Color.fromRGBO(
                                                        249, 106, 100, 1)),
                                            value: 0.7,
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
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nguyên liệu',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21.sp,
                        color: Color.fromRGBO(249, 106, 100, 1)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: SizedBox(
                        height: 150.h,
                        width: MediaQuery.of(context).size.width,
                        child: ScrollConfiguration(
                            behavior: CustomScroll(),
                            child: ListView(
                              padding: EdgeInsets.all(0),
                              children: recipe.ingredient
                                  .map(listIngredient)
                                  .toList(),
                            ))),
                  ),
                ],
              ),
            ),
            Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Center(
                  child: Container(
                    width: 180.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Color.fromRGBO(249, 106, 100, 1),
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: const [
                              Color.fromRGBO(247, 98, 75, 1),
                              Color.fromRGBO(254, 106, 100, 1),
                            ])),
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          'Bắt đầu nấu ăn!',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ))
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
