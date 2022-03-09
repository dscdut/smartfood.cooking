import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/features/user_choice/widget/item_choice.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';


class AllergicFoodPage extends StatefulWidget {
  const AllergicFoodPage({Key? key}) : super(key: key);

  @override
  _AllergicFoodPageState createState() => _AllergicFoodPageState();
}

class _AllergicFoodPageState extends State<AllergicFoodPage> {
  final listAllergicFood = [
    "Sữa bò",
    "Đường Lactose",
    "Trứng",
    "Cá/ Hải sản",
    "Đậu phộng",
    "Đậu tương",
    "Lúa mì",
    "Hạt cây",
    "Không dị ứng"
  ];

  var listSeleted = <bool>[];

  @override
  void initState() {
    listSeleted = List.filled(listAllergicFood.length, false)..first = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
              splashRadius: 24.sp,
              color: Palette.gray500,
              iconSize: 32.sp,
            )
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        Expanded(
          child: ListView.separated(
            itemCount: listAllergicFood.length,
            itemBuilder: (context, index) {
              return ItemChoice(
                isSelected: listSeleted[index],
                itemTitle: listAllergicFood[index],
                onTapFunction: () {
                  setState(() {
                    if (index == listAllergicFood.length - 1) {
                      listSeleted = List.filled(listAllergicFood.length, false)
                        ..last = true;
                    } else {
                      if (listSeleted.last) {
                        listSeleted.last = false;
                      }

                      listSeleted[index] = !listSeleted[index];
                      if (listSeleted.every((element) => element == false)) {
                        listSeleted =
                            List.filled(listAllergicFood.length, false)
                              ..last = true;
                      }
                    }
                  });
                },
                isNeedHelpTooltip: false,
              );
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
