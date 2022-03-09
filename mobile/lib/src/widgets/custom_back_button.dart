import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
    required this.onPressedFunction,
  }) : super(key: key);

  final VoidCallback onPressedFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: Palette.shadowColor.withOpacity(0.1),
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: CircleAvatar(
        radius: 18.r,
        backgroundColor: Colors.white,
        child: IconButton(
          padding: EdgeInsets.zero,
          splashRadius: 24,
          icon: const Icon(PhosphorIcons.caretLeftBold),
          color: Palette.pink500,
          iconSize: 20.sp,
          onPressed: onPressedFunction,
        ),
      ),
    );
  }
}
