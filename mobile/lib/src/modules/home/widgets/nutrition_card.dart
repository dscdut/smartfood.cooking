import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';

class NutritionCard extends StatelessWidget {
  const NutritionCard({
    super.key,
    required this.nameNutrition,
    required this.valueNutrition,
  });

  final String nameNutrition;
  final String valueNutrition;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      padding: EdgeInsets.symmetric(vertical: 14.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Palette.shadowColor.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            nameNutrition,
            style: CustomTextTheme.subtitle1.copyWith(
              color: Palette.gray500,
              fontSize: 17.sp,
            ),
          ),
          Text(
            valueNutrition,
            style: CustomTextTheme.bodyText1.copyWith(
              color: Palette.gray400,
              fontSize: 15.sp,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: LinearProgressIndicator(
                minHeight: 6.h,
                backgroundColor: Palette.pink100,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Palette.pink500,
                ),
                value: 0.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
