import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.onPressedFunction,
    this.reverse = false,
    this.opacity = 1.0,
    this.isHide = false,
  }) : assert(opacity >= 0.0 && opacity <= 1.0);

  final VoidCallback? onPressedFunction;
  final bool reverse;
  final double opacity;
  final bool isHide;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: !isHide ? 1.0 : 0.0,
      child: Container(
        decoration: BoxDecoration(
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
          backgroundColor: Colors.white.withOpacity(opacity),
          child: IconButton(
            padding: EdgeInsets.zero,
            splashRadius: 24,
            icon: Icon(
              reverse
                  ? PhosphorIcons.caretRightBold
                  : PhosphorIcons.caretLeftBold,
            ),
            color: Palette.pink500,
            iconSize: 20.sp,
            onPressed: !isHide ? onPressedFunction : null,
          ),
        ),
      ),
    );
  }
}
