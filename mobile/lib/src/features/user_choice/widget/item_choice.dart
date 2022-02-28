import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/features/user_choice/widget/custom_tooltip.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ItemChoice extends StatelessWidget {
  const ItemChoice({
    Key? key,
    required this.itemTitle,
    required this.isSelected,
    this.isNeedHelpTooltip = true,
    required this.onTapFunction,
    this.toolTipContent,
  }) : super(key: key);

  final String itemTitle;
  final bool isSelected;
  final bool isNeedHelpTooltip;
  final VoidCallback onTapFunction;
  final String? toolTipContent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      isSelected
                          ? PhosphorIcons.checkCircle
                          : PhosphorIcons.circle,
                      size: 32.sp,
                      color: isSelected ? Palette.pink500 : Palette.gray500,
                    ),
                    SizedBox(width: 7.w),
                    Text(
                      itemTitle,
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color:
                                isSelected ? Palette.pink500 : Palette.gray500,
                            fontSize: 18.sp,
                          ),
                    )
                  ],
                ),
                isNeedHelpTooltip
                    ? CustomTooltip(
                        message: 'Eat Clean là chế độ ăn sạch, sử dụng '
                            'các thực phẩm sạch, không qua chế biến '
                            'sẵn, không chất phụ gia, bảo quản và '
                            'giữ nguyên bản chất tự nhiên của thức ăn.',
                        child: IconButton(
                          constraints: const BoxConstraints(),
                          padding: EdgeInsets.zero,
                          splashRadius: 24.sp,
                          icon: const Icon(
                            PhosphorIcons.question,
                          ),
                          iconSize: 28.sp,
                          onPressed: () {},
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
          const Divider(
            color: Palette.gray200,
            height: 10,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
