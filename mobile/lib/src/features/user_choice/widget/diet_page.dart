import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/features/user_choice/widget/item_choice.dart';


class DietPage extends StatefulWidget {
  const DietPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DietPage> createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
  final listDiet = [
    "Eat Clean",
    "Keto",
    "Low carb/ Das",
    "Thuần chay",
    "Chế độ ăn cho người béo phì",
    "Chế độ ăn cho người thiếu cân",
    "Không theo chế độ ăn"
  ];

  int currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Chế độ ăn",
          style: CustomTextTheme.headline1.copyWith(
            color: Palette.gray500,
            fontSize: 32.sp,
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Expanded(
          child: ListView.separated(
            itemCount: listDiet.length,
            itemBuilder: (context, index) {
              return ItemChoice(
                isSelected: currentSelected == index,
                itemTitle: listDiet[index],
                onTapFunction: () {
                  setState(() {
                    currentSelected = index;
                  });
                },
                isNeedHelpTooltip: !(index == listDiet.length - 1),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 18.h);
            },
          ),
        ),
      ],
    );
  }
}