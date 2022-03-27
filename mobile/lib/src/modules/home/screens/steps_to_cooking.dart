import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/core/utils/custom_cache_manager.dart';
import 'package:mobile/src/data/model/recipe/cooking_step.dart';
import 'package:mobile/src/modules/home/widgets/dynamic_height_page_view.dart';
import 'package:mobile/src/widgets/custom_back_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class StepsToCookingScreen extends StatefulWidget {
  const StepsToCookingScreen({Key? key}) : super(key: key);

  @override
  State<StepsToCookingScreen> createState() => _StepsToCookingScreenState();
}

class _StepsToCookingScreenState extends State<StepsToCookingScreen> {
  late List<CookingStep>? listStep;
  late String nameRecipe;

  late PageController dynamicViewPageController;
  late PageController listPictureStepPageController;

  int currentImagePage = 0;
  int indexCurrentPage = 0;
  bool isImagePageLast = false;

  @override
  void initState() {
    super.initState();
    listPictureStepPageController = PageController()
      ..addListener(() {
        final int? newIndex = listPictureStepPageController.page?.round();
        if (currentImagePage != newIndex) {
          setState(() {
            currentImagePage = newIndex!;
          });
        }
      });
    dynamicViewPageController = PageController()
      ..addListener(() {
        final int? newIndex = dynamicViewPageController.page?.round();
        if (indexCurrentPage != newIndex) {
          setState(() {
            indexCurrentPage = newIndex!;
            listPictureStepPageController.jumpToPage(0);
          });
        }
      });
  }

  @override
  void didChangeDependencies() {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    listStep = arguments["step"] as List<CookingStep>;
    print(listStep!.length);
    nameRecipe = arguments["name"] as String;
    log(listStep.toString());
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
                  SizedBox(width: 8.w),
                  Expanded(
                      child: Text(
                    nameRecipe,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: CustomTextTheme.headline2.copyWith(
                      color: Palette.pink500,
                      fontSize: 24.sp,
                    ),
                  )),
                  SizedBox(width: 22.w),
                ],
              ),
            ),
            listStep!.length != 1
                ? Padding(
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
                  )
                : const SizedBox(),
            SizedBox(
              height: 220.h,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: listPictureStepPageController,
                    itemCount: listStep![indexCurrentPage].images!.length,
                    itemBuilder: (context, index) {
                      return CachedNetworkImage(
                        cacheManager: CustomCacheManager.customCacheManager,
                        imageUrl: listStep![indexCurrentPage].images![index],
                        imageBuilder: (context, imageProvider) => Hero(
                          tag: listStep![indexCurrentPage].images![index],
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, RouteManager.viewImage,
                                arguments:
                                    listStep![indexCurrentPage].images![index]),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 16.h,
                              ),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        progressIndicatorBuilder: (context, string, progress) {
                          return Container(
                            height: 180.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(12.r),
                              ),
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
                          height: 180.h,
                          child: const Center(
                            child: Icon(
                              PhosphorIcons.warning,
                              color: Palette.orange500,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(15.r),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  currentImagePage != 0
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 16.w),
                            child: CustomBackButton(
                              onPressedFunction: () =>
                                  listPictureStepPageController.previousPage(
                                curve: Curves.linear,
                                duration: const Duration(
                                  milliseconds: 300,
                                ),
                              ),
                              opacity: 0.7,
                            ),
                          ),
                        )
                      : const SizedBox(),
                  currentImagePage !=
                          listStep![indexCurrentPage].images!.length - 1
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 16.w),
                            child: CustomBackButton(
                              onPressedFunction: () =>
                                  listPictureStepPageController.nextPage(
                                curve: Curves.linear,
                                duration: const Duration(
                                  milliseconds: 300,
                                ),
                              ),
                              reverse: true,
                              opacity: 0.7,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
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
              pageController: dynamicViewPageController,
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
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 10.h,
                          height: 10.h,
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
                                dynamicViewPageController.previousPage(
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
                            dynamicViewPageController.nextPage(
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
