import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/constant/image_path.dart';
import 'package:mobile/src/core/theme/palette.dart';

class ChooseCountryPage extends StatefulWidget {
  const ChooseCountryPage({Key? key}) : super(key: key);

  @override
  State<ChooseCountryPage> createState() => _ChooseCountryPageState();
}

class _ChooseCountryPageState extends State<ChooseCountryPage> {
  List<bool> listCheckChosen = List.filled(3, false);

  void onTapCountryCard(index) {
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
          style: Theme.of(context).textTheme.headline1!.copyWith(
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
                onTapCountryCard(0);
              },
              child: CountryCard(
                imagePath: ImagePath.foodNorthImage,
                title: "Miền Bắc",
                isChosen: listCheckChosen[0],
              ),
            ),
            GestureDetector(
              onTap: () {
                onTapCountryCard(1);
              },
              child: CountryCard(
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
              onTapCountryCard(2);
            },
            child: CountryCard(
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

class CountryCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final bool isChosen;

  const CountryCard({
    Key? key, required this.imagePath, required this.title, this.isChosen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(
          imagePath,
          width: 140.w,
          height: 124.h,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 95.h,
          left: 8.w,
          child: Container(
            decoration: BoxDecoration(
              color: isChosen ? Palette.pink500 : Colors.white,
              border: Border.all(
                color: Palette.pink500,
                width: 2.0
              ),
              borderRadius: BorderRadius.circular(20)
            ),
            width: 120.w,
            height: 40.h,
            child: Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: isChosen ? Colors.white : Palette.gray500
                ),
              ),
            ),
          ),
        )
      ]
    );
  }
}
