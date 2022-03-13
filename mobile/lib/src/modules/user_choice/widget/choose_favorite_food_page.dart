import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/modules/user_choice/controller/user_choice_provider.dart';
import 'package:provider/provider.dart';

class ChooseFavoriteFoodPage extends StatelessWidget {
  const ChooseFavoriteFoodPage({Key? key}) : super(key: key);

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
              return Consumer<UserChoiceProvider>(builder: (_, provider, __) {
                return InkWell(
                  onTap: () => provider.onTapFavoriteFoodCard(index),
                  child: FavoriteFoodCard(
                    imagePath: provider.listImagePathFavoriteFood[index],
                    title: provider.listNameFavoriteFood[index],
                    isChosen: provider.listCheckChosenFavoriteFood[index],
                  ),
                );
              });
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
          top: -3.h,
          right: -3.h,
          child: IgnorePointer(
            ignoring: true,
            child: Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isChosen,
              shape: const CircleBorder(),
              onChanged: (bool? value) {},
            ),
          ),
        ),
      ],
    );
  }
}
