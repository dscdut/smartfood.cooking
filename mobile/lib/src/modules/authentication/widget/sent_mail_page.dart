import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/src/core/constant/image_path.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';

class SentMailPage extends StatefulWidget {
  const SentMailPage({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<SentMailPage> createState() => _SentMailPageState();
}

class _SentMailPageState extends State<SentMailPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'Đã gửi email cho bạn',
            style: CustomTextTheme.headline2.copyWith(
              color: Palette.pink500,
              fontSize: 28.sp,
            ),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          'Chúng tôi đã gửi đến một liên kết đặt lại mật khẩu '
          'tới abc***23@gmail.com',
          textAlign: TextAlign.center,
          style: CustomTextTheme.subtitle2.copyWith(
            color: Palette.gray500,
            fontSize: 16.sp,
          ),
        ),
        Center(
          child: SvgPicture.asset(
            ImagePath.gmailLogo,
            height: 140.h,
            width: 140.h,
          ),
        ),
        Center(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Không nhận được email? ',
                  style: CustomTextTheme.bodyText3.copyWith(
                    fontSize: 15.sp,
                  ),
                ),
                TextSpan(
                  text: 'Gửi lại ngay',
                  style: CustomTextTheme.bodyText1.copyWith(
                    color: Palette.pink500,
                    fontSize: 15.sp,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => log('Send mail again'),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 38.h),
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
                'Quay lại đăng nhập',
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
