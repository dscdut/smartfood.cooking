import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/features/home/widgets/dynamic_height_page_view.dart';

class StepsToCookingScreen extends StatefulWidget {
  const StepsToCookingScreen({Key? key}) : super(key: key);

  @override
  State<StepsToCookingScreen> createState() => _StepsToCookingScreenState();
}

class _StepsToCookingScreenState extends State<StepsToCookingScreen> {
  final List<String> listSteps = [
    "Cánh gà làm sạch, ngâm với nước ấm pha muối loãng, thêm vài lát gừng, hành củ đập dập trong 10-15 phút để khử mùi. Sau đó, rửa sạch, thấm khô. Nếu cánh nhỏ thì để nguyên, cánh to thì cắt thành các miếng vừa ăn.",
    "Ướp cánh gà với gia vị: 1 thìa cà phê muối, 1 thìa cà phê hạt tiêu, 1 thìa cà phê hạt nêm, 2 thìa cà phê ớt bột tạo màu Hàn Quốc, 2 thìa cà phê dầu hào, 1 thìa cà phê mỡ gà hoặc mỡ lợn, 1 thìa canh bột bắp và chút gừng, hành củ đập dập (khi rán bỏ gừng, hành ra, tránh bị cháy). Đeo găng tay trộn và thoa đều các mặt cho gia vị thấm đều. Để ướp trong 15 – 20 phút."
  ];

  late PageController pageController;

  int indexCurrentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController() //
      ..addListener(() {
        final int? newIndex = pageController.page?.round();
        if (indexCurrentPage != newIndex) {
          setState(() => indexCurrentPage = newIndex!);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 30.h, left: 16.w, right: 16.w, bottom: 40.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Text(
                  "Gà chiên nước mắm",
                  style: Theme.of(context).textTheme.headline2!.copyWith(color: Palette.pink500),
                ),
                SizedBox(
                  width: 28.w,
                )
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  color: Palette.orange400,
                  borderRadius: BorderRadius.circular(20)
                ),
                margin: EdgeInsets.only(top: 30.h),
                width: 100.w,
                height: 40.h,
                child: Center(
                  child: Text(
                    "Bước ${indexCurrentPage + 1}",
                    style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 28.h,
            ),
            DynamicHeightPageView(
              children: listSteps.map((e) {
                  return Text(
                    e,
                    style: Theme.of(context).textTheme.headline5!.copyWith(color: Palette.gray500, fontSize: 16.sp),
                  );
                }).toList(),
              indexCurrentPage: indexCurrentPage,
              pageController: pageController,
            ),
            SizedBox(
              height: 28.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: listSteps.asMap().map((key, value) {
                return MapEntry(
                    key,
                    Container(
                      width: 8.h,
                      height: 8.h,
                      margin: EdgeInsets.only(left: key == 0 ? 0 : 15.w),
                      decoration: BoxDecoration(
                          color: indexCurrentPage == key ? Palette.pink500 : Palette.pink100,
                          borderRadius: BorderRadius.circular(8.h)
                      ),
                    )
                );
              }).values.toList()
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: indexCurrentPage != 0,
                  child: TextButton(
                    onPressed: () {
                      if (indexCurrentPage != 0) {
                        setState(() => indexCurrentPage = indexCurrentPage - 1);
                        pageController.jumpToPage(indexCurrentPage - 1);
                      }
                    },
                    style: TextButton.styleFrom(
                      side: BorderSide(
                        width: 2.0,
                        color: Palette.pink500
                      ),
                      fixedSize: Size(110.w, 40.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                    child: Text(
                      "Quay lại",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Palette.gray500),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (indexCurrentPage < listSteps.length - 1) {
                      setState(() => indexCurrentPage = indexCurrentPage + 1);
                      pageController.jumpToPage(indexCurrentPage + 1);
                    }
                  },
                  style: TextButton.styleFrom(
                    fixedSize: Size(110.w, 40.h),
                    backgroundColor: Palette.pink500,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                  ),
                  child:  Text(
                    "Tiếp theo",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
