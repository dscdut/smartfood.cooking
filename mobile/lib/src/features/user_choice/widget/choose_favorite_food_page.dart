import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/constant/image_path.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
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
      // listCheckChosen = List.filled(9, false);
      listCheckChosen[index] = !listCheckChosen[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Món ăn yêu thích",
          style: CustomTextTheme.headline1.copyWith(
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
              mainAxisSpacing: 15.h,
              crossAxisSpacing: 15.w,
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

  const FavoriteFoodCard({
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
      return Palette.gray300;
    }
    return Palette.pink500;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: EdgeInsets.all(3.h),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                offset: const Offset(0, 1),
                color: Palette.shadowColor.withOpacity(0.1),
              ),
            ],
            color: Palette.backgroundColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isChosen ? Palette.pink500 : Colors.white,
              width: 2.w,
            ),
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
                style: CustomTextTheme.headline4.copyWith(
                  color: Palette.gray500,
                  fontSize: 14.sp,
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: -6.h,
          right: -6.h,
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
