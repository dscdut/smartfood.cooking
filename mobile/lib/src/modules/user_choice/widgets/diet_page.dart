import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/modules/user_choice/controller/user_choice_provider.dart';
import 'package:mobile/src/modules/user_choice/widgets/item_choice.dart';
import 'package:provider/provider.dart';

class DietPage extends StatelessWidget {
  const DietPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int listLength =
        context.read<UserChoiceProvider>().listNameDiet.length;
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
        Expanded(
          child: ListView.separated(
            itemCount: listLength,
            itemBuilder: (context, index) {
              return Consumer<UserChoiceProvider>(builder: (_, provider, __) {
                return ItemChoice(
                  isSelected: provider.currentIndex == index,
                  itemTitle: provider.listNameDiet[index],
                  onTapFunction: () {
                    provider.onTapDietItem(index);
                  },
                  isNeedHelpTooltip: !(index == listLength - 1),
                );
              });
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
