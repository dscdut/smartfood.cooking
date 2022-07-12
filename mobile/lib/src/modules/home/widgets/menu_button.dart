import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.child,
    required this.menuName,
    required this.onMenuAction,
  });

  final Widget child;
  final String menuName;
  final VoidCallback onMenuAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(15.r),
          onTap: onMenuAction,
          child: Container(
            height: 50.h,
            width: 50.h,
            decoration: BoxDecoration(
              color: Palette.backgroundColor,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(
                  color: Palette.shadowColor.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(child: child),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          menuName,
          style: CustomTextTheme.bodyText1.copyWith(
            color: Palette.gray500,
            fontSize: 14.sp,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
