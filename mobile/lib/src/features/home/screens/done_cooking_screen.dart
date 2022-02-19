import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/constant/image_path.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DoneCookingScreen extends StatelessWidget {
  const DoneCookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 40.h,
          left: 16.w,
          right: 16.w,
        ),
        child: Column(
          children: [
            Image.asset(
              ImagePath.doneCookingCat,
            ),
            SizedBox(
              height: 32.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Chúc mừng bạn đã hoàn thành món ăn",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: Palette.gray500),
                ),
                SizedBox(
                  width: 6.w,
                ),
                Icon(
                  PhosphorIcons.handsClappingBold,
                  color: Palette.gray500,
                ),
              ],
            ),
            Container(
              width: 280.w,
              height: 120.h,
              margin: EdgeInsets.only(top: 38.h),
              padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 18.h),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_fire_department_rounded,
                        color: Palette.orange500,
                        size: 28,
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Text(
                        "Lượng Calo bạn đã tiêu thụ",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(color: Palette.orange500),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 160.w,
                        height: 8.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Palette.pink200,
                        ),
                      ),
                      Container(
                        width: (160 * 0.32).w,
                        height: 8.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Palette.pink500,
                        ),
                      )
                    ],
                  ),
                  Text(
                    "32%",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: Palette.gray500),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 38.h,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                  fixedSize: Size(210.w, 45.h),
                  backgroundColor: Palette.orange500,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    PhosphorIcons.houseBold,
                    color: Colors.white,
                    size: 25.sp,
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  Text(
                    "Quay về trang chủ",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.white),
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
