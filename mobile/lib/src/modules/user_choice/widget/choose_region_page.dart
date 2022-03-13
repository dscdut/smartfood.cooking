import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/constant/image_path.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';

class ChooseRegionPage extends StatefulWidget {
  const ChooseRegionPage({Key? key}) : super(key: key);

  @override
  State<ChooseRegionPage> createState() => _ChooseRegionPageState();
}

class _ChooseRegionPageState extends State<ChooseRegionPage> {
  List<bool> listCheckChosen = List.filled(3, false);

  void onTapRegionCard(index) {
    setState(() {
      listCheckChosen = List.filled(3, false);
      listCheckChosen[index] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Chọn vùng miền",
          style: CustomTextTheme.headline1.copyWith(
            color: Palette.gray500,
            fontSize: 32.sp,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                onTapRegionCard(0);
              },
              child: RegionCard(
                imagePath: ImagePath.foodNorthImage,
                title: "Miền Bắc",
                isChosen: listCheckChosen[0],
              ),
            ),
            GestureDetector(
              onTap: () {
                onTapRegionCard(1);
              },
              child: RegionCard(
                imagePath: ImagePath.foodCentralImage,
                title: "Miền Trung",
                isChosen: listCheckChosen[1],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              onTapRegionCard(2);
            },
            child: RegionCard(
              imagePath: ImagePath.foodSouthImage,
              title: "Miền Nam",
              isChosen: listCheckChosen[2],
            ),
          ),
        ),
      ],
    );
  }
}

class RegionCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final bool isChosen;

  const RegionCard({
    Key? key,
    required this.imagePath,
    required this.title,
    this.isChosen = false,
  }) : super(key: key);

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.selected,
    };
    if (!states.any(interactiveStates.contains)) {
      return Palette.backgroundColor;
    }
    return Palette.pink500;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Image.asset(
          imagePath,
          width: 140.w,
          height: 124.h,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: -10.h,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: isChosen
                  ? Border.all(color: Palette.pink500, width: 2.0)
                  : null,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  offset: const Offset(0, 4),
                  color: Palette.shadowColor.withOpacity(0.1),
                ),
              ],
            ),
            width: 120.w,
            height: 40.h,
            child: Center(
              child: Text(
                title,
                style:
                    CustomTextTheme.headline4.copyWith(color: Palette.gray500),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: -5.h,
          child: Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith(getColor),
            value: isChosen,
            shape: const CircleBorder(),
            onChanged: (bool? value) {},
          ),
        ),
      ],
    );
  }
}
