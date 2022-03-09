import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/core/constant/image_path.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/features/user_choice/widget/allergic_food_page.dart';
import 'package:mobile/src/features/user_choice/widget/choose_region_page.dart';
import 'package:mobile/src/features/user_choice/widget/choose_favorite_food_page.dart';
import 'package:mobile/src/features/user_choice/widget/diet_page.dart';
import 'package:mobile/src/widgets/custom_back_button.dart';
import 'package:mobile/src/widgets/no_show_limit_scroll.dart';

class UserChoiceScreen extends StatefulWidget {
  const UserChoiceScreen({Key? key}) : super(key: key);

  @override
  State<UserChoiceScreen> createState() => _UserChoiceScreenState();
}

class _UserChoiceScreenState extends State<UserChoiceScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  late final PageController pageController;

  @override
  void initState() {
    tabController = TabController(
        vsync: this,
        length: 4,
        animationDuration: const Duration(milliseconds: 300));
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w, bottom: 10.0.h),
          child: Column(
            children: [
              Center(
                child: SvgPicture.asset(
                  ImagePath.smartfoodLogoSvg,
                  height: 110.h,
                  width: 110.h,
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(
                    onPressedFunction: () {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeOut,
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Bỏ qua",
                      style: CustomTextTheme.headline3.copyWith(
                        color: Palette.gray300,
                        fontSize: 22.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: ScrollConfiguration(
                  behavior: NoShowLimitScroll(),
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: pageController,
                    onPageChanged: (value) {
                      setState(() {
                        tabController.index = value;
                      });
                    },
                    children: [
                      ChooseRegionPage(
                        key: UniqueKey(),
                      ),
                      ChooseFavoriteFoodPage(
                        key: UniqueKey(),
                      ),
                      DietPage(key: UniqueKey()),
                      const AllergicFoodPage(),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (tabController.index + 1 < 4) {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  } else {
                    Navigator.pushNamedAndRemoveUntil(
                        context, RouteManager.mainScreen, (route) => false);
                  }
                },
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 32.h,
                      bottom: 24.h,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Palette.orange500,
                    ),
                    child: Text(
                      tabController.index + 1 == 4 ? "Xác nhận" : "Tiếp tục",
                      style: CustomTextTheme.headline4.copyWith(
                        color: Palette.backgroundColor,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ),
              ),
              // GestureDetector(
              //   onTap: () {
              //     if (tabController.index + 1 < 4) {
              //       pageController.nextPage(
              //         duration: const Duration(milliseconds: 300),
              //         curve: Curves.easeIn,
              //       );
              //     } else {
              //       Navigator.pushNamedAndRemoveUntil(
              //           context, RouteManager.mainScreen, (route) => false);
              //     }
              //   },
              //   child: Container(
              //     margin: EdgeInsets.only(bottom: 15.h),
              //     alignment: Alignment.center,
              //     decoration: BoxDecoration(
              //       color: Palette.orange500,
              //       borderRadius: BorderRadius.circular(20.r),
              //     ),
              //     padding:
              //         EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              //     child: Text(
              //       tabController.index + 1 == 4 ? "Xác nhận" : "Tiếp tục",
              //       style: CustomTextTheme.headline4.copyWith(
              //         color: Palette.backgroundColor,
              //         fontSize: 20.sp,
              //       ),
              //     ),
              //   ),
              // ),
              Center(
                child: TabPageSelector(
                  controller: tabController,
                  color: Palette.pink100,
                  selectedColor: Palette.pink500,
                  indicatorSize: 10.0.r,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
