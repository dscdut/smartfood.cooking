import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/src/core/constant/image_path.dart';
import 'package:mobile/src/core/theme/palette.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 30.h, left: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 28.w,
                  height: 28.w,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        color: Color(0xFF000000).withOpacity(0.1)
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28.w),
                  ),
                  child: Icon(
                    Icons.chevron_left_rounded,
                    size: 28,
                    color: Palette.pink500,
                  ),
                ),
              ),
            ),
            Image.asset(
              ImagePath.notFoundImage,
              height: ScreenUtil().screenHeight * 0.6,
            ),
            Text(
              "Rất tiếc! Hệ thống không tìm được món ăn với nguyên liệu bạn cung cấp.",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Palette.pink500),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30.h,
            ),
            TextButton(
              onPressed: () {

              },
              style: TextButton.styleFrom(
                fixedSize: Size(210.w, 40.h),
                backgroundColor: Palette.orange500,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                )
              ),
              child:  Text(
                "Công thức tương tự",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextButton(
              onPressed: () {

              },
              style: TextButton.styleFrom(
                side: BorderSide(
                  width: 2.0,
                  color: Palette.orange500
                ),
                fixedSize: Size(210.w, 40.h),
                shape: RoundedRectangleBorder( 
                  borderRadius: BorderRadius.circular(20)
                )
              ),
              child: Text(
                "Chỉnh sửa danh sách",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Palette.gray500),
              ),
            )
          ],
        ),
      )
    );
  }
}
