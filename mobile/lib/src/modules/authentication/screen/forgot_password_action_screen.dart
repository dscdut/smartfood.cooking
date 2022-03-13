import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/src/core/constant/image_path.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/modules/authentication/widget/change_new_pasword_page.dart';
import 'package:mobile/src/modules/authentication/widget/forgot_password_page.dart';
import 'package:mobile/src/modules/authentication/widget/sent_mail_page.dart';
import 'package:mobile/src/widgets/custom_back_button.dart';

class ForgotPasswordActionScreen extends StatefulWidget {
  const ForgotPasswordActionScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordActionScreen> createState() =>
      _ForgotPasswordActionScreenState();
}

class _ForgotPasswordActionScreenState
    extends State<ForgotPasswordActionScreen> {
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.0.w,
              right: 16.0.w,
              bottom: 24.0.h,
              top: 8.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SvgPicture.asset(
                    ImagePath.smartfoodLogoSvg,
                    // height: 110.h,
                  ),
                ),
                SizedBox(height: 8.h),
                CustomBackButton(
                  onPressedFunction: () => pageController.previousPage(
                    curve: Curves.linear,
                    duration: const Duration(milliseconds: 300),
                  ),
                ),
                SizedBox(
                  height: 48.h,
                ),
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: pageController,
                    children: [
                      ForgotPasswordPage(pageController: pageController),
                      SentMailPage(pageController: pageController),
                      const ChangeNewPasswordPage(),
                    ],
                  ),
                ),
                Center(
                  child: Text(
                    "Bạn cần trợ giúp?",
                    style: CustomTextTheme.subtitle1.copyWith(
                      color: Palette.gray500,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
