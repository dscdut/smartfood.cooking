import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/data/model/recipe/step.dart';
import 'package:mobile/src/modules/home/widgets/dynamic_height_page_view.dart';
import 'package:mobile/src/widgets/custom_back_button.dart';

class StepsToCookingScreen extends StatefulWidget {
  const StepsToCookingScreen({Key? key}) : super(key: key);

  @override
  State<StepsToCookingScreen> createState() => _StepsToCookingScreenState();
}

class _StepsToCookingScreenState extends State<StepsToCookingScreen> {
  late List<CookingStep>? listStep;

  late PageController pageController;

  int indexCurrentPage = 0;
  final listImageStep = [
    "assets/images/temp/b1.png",
    "assets/images/temp/b2.png",
    "assets/images/temp/b3.png",
    "assets/images/temp/b3.png",
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController()
      ..addListener(() {
        final int? newIndex = pageController.page?.round();
        if (indexCurrentPage != newIndex) {
          setState(() => indexCurrentPage = newIndex!);
        }
      });
  }

  @override
  void didChangeDependencies() {
    listStep = ModalRoute.of(context)!.settings.arguments as List<CookingStep>?;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 20.h,
          bottom: 40.h,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(
                    onPressedFunction: () => Navigator.pop(context),
                  ),
                  Text(
                    "Gà chiên nước mắm",
                    style: CustomTextTheme.headline2
                        .copyWith(color: Palette.pink500),
                  ),
                  SizedBox(
                    width: 28.w,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                      color: Palette.orange400,
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.only(top: 30.h),
                  width: 100.w,
                  height: 40.h,
                  child: Center(
                    child: Text(
                      "Bước ${indexCurrentPage + 1}",
                      style: CustomTextTheme.headline4
                          .copyWith(color: Palette.backgroundColor),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0.h),
              child: Image.asset(listImageStep[indexCurrentPage]),
            ),
            //TODO: will refactor ```DynamicHeightPageView```
            DynamicHeightPageView(
              children: listStep!.map((e) {
                return Text(
                  e.content!,
                  style: CustomTextTheme.headline5
                      .copyWith(color: Palette.gray500, fontSize: 16.sp),
                  textAlign: TextAlign.justify,
                );
              }).toList(),
              indexCurrentPage: indexCurrentPage,
              pageController: pageController,
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: listStep!
                  .asMap()
                  .map(
                    (key, value) {
                      return MapEntry(
                        key,
                        Container(
                          width: 8.h,
                          height: 8.h,
                          margin: EdgeInsets.only(left: key == 0 ? 0 : 15.w),
                          decoration: BoxDecoration(
                              color: indexCurrentPage == key
                                  ? Palette.pink500
                                  : Palette.pink100,
                              borderRadius: BorderRadius.circular(8.h)),
                        ),
                      );
                    },
                  )
                  .values
                  .toList(),
            ),
            const Spacer(),
            indexCurrentPage < listStep!.length - 1
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(
                          visible: indexCurrentPage != 0,
                          child: TextButton(
                            onPressed: () {
                              if (indexCurrentPage != 0) {
                                setState(() =>
                                    indexCurrentPage = indexCurrentPage - 1);
                                pageController.previousPage(
                                  curve: Curves.linear,
                                  duration: const Duration(milliseconds: 200),
                                );
                              }
                            },
                            style: TextButton.styleFrom(
                                side: const BorderSide(
                                    width: 2.0, color: Palette.orange500),
                                fixedSize: Size(110.w, 40.h),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            child: Text(
                              "Quay lại",
                              style: CustomTextTheme.headline4
                                  .copyWith(color: Palette.gray500),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              indexCurrentPage = indexCurrentPage + 1;
                            });
                            pageController.nextPage(
                              curve: Curves.linear,
                              duration: const Duration(milliseconds: 200),
                            );
                          },
                          style: TextButton.styleFrom(
                            fixedSize: Size(110.w, 40.h),
                            backgroundColor: Palette.orange500,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            "Tiếp theo",
                            style: CustomTextTheme.headline4
                                .copyWith(color: Palette.backgroundColor),
                          ),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: TextButton(
                      onPressed: () => Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouteManager.doneCooking,
                        ModalRoute.withName(RouteManager.cookRecipe),
                      ),
                      style: TextButton.styleFrom(
                        fixedSize: Size(110.w, 40.h),
                        backgroundColor: Palette.orange500,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        "Hoàn thành",
                        style: CustomTextTheme.headline4
                            .copyWith(color: Palette.backgroundColor),
                      ),
                    ),
                  ),
          ],
        ),
      ),
      backgroundColor: Palette.backgroundColor,
    );
  }
}
