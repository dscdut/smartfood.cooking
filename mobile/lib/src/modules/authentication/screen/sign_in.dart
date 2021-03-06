import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/core/constant/image_path.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/modules/authentication/controllers/sign_in_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  bool showNewChanged = true;
  late final TextEditingController emailTextController;
  late final TextEditingController passwordTextController;
  late final FocusNode passFocusNode;

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    passFocusNode = FocusNode();
  }

  void onEyePress() {
    setState(() {
      showNewChanged = !showNewChanged;
    });
  }

  @override
  Widget build(BuildContext context) {
    final signInProvider = context.read<SignInProvider>();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            left: 16.w,
            right: 16.w,
          ),
          children: [
            Center(
              child: SvgPicture.asset(ImagePath.smartfoodLogoSvg),
            ),
            SizedBox(height: 16.h),
            Form(
              key: _formKey,
              child: Column(
                children: [
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
                      controller: emailTextController,
                      decoration: InputDecoration(
                        icon: const Icon(
                          PhosphorIcons.user,
                          color: Palette.gray500,
                        ),
                        hintText: 'Email ho???c t??n ????ng nh???p',
                        border: InputBorder.none,
                        hintStyle: CustomTextTheme.subtitle2.copyWith(
                          color: Palette.gray300,
                          fontSize: 16.sp,
                        ),
                        suffixIcon: const SizedBox(),
                        contentPadding: EdgeInsets.only(
                          right: 16.w,
                          top: 3.h,
                        ),
                      ),
                      textInputAction: TextInputAction.go,
                      onFieldSubmitted: (value) => passFocusNode.requestFocus(),
                      textAlignVertical: TextAlignVertical.center,
                      style: CustomTextTheme.headline6.copyWith(
                        color: Palette.gray500,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 36.h,
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
                      controller: passwordTextController,
                      obscureText: showNewChanged,
                      focusNode: passFocusNode,
                      decoration: InputDecoration(
                        icon: const Icon(
                          PhosphorIcons.lockKey,
                          color: Palette.gray500,
                        ),
                        hintText: 'M???t kh???u',
                        border: InputBorder.none,
                        hintStyle: CustomTextTheme.subtitle2.copyWith(
                          color: Palette.gray300,
                          fontSize: 16.sp,
                        ),
                        suffixIcon: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: Icon(
                            showNewChanged
                                ? PhosphorIcons.eye
                                : PhosphorIcons.eyeSlash,
                          ),
                          onPressed: onEyePress,
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
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(RouteManager.forgotPassword);
                    },
                    child: Text(
                      'Qu??n m???t kh???u',
                      style: CustomTextTheme.subtitle1
                          .copyWith(color: Palette.pink400, fontSize: 15.sp),
                    ),
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: () => Navigator.pushReplacementNamed(
                context,
                RouteManager.userChoice,
              ),
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(
                    top: 18.h,
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
                    '????ng nh???p',
                    style: CustomTextTheme.headline4.copyWith(
                      color: Palette.backgroundColor,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Ch??a c?? t??i kho???n? ',
                      style: CustomTextTheme.subtitle2.copyWith(
                        fontSize: 16.sp,
                        color: Palette.gray400,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: '????ng k?? ngay',
                      style: CustomTextTheme.subtitle1.copyWith(
                        color: Palette.pink500,
                        fontSize: 16.sp,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.of(context)
                            .pushReplacementNamed(RouteManager.signUp),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 2.h,
                      color: Palette.gray300,
                    ),
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  Text(
                    'Ho???c',
                    style: CustomTextTheme.subtitle1
                        .copyWith(color: Palette.gray300, fontSize: 16.sp),
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  Expanded(
                    child: Container(
                      height: 2.h,
                      color: Palette.gray300,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(21),
              width: 279.w,
              height: 45.h,
              decoration: BoxDecoration(
                color: Palette.backgroundColor,
                boxShadow: const [
                  BoxShadow(
                    color: Palette.gray200,
                    blurRadius: 10,
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                child: Row(
                  children: [
                    SizedBox(
                      width: 25.w,
                    ),
                    Image.asset(
                      'assets/images/decoration/google.png',
                      height: 20.r,
                      width: 20.r,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      '????ng nh???p b???ng Google',
                      style: CustomTextTheme.headline4
                          .copyWith(color: Palette.gray500),
                    )
                  ],
                ),
                onPressed: () {
                  signInProvider.onTapSigninWithGoogle().then((_) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteManager.mainScreen,
                      (route) => false,
                    );
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(21),
              width: 279.w,
              height: 45.h,
              decoration: BoxDecoration(
                color: Colors.blue,
                boxShadow: const [
                  BoxShadow(
                    color: Palette.gray200,
                    blurRadius: 10,
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                child: Row(
                  children: [
                    SizedBox(
                      width: 25.w,
                    ),
                    Image.asset(
                      'assets/images/decoration/facebook.png',
                      height: 20.r,
                      width: 20.r,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      '????ng nh???p b???ng Facebook',
                      style: CustomTextTheme.headline4
                          .copyWith(color: Palette.backgroundColor),
                    )
                  ],
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
