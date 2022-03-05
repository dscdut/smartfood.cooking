import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTheme {
  static final textTheme = TextTheme(
    headline1: TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 32.sp,
      letterSpacing: 0.1,
      height: 36.sp / 32.sp,
    ),
    headline2: TextStyle(
      fontSize: 24.sp,
      height: 28 / 24,
      fontWeight: FontWeight.w800,
      letterSpacing: 0.1,
    ),
    headline3: TextStyle(
      fontSize: 20.sp,
      height: 24 / 20,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.4,
    ),
    headline4: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      height: 20.sp / 16.sp,
      letterSpacing: 0.4,
    ),
    headline5: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.4,
      height: 30.sp / 16.sp,
    ),
    subtitle1: TextStyle(
      fontSize: 14.sp,
      height: 16.sp / 14.sp,
      letterSpacing: 0.175,
      fontWeight: FontWeight.w800,
    ),
    bodyText1: TextStyle(
      fontSize: 12.sp,
      height: 14.sp / 12.sp,
      letterSpacing: 0.15,
      fontWeight: FontWeight.w800,
    ),
    bodyText2: TextStyle(
      fontSize: 8.sp,
      height: 10.sp / 8.sp,
      letterSpacing: 0.15,
      fontWeight: FontWeight.w700,
    ),
  );
}
