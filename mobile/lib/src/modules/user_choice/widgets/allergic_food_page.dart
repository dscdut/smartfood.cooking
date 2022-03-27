import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/modules/user_choice/controller/user_choice_provider.dart';
import 'package:mobile/src/modules/user_choice/widgets/item_choice.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class AllergicFoodPage extends StatelessWidget {
  const AllergicFoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userChoiceProvider = context.read<UserChoiceProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Thực phẩm dị ứng",
              style: CustomTextTheme.headline1.copyWith(
                color: Palette.gray500,
                fontSize: 32.sp,
              ),
            ),
            IconButton(
              constraints: const BoxConstraints(),
              padding: EdgeInsets.zero,
              icon: const Icon(
                PhosphorIcons.magnifyingGlass,
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, RouteManager.allergicChoice),
              splashRadius: 24.sp,
              color: Palette.gray500,
              iconSize: 32.sp,
            )
          ],
        ),
        SizedBox(height: 8.h),
        Expanded(
          child: ListView.separated(
            itemCount: userChoiceProvider.listNameAllergicFood.length,
            itemBuilder: (_, index) {
              return Consumer<UserChoiceProvider>(builder: (_, provider, __) {
                return ItemChoice(
                  isSelected: provider.listCheckChosenAllergicFood[index],
                  itemTitle: provider.listNameAllergicFood[index],
                  onTapFunction: () {
                    provider.onTapAllergicItem(index);
                  },
                  isNeedHelpTooltip: false,
                );
              });
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 8.h);
            },
          ),
        ),
      ],
    );
  }
}
