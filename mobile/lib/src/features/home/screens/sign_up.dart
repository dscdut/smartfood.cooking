import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/features/home/screens/sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
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
                  leadingIcon: Icon(
                    Icons.person,
                    color: Palette.gray300,
                  ),
                  hintText: 'Email',
                  endingIconButton: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.check_box_outline_blank,
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomTextField(
                  leadingIcon: Icon(
                    Icons.lock,
                    color: Palette.gray300,
                  ),
                  hintText: 'Mật khẩu',
                  endingIconButton: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Palette.gray400,
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomTextField(
                  leadingIcon: Icon(
                    Icons.lock,
                    color: Palette.gray300,
                  ),
                  hintText: 'Xác nhận lại mật khẩu',
                  endingIconButton: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Palette.gray400,
                    ),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isChecked,
                        shape: CircleBorder(
                            side: BorderSide(color: Palette.pink500)),
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Text(
                        'Tôi đồng ý với điều khoản của',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Palette.gray400,
                            fontSize: 14.5.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'SmartFood',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    color: Palette.pink500,
                                    fontSize: 14.5.sp,
                                    fontWeight: FontWeight.w500),
                          )),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 25, top: 25),
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
                          'Đăng ký',
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
                  height: 130.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Đã có tài khoản?',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Palette.gray400, fontSize: 16.sp),
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
                                  color: Palette.pink500, fontSize: 16.sp),
                        )),
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
