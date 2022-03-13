import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/core/theme/palette.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/decoration/fridge.png",
                    width: 167.w,
                    height: 194.h,
                    scale: 1,
                  ),
                ),
                CustomTextField(
                  leadingIcon: const Icon(
                    Icons.person,
                    color: Palette.gray300,
                  ),
                  hintText: 'Email hoặc tên đăng nhập',
                  endingIconButton: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.check_box_outline_blank,
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomTextField(
                  leadingIcon: const Icon(
                    Icons.lock,
                    color: Palette.gray300,
                  ),
                  hintText: 'Mật khẩu',
                  endingIconButton: IconButton(
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Palette.gray400,
                    ),
                    onPressed: () {},
                    splashRadius: 20,
                  ),
                ),
                Row(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(RouteManager.forgotPassword);
                          },
                          child: Text(
                            'Quên mật khẩu',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                    color: Palette.pink400, fontSize: 16.sp),
                          )),
                    )
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(bottom: 25, top: 10),
                    width: 135.w,
                    height: 39.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Palette.orange500,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          'Đăng nhập',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  color: Palette.backgroundColor,
                                  fontSize: 16.sp),
                        ),
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Chưa có tài khoản?',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Palette.gray400, fontSize: 16.sp),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(RouteManager.signUp);
                        },
                        child: Text(
                          'Đăng ký ngay',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  color: Palette.pink500, fontSize: 16.sp),
                        )),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 2.h,
                        color: Palette.gray300,
                      )),
                      SizedBox(
                        width: 25.w,
                      ),
                      Text(
                        'Hoặc',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Palette.gray300, fontSize: 16.sp),
                      ),
                      SizedBox(
                        width: 25.w,
                      ),
                      Expanded(
                          child: Container(
                        height: 2.h,
                        color: Palette.gray300,
                      )),
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
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                          'Đăng nhập bằng Google',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Palette.gray500),
                        )
                      ],
                    ),
                    onPressed: () {},
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
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                          'Đăng nhập bằng Facebook',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Palette.backgroundColor),
                        )
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Icon leadingIcon;
  final IconButton? endingIconButton;

  const CustomTextField(
      {Key? key,
      required this.hintText,
      required this.leadingIcon,
      this.endingIconButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 45.h,
        width: 300.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Palette.backgroundColor),
        child: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: Palette.gray300),
            prefixIcon: leadingIcon,
            suffixIcon: endingIconButton,
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Palette.gray200),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Palette.gray200),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
