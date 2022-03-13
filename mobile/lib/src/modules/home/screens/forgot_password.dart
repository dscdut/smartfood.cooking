import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/modules/home/screens/sign_in.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: Palette.backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Image.asset(
                    "assets/images/decoration/fridge.png",
                    height: 120.h,
                    scale: 1,
                  ),
                ),
                SizedBox(
                  height: 96.h,
                ),
                Center(
                  child: Text(
                    'Quên mật khẩu!',
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          color: Palette.pink500,
                        ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Center(
                  child: Text(
                    'Đừng lo lắng! Nhập email bạn đã đăng ký'
                    ' \nvào bên dưới để được hướng dẫn'
                    ' \nkhôi phục lại mật khẩu.',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Palette.gray500,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 70.h,
                ),
                CustomTextField(
                  leadingIcon: const Icon(
                    Icons.person,
                    color: Palette.gray300,
                  ),
                  hintText: 'Email bạn đã đăng ký',
                  endingIconButton: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.check_box_outline_blank,
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Nhớ lại mật khẩu?',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Palette.gray400,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(RouteManager.signIn);
                        },
                        child: Text(
                          'Đăng nhập ngay',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  color: Palette.pink500,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                        )),
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(top: 30.h),
                    width: 135.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Palette.orange500,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          'Tiếp tục',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  color: Palette.backgroundColor,
                                  fontSize: 18.sp),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 100.h,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Bạn cần trợ giúp?',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Palette.gray500,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800),
                    ))
              ],
            ),
          ),
        ],
      )),
    );
  }
}
