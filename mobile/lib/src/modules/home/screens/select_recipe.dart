// ignore_for_file: cascade_invocations, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/data/model/recipe/recipe.dart';
import 'package:mobile/src/modules/home/controller/recipe_filter_provider.dart';
import 'package:mobile/src/modules/home/widgets/recipe_card.dart';
import 'package:mobile/src/widgets/custom_back_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class SelectRecipe extends StatefulWidget {
  const SelectRecipe({super.key});

  @override
  State<SelectRecipe> createState() => _SelectRecipeState();
}

class _SelectRecipeState extends State<SelectRecipe> {
  late List<Recipe> _listFound;
  @override
  void didChangeDependencies() {
    _listFound = ModalRoute.of(context)!.settings.arguments as List<Recipe>;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final recipeFilterProvider = context.read<RecipeFilterProvider>();
    recipeFilterProvider.listFound = _listFound;
    recipeFilterProvider.displayRoutingResult();
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20.h),
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
                  Text(
                    'Công thức của bạn',
                    style: CustomTextTheme.headline2
                        .copyWith(color: Palette.pink500, fontSize: 26.sp),
                  ),
                  IconButton(
                    splashRadius: 24,
                    onPressed: () => showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30.r),
                        ),
                      ),
                      context: context,
                      builder: (context) => recipeFilter(
                        context,
                        recipeFilterProvider.listFound,
                      ),
                      isScrollControlled: true,
                    ),
                    icon: const Icon(
                      PhosphorIcons.sliders,
                      size: 32,
                      color: Palette.pink500,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: _listFound.length,
                itemBuilder: (context, index) {
                  return RecipeCard(recipe: _listFound[index]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 16.h,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget recipeFilter(
  BuildContext context,
  List<Recipe> listFound,
) {
  final recipeFilterProvider = context.read<RecipeFilterProvider>();
  return Container(
    decoration: BoxDecoration(
      color: Palette.backgroundColor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.r),
        topRight: Radius.circular(30.r),
      ),
    ),
    height: 662.h,
    padding: EdgeInsets.symmetric(horizontal: 16.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Center(
            child: Container(
              width: 70.w,
              height: 8.h,
              decoration: BoxDecoration(
                color: Palette.pink100,
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ),
        ),
        Center(
          child: Text(
            'Bộ lọc',
            style: CustomTextTheme.headline1
                .copyWith(color: Palette.gray500, fontSize: 32.sp),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          'Cấp độ',
          style: CustomTextTheme.headline3
              .copyWith(color: Palette.gray500, fontSize: 20.sp),
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            Consumer<RecipeFilterProvider>(
              builder: (context, provider, child) {
                return Container(
                  width: 80.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: (recipeFilterProvider.levelFilter == 1)
                        ? Palette.pink500
                        : Palette.backgroundColor,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 5,
                        color: Palette.gray200,
                        offset: Offset(
                          0,
                          3,
                        ),
                      )
                    ],
                  ),
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      recipeFilterProvider.levelFilterAction(1);
                    },
                    child: Center(
                      child: Text(
                        'Dễ',
                        style: CustomTextTheme.headline4.copyWith(
                          color: (recipeFilterProvider.levelFilter == 1)
                              ? Palette.backgroundColor
                              : Palette.gray500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const Spacer(),
            Consumer<RecipeFilterProvider>(
              builder: (context, provider, child) {
                return Container(
                  width: 80.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: (recipeFilterProvider.levelFilter == 2)
                        ? Palette.pink500
                        : Palette.backgroundColor,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 5,
                        color: Palette.gray200,
                        offset: Offset(
                          0,
                          3,
                        ),
                      )
                    ],
                  ),
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      recipeFilterProvider.levelFilterAction(2);
                    },
                    child: Center(
                      child: Text(
                        'Vừa',
                        style: CustomTextTheme.headline4.copyWith(
                          color: (recipeFilterProvider.levelFilter == 2)
                              ? Palette.backgroundColor
                              : Palette.gray500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const Spacer(),
            Consumer<RecipeFilterProvider>(
              builder: (context, provider, child) {
                return Container(
                  width: 80.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: (recipeFilterProvider.levelFilter == 3)
                        ? Palette.pink500
                        : Palette.backgroundColor,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 5,
                        color: Palette.gray200,
                        offset: Offset(
                          0,
                          3,
                        ),
                      )
                    ],
                  ),
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      recipeFilterProvider.levelFilterAction(3);
                    },
                    child: Center(
                      child: Text(
                        'Khó',
                        style: CustomTextTheme.headline4.copyWith(
                          color: (recipeFilterProvider.levelFilter == 3)
                              ? Palette.backgroundColor
                              : Palette.gray500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
        SizedBox(
          height: 32.h,
        ),
        Row(
          children: [
            Text(
              'Thời gian',
              style: CustomTextTheme.headline3
                  .copyWith(color: Palette.gray500, fontSize: 20.sp),
            ),
            const Spacer(),
            Consumer<RecipeFilterProvider>(
              builder: (context, provider, child) {
                return Text(
                  '${provider.timeFilter.start.toInt()} tới ${provider.timeFilter.end.toInt()} phút',
                  style: CustomTextTheme.subtitle2
                      .copyWith(color: Palette.gray400, fontSize: 16.sp),
                );
              },
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Consumer<RecipeFilterProvider>(
          builder: ((context, provider, child) {
            return SliderTheme(
              data: const SliderThemeData(
                trackHeight: 8,
                activeTickMarkColor: Palette.gray100,
              ),
              child: RangeSlider(
                activeColor: Palette.pink500,
                inactiveColor: Palette.pink200,
                max: 300,
                values: recipeFilterProvider.timeFilter,
                onChanged: (RangeValues newTimeFilter) {
                  recipeFilterProvider.timeFilterAction(newTimeFilter);
                },
              ),
            );
          }),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          'Đánh giá',
          style: CustomTextTheme.headline3
              .copyWith(color: Palette.gray500, fontSize: 20.sp),
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            Consumer<RecipeFilterProvider>(
              builder: (context, provider, child) {
                return Container(
                  width: 80.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: (recipeFilterProvider.reviewFilter == 1)
                        ? Palette.pink500
                        : Palette.backgroundColor,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 5,
                        color: Palette.gray200,
                        offset: Offset(
                          0,
                          3,
                        ),
                      )
                    ],
                  ),
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      recipeFilterProvider.reviewFilterAction(1);
                    },
                    child: Center(
                      child: Text(
                        'Thấp',
                        style: CustomTextTheme.headline4.copyWith(
                          color: (recipeFilterProvider.reviewFilter == 1)
                              ? Palette.backgroundColor
                              : Palette.gray500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const Spacer(),
            Consumer<RecipeFilterProvider>(
              builder: (context, provider, child) {
                return Container(
                  width: 110.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: (recipeFilterProvider.reviewFilter == 2)
                        ? Palette.pink500
                        : Palette.backgroundColor,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 5,
                        color: Palette.gray200,
                        offset: Offset(
                          0,
                          3,
                        ),
                      )
                    ],
                  ),
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      recipeFilterProvider.reviewFilterAction(2);
                    },
                    child: Center(
                      child: Text(
                        'Trung bình',
                        style: CustomTextTheme.headline4.copyWith(
                          color: (recipeFilterProvider.reviewFilter == 2)
                              ? Palette.backgroundColor
                              : Palette.gray500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const Spacer(),
            Consumer<RecipeFilterProvider>(
              builder: (context, provider, child) {
                return Container(
                  width: 80.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: (recipeFilterProvider.reviewFilter == 3)
                        ? Palette.pink500
                        : Palette.backgroundColor,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 5,
                        color: Palette.gray200,
                        offset: Offset(
                          0,
                          3,
                        ),
                      )
                    ],
                  ),
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      recipeFilterProvider.reviewFilterAction(3);
                    },
                    child: Center(
                      child: Text(
                        'Cao',
                        style: CustomTextTheme.headline4.copyWith(
                          color: (recipeFilterProvider.reviewFilter == 3)
                              ? Palette.backgroundColor
                              : Palette.gray500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
        SizedBox(
          height: 32.h,
        ),
        Row(
          children: [
            Text(
              'Lượng calories',
              style: CustomTextTheme.headline3
                  .copyWith(color: Palette.gray500, fontSize: 20.sp),
            ),
            const Spacer(),
            Consumer<RecipeFilterProvider>(
              builder: (context, provider, child) {
                return Text(
                  '${provider.caloriFilter.start.toInt()} tới ${provider.caloriFilter.end.toInt()} calories',
                  style: CustomTextTheme.subtitle2
                      .copyWith(color: Palette.gray400, fontSize: 16.sp),
                );
              },
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Consumer<RecipeFilterProvider>(
          builder: ((context, provider, child) {
            return SliderTheme(
              data: const SliderThemeData(trackHeight: 8),
              child: RangeSlider(
                activeColor: Palette.pink500,
                inactiveColor: Palette.pink200,
                max: 5000,
                values: recipeFilterProvider.caloriFilter,
                onChanged: (RangeValues newTimeFilter) {
                  recipeFilterProvider.caloriFilterAction(newTimeFilter);
                },
              ),
            );
          }),
        ),
        SizedBox(
          height: 15.h,
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Consumer<RecipeFilterProvider>(
              builder: (context, value, child) {
                return TextButton(
                  onPressed: () {
                    recipeFilterProvider.submitFilter(listFound);
                    recipeFilterProvider.displayFilterResult();
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                    fixedSize: Size(340.w, 45.h),
                    backgroundColor: Palette.orange500,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  child: Text(
                    'Áp dụng bộ lọc',
                    style: CustomTextTheme.headline4.copyWith(
                      color: Palette.backgroundColor,
                      fontSize: 18.sp,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Consumer<RecipeFilterProvider>(
              builder: (context, provider, child) {
                return TextButton(
                  onPressed: () {
                    recipeFilterProvider.displayRoutingResult();
                    recipeFilterProvider.resetFilter();
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                    fixedSize: Size(340.w, 45.h),
                    backgroundColor: Palette.backgroundColor,
                    side: const BorderSide(color: Palette.orange500, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  child: Text(
                    'Xoá bộ lọc',
                    style: CustomTextTheme.headline4.copyWith(
                      color: Palette.gray500,
                      fontSize: 18.sp,
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    ),
  );
}
