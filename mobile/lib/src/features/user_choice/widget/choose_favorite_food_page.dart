import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/constant/image_path.dart';
import 'package:mobile/src/core/theme/custom_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';

class ChooseFavoriteFoodPage extends StatefulWidget {
  const ChooseFavoriteFoodPage({Key? key}) : super(key: key);

  @override
  State<ChooseFavoriteFoodPage> createState() => _ChooseFavoriteFoodPageState();
}

class _ChooseFavoriteFoodPageState extends State<ChooseFavoriteFoodPage> {
  final List<String> listImagePath = [
    ImagePath.traditionalKoreanFoodImage,
    ImagePath.noodleImage,
    ImagePath.soupImage,
    ImagePath.grilledImage,
    ImagePath.vegetarianDishImage,
    ImagePath.vegetableImage,
    ImagePath.drinkImage,
    ImagePath.cakeImage,
    ImagePath.friedImage
  ];
  final List<String> listTitle = [
    "Lẩu",
    "Bún-Mì-Phở",
    "Cháo",
    "Nướng",
    "Món chay",
    "Rau củ",
    "Thức uống",
    "Bánh ngọt",
    "Chiên"
  ];
  List<bool> listCheckChosen = List.filled(9, false);

  void onTapFavoriteFoodCard(int index) {
    setState(() {
      listCheckChosen = List.filled(9, false);
      listCheckChosen[index] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Món ăn yêu thích",
          style: CustomTheme.headline1.copyWith(
            color: Palette.gray500,
            fontSize: 32.sp,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Expanded(
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 20.h,
              crossAxisSpacing: 20.w,
            ),
            children: List<Widget>.generate(9, (index) {
              return GestureDetector(
                onTap: () {
                  onTapFavoriteFoodCard(index);
                },
                child: FavoriteFoodCard(
                  imagePath: listImagePath[index],
                  title: listTitle[index],
                  isChosen: listCheckChosen[index],
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}

class FavoriteFoodCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final bool isChosen;

  const FavoriteFoodCard(
      {Key? key,
      required this.imagePath,
      required this.title,
      this.isChosen = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        color: isChosen ? Palette.pink400 : Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            imagePath,
            height: 68.h,
          ),
          Text(
            title,
            style: CustomTheme.headline4.copyWith(
                color: isChosen ? Colors.white : Palette.gray500,
                fontSize: 16.sp),
          )
        ],
      ),
    );
  }
}
