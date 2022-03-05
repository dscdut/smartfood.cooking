import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/core/theme/custom_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ChangeNewPasswordPage extends StatefulWidget {
  const ChangeNewPasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangeNewPasswordPage> createState() => _ChangeNewPasswordPageState();
}

class _ChangeNewPasswordPageState extends State<ChangeNewPasswordPage> {
  bool showNewChanged = true;
  bool showReNewChanged = true;

  void onEyePress() {
    setState(() {
      showNewChanged = !showNewChanged;
    });
  }

  void onReEyePress() {
    setState(() {
      showReNewChanged = !showReNewChanged;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            "Khôi phục mật khẩu",
            style: CustomTheme.headline2.copyWith(
              color: Palette.pink500,
              fontSize: 28.sp,
            ),
          ),
        ),
        SizedBox(
          height: 42.h,
        ),
        Container(
          // height: 40.h,
          padding: EdgeInsets.only(
            // vertical: 1.h,
            left: 16.w,
            right: 8.w,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 16.0.w,
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
            obscureText: showNewChanged,
            decoration: InputDecoration(
              icon: const Icon(
                PhosphorIcons.lockKey,
                color: Palette.gray500,
              ),
              hintText: "Nhập mật khẩu mới",
              border: InputBorder.none,
              hintStyle: CustomTheme.subtitle2.copyWith(
                color: Palette.gray300,
                fontSize: 16.sp,
              ),
              suffixIcon: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(
                  showNewChanged ? PhosphorIcons.eye : PhosphorIcons.eyeSlash,
                ),
                onPressed: onEyePress,
                color: Palette.gray500,
                splashColor: Colors.transparent,
                splashRadius: 24,
              ),
              contentPadding: EdgeInsets.only(right: 8.w),
            ),
            textAlignVertical: TextAlignVertical.center,
            style: CustomTheme.headline6.copyWith(
              color: Palette.gray500,
              fontSize: 18.sp,
            ),
          ),
        ),
        SizedBox(
          height: 42.h,
        ),
        Container(
          // height: 40.h,
          padding: EdgeInsets.only(
            // vertical: 1.h,
            left: 16.w,
            right: 8.w,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 16.0.w,
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
            obscureText: showReNewChanged,
            decoration: InputDecoration(
              icon: const Icon(
                PhosphorIcons.lockKey,
                color: Palette.gray500,
              ),
              hintText: "Xác nhận lại mật khẩu mới",
              border: InputBorder.none,
              hintStyle: CustomTheme.subtitle2.copyWith(
                color: Palette.gray300,
                fontSize: 16.sp,
              ),
              suffixIcon: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(
                  showReNewChanged ? PhosphorIcons.eye : PhosphorIcons.eyeSlash,
                ),
                splashColor: Colors.transparent,
                onPressed: onReEyePress,
                color: Palette.gray500,
                splashRadius: 24,
              ),
              contentPadding: EdgeInsets.only(right: 8.w),
            ),
            textAlignVertical: TextAlignVertical.center,
            style: CustomTheme.headline6.copyWith(
              color: Palette.gray500,
              fontSize: 18.sp,
            ),
          ),
        ),
        SizedBox(height: 42.h),
        GestureDetector(
          onTap: () => Navigator.pushNamedAndRemoveUntil(
            context,
            RouteManager.signIn,
            (route) => false,
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
                "Hoàn thành",
                style: CustomTheme.headline4.copyWith(
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
