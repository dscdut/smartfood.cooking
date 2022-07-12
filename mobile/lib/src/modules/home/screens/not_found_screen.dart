import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/core/constant/image_path.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/widgets/custom_back_button.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 20.h,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.0.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomBackButton(
                  onPressedFunction: () => Navigator.pop(context),
                ),
              ),
            ),
            Image.asset(
              ImagePath.notFoundImage,
              height: ScreenUtil().screenHeight * 0.5,
            ),
            SizedBox(height: 28.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Column(
                children: [
                  Text(
                    'Rất tiếc! Hệ thống không tìm được món ăn với nguyên liệu bạn cung cấp.',
                    style: CustomTextTheme.subtitle1
                        .copyWith(color: Palette.pink500, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextButton(
                    onPressed: () => Navigator.popAndPushNamed(
                      context,
                      RouteManager.selectRecipe,
                    ),
                    style: TextButton.styleFrom(
                      fixedSize: Size(210.w, 40.h),
                      backgroundColor: Palette.orange500,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Công thức tương tự',
                      style: CustomTextTheme.headline4
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      side:
                          const BorderSide(width: 2, color: Palette.orange500),
                      fixedSize: Size(210.w, 40.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Chỉnh sửa danh sách',
                      style: CustomTextTheme.headline4
                          .copyWith(color: Palette.gray500),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
