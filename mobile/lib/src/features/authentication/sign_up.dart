import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/core/constant/image_path.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool showPass = true;
  bool showRepass = true;

  bool isCheckLisences = false;

  late final TextEditingController emailTextController;
  late final TextEditingController passwordTextController;
  late final TextEditingController rePasswordTextController;

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    rePasswordTextController = TextEditingController();
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Palette.pink500;
    }
    return Palette.pink500;
  }

  void showPassword() {
    setState(() {
      showPass = !showPass;
    });
  }

  void showRePassword() {
    setState(() {
      showRepass = !showRepass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
          child: Column(
            children: [
              Center(
                child: SvgPicture.asset(ImagePath.smartfoodLogoSvg),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                // height: 40.h,
                padding: EdgeInsets.only(
                  top: 1.h,
                  bottom: 1.h,
                  left: 16.w,
                  right: 16.w,
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: 16.0.w,
                ),
                decoration: BoxDecoration(
                  color: Palette.backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      color: Palette.shadowColor.withOpacity(0.1),
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: const Icon(
                      PhosphorIcons.lockKey,
                      color: Palette.gray500,
                    ),
                    hintText: "Email",
                    border: InputBorder.none,
                    hintStyle: CustomTextTheme.subtitle2.copyWith(
                      color: Palette.gray300,
                      fontSize: 16.sp,
                    ),
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  style: CustomTextTheme.headline6.copyWith(
                    color: Palette.gray500,
                    fontSize: 18.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Container(
                // height: 40.h,
                padding: EdgeInsets.only(
                  top: 1.h,
                  bottom: 1.h,
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
                      blurRadius: 6,
                      color: Palette.shadowColor.withOpacity(0.1),
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: TextFormField(
                  obscureText: showPass,
                  decoration: InputDecoration(
                    icon: const Icon(
                      PhosphorIcons.lockKey,
                      color: Palette.gray500,
                    ),
                    hintText: "Mật khẩu",
                    border: InputBorder.none,
                    hintStyle: CustomTextTheme.subtitle2.copyWith(
                      color: Palette.gray300,
                      fontSize: 16.sp,
                    ),
                    suffixIcon: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: Icon(
                        showPass ? PhosphorIcons.eye : PhosphorIcons.eyeSlash,
                      ),
                      onPressed: showPassword,
                      color: Palette.gray500,
                      splashColor: Colors.transparent,
                      splashRadius: 24,
                    ),
                    contentPadding: EdgeInsets.only(
                      right: 16.w,
                      top: 3.h,
                    ),
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  style: CustomTextTheme.headline6.copyWith(
                    color: Palette.gray500,
                    fontSize: 18.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Container(
                // height: 40.h,
                padding: EdgeInsets.only(
                  top: 1.h,
                  bottom: 1.h,
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
                      blurRadius: 6,
                      color: Palette.shadowColor.withOpacity(0.1),
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: TextFormField(
                  obscureText: showRepass,
                  decoration: InputDecoration(
                    icon: const Icon(
                      PhosphorIcons.lockKey,
                      color: Palette.gray500,
                    ),
                    hintText: "Xác nhận lại mật khẩu",
                    border: InputBorder.none,
                    hintStyle: CustomTextTheme.subtitle2.copyWith(
                      color: Palette.gray300,
                      fontSize: 16.sp,
                    ),
                    suffixIcon: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: Icon(
                        showRepass ? PhosphorIcons.eye : PhosphorIcons.eyeSlash,
                      ),
                      onPressed: showRePassword,
                      color: Palette.gray500,
                      splashColor: Colors.transparent,
                      splashRadius: 24,
                    ),
                    contentPadding: EdgeInsets.only(
                      right: 16.w,
                      top: 3.h,
                    ),
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  style: CustomTextTheme.headline6.copyWith(
                    color: Palette.gray500,
                    fontSize: 18.sp,
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox.square(
                      dimension: 24.r,
                      child: Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckLisences,
                        shape: const CircleBorder(
                          side: BorderSide(color: Palette.pink500),
                        ),
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckLisences = value!;
                          });
                        },
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Tôi đồng ý với điều khoản của ",
                            style: CustomTextTheme.subtitle2.copyWith(
                              fontSize: 16.sp,
                              color: Palette.gray500,
                              // fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: "SmartFood",
                            style: CustomTextTheme.subtitle1.copyWith(
                              color: Palette.pink500,
                              fontSize: 16.sp,
                              // fontWeight: FontWeight.w700,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushReplacementNamed(
                  context,
                  RouteManager.signIn,
                ),
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
                      "Đăng ký",
                      style: CustomTextTheme.headline4.copyWith(
                        color: Palette.backgroundColor,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Đã có tài khoản?',
                    style: CustomTextTheme.headline4
                        .copyWith(color: Palette.gray400, fontSize: 16.sp),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(
                      context,
                      RouteManager.signIn,
                    ),
                    child: Text(
                      'Đăng nhập ngay',
                      style: CustomTextTheme.subtitle1
                          .copyWith(color: Palette.pink500, fontSize: 16.sp),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
