import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            "Quên mật khẩu",
            style: CustomTextTheme.headline2.copyWith(
              color: Palette.pink500,
              fontSize: 28.sp,
            ),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 36.0.w),
          child: Text(
            "Đừng lo lắng! Nhập email bạn đã đăng kí "
            "vào bên dưới để được hướng dẫn "
            "khôi phục lại mật khẩu.",
            textAlign: TextAlign.center,
            style: CustomTextTheme.subtitle2.copyWith(
              color: Palette.gray500,
              fontSize: 16.sp,
            ),
          ),
        ),
        SizedBox(
          height: 42.h,
        ),
        Container(
          // height: 40.h,
          padding: EdgeInsets.symmetric(
            // vertical: 1.h,
            horizontal: 16.w,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 16.0.w,
            vertical: 16.0.h,
          ),
          decoration: BoxDecoration(
            color: Palette.backgroundColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Palette.shadowColor.withOpacity(0.1),
                offset: const Offset(0, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(25.r),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              icon: const Icon(
                PhosphorIcons.user,
                color: Palette.gray500,
              ),
              hintText: "Email đã đăng ký",
              border: InputBorder.none,
              hintStyle: CustomTextTheme.subtitle2.copyWith(
                color: Palette.gray300,
                fontSize: 16.sp,
              ),
              contentPadding: EdgeInsets.only(right: 28.w),
            ),
            style: CustomTextTheme.subtitle2.copyWith(
              color: Palette.gray500,
              fontSize: 18.sp,
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Center(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Nhớ lại mật khẩu? ",
                  style: CustomTextTheme.bodyText3.copyWith(
                    fontSize: 15.sp,
                  ),
                ),
                TextSpan(
                  text: "Đăng nhập ngay",
                  style: CustomTextTheme.bodyText1.copyWith(
                    color: Palette.pink500,
                    fontSize: 15.sp,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 42.h),
        GestureDetector(
          onTap: () => widget.pageController.nextPage(
            curve: Curves.linear,
            duration: const Duration(milliseconds: 300),
          ),
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: Palette.orange500,
              ),
              child: Text(
                "Tiếp tục",
                style: CustomTextTheme.headline4.copyWith(
                  color: Palette.backgroundColor,
                  fontSize: 17.sp,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
